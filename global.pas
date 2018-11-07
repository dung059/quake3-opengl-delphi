unit global;

interface

uses OpenGL12, Windows,  Console, q3bsp, q3shaders,q3sound,cam;

var
  h_Wnd  : HWND;                     // Global window handle
  h_DC   : HDC;                      // Global device context
  h_RC   : HGLRC;                    // OpenGL rendering context

  Q3Level       : TQuake3BSP;
  Sound : TSoundEngine;
  ShaderManager : TShaderManager;
  Camera        : TCamera;

  finished : boolean = false;

  GroundType : string;
  
  //skipNextMove  : boolean;
  TestCollision : boolean = true;    // Collsion test?
  Loaded : boolean = false;
  WireFrame : Boolean = false;
  RenderSky : boolean = true;
  SimpleRender : boolean = false;
  MultiTexture : boolean = false;
  ShowFog : boolean = true;
//  ShowLog : boolean = false;
//  DumpErrors : boolean = false;
  Pause : boolean = false;
  SortFaces : boolean = true;
  LockingAvailable : boolean = false;
  LockArrays : boolean = false;
  DrawFog : boolean = true;
  
  VisibleTriangles : integer = 0;
  nextLeaf : integer;
  currentLeaf : integer;
  fogLeaf : integer;
  LastError : cardinal;
  LastErrorString : string;

  // Splash screen
  splashName : string;
  splashId : cardinal = 0;

  lastKeyPress : cardinal;
  startTime, endTime : int64;
  RenderTime : double;

  // geometry
  BSPLeaves : integer;
  renderedLeaves : integer;
  PVSLeaves : integer;
  FrustumLeaves : integer;

const
  WND_TITLE = 'Quake 3 Map Viewer';
  FPS_TIMER = 1;                     // Timer to show FPS
  FPS_INTERVAL = 500;                // Show FPS every xxx ms
  START_PAUSE_AFTER = 120000;
var
  QUAKE_FOLDER : string;             // Quake 3 base folder (..baseq3)
  BSP_NAME : string;                 // bsp file name
  SCREEN_WIDTH  : integer;           // screen settings
  SCREEN_HEIGHT : integer;
  COLOR_DEPTH   : integer;
  TEXTURE_DEPTH : integer;
  CAM_SPEED : integer;
  CAM_ACCEL : integer;
  CAM_FRICT : integer;
  Gamma : single;
  FOV : integer;
  DEPTH_OF_VIEW : integer;
  WORLD_MAX : single;
  Tesselation : integer;             // subdivision of bezier patches 2, 8 (3^n - 1)
  FullScreen : boolean;
  SKY_RESOLUTION : integer;
  FPSCount : Integer = 0;            // Counter for FPS
  DumpMsg,
  PosMsg : string;
  Cons : TConsole;
  MUSIC_VOL : byte;
  FX_VOL : byte;
const
  NV_FOG_DISTANCE_MODE_EXT  = $855A;
  NV_EYE_RADIAL_EXT	    = $855B;
  NV_EYE_PLANE_ABSOLUTE_EXT = $855C;


function CheckExtensions : boolean;

implementation

uses INIFiles, SysUtils, Forms;

var ini : TINIFile;


function CheckExtensions : boolean;
begin
  MultiTexture := GL_ARB_multitexture;
  result := true;
end;

initialization
  ini := TINIFile.Create(ExtractFilePath(Application.ExeName) + 'Q3MapView.ini');

  QUAKE_FOLDER := ini.ReadString('Quake3', 'Folder', '');
  BSP_NAME := ini.ReadString('Quake3', 'BSP', 'q3dm1.bsp');

  SCREEN_WIDTH := ini.ReadInteger('Screen', 'Width', 640);
  SCREEN_HEIGHT := ini.ReadInteger('Screen', 'Height', 480);
  COLOR_DEPTH := ini.ReadInteger('Screen', 'ColorDepth', 16);
  TEXTURE_DEPTH := ini.ReadInteger('Screen', 'TextureDepth', 16);
  Gamma := ini.ReadFloat('Screen', 'Gamma', 2);
  FullScreen := ini.ReadBool('Screen', 'Fullscreen', true);

  FOV := ini.ReadInteger('Camera', 'FOV', 90);
  Depth_Of_View := ini.ReadInteger('Camera', 'DepthOfView', 4000);

  Tesselation :=ini.ReadInteger('Detail', 'Tesselation', 2);

  CAM_SPEED  :=ini.ReadInteger('Camera', 'Speed', 200);
  CAM_ACCEL  :=ini.ReadInteger('Camera', 'Acceleration', 2000);
  CAM_FRICT  :=ini.ReadInteger('Camera', 'Friction', 1000);

  SKY_RESOLUTION := ini.ReadInteger('Skybox', 'Resolution', 18);

  MUSIC_VOL  :=ini.ReadInteger('Sound', 'MusicVolume', 64);
  FX_VOL  :=ini.ReadInteger('Sound', 'FXVolume', 64);

//  DumpErrors := ini.ReadBool('Debug', 'DumpErrors', false);
finalization
  ini.Free;
end.
