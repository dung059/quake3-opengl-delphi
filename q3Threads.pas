unit q3Threads;

interface

uses
  Windows, WinInet, System.Classes, global, Winapi.OpenGL;

type
  Tdrawtypes = (FLASHINIT, FLASHQ3LOAD, FLASHDRAW, // for load flash when load
                BSPINIT, BSPLOADTEXTURE, SHAREDLOADTEXTURE, BSPDRAW, DRAWLOAD, DRAWTEST,
    DRAWNONE, DRAWMENU);

  TThreadStatus = (ACTIVE, INACTIVE, SUCCESS);

  TQ3FunctionThread = class(TThread)
  private
    fFunc: String;
    FileURL, LocalFileName: string;
    texIndex: GLuint;
    function CreateRecID(P: Pointer): DWord; stdcall;
    function GetInetFile(const FileURL, FileName: String): boolean;
    function myglGenTextures(): GLuint;
    procedure GetFileFromInternet(URL, LocalFName: String);
    procedure InitLoadQ3();
    procedure BSPLoadQ3();
  public
    constructor Create(filename, _fn: string);
    //destructor Destroy; override;

  protected
    procedure Execute; override;
  end;

  TQ3Thread = class
  private
    status: Boolean;
    procedure ThreadDone(Sender: TObject);
  public
    drawgame: Tdrawtypes;
    BSPtextureLoađInex, SharedtextureLoađInex: integer;
    procedure SetFunc(filename, func: String);
  end;

var
  ThreadStatus: TThreadStatus;
  q3Thread: TQ3Thread;

implementation

{ Q3Thread }

uses
  System.SysUtils, Q3Pk3Read, Frustum, q3shaders, Cam, Q3BSP, Console, q3sound, math3d;

procedure TQ3FunctionThread.BSPLoadQ3;
begin
  splashName := 'levelshots\' + ChangeFileExt(BSP_NAME, '.jpg');
  splashId := ShaderManager.LoadTexture(splashName, false, false);
  // glDraw(h_DC);

  Camera.screenlock := True;
  Camera.ResetPosition;

  // Loaded := Q3Level.LoadBSP(QUAKE_FOLDER , BSP_NAME, BSP_MAP_INDEX);
  if not Q3Level.LoadBSP('', BSP_NAME, True) then
    PostQuitMessage(0);

  Player.LoadPlayer('models\players\anarki', 'default');
  Player.SetAnim(0);
  LoadRailgun;

  with Q3Level.PlayerPosition do
  begin
    Camera.Init(FOV, SCREEN_WIDTH, SCREEN_HEIGHT, 1, 1, Angle);
    Camera.position.X := position.X;
    Camera.position.Y := position.Y + 40;
    Camera.position.Z := position.Z + 0;
    Camera.ApplyCamera;
  end;

  currentLeaf := Q3Level.FindLeaf(Camera.position);
  SetCursorPos((SCREEN_WIDTH DIV 2) + SCREEN_LEFT, (SCREEN_HEIGHT DIV 2) +
    SCREEN_TOP);
  // drawgame := BSPDRAW;
  if q3Thread.drawgame = FLASHDRAW then
    q3Thread.drawgame := BSPLOADTEXTURE;
end;

constructor TQ3FunctionThread.Create(filename, _fn: string);
begin
  inherited Create(false);

  FileURL := '';
  LocalFileName := filename;

  fFunc := _fn;
  FreeOnTerminate:=True;
end;

function TQ3FunctionThread.CreateRecID(P: Pointer): DWord; stdcall;
{ ------------------------------------------------------------------ }
{ Download Thread }
{ ------------------------------------------------------------------ }
begin
  ThreadStatus := ACTIVE;
  if GetInetFile(FileURL, LocalFileName) = True then
    ThreadStatus := SUCCESS
  else
  begin
    MessageBox(0, 'Unable to locate file', 'Error', MB_OK or MB_ICONERROR);
    ThreadStatus := INACTIVE;
  end;
end;

function TQ3FunctionThread.myglGenTextures(): GLuint;
var
  Texture : GLuint;
begin
  glEnable (GL_TEXTURE_2D);
  glGenTextures(1, @Texture);
  glBindTexture(GL_TEXTURE_2D, Texture);
  Result := Texture;
end;


procedure TQ3FunctionThread.Execute;
var Texture : GLuint;
begin
  inherited;
  while not Terminated do
  begin
    if fFunc = '' then
      Terminate;
      // Continue;
    if fFunc = 'GetInetFile' then
    begin
      ThreadStatus := ACTIVE;
      if GetInetFile(FileURL, LocalFileName) = True then
        ThreadStatus := SUCCESS
      else
      begin
        MessageBox(0, 'Unable to locate file', 'Error', MB_OK or MB_ICONERROR);
        ThreadStatus := INACTIVE;
      end;
    end;

    if fFunc = 'InitLoad' then
    begin
      InitLoadQ3;
      BSPLoadQ3();
    end;

    if fFunc = 'BSPLoadQ3' then
    begin
      BSPLoadQ3;
    end;
    if fFunc = 'opengl' then
    begin
      glGenTextures(1, @Texture);
      glBindTexture(GL_TEXTURE_2D, Texture);
      Texture := myglGenTextures()
    end;
    if fFunc = 'openglloadtexture' then
    begin
      //tex.LoadTextureData(@tex.texture[texIndex],fn);
    end;
    if fFunc = 'Playerload' then
    begin
      Player.LoadPlayer(LocalFileName, 'default');
      Player.SetAnim(0);
    end;
    if fFunc = 'scanshared' then
    begin
    end;

    Sleep(1); // This keeps the thread from going crazy and maxing the processor...
    fFunc := '';
  end;
      //Terminate;
  // Destroy;
end;

procedure TQ3FunctionThread.GetFileFromInternet(URL, LocalFName: String);
{ ------------------------------------------------------------------ }
{ Function to get a file from the internet using HTTP }
{ ------------------------------------------------------------------ }
var
  DownloadThread: THandle;
  ThreadID: DWord;
begin
  exit;
  ThreadStatus := ACTIVE;
  FileURL := URL;
  LocalFileName := LocalFName;
  // DownloadThread := CreateThread(nil, 0, @CreateRecID, nil, 0, ThreadID);
  if (DownloadThread = 0) then
    MessageBox(0, 'Unable to create a download thread', 'Error',
      MB_OK or MB_ICONERROR);
end;

function TQ3FunctionThread.GetInetFile(const FileURL, FileName: String): boolean;
{ ------------------------------------------------------------------ }
{ Creates a thread that downloads a texture from the internet }
{ ------------------------------------------------------------------ }
const
  BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array [1 .. BufferSize] of Byte;
  BufferLen: DWord;
  f: File;
  sAppName: string;
  lpFindFileData: TWin32FindData;
begin
  Result := false;
  sAppName := 'Jans OpenGL Texture loader';
  hSession := InternetOpen(PChar(sAppName),
    // agent. (can be "Microsoft Internet Explorer")
    INTERNET_OPEN_TYPE_PRECONFIG, // access
    nil, // proxy server
    nil, // defauts
    0); // synchronous

  try
    hURL := InternetOpenURL(hSession, // Handle to current session
      PChar(FileURL), // URL to read
      nil, // HTTP headers to send to server
      0, // Header length
      0, 0); // flags   (might want to add some like INTERNET_FLAG_RELOAD with forces a reload from server and not from cache)
    if hURL <> nil then
    begin
      try
        AssignFile(f, FileName);
        Rewrite(f, 1);
        repeat
          InternetReadFile(hURL, // File URL
            @Buffer, // Buffer that receives data
            SizeOf(Buffer), // bytes to read
            BufferLen); // bytes read
          BlockWrite(f, Buffer, BufferLen)
        until BufferLen = 0;
        CloseFile(f);
        if Buffer[1] = $3D then // basic check to see if its HTML returned
          Result := false // if its the start of a tag, then error.
        else
          Result := True;
      finally
        InternetCloseHandle(hURL) // close connection to file
      end
    end;
  finally
    InternetCloseHandle(hSession) // close connection to internet
  end
end;

procedure TQ3FunctionThread.InitLoadQ3;
begin
  Pk3Zip := TZipPK3.Create(Q3_BASE_PATH, BSP_NAME);
  // Pk3Zip.IndexOf(BSP_NAME);
  // if Pk3Zip.IsOpenIndex = -1 then
  // Pk3Zip.IndexOf(Pk3Zip.BSP_LIST.Strings[0]);

  if not Assigned(frust) then
    frust := TFrustum.Create;
  if not Assigned(ShaderManager) then
    ShaderManager := TShaderManager.Create(Pk3Zip);

  if not Assigned(Q3Level) then
    Q3Level := TQuake3BSP.Create;
  Q3Level.ShaderManager := ShaderManager;
  Q3Level.Camera := Camera;

  if not Assigned(Cons) then
  begin
    Cons := TConsole.Create(SCREEN_WIDTH, SCREEN_HEIGHT);
    Cons.AddMsg('OpenGL vendor ' + glGetString(GL_VENDOR));
    Cons.AddMsg('OpenGL renderer ' + glGetString(GL_RENDERER));
    Cons.AddMsg('OpenGL version ' + glGetString(GL_VERSION));
    Cons.AddMsg('Supported OpenGL extensions ' + glGetString(GL_EXTENSIONS));
  end;
  if not Assigned(Sound) then
  begin
    Sound := TSoundEngine.Create;
    // load walk sound
    Camera.NormalSound := Sound.LoadSample('\sound\player\footsteps\step1.wav',
      false, false);
    Camera.Channel := Sound.NewEmitter(Camera.NormalSound, SetVector(0, 0, 0),
      false, True);
    Camera.MetalSound := Sound.LoadSample('\sound\player\footsteps\clank1.wav',
      false, false);
    Camera.WaterSound := Sound.LoadSample('\sound\player\footsteps\splash1.wav',
      false, false);
    // fmod
    Sound.LoadSample('\sound\player\footsteps\step2.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\step3.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\step4.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\clank2.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\clank3.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\clank4.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\splash2.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\splash3.wav', false, false);
    Sound.LoadSample('\sound\player\footsteps\splash4.wav', false, false);
    // bass
    Sound.LoadSample(false, '\sound\player\footsteps\step2.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\step3.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\step4.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\clank2.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\clank3.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\clank4.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\splash2.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\splash3.wav');
    Sound.LoadSample(false, '\sound\player\footsteps\splash4.wav');
    Camera.NormalSound := Sound.LoadSample(false,
      '\sound\player\footsteps\step1.wav');
    Camera.MetalSound := Sound.LoadSample(false,
      '\sound\player\footsteps\clank1.wav');
    Camera.WaterSound := Sound.LoadSample(false,
      '\sound\player\footsteps\splash1.wav');
  end;
  // drawgame := BSPINIT;
end;

{ TQ3Thread }

procedure TQ3Thread.SetFunc(filename, func: String);
begin
  //  if func = 'InitLoad' then
  //    with TQ3FunctionThread.Create(0, func) do
  //      OnTerminate := ThreadDone;
  with TQ3FunctionThread.Create(filename, func) do
    OnTerminate := ThreadDone;
  q3Thread.drawgame := FLASHINIT;
end;

procedure TQ3Thread.ThreadDone(Sender: TObject);
begin
  status := false;
end;

initialization

end.
