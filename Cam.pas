unit Cam;

interface

uses math3d, OpenGL12, windows, q3types;

type
  TMatrix3x3 = array[0..8] of single;
  TMatrix4x4 = array[0..15] of single;

const
  AutoRotateSpeed = 250;
  stepFrequency = 380;

type TCamera = class(TObject)
  private
    InMotion : boolean;
    lastStep : cardinal;
  public
    sndCnt : byte;
    Channel : integer;
    PlaySound : boolean;
    NormalSound, MetalSound, WaterSound : integer;
    position : TVector3f;
    x_angle,
    y_angle : single;
    // NOTE: The values don't change in quake 3
    acceleration : single;
    friction : single;
    max_speed : single;
    move_mouse_x,
    move_mouse_y : single;
    fov : single;
    cos_fov : single;
    proj_ratio : single; // projection ratio
    rotation : TMatrix3x3; // precalculated ratation matrix for movements
    eyedir : TVector3f;  // eyedir, and normal of the viewing z=0 plane
    eyedist : single; // signed distance to the z=0 plane
    Velocity : TVector3f;
    ScreenLock : boolean;
    moveLeft,
    moveRight,
    moveUp,
    moveDown,
    moveForward,
    moveBackward : boolean;
    constructor Create;
    destructor Destroy; override;
    procedure Init(fov, w, h, x, y , new_angle: single);
    procedure SetFov(fov : single);
    function GetFov() : single;
    function ApplyCamera : boolean;
    function Update(speed : single) : boolean;
    procedure MoveCameraByMouse;
    procedure AutoRotate;
end;

implementation

uses Global, q3timer;

// Vector and matrix multiplication
procedure MultVect3x3(A : TMatrix3x3;  v: TVector3f; var dest : Tvector3f);
var t : TVector3f;
begin
  t := SetVector(A[0], A[1], A[2]);
  dest.x := DotProduct(t, v);
  t := SetVector(A[3], A[4], A[5]);
  dest.y := DotProduct(t, v);
  t := SetVector(A[6], A[7], A[8]);
  dest.z := DotProduct(t, v);
end;

constructor TCamera.Create;
begin
  position.x := 0;
  position.y := 0;
  position.z := 10;
  x_angle := 0;
  y_angle := 90;
  fov := 90;
  acceleration := 2000;
  friction := 1000;
  max_speed := 200;
  velocity := SetVector(0, 0, 0);		// initialization
  Channel := -1;
  PlaySound := false;
  sndCnt := 0;
  ScreenLock := true;
end;

destructor TCamera.Destroy;
begin
  inherited Destroy;
end;

procedure TCamera.Init(fov, w, h, x, y, new_angle : single);
begin
  self.fov := DEG2RAD(fov);	// converts fov to radians
  cos_fov := Cos(fov/2.0);

  // Projection ratio
  proj_ratio := w/h;
  x_angle := 0;
  y_angle := 90-new_angle;
end;

procedure TCamera.SetFov(fov : single);
begin
  self.fov := DEG2RAD(fov);	// converts fov to radians
end;

function TCamera.GetFov() : single;
begin
  result :=  RAD2DEG(self.fov);
end;

function TCamera.ApplyCamera : boolean;
var temp : TMatrix4x4;
    v : TVector3f;
begin
  // in q3 +z is up, -z is down
  // translate -> rotate = move camera around origin
  // rotate -> tarnslate = move world around camera
  glRotatef(x_angle, 1, 0, 0); // pitch
  glRotatef(y_angle, 0, 1, 0);  // roll
  with Position do
    glTranslatef(-x, -y, -z);

  glGetFloatv(GL_MODELVIEW_MATRIX, @temp);
  rotation[0] := temp[0];
  rotation[1] := temp[1];
  rotation[2] := temp[2];
  rotation[3] := temp[4];
  rotation[4] := temp[5];
  rotation[5] := temp[6];
  rotation[6] := temp[8];
  rotation[7] := temp[9];
  rotation[8] := temp[10];
  v.x := 0; v.y := 0; v.z := -1;
  MultVect3x3(rotation, v, eyedir);
  eyedist := DotProduct(position, eyedir);
end;


function TCamera.Update(speed : single) : boolean;
var dir, versor, desp, temp : TVector3f;
    rad_yaw, vel, ivel : single;
    tick : cardinal;
label MouseAction;
begin
  result := moveForward or moveBackward or moveLeft or moveRight or moveUp or moveDown;
  if result and (InMotion=false) then begin
    lastStep := GetTickCount - stepFrequency;
  end;
  if (result = false) and InMotion then begin
    lastStep := GetTickCount - stepFrequency;
  end;
  InMotion := result;
//  if result = false then goto MouseAction;

  dir    := SetVector(0,0,0);
  versor := SetVector( 0,0,0);

  if (moveForward)  then versor.z := versor.z-1.0;
  if (moveBackward) then versor.z := versor.z+1.0;
{  if (moveUp)       then versor.y := versor.y+1.0;
  if (moveDown)     then versor.y := versor.y-1.0;}
  if (moveLeft)     then versor.x := versor.x-1.0;
  if (moveRight)    then versor.x := versor.x+1.0;

  rad_yaw := DEG2RAD(y_angle);
  // strafe
  if (versor.x <> 0) then begin
    dir.x := dir.x +  versor.x*Cos(rad_yaw);
    dir.z := dir.z +  versor.x*Sin(rad_yaw);
  end;

  // move
  if (versor.z <> 0) then begin
    dir.x := dir.x -  versor.z*Sin(rad_yaw);
    dir.z := dir.z +  versor.z*Cos(rad_yaw);
  end;

  if (Normalize(versor) > 0) then begin
    velocity.x := velocity.x + dir.x*speed*acceleration;
    velocity.y := velocity.y + dir.y*speed*acceleration;
    velocity.y := 0;
    velocity.z := velocity.z + dir.z*speed*acceleration;
  end;

  // Speed
  temp := velocity;
  vel := Normalize(temp);

  velocity.x := velocity.x - temp.x*speed*friction;
  velocity.y := velocity.y - temp.y*speed*friction;
  velocity.z := velocity.z - temp.z*speed*friction;

  if (((temp.x > 0) and (velocity.x < 0)) or ((temp.x < 0) and (velocity.x > 0))) then
    velocity.x := 0;
  if (((temp.y > 0) and (velocity.y < 0)) or ((temp.y < 0) and (velocity.y > 0))) then
    velocity.y := 0;
  if (((temp.z > 0) and (velocity.z < 0)) or ((temp.z < 0) and (velocity.z > 0))) then
    velocity.z := 0;

  if (vel > max_speed) then begin
    ivel := 1/vel*max_speed;
    velocity := ScaleVector(velocity, ivel);
  end;


  // Position
  desp := ScaleVector(velocity, speed);
//  desp.y := position.y; // never change height

  //if (pos) nur wenn pos angegeben
  //AddVector(desp, cam.pos, pos);
  position := AddVector(desp, position);
  //else VectorAdd(desp, cam.pos, cam.pos);

  if InMotion then begin
     tick := GetTickCount;
     if (tick - lastStep) > stepFrequency then begin
       lastStep := tick;
       PlaySound := true;
     end;
  end;
MouseAction:
  // Rotation
  if (move_mouse_x <> 0) then begin
    y_angle := y_angle + move_mouse_x*fov/M_TWO_PI;		// the rotation is proportionnal to camera fov
  end;
  if (move_mouse_y <> 0) then begin
    x_angle := x_angle + move_mouse_y*fov/M_TWO_PI;
  end;

  // dont go out of bounds
  if (x_angle < -90.0) then
    x_angle := -90.0
  else if (x_angle > 90.0) then
    x_angle := 90.0;

  moveForward := false;
  moveBackward := false;
  moveLeft := false;
  moveRight := false;
  moveUp := false;
  moveDown := false;
  move_mouse_x := 0;
  move_mouse_y := 0;
end;

procedure TCamera.MoveCameraByMouse;
var mousePos : TPoint;
    middleX, middleY : Integer;
begin
  middleX := SCREEN_WIDTH SHR 1;       // This is a binary shift to get half the width
  middleY := SCREEN_HEIGHT SHR 1;      // This is a binary shift to get half the height

  // Get the mouse's current X,Y position
  GetCursorPos(mousePos);

  // If our cursor is still in the middle, we never moved... so don't update the screen
  if (mousePos.X = middleX) and (mousePos.Y = middleY) then
    exit;

  lastKeyPress := GetTickCount;
  // Set the mouse position to the middle of our window
  if ScreenLock then
    begin
      SetCursorPos(middleX, middleY);
      // Get the direction the mouse moved in, but bring the number down to a reasonable amount
      move_mouse_x :=  (mousePos.X - middleX);
      move_mouse_y  := (mousePos.Y - middleY);
    end
  else
  begin
    //ShowCursor(true);
  end;
end;

procedure TCamera.AutoRotate;
var mousePos : TPoint;
    middleX, middleY : Integer;
begin
  middleX := SCREEN_WIDTH SHR 1;       // This is a binary shift to get half the width
  middleY := SCREEN_HEIGHT SHR 1;      // This is a binary shift to get half the height

  // Set the mouse position to the middle of our window
  SetCursorPos(middleX, middleY);

//  x_angle := -30;
  y_angle := y_angle +  gTimer.FrameTime * (AutoRotateSpeed / (2*PI)) ;
//  move_mouse_x :=  3.5;
//  move_mouse_y  := 0;
end;

end.
