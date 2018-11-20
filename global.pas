unit global;

interface

uses OpenGL, Windows, Console, q3bsp, q3shaders, q3sound, cam, System.Classes,
  Q3MD3, Textures, q3timer, System.Zip, Q3Pk3Read,
  System.Win.ScktComp;

type

  TQ3Protocol = record
    len: Int64;
    // để st sẽ mất time gửi
    // st: TMemoryStream;
    mess: String[128];
    user: String[128];
    pass: String[128];
  end;

  TBuffer = class(TMemoryStream)
    Code, Pack: TQ3Protocol;
    FromID, ToID: Integer;
  public
    procedure Append(Data: Pointer; len: Integer);
    procedure Compact;
    function Expand(len: Integer): Pointer;
    function GetRemaining: Integer;
    function GetWorkData: Pointer;
  end;

  TBuffers = class
  public
    RecvBuffer: TBuffer;
    SendBuffer: TBuffer;
    constructor Create;
    destructor Destroy; override;
  end;

  TGameServerSocket = class
  public
    // OnClientConnent event handler
    procedure ClientConnected(Sender: TObject; Socket: TCustomWinSocket);
    // OnClientDisconnect event handler
    procedure ClientDisconnected(Sender: TObject; Socket: TCustomWinSocket);
    // OnClientRead event handler
    procedure ReadData(Sender: TObject; Socket: TCustomWinSocket);
    // OnClientWrite event handler
    procedure SendData(Sender: TObject; Socket: TCustomWinSocket);
    procedure SendDataTo(Socket: TCustomWinSocket; var Data: TBuffer;
      len: Integer);
    // procedure MessageTo(Client: TClient; Pack: TPackData);
    procedure MessageTo(Client: TClientSocket; ServerID: Integer;
      Pack: TQ3Protocol);
  end;

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
  startTime, endTime: Int64;
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

  checkthread: Boolean;
  gTimer: THiResTimer;
  Q3_BASE_PATH: TStringList;
  ClientSocket: TClientSocket;

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
function findcommand(command: string; findin: String): Boolean;
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

function findcommand(command: string; findin: String): Boolean;
var
  li: TStringList;
  i: Integer;
begin
  result := false;
  li := TStringList.Create;
  try
    li.Delimiter := '|';
    li.DelimitedText := findin;
    for i := 0 to li.Count - 1 do
      if command = li.Strings[i] then
      begin
        result := true;
        Break;
      end;
  finally
    li.Free;
  end;
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
        // LIST_BSP_NAME.Add(fullpath + sr.Name);
      until FindNext(sr) <> 0;
      FindClose(sr);
      result := true;
    end;
  end
  else
  begin
    fullpath := IncludeTrailingBackslash(Path);
    // ScanFolder(fullpath, '*.*', LIST_BSP_NAME);
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
  stream, temp: TMemoryStream;
  tmp: TPk3Colection;

  { TBuffer }

procedure TBuffer.Append(Data: Pointer; len: Integer);
begin
  Position := Size;
  WriteBuffer(Data, len);
end;

procedure TBuffer.Compact;
var
  NewSize: Integer;
begin
  if Position < 1 then
    Exit;
  NewSize := GetRemaining;
  if NewSize > 0 then
  begin
    Move(GetWorkData^, Memory^, NewSize);
    Size := NewSize;
  end
  else
    Clear;
end;

function TBuffer.Expand(len: Integer): Pointer;
var
  OldSize: Integer;
begin
  OldSize := Size;
  Size := OldSize + len;
  result := PByte(Memory) + OldSize;
end;

function TBuffer.GetRemaining: Integer;
begin
  result := Size - Position;
end;

function TBuffer.GetWorkData: Pointer;
begin
  result := PByte(Memory) + Position;
end;

{ TBuffers }

constructor TBuffers.Create;
begin
  inherited;
  RecvBuffer := TBuffer.Create;
  SendBuffer := TBuffer.Create;
end;

destructor TBuffers.Destroy;
begin
  RecvBuffer.Free;
  SendBuffer.Free;
  inherited;
end;

{ TGameServerSocket }

procedure TGameServerSocket.ClientConnected(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Socket.Data := TBuffers.Create;
end;

procedure TGameServerSocket.ClientDisconnected(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  TBuffers(Socket.Data).Free;
  Socket.Data := nil;
end;

procedure TGameServerSocket.MessageTo(Client: TClientSocket; ServerID: Integer;
  Pack: TQ3Protocol);
var
  Send: TBuffer;
begin
  Send.Code := Pack;
  Send.FromID := ServerID;
  Send.ToID := Client.Tag;
  Send.Pack := Pack;

  SendDataTo(Client.Socket, Send, SizeOf(Send));
end;

procedure TGameServerSocket.ReadData(Sender: TObject; Socket: TCustomWinSocket);
var
  RecvBuffer: TBuffer;
  OldSize, len: Integer;
  Receive: TBuffer;
begin
  len := Socket.ReceiveLength;
  if len < 1 then
    Exit;

  RecvBuffer := TBuffers(Socket.Data).RecvBuffer;
  OldSize := RecvBuffer.Size;

  try
    len := Socket.ReceiveBuf(RecvBuffer.Expand(len)^, len);
  except
    len := 0;
  end;

  if len < 1 then
  begin
    RecvBuffer.Size := OldSize;
    Exit;
  end;

  RecvBuffer.Position := 0;
  try
    while RecvBuffer.GetRemaining >= SizeOf(TBuffer) do
    begin
      RecvBuffer.ReadBuffer(Receive, SizeOf(TBuffer));
    end;
  finally
    RecvBuffer.Compact;
  end;
end;

procedure TGameServerSocket.SendData(Sender: TObject; Socket: TCustomWinSocket);
var
  SendBuffer: TBuffer;
  len: Integer;
begin
  SendBuffer := TBuffers(Socket.Data).SendBuffer;
  SendBuffer.Position := 0;
  try
    repeat
      len := SendBuffer.GetRemaining;
      if len < 1 then
        Break;
      try
        len := Socket.SendBuf(SendBuffer.GetWorkData^, len);
      except
        len := 0;
      end;
      if len < 1 then
        Break;
      SendBuffer.Seek(len, soCurrent);
    until false;
  finally
    SendBuffer.Compact;
  end;
end;

procedure TGameServerSocket.SendDataTo(Socket: TCustomWinSocket;
  var Data: TBuffer; len: Integer);
var
  SendBuffer: TBuffer;
  Ptr: PByte;
  Sent: Integer;
begin
  if Socket = nil then
    Exit;
  SendBuffer := TBuffers(Socket.Data).SendBuffer;
  if SendBuffer.Size > 0 then
  begin
    SendBuffer.Append(Data, len);
    Exit;
  end;
  Ptr := PByte(@Data);
  while len > 0 do
  begin
    Sent := Socket.SendBuf(Ptr^, len);
    if Sent < 1 then
      Break;
    Inc(Ptr, Sent);
    Dec(len, Sent);
  end;
  if len > 0 then
    SendBuffer.Append(Ptr, len);
end;

initialization

if not FileExists(ExtractFilePath(ParamStr(0)) + 'Q3MapView.ini') then
begin
  ini := TINIFile.Create(ExtractFilePath(ParamStr(0)) + 'Q3MapView.ini');
  ini.WriteString('Quake3', 'Folder_1', 'E:\GAME\Quake III\baseq3\');
  ini.WriteString('Quake3', 'Folder_2',
    'D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\Mods\');
  ini.WriteString('Quake3', 'BSP', 'q3dm1.bsp');
  ini.WriteString('Quake3', 'MD3', 'railgun.md3');
  ini.WriteInteger('Screen', 'Width', 1600);
  ini.WriteInteger('Screen', 'Height', 840);
  ini.WriteInteger('Screen', 'ColorDepth', 16);
  ini.WriteFloat('Screen', 'Gamma', 2);
  ini.WriteBool('Screen', 'Fullscreen', true);
  ini.WriteInteger('Camera', 'FOV', 90);
  ini.WriteInteger('Camera', 'DepthOfView', 4000);
  ini.WriteInteger('Detail', 'Tesselation', 2);
  ini.WriteInteger('Camera', 'Speed', 200);
  ini.WriteInteger('Camera', 'Acceleration', 2000);
  ini.WriteInteger('Camera', 'Friction', 1000);
  ini.WriteInteger('Skybox', 'Resolution', 18);
  ini.WriteInteger('Sound', 'MusicVolume', 64);
  ini.WriteInteger('Sound', 'FXVolume', 64);
  ini.Free;
end;

Q3_BASE_PATH := TStringList.Create;
Q3_BASE_PATH.Sorted := true;
Q3_BASE_PATH.Duplicates := dupIgnore;

ini := TINIFile.Create(ExtractFilePath(ParamStr(0)) + 'Q3MapView.ini');

for i := 1 to 255 do
begin
  s := ini.ReadString('Quake3', 'Folder_' + IntToStr(i), '');
  if (s <> '') and directoryexists(s) then
    Q3_BASE_PATH.Add(s);
end;
CreateDir('temps');
Q3_BASE_PATH.Add('temps\');

BSP_NAME := ini.ReadString('Quake3', 'BSP', 'q3dm1.bsp');
MD3_NAME := ini.ReadString('Quake3', 'MD3', 'railgun.md3');
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
ini.Free;

// có thể sửa để thêm nhiều đường dẫn đến thư mục chứa data
// LoadAllBSPmaps(QUAKE_FOLDER, false);
// LoadAllBSPmaps(MODS_QUAKE_FOLDER, true);

// BSP_MAP_INDEX := IndexofMaps(BSP_NAME, LIST_BSP_NAME);

//if not Assigned(Q3Level) then
//  Q3Level := TQuake3BSP.Create;

// i := (messagedlg('Custom dialog: ban muon load map: ' + LIST_BSP_NAME.Strings[BSP_MAP_INDEX + 1]
// ,mtConfirmation, [mbYes,mbAll,mbCancel], 0));
// InputBox('abc', 'tess', '40');

// LoadRailgun;
XRot := 0;
YRot := 0;
// md3check.LoadModel
// ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\Maps\scorn-robotic\models\robot\face\face.md3');

// Pk3Zip.MyReadPK3
// ('D:\DUNG\project\delphi\OpenGL\Quake3\My\Elements\Maps\lvlworld.com\hate.pk3');

finalization

Q3_BASE_PATH.Free;

end.
