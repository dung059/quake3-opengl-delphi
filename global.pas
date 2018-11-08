unit global;

interface

uses OpenGL, Windows, Console, q3bsp, q3shaders, q3sound, cam, System.Classes,
  Q3MD3, Textures, q3timer, q3Threads, System.Zip, Q3Pk3Read;

type
  Tdrawtypes = (FLASHINIT, FLASHDRAW, BSPINIT, BSPDRAW, DRAWLOAD, DRAWTEST,
    DRAWNONE, DRAWMENU);

var
  h_Wnd: HWND; // Global window handle
  h_DC: HDC; // Global device context
  h_RC: HGLRC; // OpenGL rendering context

  Q3Level: TQuake3BSP;
  Sound: TSoundEngine;
  ShaderManager: TShaderManager;
  Camera: TCamera;

  finished: Boolean = false;

  GroundType: string;

  skipNextMove: Boolean;
  TestCollision: Boolean = true; // Collsion test?
  // Loaded: boolean = false;
  WireFrame: Boolean = false;
  RenderSky: Boolean = true;
  SimpleRender: Boolean = false;
  MultiTexture: Boolean = false;
  ShowFog: Boolean = true;
  // ShowLog : boolean = false;
  // DumpErrors : boolean = false;

  CubeTex, BackgroundTex: GLuint;
  drawgame: Tdrawtypes;
  Pause: Boolean = false;
  SortFaces: Boolean = true;
  LockingAvailable: Boolean = false;
  LockArrays: Boolean = false;
  DrawFog: Boolean = true;

  VisibleTriangles: Integer = 0;
  nextLeaf: Integer;
  currentLeaf: Integer;
  fogLeaf: Integer;
  LastError: cardinal;
  LastErrorString: string;

  // Splash screen
  splashName: string;
  splashId: cardinal = 0;

  lastKeyPress: cardinal;
  startTime, endTime: int64;
  RenderTime: double;

  // geometry
  BSPLeaves: Integer;
  renderedLeaves: Integer;
  PVSLeaves: Integer;
  FrustumLeaves: Integer;

  keys: array [0 .. 255] of Boolean; // Holds keystrokes

  Player: Q3Player;
  Weapon: TMD3Model;
  YRot, XRot, ZRot: glFloat; // Y Rotation
  Xcoord, Ycoord, Zcoord: Integer;

  ThreadStatus: TThreadStatus;
  thread: Q3Thread;
  checkthread: Boolean;
  gTimer: THiResTimer;

const
  WND_TITLE = 'Quake 3 Game [dung059]';
  FPS_TIMER = 1; // Timer to show FPS
  FPS_INTERVAL = 500; // Show FPS every xxx ms
  START_PAUSE_AFTER = 120000;

var
  BSP_NAME, MD3_NAME: string;

  // list of folder game
  SCREEN_WIDTH, SCREEN_LEFT: Integer; // screen settings
  SCREEN_HEIGHT, SCREEN_TOP: Integer;
  COLOR_DEPTH: Integer;
  TEXTURE_DEPTH: Integer;
  CAM_SPEED: Integer;
  CAM_ACCEL: Integer;
  CAM_FRICT: Integer;
  Gamma: single;
  FOV: Integer;
  DEPTH_OF_VIEW: Integer;
  WORLD_MAX: single;
  Tesselation: Integer; // subdivision of bezier patches 2, 8 (3^n - 1)
  FullScreen: Boolean;
  SKY_RESOLUTION: Integer;
  // FPSCount: integer = 0; // Counter for FPS
  ElapsedTime, FrameTime: Integer; // Elapsed time between frames
  DumpMsg, PosMsg: string;
  Cons: TConsole;
  MUSIC_VOL: byte;
  FX_VOL: byte;

  Pk3Zip: TZipPK3;

const
  NV_FOG_DISTANCE_MODE_EXT = $855A;
  NV_EYE_RADIAL_EXT = $855B;
  NV_EYE_PLANE_ABSOLUTE_EXT = $855C;

function CheckExtensions: Boolean;
function IndexofMaps(findstr: String; Inlist: TStringList): Integer;
procedure LoadRailgun;
procedure drawORGLine();

implementation

uses INIFiles, SysUtils, Forms, ExtOpenGL, Dialogs;

function BASEPATH(list: TStringList): TStringList; forward;

var
  ini: TINIFile;
  QUAKE_FOLDER: string; // Quake 3 base folder (..baseq3)
  MODS_QUAKE_FOLDER: string;

function CheckExtensions: Boolean;
begin
  MultiTexture := GL_ARB_multitexture;
  result := true;
end;

function LoadAllBSPmaps(Path: string; mods: Boolean): Boolean;
var
  sr: TSearchRec;
  fullpath, dir: string;
begin
  result := false;
  if not mods then
  begin
    fullpath := IncludeTrailingBackslash(Path) + 'maps\';
    dir := fullpath + '*.bsp';
    if FindFirst(dir, faAnyFile, sr) = 0 then
    begin
      repeat
        //LIST_BSP_NAME.Add(fullpath + sr.Name);
      until FindNext(sr) <> 0;
      FindClose(sr);
      result := true;
    end;
  end
  else
  begin
    fullpath := IncludeTrailingBackslash(Path);
    //ScanFolder(fullpath, '*.*', LIST_BSP_NAME);
  end;
end;

function IndexofMaps(findstr: String; Inlist: TStringList): Integer;
var
  i: Integer;
begin
  result := -1;
  for i := 0 to Inlist.Count - 1 do
    if Pos(LowerCase(findstr), LowerCase(Inlist.Strings[i]), 1) > 0 then
    begin
      result := i;
      Break;
    end;
end;

function BASEPATH(list: TStringList): TStringList;
var
  i: Integer;
  s: string;
begin
  result := TStringList.Create;
  for i := 0 to list.Count - 1 do
  begin
    s := IncludeTrailingBackslash(ExtractFilePath(LowerCase(list.Strings[i])));
    delete(s, length(s), 1);
    while s[length(s)] <> '\' do
      delete(s, length(s), 1);
    if result.IndexOf(s) = -1 then
      result.Add(s);
  end;
end;

{ ------------------------------------------------------------------ }
{ Function used to load a railgin and join it to the player }
{ ------------------------------------------------------------------ }
procedure LoadRailgun;

  procedure LoadMeshTexture(const imagename, meshname: String);
  var
    i: Integer;
  begin
    // Find the right mesh item to assign the skin to
    for i := 0 to Weapon.header.numMeshes - 1 do
    begin
      // check it the two names are the same
      if UpperCase(CharArrToStr(Weapon.meshes[i].MeshHeader.Name))
        = UpperCase(meshname) then
      begin
        LoadTexture(imagename, Weapon.meshes[i].Texture, false, false);
        Weapon.meshes[i].SetTexture := true;
        Break;
      end;
    end;
  end;

begin
  Weapon.LoadModel
    ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\GFX\model\railgun\railgun.md3');

  LoadMeshTexture
    ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\GFX\model\railgun\railgun1.jpg',
    'w_railgun1');
  LoadMeshTexture
    ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\GFX\model\railgun\railgun2.glow.jpg',
    'w_railgun2');
  LoadMeshTexture
    ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\GFX\model\railgun\railgun4.jpg',
    'w_railgun4');
  LoadMeshTexture
    ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\GFX\model\railgun\railgun3.glow.jpg',
    'w_railgun3');
  LoadMeshTexture
    ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\GFX\model\railgun\railgun1.jpg',
    'w_railgun05');

  Player.Upper.LinkModel('tag_weapon', Weapon);
end;

procedure drawORGLine();
begin
  glPushMatrix; // Push the current matrix view onto the stack.
  glScalef(5.01, 5.01, 5.01);
  // glRotatef(ElapsedTime/10, 1, 0, 0); // Rotate the lines around the local x-axis.
  glBegin(GL_LINES); // Get ready to draw a line
  glColor3f(1.0, 0.0, 0.0); // ... a red one
  glVertex3f(0.0, 0.0, 0.0); // start at -1,0,0 (x,y,z)
  glVertex3f(1.0, 0.0, 0.0); // and draw to 1,0,0
  glEnd;
  glBegin(GL_LINES);
  glColor3f(0.0, 1.0, 0.0); // now a green one.
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(0.0, 1.0, 0.0);
  glEnd;
  glBegin(GL_LINES);
  glColor3f(0.0, 0.0, 1.0); // now a blue one.
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(0.0, 0.0, 1.0);
  glEnd;
  glPopmatrix;
end;

var
  i: Integer;
  md3check: TMD3Model;
  s: string;
  xpath: TStringlist;
  stream, temp: TMemoryStream;
  tmp: TPk3Colection;

initialization

  xpath := TStringlist.Create;

ThreadStatus := INACTIVE;

ini := TINIFile.Create(ExtractFilePath(ParamStr(0)) + 'Q3MapView.ini');

for i := 1 to 255 do
begin
  s := ini.ReadString('Quake3', 'Folder_' + IntToStr(i), '');
  if (s <> '') and directoryexists(s) then
    xpath.Add(s);
end;
xpath.Add('temps\');
Pk3Zip := TZipPK3.Create(xpath);

BSP_NAME := ini.ReadString('Quake3', 'BSP', 'q3dm1.bsp');
MD3_NAME := ini.ReadString('Quake3', 'MD3', 'railgun.md3');

tmp := Pk3Zip.IndexOf(BSP_NAME);

if tmp.Count <> 0 then
  begin
    temp := Pk3Zip.ReadFileInPK3(tmp, BSP_NAME);
//    stream := TFileStream.Create(Pk3Zip.fallfile[i].FileName, fmCreate);
//    try
//      stream.CopyFrom(temp, temp.Size);
//    finally
//      stream.Free;
//    end;
  end;


SCREEN_WIDTH := ini.ReadInteger('Screen', 'Width', 640);
SCREEN_HEIGHT := ini.ReadInteger('Screen', 'Height', 480);
COLOR_DEPTH := ini.ReadInteger('Screen', 'ColorDepth', 16);
TEXTURE_DEPTH := ini.ReadInteger('Screen', 'TextureDepth', 16);
Gamma := ini.ReadFloat('Screen', 'Gamma', 2);
FullScreen := ini.ReadBool('Screen', 'Fullscreen', true);

FOV := ini.ReadInteger('Camera', 'FOV', 90);
DEPTH_OF_VIEW := ini.ReadInteger('Camera', 'DepthOfView', 4000);

Tesselation := ini.ReadInteger('Detail', 'Tesselation', 2);

CAM_SPEED := ini.ReadInteger('Camera', 'Speed', 200);
CAM_ACCEL := ini.ReadInteger('Camera', 'Acceleration', 2000);
CAM_FRICT := ini.ReadInteger('Camera', 'Friction', 1000);

SKY_RESOLUTION := ini.ReadInteger('Skybox', 'Resolution', 18);

MUSIC_VOL := ini.ReadInteger('Sound', 'MusicVolume', 64);
FX_VOL := ini.ReadInteger('Sound', 'FXVolume', 64);

// DumpErrors := ini.ReadBool('Debug', 'DumpErrors', false);

// có thể sửa để thêm nhiều đường dẫn đến thư mục chứa data
// LoadAllBSPmaps(QUAKE_FOLDER, false);
// LoadAllBSPmaps(MODS_QUAKE_FOLDER, true);

//BSP_MAP_INDEX := IndexofMaps(BSP_NAME, LIST_BSP_NAME);

if not Assigned(Q3Level) then
  Q3Level := TQuake3BSP.Create;


// i := (messagedlg('Custom dialog: ban muon load map: ' + LIST_BSP_NAME.Strings[BSP_MAP_INDEX + 1]
// ,mtConfirmation, [mbYes,mbAll,mbCancel], 0));
// InputBox('abc', 'tess', '40');
drawgame := FLASHINIT;

// LoadRailgun;
XRot := 0;
YRot := 0;
md3check.LoadModel
  ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\Maps\scorn-robotic\models\robot\face\face.md3');

//Pk3Zip.MyReadPK3
//  ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\Maps\lvlworld.com\hate.pk3');

finalization

ini.Free;
xpath.Free;

end.
