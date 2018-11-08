
unit q3shaders;

interface

uses StdCtrls, sysutils, classes, OpenGL, Hashes;

const
  Rad = Pi / 180.0;

var skyboxId : integer = -1;

type enSortKey = (SK_NONE = 0, SK_PORTAL = 1, SK_SKY = 2, SK_OPAQUE = 3, SK_BANNER = 6, SK_TRANS = 7, SK_UNDERWATER = 8, SK_ADDITIVE = 9, SK_NEAREST = 16);
type enTCGen =   (TCGEN_STANDARD = 0, TCGEN_ENVIRONMENT = 1, TCGEN_BASE = 2, TCGEN_LIGHTMAP = 3, TCGEN_VECTOR = 4);
type enrgbGen =  (RGBGEN_IDENTITYLIGHTNING = 0, RGBGEN_IDENTITY = 1, RGBGEN_WAVE = 2, RGBGEN_ENTITY = 3, RGBGEN_ONEMINUSENTITY = 4,
                  RGBGEN_VERTEX = 5, RGBGEN_ONEMINUSVERTEX = 6, RGBGEN_LIGHTNINGDIFFUSE = 7);
type entcmod =   (TCMOD_UNUSED = 0, TCMOD_ROTATE = 1, TCMOD_SCALE = 2, TCMOD_SCROLL = 3, TCMOD_STRETCH = 4, TCMOD_TRANSFORM = 5, TCMOD_TURB = 6);
type enWave =    (WF_NONE = 0, WF_SIN = 1, WF_TRIANGLE = 2, WF_SQUARE = 3, WF_SAWTOOTH = 4, WF_INVSAWTOOTH = 5, WF_NOISE = 6);
type enDeformType = (DEFORMVERTEXES_NONE = 0,	      // 0 parameters
                     DEFORMVERTEXES_WAVE = 1,	      // 6 parameters
                     DEFORMVERTEXES_NORMAL= 2,	      // 5 parameters
                     DEFORMVERTEXES_BULGE = 3,	      // 3 parameters
                     DEFORMVERTEXES_MOVE = 4,	      // 8 parameters
                     DEFORMVERTEXES_AUTOSPRITE	= 5,  // 0 parameters
                     DEFORMVERTEXES_AUTOSPRITE2	= 6); // 0 parameters

type TDeformVertexes = record
  deformType : enDeformType;
  values : array[0..7] of single;
end;

type TWaveFunc = record
  func : enWave;
  base : Single;
  amp  : Single;
  phase : Single;
  freq : Single;
  // state info
  curStatus : single;
  Direction : boolean;
end;

type TrgbGen = record
  rgbGType :  enrgbGen;
  Values : array[0..5] of single;
  Wave : TWaveFunc;
end;

type Ttcmod = record
  modType : entcmod;
  Values : array[0..5] of single;
  Wave : TWaveFunc;
end;

type TFogParam = record
  Red : single;
  Green : single;
  Blue : single;
  Alpha : single;
  Distance : single;
end;

type TLayer = record
  TextureNames : array of string;
  TextureId : array[0..7] of GLUINT;
  numOfTextures : byte;
  tcMods : array  of Ttcmod;
  numOftcMods : integer;
  rgbGen : array of TrgbGen;
  numOfrgbGen : integer;
  animFreq : Single;
  animFrameTime : integer; // 1 frame each animFreq ms
  doBlending : Boolean;
  doAlphaTest : Boolean;
  DepthWrite :Boolean;
  DepthFunc : integer;
  DestBlend : integer;
  SrcBlend : integer;
  AlphaFunc : integer;
  AlphaRef : single;
  alphaWave : TWaveFunc;
  UseLightmap : boolean;
  UseVertexColors : boolean;

  // state infos
  curAnimStat : integer;
  curTexture : integer;
  curColor : array[0..3] of byte; // rgba
  TexClamp :  Boolean;
  tcGen : enTcGen;

  //Default Scaling-value
  tcModScaleX  : single;
  tcModScaleY  : single;
  tcModStretchX : single;
  tcModStretchY : single;
  rgbFactor    : single;
  XOffset : single;
  YOffset : single;
  rotate : single;
end;

type TShader = class(TCollectionItem)
  public
    ShaderFile : string;
    Name : string;
    lastTime : longword;
    Cull : integer;
    Source : string;
    Surface : cardinal;
    Contents : cardinal;
    Layers : array of TLayer;
    numOfLayers : integer;
    numOfDeformVertexes : integer;
    qerImage : string;
    qerId : GLUINT;
    NoMipMap : boolean;
    NoPicMip : boolean;
    IsSkyBox : boolean;
    effectIndex : integer;
    FogValues : array[0..1] of single;
    DeformVertexes : array of TDeformVertexes;
    Fog : TFogParam;
    hasFog : boolean;
    SortKey : enSortKey;
    TotallyTrans : boolean;
    SkyboxType : integer;
    SkyboxTextureNames : array of string;
    SkyboxTextureIds : array of cardinal;

    constructor Create(AOwner : TCollection); override; // for inital values
end;
type PShader = ^TShader;

type TShaderManager = class(TCollection)
  private
    FGeneralTexture : cardinal;
    FAvailableShaders : TStringList;
    FRequiredShaders : TStringList;
    FLoadedTextures : TIntegerHash;
    FPath : TStringList;
    FTempScript: TStringList;
    function GetItem(Index : integer) : TShader;
    function ScanShader(path, filename : string; memorystream: TMemoryStream) : boolean; // get available shaders
    function ReadShadersFromList(filename : string; list : TStringList) : boolean;
    function ScanAvailableShaders : boolean;
  public
    constructor Create(quakePath : TStringList);
    destructor Destroy; override;
    function IndexOf(name : string) : integer;
    function ReadRequiredShaders : boolean;
    function LoadTexture(name : string;  NoPicMip, NoMipMap : boolean) : GLUINT;
//    procedure SetLayer(ShaderID, StageID : integer);
    procedure SetState(ShaderID, StageID : integer);
//    procedure SetMods(ShaderID, StageID : integer);
    property Items[Index: Integer]: TShader read GetItem; default;
    property AvailableShaders : TStringList read FAvailableShaders;
    property RequiredShaders : TStringList read FRequiredShaders write FRequiredShaders;
    property LoadedTextures : TIntegerHash read FLoadedTextures write FLoadedTextures;
end;

function Eval(wave : TWaveFunc) : single;

implementation

uses shaderValues, dialogs, textures, q3bsp, global, q3Timer, math3d, q3types, strutils;

function IsNumeric(s : string) : boolean;
var i, l : integer;
begin
  if Length(s) > 0 then begin
    result := true;
    for i := 1 to Length(s) do begin
      if (MidStr(s, i, 1) < '0') or (MidStr(s, i, 1) > '9') then begin
        result := false;
        exit;
      end;
    end;
  end
  else
    result := false;
end;

function Eval(wave : TWaveFunc) : single;
var x, y : single;
begin
  // Evaluate a number of time based periodic functions
  // y = p[1] + p[2] * func( (time + p[3]) * p[4] )
  // y =  base + amp * func(timer + phase*freq)

  x := (gTimer.TotalTime  + wave.phase) * wave.freq;
//  x := gTimer.TotalTime  + wave.phase * wave.freq;
  x := x - Trunc(x);		// normalized

  case wave.func of
    wf_Sin :
      y := Sin(x * M_TWO_PI);
    wf_Triangle :
      if (x < 0.5) then
        y := 4.0 * x - 1.0
      else
        y := -4.0 * x + 3.0;
    wf_Square :
	if (x < 0.5) then
          y := 1.0
	else
          y := -1.0;
    wf_SawTooth :
      y := x;
    wf_InvSawTooth :
      y := 1.0 - x;
    wf_Noise :
      ; // NOP
  end;
  result :=  y * wave.amp + wave.base;
end;

function removeExt(const s : string) : string;
var p : integer;
begin
  p := Pos('.tga', s);
  if p > 0 then begin
    result := Copy(s, 1, p-1);
    exit;
  end;

  p := Pos('.jpg', s);
  if p > 0 then begin
    result := Copy(s, 1, p-1);
    exit;
  end
  else
    result := s;
end;

function StrToFloat(s : string) : extended;
begin
  try
    s := StringReplace(s, '.', ',', [rfReplaceAll]);
    result := sysutils.StrToFloat(s);
  except
    ShowMessage('Cant convert ' + s);
    result := 0.0;
  end;
end;

function RemoveComment(txt : string) : string;
var p : integer;
    tmp : string;
begin
  txt := Trim(Txt);
  txt := StringReplace(txt, #9,  ' ', [rfReplaceAll]);

  tmp := txt;
  p := Pos('//', txt);
  if p > 0 then
    tmp := Trim(Copy(txt, 1, p-1));
  p := Pos('#', txt);
  if p > 0 then
    tmp := Trim(Copy(txt, 1, p-1));
  result := Trim(tmp);
end;

function GetToken(var txt : string) : string;
var l, p : integer;
    tmp : string;
begin
  l := Length(txt);
  tmp := '';

  p := Pos(' ', txt);
  if p > 0 then begin  // found
    result := Trim(Copy(txt, 1, p-1));
    txt := Trim(Copy(txt, p+1, l-p));
  end
  else begin // not found
    result := Trim(txt);
    txt := '';
  end;
end;

function SplitList(var txt : string) : string;
var l, p : integer;
    tmp : string;
begin
  l := Length(txt);
  tmp := '';

  p := Pos('=', txt);
  if p > 0 then begin  // found
    result := Trim(Copy(txt, 1, p-1));
    txt := Trim(Copy(txt, p+1, l-p));
  end
  else begin // not found
    result := Trim(txt);
    txt := '';
  end;
end;

procedure Tokenize(txt : string; Tokens : TStringList);
var tok : string;
begin
  Tokens.Clear;
  repeat
    tok := GetToken(txt);
    if tok <> '' then
      Tokens.Add(tok);
  until txt = '';
end;

function ConvertPath(p : string) : string;
begin
  result := StringReplace(p, '/', '\', [rfReplaceAll]);
end;

type
  CharArray = array[1..10000000] of char;
  CharArrayPtr = ^CharArray;

Procedure ReadALine(MyStream : TMemoryStream; var TheLine : String);
var
  Length : Integer;
begin
  length := 0;
  while (MyStream.Position < MyStream.Size) and not
        (CharArrayPtr(MyStream.Memory)[MyStream.Position + length] in [#10, #13]) do
        inc(Length);
  setlength(TheLine, Length - 1);
  MyStream.Read(TheLine[1], Length);

  while (MyStream.Position < MyStream.Size) and not
        (CharArrayPtr(MyStream.Memory)[MyStream.Position + length] in [#10, #13]) do
  MyStream.Position := MyStream.Position + 1;
end;

Procedure WriteALine(MyStream : TMemoryStream; TheLine: String);
var
  Temp : String;
begin
  MyStream.Write(TheLine[1], Length(TheLine));
  Temp := #10#13;
  MyStream.Write(Temp [1], Length(Temp ));
end;

// TShader *********************************************************************
constructor TShader.Create(AOwner : TCollection);
begin
  inherited Create(AOwner);
end;

function TShaderManager.GetItem(Index : integer) : TShader;
begin
  result := inherited Items[Index] as TShader;
end;

// TShaders ********************************************************************
function TShaderManager.ScanAvailableShaders : boolean;
var
  sr: TSearchRec;
  fullpath, dir : string;
  i, k: Integer;
  temp: TMemoryStream;
begin
  result := false;
  if Count > 0 then Clear;

  FAvailableShaders.Clear;

  // first scan in base_path for scripts
  for I := 0 to FPath.Count - 1 do
  begin
    fullpath := FPath.Strings[i] + 'scripts\';

    dir := FPath.Strings[i] + 'scripts\*.shader';
    if FindFirst(dir, faAnyFile, sr) = 0 then begin
      repeat
        ScanShader(fullpath,  sr.Name, nil);
      until FindNext(sr) <> 0;
      FindClose(sr);
      result := true;
    end;
  end;

  // second scan in pk3 file in base_path
  for I := 0 to length(Pk3Zip.FILES_IN_PK3) - 1 do
    for k := 0 to Pk3Zip.FILES_IN_PK3[i].Count - 1 do
      begin
        if Pk3Zip.FILES_IN_PK3[i].Items[k].Ext = '.shader' then
        begin
          temp := Pk3Zip.ReadFileInPK3(Pk3Zip.FILES_IN_PK3[i], Pk3Zip.FILES_IN_PK3[i].Items[k].Full);
          ScanShader(Pk3Zip.FILES_IN_PK3[i].Pk3FileName, Pk3Zip.FILES_IN_PK3[i].Items[k].Full, temp);
          temp.Free;
    //      Pk3Zip.Log(format('FileName: ' + #9 + '%s' + #9 + 'ext: ' + #9 + '%s' + #9 +
    //        'PK3: ' + #9 + '%s' + #9 + 'Time: ' + #9 + '%s' + #$D#$A,
    //        [xfile, ExtractFileExt(xfile), Pk3Zip.FILES_IN_PK3[i].FullPath,
    //        formatdatetime('c', now())]));
          result := true;
        end;
      end;

end;

function TShaderManager.IndexOf(name : string) : integer;
var i : integer;
begin
  result := -1;
  name := lowercase(name);
  if Count > 0 then begin
    for i := 0 to Count-1 do begin
      if LowerCase(Items[i].Name) = name then begin
        result := i;
        exit;
      end;
    end;
  end;
end;

constructor TShaderManager.Create(quakePath : TStringList);
begin
  inherited Create(TShader);

  FAvailableShaders := TStringList.Create;
  FRequiredShaders := TStringList.Create;
  FRequiredShaders.Sorted := true;
  FLoadedTextures := TIntegerHash.Create;
  FTempScript := TStringList.Create;

  FPath := TStringList.Create;
  if not Assigned(quakePath) then
    begin
      quakePath := TStringList.Create;
      quakePath.Add('C:\Quake III\baseq3\');
    end;
  FPath.Assign(quakePath);
  if FileExists('temps\scripts\script.shader') then
    begin
      FTempScript.LoadFromFile('temps\scripts\script.shader');
      ScanShader('', 'temps\scripts\script.shader', nil);
    end
  else
  begin
    ScanAvailableShaders;
    CreateDir('temps\scripts');
    FTempScript.SaveToFile('temps\scripts\script.shader');
  end;
end;

destructor TShaderManager.Destroy;
begin
  FAvailableShaders.Free;
  FRequiredShaders.Free;
  FLoadedTextures.Free;
  if Assigned(FPath) then
    FPath.Free;
  if Assigned(FTempScript) then
    begin
      FTempScript.SaveToFile('temps\scripts\script.shader');
      FTempScript.Free;
    end;

  inherited Destroy;
end;

function TShaderManager.ScanShader(path, filename : string; memorystream: TMemoryStream) : boolean;
var f : Text;
    line : string;
    lines: TStrings;
    stage, i : integer;
    tmp : string;
begin
  result := false;

  if Assigned(memorystream) then
    begin
      memorystream.Position := 0;
      // SetString(line, PChar(memorystream.Memory), memorystream.Size div SizeOf(Char));
      SetString(line, PAnsiChar(memorystream.Memory), memorystream.Size);

      lines := TStringList.Create;
      lines.Text := line;
      FTempScript.Text := FTempScript.Text + #$D#$A + line;

      i := 0;
      stage := 0;
      while i < lines.Count - 1 do
      begin
        line := lines[i];
        inc(i);
        line := RemoveComment(line);
        if (Copy(line, 1, 2) = '//') then continue;

        if (line <> '') and (stage=0) and (line <> '{') then begin // must be the shader name
          tmp := ConvertPath(line+'='+filename);
          FAvailableShaders.Add(tmp);
          continue;
        end;

        if Copy(line, 1, 1) = '{' then begin
          inc(stage);
          continue;
        end;
        if Copy(line, 1, 1) = '}' then begin
          dec(stage);
          continue;
        end;
      end;
      result := true;
      lines.free;
    end
  else
    begin
      AssignFile(f, path+filename);
      Reset(f);
      stage := 0;
      while not eof(f) do begin
        Readln(f, line);
        line := RemoveComment(line);
        if (Copy(line, 1, 2) = '//') then continue;

        if (line <> '') and (stage=0) and (line <> '{') then begin // must be the shader name
          tmp := ConvertPath(line+'='+filename);
          FAvailableShaders.Add(tmp);
          continue;
        end;

        if Copy(line, 1, 1) = '{' then begin
          inc(stage);
          continue;
        end;
        if Copy(line, 1, 1) = '}' then begin
          dec(stage);
          continue;
        end;
      end;
      CloseFile(f);
      exit(true);
    end;
end;

function TShaderManager.ReadShadersFromList(filename : string; list : TStringList) : boolean;

  function paramCheck(param: TStringList; pos: integer): string;
  begin
    if pos >= param.Count then
       Result := '0'
    else
       Result := param[pos];
  end;

var f : Text;
    line, tok, remain : string;
    stage : integer;
    curLayer : integer;
    newItem : TShader;
    tmpInt, i, k : integer;
    params : TStringList;
    required : boolean;
    src, path : string;
    modIdx, rgbIdx : integer;
    cast1, cast2 : integer;
label splitLine;    
begin
  result := false;
  params := TStringList.Create;
  k := 0;
  while k < Fpath.Count do
  begin
    path := FPath.Strings[k];
    inc(k);

    if FileExists(path+'scripts\'+ filename) then
    begin
      AssignFile(f, path+'scripts\'+ filename);
      Reset(f);
      stage := 0;
      src := '';
      while not eof(f) do begin
        Readln(f, line);

        src := src + line + #13#10;

    splitLine:

        line := RemoveComment(line);

        if (Copy(line, 1, 2) = '//') then continue;

        if (line <> '') and (stage=0) and (line <> '{') then begin // must be the shader name
          line := ConvertPath(line);
          required := (list.IndexOf(line) <> -1);
          if required then begin
            src := '';
            curLayer := 0;
            newItem := TShader(Add);
            newItem.Name := line;
            newItem.ShaderFile := path+'scripts\'+filename;
            newItem.numOfLayers := 0;
            newItem.NoMipMap := false;
            newItem.NoPicMip := false;
            newItem.Cull := GL_FRONT;
            newItem.qerId := 0;
            newItem.qerImage := '';
            newItem.HasFog := false;
            newItem.IsSkyBox := false;
            newItem.TotallyTrans := false;
            newItem.SortKey := sk_opaque;
            newItem.effectIndex := -1;
            newItem.SkyboxType := -1;
          end;
          continue;
        end;
        if Copy(line, 1, 1) = '{' then begin
          inc(stage);
          if (stage = 2) and required then begin
            inc(curLayer);
            SetLength(newItem.Layers, curLayer);
            // initial values
            newItem.Layers[curLayer-1].DepthFunc := GL_LEQUAL; //Lookup('lequal');
            newItem.Layers[curLayer-1].DepthWrite := true;
            newItem.Layers[curLayer-1].AlphaFunc := Lookup('noalpha');
            newItem.Layers[curLayer-1].AlphaRef := 1;
            newItem.Layers[curLayer-1].AlphaWave.func := wf_None;
            newItem.Layers[curLayer-1].doAlphaTest := false;
            newItem.Layers[curLayer-1].doBlending := false;
            newItem.Layers[curLayer-1].TexClamp := false;
            newItem.Layers[curLayer-1].numOfrgbGen := 0;
            newItem.Layers[curLayer-1].numOftcMods := 0;
            newItem.Layers[curLayer-1].UseVertexColors := false;
          end;
          if Length(line) > 1 then begin
            line := Trim(Copy(line, 2, Length(line)-1));
            goto splitLine;
          end
          else
            continue;
        end;
        if Copy(line, 1, 1) = '}' then begin
          dec(stage);
          if (stage = 1) and required then begin
            newItem.numOfLayers := curLayer;
          end;

          // copy last shader source
          if (stage = 0) and required then begin
            newItem.Source := src;
            src := '';
          end;

          if (stage = 0) then
            src := ''; // reset tmp source
          continue;
        end;

        if (Length(line) > 0) and required then begin
          line := LowerCase(line);
          Tokenize(line, params);

          if (stage = 1) then begin
            if params[0] = 'surfaceparm' then begin
    {          if params[1] = 'alphashadow' then
                newItem.Surface := newItem.Surface or SURF_ALPHASHADOW
              else if params[1] = 'areaportal' then
                newItem.Contents := newItem.Contents or CONTENTS_AREAPORTAL
              else if params[1] = 'clusterportal' then
                newItem.Contents := newItem.Contents or CONTENTS_CLUSTERPORTAL
              else if params[1] = 'donotenter' then
                newItem.Contents := newItem.Contents or CONTENTS_DONOTENTER
              else if params[1] = 'flesh' then
                newItem.Surface := newItem.Surface or SURF_FLESH
              else if params[1] = 'fog' then
                newItem.Contents := newItem.Contents or CONTENTS_FOG
              else if params[1] = 'lava' then
                newItem.Contents := newItem.Contents or CONTENTS_LAVA
              else if params[1] = 'metalsteps' then
                newItem.Surface := newItem.Surface or SURF_METALSTEPS
              else if params[1] = 'nodamage' then
                newItem.Surface := newItem.Surface or SURF_NODAMAGE
              else if params[1] = 'nodlight' then
                newItem.Surface := newItem.Surface or SURF_NODLIGHT
              else if params[1] = 'nodraw' then
                newItem.Surface := newItem.Surface or SURF_NODRAW
              else if params[1] = 'nodrop' then
                newItem.Contents := newItem.Contents or CONTENTS_NODROP
              else if params[1] = 'noimpact' then
                newItem.Surface := newItem.Surface or SURF_NOIMPACT
              else if params[1] = 'nomarks' then
                newItem.Surface := newItem.Surface or SURF_NOMARKS
              else if params[1] = 'nolightmap' then
                newItem.Surface := newItem.Surface or SURF_NOLIGHTMAP
              else if params[1] = 'nosteps' then
                newItem.Surface := newItem.Surface or SURF_NOSTEPS
              else if params[1] = 'nonsolid' then
                newItem.Surface := newItem.Surface or SURF_NONSOLID
              else if params[1] = 'origin' then
                newItem.Contents := newItem.Contents or CONTENTS_ORIGIN
              else if params[1] = 'playerclip' then
                newItem.Contents := newItem.Contents or CONTENTS_PLAYERCLIP
              else if params[1] = 'slick' then
                newItem.Surface := newItem.Surface or SURF_SLICK
              else if params[1] = 'slime' then
                newItem.Contents := newItem.Contents or CONTENTS_SLIME
              else if params[1] = 'structural' then
                newItem.Contents := newItem.Contents or CONTENTS_STRUCTURAL
              else if params[1] = 'trans' then
                newItem.Contents := newItem.Contents or CONTENTS_TRANSLUCENT
              else if params[1] = 'water' then
                newItem.Contents := newItem.Contents or CONTENTS_WATER
              else if params[1] = 'sky' then
                newItem.Surface := newItem.Surface or SURF_SKY;
    }
              try
              newItem.Surface := newItem.Surface + LookUp(paramCheck(params, 1));
              except
                ShowMessage(paramCheck(params, 1));
              end;
              continue;
            end;

            if params[0] = 'cull' then begin
               newItem.Cull := LookUp(paramCheck(params, 1));
               continue;
            end;

            if params[0] = 'sort' then begin
              tmpInt := LookUp(paramCheck(params, 1));
              if tmpInt >   -1 then
                newItem.SortKey := enSortKey(tmpInt);
              continue;
            end;

            if params[0] = 'skyparms' then begin
              // set the global skyBox class
              newItem.IsSkyBox := true;
              skyBoxId := Count-1;

              if (paramCheck(params, 1) = '-') or IsNumeric(paramCheck(params, 1)) or
                (paramCheck(params, 1) = 'full') then begin // type = sphere
                newItem.SkyboxType := 1;
              end
              else begin                   // type = box
                // found in q3dm10, q3tourney1
                newItem.SkyboxType := 2;
                SetLength(newItem.SkyboxTextureNames, 6);
                SetLength(newItem.SkyboxTextureIds, 6);
                newItem.SkyboxTextureNames[0] := ConvertPath(paramCheck(params, 1)+'_rt');
                newItem.SkyboxTextureNames[1] := ConvertPath(paramCheck(params, 1)+'_lf');
                newItem.SkyboxTextureNames[2] := ConvertPath(paramCheck(params, 1)+'_ft');
                newItem.SkyboxTextureNames[3] := ConvertPath(paramCheck(params, 1)+'_bk');
                newItem.SkyboxTextureNames[4] := ConvertPath(paramCheck(params, 1)+'_up');
                newItem.SkyboxTextureNames[5] := ConvertPath(paramCheck(params, 1)+'_dn');
                for i := 0 to 5 do
                  newItem.SkyboxTextureIds[i] := 0;
              end;
              continue;
            end;

            if params[0] = 'deformvertexes' then begin
              inc(newItem.numOfDeformVertexes);
              SetLength(newItem.DeformVertexes, newItem.numOfDeformVertexes);
              newItem.DeformVertexes[newItem.numOfDeformVertexes-1].deformType := enDeformType(Lookup('def_'+paramCheck(params, 1)));
              with newItem.DeformVertexes[newItem.numOfDeformVertexes-1] do begin
                case deformType of
                  DEFORMVERTEXES_AUTOSPRITE,
                  DEFORMVERTEXES_AUTOSPRITE2 :
                    newItem.Cull := GL_NONE;
                  DEFORMVERTEXES_WAVE :
                    begin
                      for i := 0 to 5 do
                        if i = 1 then
                          Values[i] := Lookup(paramCheck(params, 2+i))
                        else
                          Values[i] := StrToFloat(paramCheck(params, 2+i));
                    end;
                  DEFORMVERTEXES_NORMAL :
                    begin
                      // wave func at i=1
                      for i := 0 to 4 do
                        if i = 1 then
                          Values[i] := Lookup(paramCheck(params, 2+i))
                        else
                          Values[i] := StrToFloat(paramCheck(params, 2+i));
                    end;
                  DEFORMVERTEXES_BULGE :
                    begin
                      for i := 0 to 2 do
                        Values[i] := StrToFloat(paramCheck(params, 2+i));
                    end;
                  DEFORMVERTEXES_MOVE :
                    begin
                      for i := 0 to 7 do
                        if i = 3 then
                          Values[i] := Lookup(paramCheck(params, 2+i))
                        else
                          Values[i] := StrToFloat(paramCheck(params, 2+i));
                    end;
                end;
              end;
              continue;
            end;

            if params[0] = 'fogparms' then begin
              newItem.HasFog := true;
              // color params with parens !!!
              newItem.Fog.Red := StrToFloat(paramCheck(params, 2));
              newItem.Fog.Green := StrToFloat(paramCheck(params, 3));
              newItem.Fog.Blue := StrToFloat(paramCheck(params, 4));
              newItem.Fog.Alpha := 1;
              newItem.Fog.Distance := StrToFloatDef(paramCheck(params, 6), 0.0);  //params[6]
              continue;
            end;

            if params[0] = 'qer_editorimage' then begin
              newItem.qerImage := ConvertPath(paramCheck(params, 1));
              continue;
            end;

            if params[0] = 'nopicmip' then begin
              newItem.NoPicMip := true;
              continue;
            end;
            if params[0] = 'nomipmap' then begin
              newItem.NoMipMap := true;
              continue;
            end;

            if params[0] = 'portal' then begin
              continue;
            end;
          end // (stage = 1)
          else if (Stage = 2) then begin
            if params[0] = 'depthfunc' then begin
              newItem.Layers[curLayer-1].DepthFunc := LookUp(paramCheck(params, 1));
              if newItem.Layers[curLayer-1].DepthFunc = -1 then
                newItem.Layers[curLayer-1].DepthFunc := GL_LEQUAL;
              continue;
            end;
            if params[0] = 'depthwrite' then begin
              if (curLayer = 1) and (newItem.TotallyTrans) then
                newItem.TotallyTrans := false;
              newItem.Layers[curLayer-1].DepthWrite := true;
              continue;
            end;
            if params[0] = 'map' then begin
              newItem.Layers[curLayer-1].animFreq := 0; // no animation
              newItem.Layers[curLayer-1].animFrameTime := 0;
              newItem.Layers[curLayer-1].numOfTextures := 1;
              SetLength(newItem.Layers[curLayer-1].TextureNames,1);
              newItem.Layers[curLayer-1].TextureNames[0] := ConvertPath(paramCheck(params, 1));
              continue;
            end;
            if params[0] = 'clampmap' then begin
              newItem.Layers[curLayer-1].animFreq := 0; // no animation
              newItem.Layers[curLayer-1].animFrameTime := 0;
              newItem.Layers[curLayer-1].numOfTextures := 1;
              SetLength(newItem.Layers[curLayer-1].TextureNames,1);
              newItem.Layers[curLayer-1].TextureNames[0] := ConvertPath(paramCheck(params, 1));
              //newItem.Layers[curLayer-1].TexClamp := true;
              continue;
            end;
            if params[0] = 'animmap' then begin
              newItem.Layers[curLayer-1].animFreq := StrToFloat(paramCheck(params, 1)); // animation speed
              newItem.Layers[curLayer-1].animFrameTime := Round(1000.0 / newItem.Layers[curLayer-1].animFreq);

              newItem.Layers[curLayer-1].numOfTextures := params.Count-2;
              SetLength(newItem.Layers[curLayer-1].TextureNames,params.Count-2);
              for i := 0 to params.Count-3 do begin
                newItem.Layers[curLayer-1].TextureNames[i] := ConvertPath(paramCheck(params, 2+i));
              end;
              continue;
            end;
            if params[0] = 'detail' then begin
              continue;
            end;
            if params[0] = 'alphafunc' then begin
              newItem.Layers[curLayer-1].AlphaFunc := Lookup(paramCheck(params, 1));
              newItem.Layers[curLayer-1].doAlphaTest := true;
              newItem.Layers[curLayer-1].DepthWrite := false;
              if newItem.Layers[curLayer-1].AlphaFunc = GL_GREATER then
                newItem.Layers[curLayer-1].AlphaRef := 0
              else
                newItem.Layers[curLayer-1].AlphaRef := 0.5;
              continue;
            end;
            if params[0] = 'alphagen' then begin
              if params.Count = 5 then begin // must be a wave
                with newItem.Layers[curLayer-1].AlphaWave  do begin
                  func := enWave(Lookup(paramCheck(params, 2)));
                  base := StrToFloat(paramCheck(params, 3));
                  amp := StrToFloat(paramCheck(params, 4));
                  phase := StrToFloat(paramCheck(params, 5));
                  freq := StrToFloat(paramCheck(params, 6));
                end;
              end;
              continue;
            end;
            if params[0] = 'tcmod' then begin
              inc(newItem.Layers[curLayer-1].numOftcmods);
              SetLength(newItem.Layers[curLayer-1].tcmods, newItem.Layers[curLayer-1].numOftcmods);
              modIdx := newItem.Layers[curLayer-1].numOftcmods-1;
              tmpInt := Lookup(paramCheck(params, 1));
              if tmpInt = -1 then
                tmpInt := 0;
              newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].modType := entcmod(tmpInt);
              case tmpInt of
                1 : newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[0] := StrToFloat(paramCheck(params, 2)); // rotate
                2,3 : begin // scale, scroll
                        for i := 0 to 1 do
                          newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[i] := StrToFloat(paramCheck(params, 2+i));
                      end;
                4 : begin // stretch
                      with newItem.Layers[curLayer-1].tcMods[modIdx].Wave  do begin
                        func := enWave(Lookup(paramCheck(params, 2)));
                        base := StrToFloat(paramCheck(params, 3));
                        amp := StrToFloat(paramCheck(params, 4));
                        phase := StrToFloat(paramCheck(params, 5));
                        freq := StrToFloat(paramCheck(params, 6));
                      end;
                    end;
                5 : begin // transform
                      for i := 0 to 5 do
                        newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[i] := StrToFloat(paramCheck(params, 2+i));
                    end;
                6 : begin // turb
                      // first param is unused
                      newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[0] := 0; //StrToFloat(params[2]);
                      newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[1] := StrToFloat(paramCheck(params, 3));
                      newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[2] := StrToFloat(paramCheck(params, 4));
                      newItem.Layers[curLayer-1].tcmods[newItem.Layers[curLayer-1].numOftcmods-1].Values[3] := StrToFloat(paramCheck(params, 5));
                    end;
              end;
              continue;
            end;
            if params[0] = 'rgbgen' then begin
              rgbIdx := newItem.Layers[curLayer-1].numOfrgbgen;
              inc(newItem.Layers[curLayer-1].numOfrgbgen);
              SetLength(newItem.Layers[curLayer-1].rgbGen, rgbIdx+1);
              newItem.Layers[curLayer-1].rgbGen[rgbIdx].rgbGType := enRGBGen(LookUp(paramCheck(params, 1)));

              case newItem.Layers[curLayer-1].rgbGen[rgbIdx].rgbGType of
                rgbGen_Wave :
                  begin
                    with newItem.Layers[curLayer-1].rgbGen[rgbIdx].Wave  do begin
                      func := enWave(Lookup(paramCheck(params, 2)));
                      base := StrToFloat(paramCheck(params, 3));
                      amp := StrToFloat(paramCheck(params, 4));
                      phase := StrToFloat(paramCheck(params, 5));
                      freq := StrToFloat(paramCheck(params, 6));
                    end;
                    newItem.Layers[curLayer-1].UseVertexColors := false;
                    FillChar(newItem.Layers[curLayer-1].curColor, 4, 255); // white
                  end;
                rgbGen_Identity :
                  begin
                    newItem.Layers[curLayer-1].UseVertexColors := false;
                    FillChar(newItem.Layers[curLayer-1].curColor, 4, 255);
                  end;
                rgbGen_IdentityLightning :
                  begin
                    newItem.Layers[curLayer-1].UseVertexColors := false;
                    FillChar(newItem.Layers[curLayer-1].curColor, 4, 128);
                    ChangeGamma(newItem.Layers[curLayer-1].curColor, gamma);

                  end;
                rgbGen_Entity,
                rgbGen_OneMinusEntity : // @@@@ must be adjusted if Entity data is available
                  begin
                    newItem.Layers[curLayer-1].UseVertexColors := false;
                    FillChar(newItem.Layers[curLayer-1].curColor, 4, 255); // white
                  end;
               rgbGen_Vertex,
               rgbGen_OneMinusVertex :  newItem.Layers[curLayer-1].UseVertexColors := true;
               rgbGen_LightningDiffuse : newItem.Layers[curLayer-1].UseVertexColors := true; // @@@ eval in setColor
              end;
              continue;
            end;

            if params[0] = 'tcgen' then begin
              tmpInt := LookUp(paramCheck(params, 1));
              if tmpInt = -1 then begin
                newItem.Layers[curLayer-1].tcGen := tcGen_standard;
                // param - array is missing for this function
              end
              else
                newItem.Layers[curLayer-1].tcGen := entcGen(tmpInt);
              continue;
            end;

            if params[0] = 'blendfunc' then begin
              newItem.Layers[curLayer-1].doBlending := true;
              if (paramCheck(params, 1) = 'add') or (paramCheck(params, 1) = 'gl_add')then begin
                newItem.Layers[curLayer-1].SrcBlend := GL_ONE;
                newItem.Layers[curLayer-1].DestBlend := GL_ONE;
                newItem.Layers[curLayer-1].DepthWrite := false;
              end
              else if paramCheck(params, 1) = 'filter' then begin
                newItem.Layers[curLayer-1].SrcBlend := GL_DST_COLOR;
                newItem.Layers[curLayer-1].DestBlend := GL_ZERO;
                newItem.Layers[curLayer-1].DepthWrite := false;
              end
              else if paramCheck(params, 1) = 'blend' then begin
                newItem.Layers[curLayer-1].SrcBlend := GL_SRC_ALPHA;
                newItem.Layers[curLayer-1].DestBlend := GL_ONE_MINUS_SRC_ALPHA;
                newItem.Layers[curLayer-1].DepthWrite := false;
              end
              else begin
                newItem.Layers[curLayer-1].SrcBlend :=  LookUp(paramCheck(params, 1));
                newItem.Layers[curLayer-1].DestBlend := LookUp(paramCheck(params, 2));
                newItem.Layers[curLayer-1].DepthWrite := false;
    {            newItem.Layers[curLayer-1].DepthWrite := (newItem.Layers[curLayer-1].SrcBlend = GL_ONE) and
                                                         (newItem.Layers[curLayer-1].SrcBlend = GL_ZERO) and
                                                         (curLayer = 1);}

              end;
              if (curLayer = 1)  then begin
                if (newItem.Layers[curLayer-1].DestBlend = GL_ONE) AND (newItem.Layers[curLayer-1].DestBlend = GL_ZERO) then
                  newItem.Layers[curLayer-1].doBlending := false;
                newItem.TotallyTrans := newItem.Layers[curLayer-1].DestBlend <> GL_ZERO;
              end;
    {          if (curLayer = 1) and (newItem.sortKey = sk_opaque) then begin
                if (newItem.Layers[curLayer-1].SrcBlend = GL_ONE) and (newItem.Layers[curLayer-1].SrcBlend = GL_ONE)then
                  newItem.SortKey := sk_additive
                else begin
                  newItem.SortKey := sk_trans;
                  newItem.Cull := GL_NONE;
                  newItem.Layers[curLayer-1].DepthWrite := false;
                end;
              end;

              if (newItem.Layers[curLayer-1].SrcBlend = GL_ZERO) and (newItem.Layers[curLayer-1].SrcBlend = GL_SRC_COLOR) then begin
                rgbIdx := newItem.Layers[curLayer-1].numOfrgbgen;
                inc(newItem.Layers[curLayer-1].numOfrgbgen);
                SetLength(newItem.Layers[curLayer-1].rgbGen, rgbIdx+1);
                newItem.Layers[curLayer-1].rgbGen[rgbIdx].rgbGType := RGBGEN_IDENTITY;
              end
              else if (newItem.Layers[curLayer-1].SrcBlend = GL_DST_COLOR) and (newItem.Layers[curLayer-1].SrcBlend = GL_ZERO) then begin
                rgbIdx := newItem.Layers[curLayer-1].numOfrgbgen;
                inc(newItem.Layers[curLayer-1].numOfrgbgen);
                SetLength(newItem.Layers[curLayer-1].rgbGen, rgbIdx+1);
                newItem.Layers[curLayer-1].rgbGen[rgbIdx].rgbGType := RGBGEN_IDENTITY;
              end;
              }
    {          if ((newItem.Surface and 8388608) =  8388608) then begin
    //            newItem.Layers[curLayer-1].DepthWrite := false;
                newItem.Layers[curLayer-1].doAlphaTest := true;
                newItem.Layers[curLayer-1].AlphaRef := 0.5;
                newItem.SortKey := SK_NEAREST;
              end;
              }
              continue;
            end; // end blendfunc
          end;
        end;
      end;
      CloseFile(f);
      break;
    end;
    //end FileExits
  end;
  //end While

  params.Free;
  result := true;
end;

function TShaderManager.ReadRequiredShaders : boolean;
var shaderFile, name, value : string;
    shaderNames : TStringList;
    i,j, t  : integer;
begin
  result := false;
  shaderNames := TStringList.Create;
  Clear;

try
  //LoadTGATexture('Initial', FGeneralTexture, true, false, false);
  if FRequiredShaders.Count > 0 then begin
    shaderFile := FRequiredShaders.Names[0];
    for i := 0 to FRequiredShaders.Count-1 do begin
      value := FRequiredShaders.Strings[i];
      name := splitList(value);
      if name = shaderFile then
        shaderNames.Add(value)
      else begin
        ReadShadersFromList(shaderFile, shaderNames);
        shaderNames.Clear;
        shaderFile := FRequiredShaders.Names[i];
        shaderNames.Add(value)
      end;
    end;
    // read last shader if required
    if shaderNames.Count > 0 then
      ReadShadersFromList(ExtractFileName(shaderFile), shaderNames);
  end;
except
  ShowMessage('TShaderManager.ReadRequiredShaders : boolean; error');
end;
  shaderNames.Free;
  // bind textures
  if Count > 0 then begin // any shaders loaded?
    for i := 0 to Count-1 do begin
      if Items[i].qerImage <> '' then begin
        items[i].qerId := LoadTexture(items[i].qerImage, Items[i].NoPicMip, Items[i].NoMipMap);
      end;
      if Items[i].numOfLayers > 0 then begin
        for j := 0 to Items[i].numOfLayers-1 do begin
          if Items[i].Layers[j].numOfTextures > 0 then begin
            for t := 0 to Items[i].Layers[j].numOfTextures-1 do begin
              if Copy(Items[i].Layers[j].TextureNames[t], 1, 1) <> '$' then begin // must be a texture name
                name := {FPath + }Items[i].Layers[j].TextureNames[t];
                Items[i].Layers[j].TextureId[t] := LoadTexture(name, Items[i].NoPicMip, Items[i].NoMipMap);
                if Items[i].Layers[j].TextureId[t] = 0 then
                  Items[i].Layers[j].TextureId[t] := Items[i].Layers[j].TextureId[t];
                FLoadedTextures[RemoveExt(name)] := Items[i].Layers[j].TextureId[t];
                Items[i].Layers[j].UseLightmap := false;
              end
              else begin
                Items[i].Layers[j].UseLightmap := true;
                if Items[i].Layers[j].TextureNames[t] = '$lightmap' then
                  FillChar(Items[i].Layers[j].curColor, 4, 255)
                else
                  FillChar(Items[i].Layers[j].curColor, 4, 128); // $identity
              end;
              // if no rgbGen is available then add $identity
              if Items[i].Layers[j].numOfrgbGen = 0 then
                FillChar(Items[i].Layers[j].curColor, 4, 255);
            end;
          end;
        end;
      end;
    end;
  end;
  result := true;
end;

function TShaderManager.LoadTexture(name : string;  NoPicMip, NoMipMap : boolean) : GLUINT;
var noExt : string;
    newId : GLUINT;
    p : integer;
    name_only : string;
    l : integer;
begin
  name := StringReplace(name, '/', '\', [rfReplaceAll]);

//  if Copy(name, 1, Length(FPath)) <> FPath then
//    name := FPath + name;
  noExt := name;

  p := Pos('.tga', noExt);
  if p > 0 then
    noExt := Copy(noExt, 1, p-1);
  p := Pos('.jpg', noExt);
  if p > 0 then
    noExt := Copy(noExt, 1, p-1);

  name_only := ExtractFileName(noExt);
  l := Length(name_only);
  repeat
    if FLoadedTextures.Exists(noExt) then begin
      result := FLoadedTextures[noExt];
      exit;
    end ;

    // tex not loaded
    LoadQuakeTexture('', noExt, newId, NoPicMip, NoMipMap  );
    if newId <> 0 then begin
      FLoadedTextures[noext] := newId;
      result := newId;
      exit;
    end;
    dec(l);
    noExt := Copy(noExt, 1, Length(noExt)-1);
  until l < 2;
  result := 0; // no texture
end;


procedure TShaderManager.SetState(ShaderID, StageID : integer);
var shader :TShader;
begin
try
  shader := Items[ShaderId];
  // Depth func
  glEnable(GL_DEPTH_TEST);
  glDepthFunc(Items[ShaderID].Layers[StageID].DepthFunc);
  // Alpha
  if Items[ShaderID].Layers[StageID].doAlphaTest = True then begin
    glEnable(GL_ALPHA_TEST);
    glAlphaFunc(Items[ShaderID].Layers[StageID].AlphaFunc, Items[ShaderID].Layers[StageID].AlphaRef);
  end
  else
    glDisable(GL_ALPHA_TEST);

  // Z-Buffer - needs sorted shaders
  if (Items[shaderId].Cull = GL_NONE) or (Items[shaderId].TotallyTrans) or (Items[ShaderID].Layers[StageID].doAlphaTest) then begin
    if Items[ShaderID].Layers[StageID].DepthWrite then
      glDepthMask(byte(true))
    else
      glDepthMask(byte(false));
  end
  else
    glDepthMask(byte(true));

  // Blending
  if (Items[ShaderID].Layers[StageID].doBlending)  then begin
    glEnable(GL_BLEND);
    glBlendFunc(Items[shaderId].Layers[stageId].SrcBlend, Items[shaderId].Layers[stageId].DestBlend);
  end
  else
    glDisable(GL_BLEND);

  if Shader.Layers[StageID].TexClamp then begin
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
  end
  else begin
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  end;

{  if Shader.Layers[StageID].tcGen = tcGen_Environment then begin
    glTexGenf(GL_S, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
    glTexGenf(GL_T, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
    glEnable(GL_TEXTURE_GEN_S);
    glEnable(GL_TEXTURE_GEN_T);
  end
  else begin
    glTexGenf(GL_S, GL_TEXTURE_GEN_MODE, GL_EYE_LINEAR);
    glTexGenf(GL_T, GL_TEXTURE_GEN_MODE, GL_EYE_LINEAR);
    glDisable(GL_TEXTURE_GEN_S);
    glDisable(GL_TEXTURE_GEN_T);
  end;
}
  except
    ShowMessage('setStage');
  end;
end;
(*
procedure TShaderManager.SetMods(ShaderID, StageID : integer);
var shader : TShader;
    j : integer;
    sx, sy : single;
begin
  shader := Items[ShaderId];
  if shader.Layers[stageId].numOftcMods > 0 then begin
    with shader.Layers[stageId] do begin
      glMatrixMode(GL_TEXTURE);
      sx := tcModScaleX /  tcModStretchX;
      sy := tcModScaleY / tcModStretchY;
      // y-tex coords are negative
      glTranslatef(0.5, 0.5, 0.0); // use mid point as rotation center instead of 0,0
      glScalef(sx, sy, 0); // set scale
      glRotatef(rotate, 0.0, 0.0, 1.0); // rotate
      glTranslatef(-0.5 + XOffset, 0.5 + YOffset, 0.0); // use mid point as rotation center
    end;
  end;
end;

procedure TShaderManager.SetLayer(ShaderID, StageID : integer);
var    shader : TShader;
    j, frame : integer;
    c : integer;
    angle : single;
begin

  shader := Items[ShaderId];
  with shader.Layers[stageId] do begin
    //Default Scaling-value
    tcModScaleX  := 1;
    tcModScaleY  := 1;
    tcModStretchX := 0;
    tcModStretchY := 0;
    rgbFactor    := 0;
    XOffset := 0;
    YOffset := 0;
  end;

  //Are there tcMod-Commands?
  if shader.Layers[stageId].numOftcMods > 0 then begin
    for j := 0 to shader.Layers[stageId].numOftcMods-1 do begin
      case shader.Layers[stageId].tcmods[j].modType of
        tcMod_rotate :
          begin
            angle := shader.Layers[stageId].tcmods[j].Values[0]*gTimer.TotalTime;
            shader.Layers[stageId].rotate := angle;
          end;
        tcMod_scale :
          begin
            shader.Layers[stageId].tcModScaleX := shader.Layers[StageId].tcMods[j].values[0];
            shader.Layers[stageId].tcModScaleY := shader.Layers[StageId].tcMods[j].values[1];
          end;
        tcMod_scroll :
          begin
            shader.Layers[stageId].XOffset := gTimer.TotalTime*shader.Layers[stageId].tcmods[j].Values[0];
            shader.Layers[stageId].YOffset := -gTimer.TotalTime*shader.Layers[stageId].tcmods[j].Values[1];
          end;
        tcMod_stretch :
          begin
            shader.Layers[stageId].tcModStretchX := shader.Layers[stageId].tcModStretchX + (1/Eval(shader.Layers[StageID].tcMods[j].Wave));
            shader.Layers[stageId].tcModStretchY := shader.Layers[stageId].tcModStretchX;
          end;
       tcMod_Turb :
         begin
         end;

      end; // case
    end; // j
    if shader.Layers[stageId].tcModStretchX = 0 then
      shader.Layers[stageId].tcModStretchX := 1;
    if shader.Layers[stageId].tcModStretchY = 0 then
      shader.Layers[stageId].tcModStretchY := 1;
  end; // tcmods

  if shader.Layers[stageId].numOfrgbGen > 0 then begin
    case shader.Layers[stageId].rgbGen[0].rgbGType of
      rgbGen_IdentityLightning :
        begin
          shader.Layers[stageId].curColor[0] := 127;
          shader.Layers[stageId].curColor[1] := 127;
          shader.Layers[stageId].curColor[2] := 127;
          shader.Layers[stageId].curColor[3] := 255;
        end;
      rgbGen_Identity :
        begin
          shader.Layers[stageId].curColor[0] := 255;
          shader.Layers[stageId].curColor[1] := 255;
          shader.Layers[stageId].curColor[2] := 255;
          shader.Layers[stageId].curColor[3] := 255;
        end;
      rgbGen_Wave :
        begin
          c := Round(255*Eval(shader.Layers[stageId].rgbGen[0].Wave));
          if c < 0 then c := 0;
          if c > 255 then c := 255;
          shader.Layers[stageId].curColor[0] := c;
          shader.Layers[stageId].curColor[1] := c;
          shader.Layers[stageId].curColor[2] := c;
          shader.Layers[stageId].curColor[3] := 255;

        end;
      rgbGen_Vertex :
        ; // NOP
      rgbGen_LightningDiffuse :
        ; // NOP
    end;
  end; // rgbGen

  //Animation
  if shader.Layers[StageID].animFreq <> 0 then begin
    frame := Trunc(gTimer.TotalTime *shader.Layers[StageID].animFreq) mod shader.Layers[StageID].numOfTextures;
    if frame >= shader.Layers[StageID].numOfTextures then
      frame := 0;
    Shader.Layers[StageID].curTexture := frame;
  end;
end;
*)
end.
