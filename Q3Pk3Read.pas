unit Q3Pk3Read;

interface

uses
  System.Zip, System.Classes, Winapi.Windows, System.SysUtils;

type
  TQ3file = record
  public
    Name, Path, Ext, Full, Pk3FileName: String;
  end;

  TPk3Colection = class(TCollectionItem)
  private
  public
    ItemIndex: Integer;
    Count: Integer;
    Pk3FileName: String;
    FileNames: array of TQ3file;
    function IndexOf(Index : integer): integer; overload;
    function IndexOf(FileName: String): integer; overload;
    constructor Create(AOwner : TCollection); override;
  end;

  TZipPK3 = class(TCollection)
  private
    //fPK3FilesList: TStringlist;
    fZipFile: TZipFile;
    fBasepath, fbsp, fAllFiles: TStringlist; // TODO change to property
    //fpk3Index: TPk3Colection;
    //fItem: TQ3file;

    function GetItem(Index : integer) : TPk3Colection;
    function checkPk3samename(filename: String; IsOpen: integer): Boolean;
    procedure ScanFolder(const Path, ext: String;
      const subfolder: Boolean = true);
    procedure MyReadPK3(FilePK3name: TPk3Colection); overload;
    procedure SearchDuplicates();
    function IndexOf(const Filename: String): integer;
    function ReadFileInPK3(pk3: TPk3Colection; Filename: String): TMemoryStream;
  public
    IsOpenIndex: Integer;
    //PK3_SELECT : TPk3Colection;
    //FILES_IN_PK3: array of TPk3Colection;

    constructor Create(Path: TStringlist; Mapname: String); overload;
    destructor Destroy; override;

    function GetFileBytes(Index: integer): TMemoryStream; overload;
    function GetFileBytes(Filename: String): TMemoryStream; overload;
    function GetFileName(Filename: String): Boolean;
    procedure Log(const sMsg: string); overload;
    procedure Log(filename: String; const sMsg: string); overload;
    procedure SaveBytesToFile(const Data: TBytes; const FileName: string);

    property Items[Index: Integer]: TPk3Colection read GetItem; default;
    property BSP_LIST : TStringlist read fbsp;
    property BASE_PATH : TStringlist read fBasepath;
  end;

implementation

uses
  Vcl.Dialogs;

{ TZip }

function TZipPK3.checkPk3samename(filename: String; IsOpen: integer): Boolean;
var
  i: Integer;
begin
  if IsOpen <> -1 then
    if Items[IsOpen].Pk3FileName = filename then
      exit(true);

  Result := false;
end;

constructor TZipPK3.Create(Path: TStringlist; Mapname: String);
var
  i, j: Integer;
begin
  inherited Create(TPk3Colection);

  if not Assigned(fBasepath) then
  begin
    fBasepath := TStringlist.Create;
    fBasepath.Sorted := true;
    fBasepath.Duplicates := dupIgnore;
    fBasepath.Assign(Path);
  end
  else
  begin
    for i := 0 to Path.Count - 1 do
      fBasepath.Add(Path.Strings[i]);
  end;
  for i := 0 to fBasepath.Count - 1 do
    ScanFolder(fBasepath.Strings[i], '.pk3', true);
  // in my laptop [core i5] 1s reader 721 files to list
  // 25s for read 72 file pk3 - total: 1.5gb
  fZipFile := TZipFile.Create;
  //fZipFile.Open('D:\DUNG\project\delphi\OpenGL\Quake3\quake3source\baseQ3\Mods\mfq3_1.pk3', zmRead);
  IsOpenIndex := -1;
  for i := 0 to count - 1 do
    MyReadPK3(Items[i]);
  IsOpenIndex := IndexOf(Mapname);

  fAllFiles := TStringlist.Create;
  fAllFiles.Sorted := true;
  fAllFiles.Duplicates := dupIgnore;
  for i := 0 to count - 1 do
    for j := 0 to Items[i].Count - 1 do
      if Items[i].FileNames[j].Ext <> '' then
        fAllFiles.Add(Items[i].FileNames[j].Full);

  fbsp := TStringlist.Create;
  fbsp.Sorted := true;
  fbsp.Duplicates := dupIgnore;
  for i := 0 to count - 1 do
    for j := 0 to Items[i].Count - 1 do
      if Items[i].FileNames[j].Ext = '.bsp' then
        fbsp.Add(Items[i].FileNames[j].Name);
  // SearchDuplicates;
end;

destructor TZipPK3.Destroy;
begin
  if Assigned(fBasepath) then
    fBasepath.Free;
  if Assigned(fZipFile) then
    fZipFile.Free;
  Log('Stop log at ' + formatdatetime('c', now()) + #$D#$A);
  inherited;
end;

function TZipPK3.GetFileBytes(Index: integer): TMemoryStream;
var
  Bytes: TBytes;
  i: Integer;
begin
  if IsOpenIndex <> -1 then
    begin
      Index := Items[IsOpenIndex].IndexOf(Items[IsOpenIndex].FileNames[Index].Full);
      if Index <> -1 then
        fZipFile.Read(Items[IsOpenIndex].FileNames[Index].Full, Bytes);
      if length(Bytes) > 0 then
      begin
        result := TMemoryStream.Create;
        result.WriteBuffer(Bytes[0], length(Bytes));
        result.Position := 0;
        exit;
      end;
    end;
end;

function TZipPK3.GetFileBytes(Filename: String): TMemoryStream;
var
  i: Integer;
begin
  Filename := StringReplace(Filename, '\', '/', [rfReplaceAll]);
  i := Items[IsOpenIndex].IndexOf(Filename);
  if i <> -1 then
      exit(GetFileBytes(i));
  // không tìm thấy
  if IndexOf(Filename) <> -1 then
    exit(GetFileBytes(Filename));
end;

function TZipPK3.GetFileName(Filename: String): Boolean;
var
  i: Integer;
begin
  result := false;
  Filename := StringReplace(Filename, '\', '/', [rfReplaceAll]);
//  if IsOpenIndex = -1 then
//    exit(false);
  i := Items[IsOpenIndex].IndexOf(Filename);
  if i <> -1 then
      exit(true);
  // không tìm thấy
  if IndexOf(Filename) <> -1 then
    exit(GetFileName(Filename));
end;

function TZipPK3.GetItem(Index: integer): TPk3Colection;
begin
  result := inherited Items[Index] as TPk3Colection;
end;

function TZipPK3.IndexOf(const Filename: String): integer;
var
  i, k: Integer; s: string;
begin
  // vi truoc do doi o ham MyReadPK3 nen gio doi lai
  s := ExtractFileName(Filename);
  s := StringReplace(s, '\', '/', [rfReplaceAll]);
  for i := 0 to count - 1 do
    for k := 0 to Items[i].Count - 1 do
    begin
      if (i = 0) and (k = 0) then
         Log('TZipPK3.IndexOf log at ' + formatdatetime('c', now()) + #$D#$A);
      Items[i].ItemIndex := -1;
      if (Items[i].FileNames[k].Name.Equals(LowerCase(s)) )
        or (Items[i].FileNames[k].Full.Equals(LowerCase(s)) )then
          begin
             Items[i].ItemIndex := k;
             fZipFile.Close;
             fZipFile.Open(Items[i].Pk3FileName, zmRead);
             IsOpenIndex := i;
             exit(i);
          end;
    end;
  //IsOpenIndex := -1;
  Result := -1;
end;

procedure TZipPK3.Log(filename: String; const sMsg: string);
var
  c1, c2: dword;
begin
  c1 := CreateFile(Pchar(filename), GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_ALWAYS, 0, 0);
  if c1 <> INVALID_HANDLE_VALUE then
  begin
    SetFilePointer(c1, 0, nil, FILE_END);
    WriteFile(c1, pointer(sMsg)^, 2 * length(sMsg), c2, nil);
    CloseHandle(c1);
  end;
end;

procedure TZipPK3.Log(const sMsg: string);
var
  c1, c2: dword;
begin
  c1 := CreateFile('Q3log.txt', GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_ALWAYS, 0, 0);
  if c1 <> INVALID_HANDLE_VALUE then
  begin
    SetFilePointer(c1, 0, nil, FILE_END);
    WriteFile(c1, pointer(sMsg)^, 2 * length(sMsg), c2, nil);
    CloseHandle(c1);
  end;
end;

procedure TZipPK3.MyReadPK3(FilePK3name: TPk3Colection);
var
  i: Integer;
  xFilename: string;
begin
  if not checkPk3samename(FilePK3name.Pk3FileName, IsOpenIndex) then
    begin
      //xFilename := StringReplace(FilePK3name.Pk3FileName, '/', '\', [rfReplaceAll]);
      try
        fZipFile.Close;
        Sleep(5);
        fZipFile.Open(FilePK3name.Pk3FileName, zmRead);
      except
        on E: Exception do
          begin
            ShowMessage(E.ClassName + #10#13 + E.Message + #10#13 + FilePK3name.Pk3FileName);
          end;
      end;
    end;

    FilePK3name.Count := fZipFile.FileCount;
    SetLength(FilePK3name.FileNames, FilePK3name.Count);
    for i := 0 to fZipFile.FileCount - 1 do
      with FilePK3name.FileNames[i] do
      begin
          // FilePK3name.FileNames[i].
          xFilename := fZipFile.Filename[i];
          Full := xFilename;
          // Phia giu nguyen ten file, doi se khong tim thay by trong zip luu kieu byte
          xFilename := StringReplace(xFilename, '/', '\', [rfReplaceAll]);
          Name := ExtractFileName(xFilename);
          Path := ExtractFilePath(xFilename);
          Ext := ExtractFileExt(xFilename);
          Pk3FileName := FilePK3name.Pk3FileName;
          // Log(format('FileName: ' + #9 + '%s' + #9 + 'ext: ' + #9 + '%s' + #9 +
          //  'PK3: ' + #9 + '%s' + #9 + 'Time: ' + #9 + '%s' + #$D#$A,
          //  [xFilename, ExtractFileExt(xFilename), Filename, formatdatetime('c',
          //  now())]));
      end;
end;

function TZipPK3.ReadFileInPK3(pk3: TPk3Colection; Filename: String): TMemoryStream;
var
  //LocalHeader: TZipHeader;
  Bytes: TBytes;
  i, k: Integer;
  s, s1: String;
begin
  if not checkPk3samename(PK3.Pk3FileName, IsOpenIndex) then
    begin
      try
        fZipFile.Close;
        fZipFile.Open(pk3.Pk3FileName, zmRead);
      except
        on E: Exception do
          begin
            ShowMessage(E.ClassName + #10#13 + E.Message + #10#13 + pk3.Pk3FileName);
          end;
      end;
    end;

    // if fZipFile.IsValid(PK3.Pk3FileName) then
    for I := 0 to pk3.Count - 1 do
      if (pk3.FileNames[i].Name = Filename) or (pk3.FileNames[i].Full = Filename) then
        if -1 <> fZipFile.IndexOf(pk3.FileNames[i].Full) then
        begin
          k := fZipFile.IndexOf(pk3.FileNames[i].Full);
          fZipFile.Read(pk3.FileNames[i].Full, Bytes);
          Break;
        end;

    if length(Bytes) > 0 then
    begin
      result := TMemoryStream.Create;
      try
        result.WriteBuffer(Bytes[0], length(Bytes));
        result.Position := 0;


        if false then
        begin
          // chua biet cach load Texture from TmemoryStream nen tam thoi save vao temp de load
          s := 'temps\' + ExtractFileName(pk3.Pk3FileName) + '\' + pk3.FileNames[i].Full;
          s := StringReplace(s, '/', '\', [rfReplaceAll]);
          k := pos('\', s, 1);
          while k <> 0 do
            begin
              s1 := Copy(s, 1, k - 1);
              //s := Copy(s, k + 1, length(s));
              k := pos('\', s, k + 1);
              CreateDir(s1);
            end;
          k := pos('/', s, 1);
          while k <> 0 do
            begin
              s1 := Copy(s, 1, k - 1);
              //s := Copy(s, k + 1, length(s));
              k := pos('/', s, 1);
              CreateDir(s1);
            end;

          // CreateDir(s + pk3.Items[i].Path);
          // ForceDirectories(s + pk3.Items[i].Path);
            if (pk3.FileNames[i].Ext = '.bmp') or (pk3.FileNames[i].Ext = '.jpg')
              or (pk3.FileNames[i].Ext = '.tga') or (pk3.FileNames[i].Ext = '.shader') then
              result.SaveToFile(s);
         end;
      finally
        // result.Free;
        // se sua loi memory nay sau
      end;
    end;
end;

procedure TZipPK3.SaveBytesToFile(const Data: TBytes; const FileName: string);
var
  stream: TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    if length(data) > 0 then
      stream.WriteBuffer(data[0], length(data));
    stream.SaveToFile(FileName);
  finally
    stream.Free;
  end;
end;

procedure TZipPK3.ScanFolder(const Path, ext: String;
  const subfolder: Boolean = true);
var
  sPath: string;
  rec: TSearchRec;
begin
  sPath := IncludeTrailingPathDelimiter(Path);
  if FindFirst(sPath + '*.*', faAnyFile, rec) = 0 then
  begin
    repeat
      if (rec.Attr and faDirectory) <> 0 then
      begin
        // item is a directory
        if (rec.Name <> '.') and (rec.Name <> '..') then
          ScanFolder(sPath + rec.Name, ext, true);
      end
      else
      begin
        // item is a file
        if ExtractFileExt(LowerCase(rec.Name)) = ext then
        begin
          with TPk3Colection(Add) do
          begin
            Pk3FileName := sPath + rec.Name;
          end;
        end;
      end;
    until FindNext(rec) <> 0;
    FindClose(rec);
  end;
end;

procedure TZipPK3.SearchDuplicates();
  procedure ExtractDuplicates2(List1, List2: TStringList; var Dupes: TStrings);
  var
    Both: TStringList;
    I: Integer;
  begin
    Both := TStringList.Create;
    try
      Both.AddStrings(List1);
      Both.AddStrings(List2);
      Both.Sort;
      for I := 0 to Both.Count - 2 do
        if (Both[I] = Both[I + 1]) then
          if (Dupes.Count = 0) or (Dupes[Dupes.Count - 1] <> Both[I]) then
            Dupes.Add(Both[I]);
    finally
      Both.Free;
    end;
  end;
var
  i, j, k, l: Integer;
  temfile : array of TStringlist;
  pk: TPk3Colection;
  Dupes: TStrings;
begin
  for i := 0 to count - 1 do
    for j := 0 to Items[i].Count - 1 do
      begin
        for k := i + 1 to count - 1 do
          for l := 0 to Items[k].Count - 1 do
             if Items[i].FileNames[j].Ext <> '' then
               if Items[i].FileNames[j].Full = Items[k].FileNames[l].Full then
                Log('temps/Duplicates.csv', format('%s,%s,%s',[Items[i].FileNames[j].Full,
                   Items[i].Pk3FileName, Items[k].Pk3FileName + #10#13]));
      end;
  for i := 0 to count - 1 do
    for j := 0 to Items[i].Count - 1 do
             if Items[i].FileNames[j].Ext <> '' then
                Log('temps/all.csv', format('%s,%s',[Items[i].FileNames[j].Full,
                   Items[i].Pk3FileName + #10#13]));
end;

{ TPk3Colection }

constructor TPk3Colection.Create(AOwner: TCollection);
begin
  inherited Create(AOwner);
end;

function TPk3Colection.IndexOf(Index: integer): integer;
begin
  if Index < count then
    exit(Index);
end;

function TPk3Colection.IndexOf(FileName: String): integer;
var
  i: integer;
begin
  Result := -1;
  FileName := ExtractFileName(FileName);
  for I := Low(FileNames) to High(FileNames) do
    if (Filename = FileNames[i].Full) or (Filename = FileNames[i].Name) then
      exit(i);
end;

initialization

end.
