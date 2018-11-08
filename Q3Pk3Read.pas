unit Q3Pk3Read;

interface

uses
  System.Zip, System.Classes, Winapi.Windows, System.SysUtils;

type
  TQ3file = record
    Name, Path, Ext, Full: String;
  end;

  TPk3Colection = record
    ItemIndex: Integer;
    Count: Integer;
    Items: array of TQ3file;
    Pk3FileName: String;
  end;

  TZipPK3 = class
  private
    fZipFile: TZipFile;
    //fPK3FilesList: TStringlist;
    fpath, fbsp: TStringlist; // TODO change to property
    fpk3Index: TPk3Colection;
    fItem: TQ3file;

    procedure ScanFolder(const Path, ext: String;
      const subfolder: Boolean = true);
    procedure MyReadPK3(var FilePK3name: TPk3Colection); overload;
  public
    FILES_IN_PK3: array of TPk3Colection;

    constructor Create(Path: TStringlist); overload;
    destructor Destroy; override;

    function IndexOf(const Filename: String): TPk3Colection;
    function ReadFileInPK3(pk3: TPk3Colection; Filename: String): TMemoryStream;
    procedure Log(const sMsg: string);
    procedure SaveBytesToFile(const Data: TBytes; const FileName: string);

    property BSP_LIST : TStringlist read fbsp;
    property BASE_PATH : TStringlist read fpath;
    property PK3_INDEX : TPk3Colection read fpk3Index write fpk3Index;
    property ITEM_INDEX : TQ3file read fItem write fItem;
  end;

implementation

uses
  Vcl.Dialogs;

{ TZip }

constructor TZipPK3.Create(Path: TStringlist);
var
  i, j: Integer;
begin
  if not Assigned(fpath) then
  begin
    fpath := TStringlist.Create;
    fpath.Assign(Path);
  end
  else
  begin
    for i := 0 to Path.Count - 1 do
      fpath.Add(Path.Strings[i]);
  end;
  for i := 0 to fpath.Count - 1 do
    ScanFolder(fpath.Strings[i], '.pk3', true);
  // in my laptop [core i5] 1s reader 721 files to list
  // 25s for read 72 file pk3 - total: 1.5gb
  for i := 0 to length(FILES_IN_PK3) - 1 do
    MyReadPK3(FILES_IN_PK3[i]);

  fbsp := TStringlist.Create;
  for i := 0 to length(FILES_IN_PK3) - 1 do
    for j := 0 to FILES_IN_PK3[i].Count - 1 do
      if FILES_IN_PK3[i].Items[j].Ext = '.bsp' then
        fbsp.Add(FILES_IN_PK3[i].Items[j].Name);
end;

destructor TZipPK3.Destroy;
begin
  if Assigned(fpath) then
    fpath.Free;
  Log('Stop log at ' + formatdatetime('c', now()) + #$D#$A);
  inherited;
end;

function TZipPK3.IndexOf(const Filename: String): TPk3Colection;
var
  i, k: Integer; s: string;
begin
  // vi truoc do doi o ham MyReadPK3 nen gio doi lai
  Result.ItemIndex := -1;
  s := Filename;
  s := StringReplace(s, '\', '/', [rfReplaceAll]);
  for i := 0 to length(FILES_IN_PK3) - 1 do
    for k := 0 to FILES_IN_PK3[i].Count - 1 do
    begin
      if (i = 0) and (k = 0) then
         Log('TZipPK3.IndexOf log at ' + formatdatetime('c', now()) + #$D#$A);
      FILES_IN_PK3[i].ItemIndex := -1;
      if (FILES_IN_PK3[i].Items[k].Name.Equals(LowerCase(s)) )
        or (FILES_IN_PK3[i].Items[k].Full.Equals(LowerCase(s)) )then
          begin
             FILES_IN_PK3[i].ItemIndex := k;
             fpk3Index := FILES_IN_PK3[i];
             exit(FILES_IN_PK3[i]);
          end;
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

procedure TZipPK3.MyReadPK3(var FilePK3name: TPk3Colection);
var
  xZipFile: TZipFile;
  i: Integer;
  xFilename: string;
begin
  xFilename := StringReplace(FilePK3name.Pk3FileName, '/', '\', [rfReplaceAll]);
  xZipFile := TZipFile.Create;
  try
    xZipFile.Open(xFilename, zmRead);

    FilePK3name.Count := xZipFile.FileCount;
    SetLength(FilePK3name.Items, FilePK3name.Count);

    for i := 0 to xZipFile.FileCount - 1 do
    begin
      xFilename := xZipFile.Filename[i];
      FilePK3name.Items[i].Full := xFilename;
      // Phia giu nguyen ten file, doi se khong tim thay by trong zip luu kieu byte
      xFilename := StringReplace(xFilename, '/', '\', [rfReplaceAll]);
      FilePK3name.Items[i].Name := ExtractFileName(xFilename);
      FilePK3name.Items[i].Path := ExtractFilePath(xFilename);
      FilePK3name.Items[i].Ext := ExtractFileExt(xFilename);

      // Log(format('FileName: ' + #9 + '%s' + #9 + 'ext: ' + #9 + '%s' + #9 +
      //  'PK3: ' + #9 + '%s' + #9 + 'Time: ' + #9 + '%s' + #$D#$A,
      //  [xFilename, ExtractFileExt(xFilename), Filename, formatdatetime('c',
      //  now())]));
    end;
    xZipFile.Close;
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + #10#13 + E.Message + #10#13 + FilePK3name.Pk3FileName);
    end;
  end;
  xZipFile.Free;
end;

function TZipPK3.ReadFileInPK3(pk3: TPk3Colection; Filename: String): TMemoryStream;
var
  Zip: TZipFile;
  //LocalHeader: TZipHeader;
  Bytes: TBytes;
  i, k: Integer;
  s, s1, xFilename: String;
begin
  Zip := TZipFile.Create;
  try
    Zip.Open(pk3.Pk3FileName, zmRead);
    for I := 0 to pk3.Count - 1 do
      if (pk3.Items[i].Name = Filename) or (pk3.Items[i].Full = Filename) then
        begin
          Zip.Read(pk3.Items[i].Full, Bytes);
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
          s := 'temps\' + ExtractFileName(pk3.Pk3FileName) + '\' + pk3.Items[i].Full;
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
            if (pk3.Items[i].Ext = '.bmp') or (pk3.Items[i].Ext = '.jpg')
              or (pk3.Items[i].Ext = '.tga') or (pk3.Items[i].Ext = '.shader') then
              result.SaveToFile(s);
         end;
      finally
        // result.Free;
        // se sua loi memory nay sau
      end;
    end;
    Zip.Close;
  except
    result := nil;
  end;
  Zip.Free;
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
          Setlength(FILES_IN_PK3, length(FILES_IN_PK3) + 1);
          with FILES_IN_PK3[length(FILES_IN_PK3) -1] do
          begin
            Pk3FileName := sPath + rec.Name;
          end;
        end;
      end;
    until FindNext(rec) <> 0;
    FindClose(rec);
  end;
end;

initialization

end.
