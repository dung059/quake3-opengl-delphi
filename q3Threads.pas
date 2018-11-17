unit q3Threads;

interface

uses
  Windows, WinInet, System.Classes;

type
  TThreadStatus = (ACTIVE, INACTIVE, SUCCESS);

  Q3Thread = class(TThread)
  private
    fFunc: String;
    FileURL, LocalFileName : string;
    function CreateRecID(P : Pointer) : DWord; stdcall;
    function GetInetFile(const fileURL, FileName: String): Boolean;
    procedure GetFileFromInternet(URL, LocalFName : String);
  public
    //constructor Create(CreateSuspended:Boolean);
    //destructor Destroy; override;

    procedure SetFunc(func: String);
  protected
    procedure Execute; override;
  end;

implementation

{ Q3Thread }

uses
  global, System.SysUtils;

{
constructor Q3Thread.Create(CreateSuspended:Boolean);
begin
  inherited Create(CreateSuspended);

  FileURL := '';
  LocalFileName := '';
end;


destructor Q3Thread.Destroy;
begin

  inherited;
end;
}

function Q3Thread.CreateRecID(P: Pointer): DWord; stdcall;
{------------------------------------------------------------------}
{  Download Thread                                                 }
{------------------------------------------------------------------}
begin
  ThreadStatus :=ACTIVE;
  if GetInetFile(FileURL,LocalFileName) = True then
    ThreadStatus :=SUCCESS
  else
  begin
    MessageBox(0, 'Unable to locate file', 'Error', MB_OK or MB_ICONERROR);
    ThreadStatus :=INACTIVE;
  end;
end;

procedure Q3Thread.Execute;
begin
  inherited;
  if fFunc = 'GetInetFile' then
  begin
    ThreadStatus :=ACTIVE;
    if GetInetFile(FileURL,LocalFileName) = True then
      ThreadStatus :=SUCCESS
    else
    begin
      MessageBox(0, 'Unable to locate file', 'Error', MB_OK or MB_ICONERROR);
      ThreadStatus :=INACTIVE;
    end;
  end;

  if fFunc = 'Q3LevelLoad' then
    begin
      splashName := 'levelshots\' + ChangeFileExt(BSP_NAME, '.jpg');
      splashId := ShaderManager.LoadTexture(splashName, false, false);
      // glDraw(h_DC);

      Camera.screenlock := true;
      Camera.ResetPosition;

      //Loaded := Q3Level.LoadBSP(QUAKE_FOLDER , BSP_NAME, BSP_MAP_INDEX);
      if not Q3Level.LoadBSP('' , BSP_NAME, true) then PostQuitMessage(0);

      Player.LoadPlayer('\models\players\anarki', 'default');
      Player.SetAnim(0);
      LoadRailgun;

      with Q3Level.PlayerPosition do begin
        Camera.Init(FOV, SCREEN_WIDTH, SCREEN_HEIGHT, 1, 1, Angle);
        Camera.position.X := Position.x;
        Camera.position.Y := Position.y + 40;
        Camera.position.Z := Position.z + 0;
        Camera.ApplyCamera;
      end;
      //currentLeaf := Q3Level.FindLeaf(Camera.Position);

      SetCursorPos((SCREEN_WIDTH  DIV 2) + SCREEN_LEFT, (SCREEN_HEIGHT DIV 2) + SCREEN_TOP);
      drawgame := BSPINIT;
    end;
end;

procedure Q3Thread.GetFileFromInternet(URL, LocalFName: String);
{------------------------------------------------------------------}
{  Function to get a file from the internet using HTTP             }
{------------------------------------------------------------------}
var DownloadThread : THandle;
    ThreadID : DWord;
begin
  exit;
  ThreadStatus :=ACTIVE;
  FileURL :=URL;
  LocalFileName := LocalFName;
  //DownloadThread := CreateThread(nil, 0, @CreateRecID, nil, 0, ThreadID);
  if (DownloadThread = 0) then
    MessageBox(0, 'Unable to create a download thread', 'Error', MB_OK or MB_ICONERROR);
end;

function Q3Thread.GetInetFile(const fileURL, FileName: String): Boolean;
{------------------------------------------------------------------}
{  Creates a thread that downloads a texture from the internet     }
{------------------------------------------------------------------}
const BufferSize = 1024;
var hSession, hURL: HInternet;
    Buffer: array[1..BufferSize] of Byte;
    BufferLen: DWORD;
    f: File;
    sAppName: string;
    lpFindFileData: TWin32FindData;
begin
  Result:=False;
  sAppName := 'Jans OpenGL Texture loader';
  hSession := InternetOpen(
                 PChar(sAppName),                // agent. (can be "Microsoft Internet Explorer")
                 INTERNET_OPEN_TYPE_PRECONFIG,   // access
                 nil,                            // proxy server
                 nil,                            // defauts
                 0);                             // synchronous

  try
    hURL := InternetOpenURL(
               hSession,          // Handle to current session
               PChar(fileURL),    // URL to read
               nil,               // HTTP headers to send to server
               0,                 // Header length
               0, 0);             // flags   (might want to add some like INTERNET_FLAG_RELOAD with forces a reload from server and not from cache)
    if hURL <> nil then
    begin
      try
        AssignFile(F, FileName);
        Rewrite(F,1);
        repeat
          InternetReadFile(
             hURL,                  // File URL
             @Buffer,               // Buffer that receives data
             SizeOf(Buffer),        // bytes to read
             BufferLen);            // bytes read
          BlockWrite(F, Buffer, BufferLen)
        until BufferLen = 0;
        CloseFile(F);
        if Buffer[1] = $3D then     // basic check to see if its HTML returned
          Result:=FALSE             // if its the start of a tag, then error.
        else
          Result:=True;
      finally
        InternetCloseHandle(hURL)   // close connection to file
      end
    end;
  finally
    InternetCloseHandle(hSession) // close connection to internet
  end
end;

procedure Q3Thread.SetFunc(func: String);
begin
  if func = 'abc' then
     fFunc := func;
end;

initialization

//thread := Q3Thread.Create(false);

end.
