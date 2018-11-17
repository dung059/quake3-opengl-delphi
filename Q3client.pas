unit Q3client;

interface

uses
  System.Classes, System.Win.ScktComp, Winapi.Windows;
type
  TClientThread = class(TThread)
  private
    memory: TMemoryStream;
    ClientSocket: TClientSocket;
    LastUpdate: DWORD;
    Traffic: integer;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; const Address: string);
    destructor Destroy; override;
  end;

implementation

uses
  global, System.SysUtils, System.Math;

{ TClientThread }

constructor TClientThread.Create(CreateSuspended: Boolean;
  const Address: string);
var
  i: integer;
begin
  memory := TMemoryStream.Create;
  ClientSocket := TClientSocket.Create(nil);
  ClientSocket.ClientType := ctBlocking;
  i := pos(':', Address);
  ClientSocket.Address := copy(Address, 1, i - 1);
  ClientSocket.Port := StrToInt(copy(Address, i + 1, MaxInt));
  ClientSocket.Active := true;
  inherited Create(CreateSuspended);
end;

destructor TClientThread.Destroy;
begin
  ClientSocket.Free;
  memory.Free;
  inherited;
end;

procedure TClientThread.Execute;
var
  Socket: TClientWinSocket;
  ScreenStream: TMemoryStream;
  Cmd: word;
  FileSizePoint: TPoint;
  Buf: array [0 .. 1023] of byte;
  Size, ToRead: integer;
begin
  Socket := ClientSocket.Socket;
  try
    ScreenStream := TMemoryStream.Create;
    try
      while Socket.Connected and not Terminated do
      begin
        Cmd := 1;
        if Socket.SendBuf(Cmd, sizeOf(Cmd)) <> sizeOf(Cmd) then
          exit;
        if Socket.SendBuf(FileSizePoint, sizeOf(FileSizePoint)) <> sizeOf(FileSizePoint) then
          exit;
        if Socket.ReceiveBuf(Size, sizeOf(Size)) <> 4 then
          exit;
        if (Size < 0) or (Size > MaxInt - 1) then
          exit;
        ScreenStream.Size := Size;
        ScreenStream.Position := 0;
        ToRead := ScreenStream.Size - ScreenStream.Position;
        ToRead := Min(ToRead, Length(Buf));
        while (ToRead > 0) and Socket.Connected do
        begin
          Size := Socket.ReceiveBuf(Buf, ToRead);
          if Size < 0 then
            exit;
          ScreenStream.WriteBuffer(Buf, Size);
          ToRead := ScreenStream.Size - ScreenStream.Position;
          ToRead := Min(ToRead, Length(Buf));
        end;
        ScreenStream.Position := 0;
        Traffic := ScreenStream.Size;
      end;
    finally
      ScreenStream.Free;
    end;
  finally
    Socket.Close;
  end;
end;

begin
  ClientSocket := TClientSocket.Create(nil);
  ClientSocket.Port := 29802;
  ClientSocket.Address := 'localhost';
  ClientSocket.ClientType := ctBlocking;

end.
