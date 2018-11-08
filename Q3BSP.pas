unit Q3BSP;

interface

uses OpenGL, Windows, Frustum, classes, Dialogs, math3d, q3shaders, q3types,
  q3SkyBox, cam;

procedure ChangeGamma(var color: array of byte; factor: single);

type
  TBSPFaceSort = record
    FaceIndex: integer;
    distance: single;
  end;

var
  numSolid, numAdditive, numTransparent: integer;
  SolidFaces, AdditiveFaces, TransparentFaces: array of TBSPFaceSort;

  // This is our Quake3 BSP class
type
  TQuake3BSP = class(TObject)
  private
    // FErrorList : TStringList;
    FShaderManager: TShaderManager;
    FSkyBox: TSkyBox;
    FPath: TStringList;
    numOfVerts: integer; // The number of verts in the model
    numOfFaces: integer; // The number of faces in the model
    numOfTextures: integer; // The number of texture maps
    numOfLightmaps: integer; // The number of light maps
    numOfNodes: integer; // The number of nodes
    numOfLeafs: integer; // The number of leafes
    numOfLeafFaces: integer; // The number of leaf faces
    numOfPlanes: integer; // The number of planes
    numOfMeshVerts: integer; // The number of mesh verts
    numOfModels: integer; // The number of Models
    numOfBrushes: integer; // The number of brushes
    numOfBrushSides: integer; // The number of brushsides
    numOfLeafBrushes: integer; // The number of leaf brushes
    numOfEffects: integer; // The number of effects
    numOfFogVolumes: integer;
    MeshVertices: array of integer; // The objects mesh vertices
    Vertices: array of TBSPVertex; // The object's vertices
    Faces: array of TBSPFace; // The faces information of the object
    EntityList: TStringList; // All the Entities of the level
    Nodes: array of TBSPNode;
    Leafs: array of TBSPLeaf;
    Planes: array of TBSPPlane;
    LeafFaces: array of integer;
    Models: array of TBSPModel;
    Effects: array of TBSPEffect;
    clusters: TBSPVisData;
    FacesDrawn: array of boolean;
    // The bitset for the faces that have/haven't been drawn
    TextureInfo: array of TBSPTextureInfo;
    Brushes: array of TBSPBrush; // The Brushes of the BSP
    BrushSides: array of TBSPBrushSide; // The Brush Sides of the BSP
    Leafbrushes: array of integer; // The bruhes of the leafs
    Lightmaps: array of GLUINT; // The texture and lightmap array for the level
    fogVolumes: array of TBSPBoundingBox;
    CenterPoints: array of TVector3f; // Used for depth sort of shaded surfaces
    IsModelFace: array of boolean;
    fileTextures: array of TQ3FileTexture; // local only !!!!

    // Position data from entity list
    numOfPositions: integer;
    Positions: array of TBSPPosition;
    curPosition: integer;
    skyboxRequired: boolean;

    procedure SetPositions(l: TStringList);
    procedure SetWorldSpawn(l: TStringList);
    procedure SetSoundEmitters(l: TStringList);

    procedure SwapBoundingBoxFloat(var min, max: TVector3f);
    procedure SwapBoundingBoxInteger(var min, max: TVector3i);
    procedure RenderSkybox;
    procedure RenderFog(FaceIndex, shaderId, planeId: integer);
    procedure RenderSurfaceShader(FaceIndex, shaderId: integer);
    procedure RenderSurface(FaceIndex: integer);

    procedure PrepareQuadricPatch(FaceIndex: integer);
    function CalcQuadricPatch(controlPoints: array of TBSPVertex;
      VertexOffset, IndexOffset, pointOffset: integer): boolean;

    procedure ChangeGammaLightmap(var pImage: TBSPLightmap;
      const Width, height: integer; factor: glFloat);
    procedure CreateLightmapTexture(var texture: GLUINT;
      pImageBits: TBSPLightmap; Width, height: integer);
    function IsClusterVisible(current, test: integer): integer;
    procedure LoadEntities(var f: file; var memory: TMemoryStream; Lump: TBSPLump; inmemory: boolean);
    procedure BindTextures(texId, lmId: integer);
    procedure WalkLeaf(leafIndex: integer; sort: boolean);
    procedure SetDefaults;
    procedure CalcFogBuffer(FaceIndex: integer; distance: single);
    procedure SetVertexCoords(shaderId, numOfVerts: integer);
    procedure SetVertexColors(shaderId, stageId, numOfVerts: integer);
    procedure SetTextureCoordinates(shaderId, stageId, numOfVerts: integer);
    procedure SetFogColor(FaceIndex, planeIndex, numOfVerts: integer;
      red, green, blue, distanceToOpaque: single);
  public
    // QUAKE_FOLDER: string;
    skyboxShader: integer;
    Camera: TCamera;

    constructor Create;
    destructor Destroy; override;

    // procedure AddError(msg : string);
    // procedure DisplayErrors;
    function PlayerPosition: TBSPPosition; // position of the player
    function FindLeaf(vPos: TVector3f): integer;
    function LoadBSP(const Folder, FileName: String; index: integer; inmemory: boolean): boolean;
    procedure RenderBSP(const Pos: TVector3f; leafIndex: integer);
    function checkMove(sp, ep, extent: TVector3f): TBSPMove;
    procedure checkMoveNode(sf, ef: single; sp, ep: TVector3f; node: integer;
      var Move: TBSPMove);
    procedure checkMoveLeaf(leafIndex: integer; var Move: TBSPMove);
    function GetSurfaceType(brushIndex: integer): string;

    property ShaderManager: TShaderManager read FShaderManager
      write FShaderManager;
    property CurrentPosition: integer read curPosition;
    property PositionCount: integer read numOfPositions;
    property SkyBox: TSkyBox read FSkyBox;
  end;

implementation

uses SysUtils, Textures, Global, q3timer, qsortunit, fmod, fmodtypes,
  fmoderrors, StrUtils,
  ExtOpenGL, Q3Pk3Read;

var
  fogBuffer: array of single;
  inputBuffer: array [0 .. 16383] of TBSPVertex;
  texCoordBuffer: array [0 .. 16383] of TVector2f;
  colorBuffer: array [0 .. 16383] of TRGBA;

function CompareSolid(e1, e2: word): integer; far;
begin
  if SolidFaces[e1].distance < SolidFaces[e2].distance then
    result := -1
  else if SolidFaces[e1].distance > SolidFaces[e2].distance then
    result := 1
  else
    result := 0;
end;

procedure SwapSolid(e1, e2: word); far;
var
  s: TBSPFaceSort;
begin
  s := SolidFaces[e1];
  SolidFaces[e1] := SolidFaces[e2];
  SolidFaces[e2] := s;
end;

function CompareTransparent(e1, e2: word): integer; far;
begin
  if TransparentFaces[e1].distance < TransparentFaces[e2].distance then
    result := -1
  else if TransparentFaces[e1].distance > TransparentFaces[e2].distance then
    result := 1
  else
    result := 0;
end;

procedure SwapTransparent(e1, e2: word); far;
var
  s: TBSPFaceSort;
begin
  s := TransparentFaces[e1];
  TransparentFaces[e1] := TransparentFaces[e2];
  TransparentFaces[e2] := s;
end;

function CompareAdditive(e1, e2: word): integer; far;
begin
  if AdditiveFaces[e1].distance < AdditiveFaces[e2].distance then
    result := -1
  else if AdditiveFaces[e1].distance > AdditiveFaces[e2].distance then
    result := 1
  else
    result := 0;
end;

procedure SwapAdditive(e1, e2: word); far;
var
  s: TBSPFaceSort;
begin
  s := AdditiveFaces[e1];
  AdditiveFaces[e1] := AdditiveFaces[e2];
  AdditiveFaces[e2] := s;
end;

function VertexAdd(v1, v2: TBSPVertex): TBSPVertex;
var
  tmp: TBSPVertex;
  norm: TVector3f;
begin
  tmp.Position.X := v1.Position.X + v2.Position.X;
  tmp.Position.Y := v1.Position.Y + v2.Position.Y;
  tmp.Position.Z := v1.Position.Z + v2.Position.Z;

  tmp.TextureCoord.X := v1.TextureCoord.X + v2.TextureCoord.X;
  tmp.TextureCoord.Y := v1.TextureCoord.Y + v2.TextureCoord.Y;

  tmp.LightmapCoord.X := v1.LightmapCoord.X + v2.LightmapCoord.X;
  tmp.LightmapCoord.Y := v1.LightmapCoord.Y + v2.LightmapCoord.Y;

  norm.X := v1.Normal.X + v2.Normal.X;
  norm.Y := v1.Normal.Y + v2.Normal.Y;
  norm.Z := v1.Normal.Z + v2.Normal.Z;
  // Normalize(norm);
  tmp.Normal := norm;
  result := tmp;
end;

function VertexScale(v1: TBSPVertex; s: double): TBSPVertex;
var
  tmp: TBSPVertex;
begin
  tmp.Position.X := v1.Position.X * s;
  tmp.Position.Y := v1.Position.Y * s;
  tmp.Position.Z := v1.Position.Z * s;

  tmp.TextureCoord.X := v1.TextureCoord.X * s;
  tmp.TextureCoord.Y := v1.TextureCoord.Y * s;

  tmp.LightmapCoord.X := v1.LightmapCoord.X * s;
  tmp.LightmapCoord.Y := v1.LightmapCoord.Y * s;

  tmp.Normal.X := v1.Normal.X * s;
  tmp.Normal.Y := v1.Normal.Y * s;
  tmp.Normal.Z := v1.Normal.Z * s;
  result := tmp;
end;

function TQuake3BSP.CalcQuadricPatch(controlPoints: array of TBSPVertex;
  VertexOffset, IndexOffset, pointOffset: integer): boolean;
var
  px, py: double;
  temp: array [0 .. 2] of TBSPVertex;
  v1, v2, v3, u1, u2, u3: TBSPVertex;
  i, v, u, row, point, numOfIndices: integer;
begin
  result := false;

  for v := 0 to tesselation do
  begin // first row ???
    px := v / tesselation;
    v1 := VertexScale(controlPoints[0], ((1.0 - px) * (1.0 - px)));
    v2 := VertexScale(controlPoints[3], ((1.0 - px) * px * 2));
    v3 := VertexScale(controlPoints[6], (px * px));
    Vertices[VertexOffset + v] := VertexAdd(VertexAdd(v1, v2), v3);
  end;

  for u := 1 to tesselation do
  begin // col ???
    py := u / tesselation;
    v1 := VertexScale(controlPoints[0], ((1.0 - py) * (1.0 - py)));
    v2 := VertexScale(controlPoints[1], ((1.0 - py) * py * 2));
    v3 := VertexScale(controlPoints[2], (py * py));
    temp[0] := VertexAdd(VertexAdd(v1, v2), v3);

    v1 := VertexScale(controlPoints[3], ((1.0 - py) * (1.0 - py)));
    v2 := VertexScale(controlPoints[4], ((1.0 - py) * py * 2));
    v3 := VertexScale(controlPoints[5], (py * py));
    temp[1] := VertexAdd(VertexAdd(v1, v2), v3);

    v1 := VertexScale(controlPoints[6], ((1.0 - py) * (1.0 - py)));
    v2 := VertexScale(controlPoints[7], ((1.0 - py) * py * 2));
    v3 := VertexScale(controlPoints[8], (py * py));
    temp[2] := VertexAdd(VertexAdd(v1, v2), v3);

    for v := 0 to tesselation do
    begin // row ??
      px := v / tesselation;

      u1 := VertexScale(temp[0], ((1.0 - px) * (1.0 - px)));
      u2 := VertexScale(temp[1], ((1.0 - px) * px * 2));
      u3 := VertexScale(temp[2], (px * px));
      // verts[u*(tesselation+1)+v] := VertexAdd(VertexAdd(u1, u2), u3);
      Vertices[VertexOffset + u * (tesselation + 1) + v] :=
        VertexAdd(VertexAdd(u1, u2), u3);
    end; // v
  end; // u
  // new indices
  i := IndexOffset;
  for row := 0 to tesselation - 1 do
  begin
    for point := 0 to tesselation - 1 do
    begin
      MeshVertices[i + 0] := pointOffset + row * (tesselation + 1) + point;
      MeshVertices[i + 1] := pointOffset + row * (tesselation + 1) + point + 1;
      MeshVertices[i + 2] := pointOffset + (row + 1) *
        (tesselation + 1) + point;

      MeshVertices[i + 3] := pointOffset + (row + 1) *
        (tesselation + 1) + point;
      MeshVertices[i + 4] := pointOffset + row * (tesselation + 1) + point + 1;
      MeshVertices[i + 5] := pointOffset + (row + 1) * (tesselation + 1) +
        point + 1;
      inc(i, 6);
    end;
  end;
  result := true;
end;

(*
  function Tesselate(var qp : TBSPQuadricPatch) : boolean;
  var px, py : double;
  temp : array[0..2] of TBSPVertex;
  v1, v2, v3, u1, u2, u3 : TBSPVertex;
  i, v, u, row, point : integer;
  begin
  with qp do begin
  numOfVerts := (tesselation+1)*(tesselation+1);
  SetLength(Verts, numOfVerts);

  for v :=0 to tesselation do begin // first row ???
  px := v / tesselation;
  v1 := VertexScale(controlPoints[0], ((1.0-px)*(1.0-px)));
  v2 := VertexScale(controlPoints[3], ((1.0-px)*px*2));
  v3 := VertexScale(controlPoints[6], (px*px));
  verts[v] := VertexAdd(VertexAdd(v1, v2), v3);
  end;

  for u := 1 to  tesselation do begin // col ???
  py := u / tesselation;
  v1 := VertexScale(controlPoints[0], ((1.0-py)*(1.0-py)));
  v2 := VertexScale(controlPoints[1], ((1.0-py)*py*2));
  v3 := VertexScale(controlPoints[2], (py*py));
  temp[0] := VertexAdd(VertexAdd(v1, v2), v3);

  v1 := VertexScale(controlPoints[3], ((1.0-py)*(1.0-py)));
  v2 := VertexScale(controlPoints[4], ((1.0-py)*py*2));
  v3 := VertexScale(controlPoints[5], (py*py));
  temp[1] := VertexAdd(VertexAdd(v1, v2), v3);

  v1 := VertexScale(controlPoints[6], ((1.0-py)*(1.0-py)));
  v2 := VertexScale(controlPoints[7], ((1.0-py)*py*2));
  v3 := VertexScale(controlPoints[8], (py*py));
  temp[2] := VertexAdd(VertexAdd(v1, v2), v3);

  for v := 0 to tesselation do begin // row ??
  px := v / tesselation;

  u1 := VertexScale(temp[0], ((1.0-px)*(1.0-px)));
  u2 := VertexScale(temp[1], ((1.0-px)*px*2));
  u3 := VertexScale(temp[2], (px*px));
  verts[u*(tesselation+1)+v] := VertexAdd(VertexAdd(u1, u2), u3);
  end; // v
  end; // u
  // new indices
  numOfIndices := tesselation*(tesselation)*6;
  SetLength(meshIndex, numOfIndices);
  i := 0;
  for row :=0 to tesselation-1 do begin
  for point := 0 to tesselation-1 do begin
  meshIndex[i+0] := row*(tesselation+1)+point;
  meshIndex[i+1] := row*(tesselation+1)+point+1;
  meshIndex[i+2] := (row+1)*(tesselation+1)+point;

  meshIndex[i+3] := (row+1)*(tesselation+1)+point;
  meshIndex[i+4] := row*(tesselation+1)+point+1;
  meshIndex[i+5] := (row+1)*(tesselation+1)+point+1;
  inc(i, 6);
  end;
  end;
  //Create indices
  SetLength(indx, tesselation*(tesselation+1)*2);
  for row :=0 to tesselation-1 do begin
  for point := 0 to tesselation do begin
  //calculate indices
  //reverse them to reverse winding
  indx[(row*(tesselation+1)+point)*2+1] := row*(tesselation+1)+point;
  indx[(row*(tesselation+1)+point)*2]   := (row+1)*(tesselation+1)+point;
  end;
  end;
  // Fill in the arrays for multi_draw_arrays
  SetLength(trianglesPerRow, tesselation);
  SetLength(rowIndexPointers, tesselation);
  for row := 0 to tesselation-1 do begin
  trianglesPerRow[row] := 2*(tesselation+1);
  rowIndexPointers[row] := @indx[row*2*(tesselation+1)];
  end;

  end; // with qp
  result := true;
  end;
*)
function StrToVector3f(s: string): TVector3f;
var
  v: TVector3f;
  p, l: integer;
  tmp: string;
begin
  l := Length(s);
  if l > 0 then
  begin
    p := 1;
    tmp := '';
    while s[p] <> ' ' do
    begin
      tmp := tmp + s[p];
      inc(p);
    end;
    v.X := StrToInt(tmp);
    inc(p);

    tmp := '';
    while s[p] <> ' ' do
    begin
      tmp := tmp + s[p];
      inc(p);
    end;
    v.Z := -StrToInt(tmp);
    inc(p);
    tmp := '';
    while p <= l do
    begin
      tmp := tmp + s[p];
      inc(p);
    end;
    v.Y := StrToInt(tmp);
  end;
  result := v;
end;

{ TQuake3BSP }
constructor TQuake3BSP.Create;
begin
  inherited Create;

  skyboxShader := -1;
  numOfVerts := 0;
  numOfFaces := 0;
  numOfTextures := 0;
  numOfLightmaps := 0;
  numOfNodes := 0;
  numOfLeafs := 0;
  numOfLeafFaces := 0;
  numOfPlanes := 0;
  numOfModels := 0;
  numOfEffects := 0;
  numOfFogVolumes := 0;

  EntityList := TStringList.Create;
  FPath := TStringList.Create;
  FPath.Assign(Pk3Zip.BASE_PATH); // or := LIST_QUAKE_BASE_PATH;
  FSkyBox := TSkyBox.Create;
  // FErrorList := TStringList.Create;
end;

destructor TQuake3BSP.Destroy;
begin
  // FErrorList.Free;
  if Assigned(EntityList) then
    EntityList.Free;
  if Assigned(FPath) then
    FPath.Free;

  SetLength(MeshVertices, 0);
  SetLength(Vertices, 0);
  SetLength(Faces, 0);
  SetLength(Nodes, 0);
  SetLength(Leafs, 0);
  SetLength(Planes, 0);
  SetLength(LeafFaces, 0);
  SetLength(FacesDrawn, 0);
  SetLength(TextureInfo, 0);
  SetLength(Brushes, 0);
  SetLength(Leafbrushes, 0);
  SetLength(Lightmaps, 0);
  // SetLength(QuadricPatches, 0);
  SetLength(Models, 0);
  SetLength(Effects, 0);
  SetLength(fogVolumes, 0);

  SetLength(SolidFaces, 0);
  SetLength(TransparentFaces, 0);
  SetLength(AdditiveFaces, 0);

  inherited Destroy;
end;

function SplitList(var txt: string): string;
var
  l, p: integer;
  tmp: string;
begin
  l := Length(txt);
  tmp := '';

  p := Pos('=', txt);
  if p > 0 then
  begin // found
    result := Trim(Copy(txt, 1, p - 1));
    txt := Trim(Copy(txt, p + 1, l - p));
  end
  else
  begin // not found
    result := Trim(txt);
    txt := '';
  end;
end;

procedure TQuake3BSP.CalcFogBuffer(FaceIndex: integer; distance: single);
var
  face: PBSPFace;
  i: integer;
  tmp: TVector3f;
  X, Y, Z: single;
begin
  face := @Faces[FaceIndex];
  for i := 0 to face.numOfVerts - 1 do
  begin
    tmp := SubtractVector(Camera.Position, Vertices[face.startVertIndex + i]
      .Position);
    X := Camera.Position.X - Vertices[face.startVertIndex + i].Position.X;
    Y := Camera.Position.Y - Vertices[face.startVertIndex + i].Position.Y;
    Z := Camera.Position.Z - Vertices[face.startVertIndex + i].Position.Z;
    fogBuffer[face.startVertIndex + i] := 1700;
    // -640*-12-Vertices[face.startVertIndex+i].Position.y
  end;
end;

function TQuake3BSP.PlayerPosition: TBSPPosition;
begin
  if numOfPositions > 0 then
  begin
    result := Positions[curPosition];
    inc(curPosition);
    if curPosition >= numOfPositions then
      curPosition := 0;
  end;
end;

procedure TQuake3BSP.SetPositions(l: TStringList);
var
  i: integer;
  v, p: string;
begin
  if l.Count > 0 then
  begin
    inc(numOfPositions);
    SetLength(Positions, numOfPositions);
    i := 0;
    while i < l.Count do
    begin
      v := l[i];
      p := l[i + 1];
      if v = 'origin' then
        Positions[numOfPositions - 1].Position := StrToVector3f(p)
      else if v = 'angle' then
        Positions[numOfPositions - 1].Angle := StrToFloat(p)
      else if v = 'spawnflags' then
        curPosition := numOfPositions - 1;
      inc(i, 2);
    end;
  end;
end;

procedure TQuake3BSP.SetWorldSpawn(l: TStringList);
var
  i, channel, snd, pi: integer;
  v, p, fn: string;
begin
  if l.Count > 0 then
  begin
    i := 0;
    while i < l.Count do
    begin
      v := l[i];
      p := l[i + 1];
      if v = 'music' then
      begin
        // right now we use just the last wav in the list
        pi := Pos(#32, p);
        if pi > 0 then
          p := RightStr(p, Length(p) - pi);
        fn := '\' + p
      end
      else if v = 'message' then
        Cons.AddMsg('MESSAGE ' + p);

      inc(i, 2);
    end;
    { i := Pos(#32, fn);
      if i > 0 then
      fn := RightStr(fn, Length(fn)-i);
    }
    if fn <> '' then
    begin
      Cons.AddMsg('MUSIC: ' + fn);
      if Sound.BASSInit then
        snd := Sound.LoadSample(false, fn)
      else
        snd := Sound.LoadSample(fn, true, false);
      // SetVector(0,0,0), false, true, MUSIC_VOL); // flags are missing
      channel := Sound.NewEmitter(snd, SetVector(0, 0, 0), false, false);
      // Sound.Play(channel, false);
    end;
  end;
end;

procedure TQuake3BSP.SetSoundEmitters(l: TStringList);
var
  i, flags, channel, snd: integer;
  Pos: TVector3f;
  v, p, fn: string;
  UsePosition, Loop: boolean;
begin
  if l.Count > 0 then
  begin
    i := 0;
    flags := 0;
    while i < l.Count do
    begin
      v := l[i];
      p := l[i + 1];
      if v = 'origin' then
        Pos := StrToVector3f(p)
      else if v = 'noise' then
        fn := '\' + p
      else if v = 'spawnflags' then
        flags := StrToInt(p)
      else if v = 'targetname' then
      begin
        Cons.AddMsg('Skipped target name');
        exit;
      end;
      inc(i, 2)
    end;
    // @@pos.Z := -pos.Z;

    Cons.AddMsg(Format('FX: %s (%f/%f/%f), %d', [fn, Pos.X, Pos.Y,
      Pos.Z, flags]));
    UsePosition := (flags and 4) = 0;
    Loop := ((flags and 1) = 1) OR ((flags and 4) = 4);
    // channel := Sound.Load(fn, Pos, UsePosition, Loop, FX_VOL); // flags are missing

    // if UsePosition then
    // Sound.Play(channel, false);
    if Sound.BASSInit then
      snd := Sound.LoadSample(false, fn)
    else
      snd := Sound.LoadSample(fn, Loop, UsePosition);
    // SetVector(0,0,0), false, true, MUSIC_VOL); // flags are missing
    channel := Sound.NewEmitter(snd, Pos, UsePosition, false);

    if UsePosition then
      FSOUND_3D_SetAttributes(channel, @Pos, nil);
  end;
end;

procedure TQuake3BSP.LoadEntities(var f: file; var memory: TMemoryStream; Lump: TBSPLump; inmemory: boolean);
var
  ents: array of ansichar;
  tmp, value, name, entityName, class_name: string;
  i, cnt, k, idx: integer;
  block: TStringList;
begin
  SetLength(ents, Lump.Length);
  EntityList.Clear;
  block := TStringList.Create;
  // block.Sorted := true; // uses for info_player_death_match
  if inmemory then
    begin
      memory.Seek(Lump.offset, soFromBeginning);
      memory.ReadBuffer(ents[0], Lump.Length);
    end
  else
    begin
      Seek(f, Lump.offset);
      BlockRead(f, ents[0], Lump.Length);
    end;

  curPosition := 0;
  numOfPositions := 0;

  // scan all chars
  cnt := 0;
  for i := 0 to Lump.Length - 1 do
  begin
    case ents[i] of
      '{', #10, #13, #9:
        ; // NOP
      '}':
        begin
          idx := block.IndexOf('classname') + 1;
          class_name := block[idx];
          if class_name = 'worldspawn' then
            SetWorldSpawn(block)
          else if class_name = 'info_player_deathmatch' then
            SetPositions(block)
          else if class_name = 'target_speaker' then
            SetSoundEmitters(block);

          (* if (class_name = 'worldspawn') or (class_name = 'info_player_deathmatch') or (class_name = 'target_speaker') then begin
            output.Lines.Add(str[idx]);
            j := 0;
            while j < str.Count do begin
            variable := str[j];
            if variable <> 'classname' then begin
            ParamStr := str[j+1];
            output.Lines.Add('  ' + variable + ' = ' + ParamStr);
            end;
            inc(j, 2);
            end;
            output.Lines.Add('');
            end; *)
          block.Clear;
        end;
      '"':
        begin
          inc(cnt);
          if cnt = 1 then
          begin
            tmp := '';
          end
          else
          begin
            cnt := 0;
            if not Odd(block.Count) then
              block.Add(lowerCase(tmp))
            else
              block.Add(tmp);
            tmp := '';
          end;
        end;
    else
      tmp := tmp + ents[i];
    end;
  end;
  // EntityList.SaveToFile('C:\entities.txt');
  block.Free;
  (*
    if EntityList.Count > 0 then begin
    curPosition := 0;
    for i := 0 to EntityList.Count-1 do begin
    if EntityList.Names[i] = 'info_player_deathmatch.angle' then begin
    inc(numOfPositions);
    SetLength(Positions, numOfPositions);
    tmp := EntityList[i];
    value := SplitList(tmp);
    Positions[numOfPositions-1].Angle := StrToFloat(tmp);
    end;
    if EntityList.Names[i] = 'info_player_deathmatch.origin' then begin
    if (numOfPositions = 0) then begin // no angle
    inc(numOfPositions);
    SetLength(Positions, numOfPositions);
    Positions[numOfPositions-1].Angle := 90;
    end;
    tmp := EntityList[i];
    value := SplitList(tmp);
    Positions[numOfPositions-1].Position := StrToVector3f(tmp);
    end;
    if EntityList.Names[i] = 'info_player_deathmatch.spawnflags' then begin
    curPosition := numOfPositions-1;
    end;
    end;
    end;
  *)
end;

(*
  procedure TQuake3BSP.LoadEntities(var f:file;Lump:TBSPLump);
  var ents : array of char;
  tmp, value, name, entityName : string;
  i, cnt, k, idx : integer;
  block : TStringList;
  begin
  SetLength(ents, lump.Length);
  EntityList.Clear;
  block := TStringList.Create;
  //block.Sorted := true; // uses for info_player_death_match
  Seek(f,lump.offset);
  BlockRead(f,ents[0],lump.Length);

  // scan all chars
  cnt := 0;
  for i := 0 to lump.Length-1 do begin
  case ents[i] of
  '{', #10 : ; // NOP
  '}' : begin
  idx := block.IndexOfName('classname');
  if idx < 0 then
  ShowMessage('Entity w/o class_name')
  else begin
  EntityName := block.Values['classname'];
  for k := 0 to block.Count-1 do begin
  if k <> idx then begin
  tmp := EntityName + '.' + block.Names[k] + '=' + block.Values[block.Names[k]];
  EntityList.Add(tmp);
  end;
  end;
  end;
  tmp := '';
  block.Clear;
  end;
  '"' : begin
  inc(cnt);
  case cnt of
  1 : Name := '';
  2 : begin name := tmp; tmp := ''; end;
  3 : begin value := ''; tmp := ''; end;
  4 : begin
  value := tmp;
  tmp := '';
  block.Add(Name + '=' + value);
  cnt := 0;
  end;
  end;
  end;
  else tmp := tmp + ents[i];
  end;
  end;
  //  EntityList.SaveToFile('C:\entities.txt');
  block.Free;
  if EntityList.Count > 0 then begin
  curPosition := 0;
  for i := 0 to EntityList.Count-1 do begin
  if EntityList.Names[i] = 'info_player_deathmatch.angle' then begin
  inc(numOfPositions);
  SetLength(Positions, numOfPositions);
  tmp := EntityList[i];
  value := SplitList(tmp);
  Positions[numOfPositions-1].Angle := StrToFloat(tmp);
  end;
  if EntityList.Names[i] = 'info_player_deathmatch.origin' then begin
  if (numOfPositions = 0) then begin // no angle
  inc(numOfPositions);
  SetLength(Positions, numOfPositions);
  Positions[numOfPositions-1].Angle := 90;
  end;
  tmp := EntityList[i];
  value := SplitList(tmp);
  Positions[numOfPositions-1].Position := StrToVector3f(tmp);
  end;
  if EntityList.Names[i] = 'info_player_deathmatch.spawnflags' then begin
  curPosition := numOfPositions-1;
  end;
  end;
  end;
  end;
*)
// Load all of the .bsp data for the level
function TQuake3BSP.LoadBSP(const Folder, FileName: String;
  index: integer; inmemory: boolean): boolean;
var
  f: File;
  i, j, k, l, size, tempInt: integer;
  temp: glFloat;
  Header: TBSPHeader;
  Lumps: array of TBSPLump;
  BSPLightMap: array of TBSPLightmap;
  dump: Text;
  shaderFile: string;
  mapName, effectAsString: string;
  dmp: TextFile;
  tmp: string;
  tmpPlane, newPlane: TBSPPlane;
  point: TVector3f;
  tt, tl: single;
  s, e: cardinal;
  dov: single;
  dist: single;
  fEffects: array of TFileEffect;
  newDistance, side: single;
  memory: TMemoryStream;
begin
  result := false;

  if inmemory then
  begin
    memory := Pk3Zip.ReadFileInPK3(Pk3Zip.IndexOf(FileName), FileName);
    memory.Position := 0;
  end;



  // mapName := Pk3Zip.ITEM_INDEX.name;
  if not inmemory then
  begin
      AssignFile(f, mapName); // Check if the .bsp file can be opened
    {$I-}
      Reset(f, 1);
    {$I+}
      if IOResult <> 0 then
      begin
        MessageBox(0, 'Could not find the BSP file!', 'Error', MB_OK);
        exit;
      end;
  end;

  // Read in the header and lump data
  if inmemory then
    memory.ReadBuffer(Header, Sizeof(Header))
  else
    BlockRead(f, Header, Sizeof(Header));
  if (Header.strID[0] <> 'I') or (Header.strID[1] <> 'B') or
    (Header.strID[2] <> 'S') or (Header.strID[3] <> 'P') or
    (Header.Version <> $2E) then
  begin
    MessageBox(0, 'Wrong header information!', 'Error', MB_OK);
    exit;
  end;

  // Initialize the header and lump structures *********************************
  SetLength(Lumps, kMaxLumps);
  if inmemory then
    memory.ReadBuffer(Lumps[0], kMaxLumps * Sizeof(TBSPLump))
  else
    BlockRead(f, Lumps[0], kMaxLumps * Sizeof(TBSPLump));

  // LUMP 0: ENTITIES **********************************************************
  try
    LoadEntities(f, memory, Lumps[kEntities], inmemory); // Load the entities
  except
    ShowMessage('Error in entities');
    exit;
  end;

  // LUMP 1: TEXTURES **********************************************************
  try
    numOfTextures := Round(Lumps[kTextures].Length / Sizeof(TQ3FileTexture));
    SetLength(fileTextures, numOfTextures);
    SetLength(TextureInfo, numOfTextures);
    if inmemory then
      begin
        memory.Seek(Lumps[kTextures].offset, soFromBeginning);
        memory.ReadBuffer(fileTextures[0], numOfTextures * Sizeof(TQ3FileTexture));
      end
    else
      begin
        Seek(f, Lumps[kTextures].offset);
        BlockRead(f, fileTextures[0], numOfTextures * Sizeof(TQ3FileTexture));
      end;

    s := GetTickCount();
    // Reset ShaderManager required list
    FShaderManager.RequiredShaders.Clear;
    for i := 0 to numOfTextures - 1 do
    begin // Go through all of the textures
      TextureInfo[i].TextureName :=
        StringReplace(lowerCase(fileTextures[i].TextureName), '/', '\',
        [rfReplaceAll]);
      TextureInfo[i].surface := fileTextures[i].flags;
      TextureInfo[i].contents := fileTextures[i].contents;
      TextureInfo[i].shaderId := -1; // intial only
      TextureInfo[i].TextureId := 0;
      shaderFile := ShaderManager.AvailableShaders.Values
        [TextureInfo[i].TextureName];

      if shaderFile <> '' then
      begin // texture as defined in a shader
        // unique shaders only
        if FShaderManager.RequiredShaders.IndexOf
          (shaderFile + '=' + TextureInfo[i].TextureName) = -1 then
          FShaderManager.RequiredShaders.Add(shaderFile + '=' + TextureInfo[i]
            .TextureName);
      end;
    end;
    // FShaderManager.RequiredShaders.SaveToFile('C:\RequiredShaders.txt');
    Cons.AddMsg('Required shaders = ' +
      IntToStr(ShaderManager.RequiredShaders.Count));
    // for i := 0 to ShaderManager.RequiredShaders.Count-1 do
    // Cons.AddMsg(ShaderManager.RequiredShaders[i]);
  except
    ShowMessage('Error in textures');
    exit;
  end;

  // LUMP 2: PLANES ************************************************************
  try
    numOfPlanes := Round(Lumps[kPlanes].Length / Sizeof(TBSPPlane));
    SetLength(Planes, numOfPlanes);
    if inmemory then
      begin
        memory.Seek(Lumps[kPlanes].offset, soFromBeginning);
        memory.ReadBuffer(Planes[0], numOfPlanes * Sizeof(TBSPPlane));
      end
    else
      begin
        Seek(f, Lumps[kPlanes].offset);
        BlockRead(f, Planes[0], numOfPlanes * Sizeof(TBSPPlane));
      end;
    for i := 0 to numOfPlanes - 1 do
    begin
      point := ScaleVector(Planes[i].Normal, -Planes[i].d);
      // Swap normal coords
      temp := Planes[i].Normal.Y;
      Planes[i].Normal.Y := Planes[i].Normal.Z;
      Planes[i].Normal.Z := -temp;
      (* temp := point.y;
        point.y := point.z;
        point.z := -temp;
        // point on new plane
        newDistance := ClassifyPoint(SetVector(0,0,0), point, Planes[i].Normal);
        if newDistance < 0 then
        newDistance :=  -abs(Planes[i].d)
        else if newDistance > 0 then
        newDistance :=  abs(Planes[i].d);
        if newDistance <> Planes[i].d then
        Planes[i].d := newDistance;
      *)
    end;
  except
    ShowMessage('Error in planes');
    exit;
  end;

  // LUMP 3: NODES *************************************************************
  try
    numOfNodes := Round(Lumps[kNodes].Length / Sizeof(TBSPNode));
    SetLength(Nodes, numOfNodes);
    if inmemory then
      begin
        memory.Seek(Lumps[kNodes].offset, soFromBeginning);
        memory.ReadBuffer(Nodes[0], numOfNodes * Sizeof(TBSPNode));
      end
    else
      begin
        Seek(f, Lumps[kNodes].offset);
        BlockRead(f, Nodes[0], numOfNodes * Sizeof(TBSPNode));
      end;
    for i := 0 to numOfNodes - 1 do
    begin
      SwapBoundingBoxInteger(Nodes[i].min, Nodes[i].max);
    end;
  except
    ShowMessage('Error in nodes');
    exit;
  end;

  // LUMP 4: LEAFS *************************************************************
  try
    numOfLeafs := Round(Lumps[kLeafs].Length / Sizeof(TBSPLeaf));
    SetLength(Leafs, numOfLeafs);
    if inmemory then
      begin
        memory.Seek(Lumps[kLeafs].offset, soFromBeginning);
        memory.ReadBuffer(Leafs[0], numOfLeafs * Sizeof(TBSPLeaf));
      end
    else
      begin
        Seek(f, Lumps[kLeafs].offset);
        BlockRead(f, Leafs[0], numOfLeafs * Sizeof(TBSPLeaf));
      end;
    for i := 0 to numOfLeafs - 1 do
    begin // Now we need to go through and convert all the leaf bounding boxes to the normal OpenGL Y up axis.
      SwapBoundingBoxInteger(Leafs[i].min, Leafs[i].max);
    end;
  except
    ShowMessage('Error in leafs');
    exit;
  end;

  // LUMP 5: LEAF FACES ********************************************************
  try
    numOfLeafFaces := Round(Lumps[kLeafFaces].Length / Sizeof(integer));
    SetLength(LeafFaces, numOfLeafFaces);
    if inmemory then
      begin
        memory.Seek(Lumps[kLeafFaces].offset, soFromBeginning);
        memory.ReadBuffer(LeafFaces[0], numOfLeafFaces * Sizeof(integer));
      end
    else
      begin
        Seek(f, Lumps[kLeafFaces].offset);
        BlockRead(f, LeafFaces[0], numOfLeafFaces * Sizeof(integer));
      end;
  except
    ShowMessage('Error in leaf faces');
    exit;
  end;

  // LUMP 6: LEAF BRUSHES ******************************************************
  try
    numOfLeafBrushes := Round(Lumps[kLeafBrushes].Length / Sizeof(integer));
    SetLength(Leafbrushes, numOfLeafBrushes);
    if inmemory then
      begin
        memory.Seek(Lumps[kLeafBrushes].offset, soFromBeginning);
        memory.ReadBuffer(Leafbrushes[0], Sizeof(integer) * numOfLeafBrushes);
      end
    else
      begin
        Seek(f, Lumps[kLeafBrushes].offset);
        BlockRead(f, Leafbrushes[0], Sizeof(integer) * numOfLeafBrushes);
      end;
  except
    ShowMessage('Error in leaf brushes');
    exit;
  end;

  // LUMP 7: MODELS ************************************************************
  try
    numOfModels := Round(Lumps[kModels].Length / Sizeof(TBSPModel));
    SetLength(Models, numOfModels);
    if inmemory then
      begin
        memory.Seek(Lumps[kModels].offset, soFromBeginning);
        memory.ReadBuffer(Models[0], Sizeof(TBSPModel) * numOfModels);
      end
    else
      begin
        Seek(f, Lumps[kModels].offset);
        BlockRead(f, Models[0], Sizeof(TBSPModel) * numOfModels);
      end;
    for i := 0 to numOfModels - 1 do
    begin
      SwapBoundingBoxFloat(Models[i].min, Models[i].max);
    end;
  except
    ShowMessage('Error in models');
    exit;
  end;

  // LUMP 8: BRUSHES *******************************************************************
  try
    numOfBrushes := Round(Lumps[kBrushes].Length / Sizeof(TBSPBrush));
    SetLength(Brushes, numOfBrushes);
    if inmemory then
      begin
        memory.Seek(Lumps[kBrushes].offset, soFromBeginning);
        memory.ReadBuffer(Brushes[0], Sizeof(TBSPBrush) * numOfBrushes);
      end
    else
      begin
        Seek(f, Lumps[kBrushes].offset);
        BlockRead(f, Brushes[0], Sizeof(TBSPBrush) * numOfBrushes);
      end;
  except
    ShowMessage('Error in brushes');
    exit;
  end;

  // LUMP 9: BRUSH SIDES *******************************************************
  try
    numOfBrushSides := Round(Lumps[kBrushSides].Length / Sizeof(TBSPBrushSide));
    SetLength(BrushSides, numOfBrushSides);
    if inmemory then
      begin
        memory.Seek(Lumps[kBrushSides].offset, soFromBeginning);
        memory.ReadBuffer(BrushSides[0], Sizeof(TBSPBrushSide) * numOfBrushSides);
      end
    else
      begin
        Seek(f, Lumps[kBrushSides].offset);
        BlockRead(f, BrushSides[0], Sizeof(TBSPBrushSide) * numOfBrushSides);
      end;
  except
    ShowMessage('Error in brush sides');
    exit;
  end;

  // LUMP 10: VERTEX ***********************************************************
  try
    numOfVerts := Round(Lumps[kVertices].Length / Sizeof(TBSPVertex));
    SetLength(Vertices, numOfVerts);
    SetLength(fogBuffer, numOfVerts);
    if inmemory then
      memory.Seek(Lumps[kVertices].offset, soFromBeginning)
    else
      Seek(f, Lumps[kVertices].offset);
    for i := 0 to numOfVerts - 1 do
    begin
      if inmemory then
        memory.ReadBuffer(Vertices[i], Sizeof(TBSPVertex))
      else
        BlockRead(f, Vertices[i], Sizeof(TBSPVertex));
      temp := Vertices[i].Position.Y;
      Vertices[i].Position.Y := Vertices[i].Position.Z;
      Vertices[i].Position.Z := -temp;
      Vertices[i].TextureCoord.Y := -Vertices[i].TextureCoord.Y;
      ChangeGamma(Vertices[i].color, Gamma);
      temp := Vertices[i].Normal.Y;
      Vertices[i].Normal.Y := Vertices[i].Normal.Z;
      Vertices[i].Normal.Z := -temp;
    end;
  except
    ShowMessage('Error in vertices');
    exit;
  end;

  // LUMP 11: MESHVERTS ********************************************************
  try
    numOfMeshVerts := Round(Lumps[kMeshVerts].Length / Sizeof(integer));
    SetLength(MeshVertices, numOfMeshVerts);
    if inmemory then
      begin
        memory.Seek(Lumps[kMeshVerts].offset, soFromBeginning);
        memory.ReadBuffer(MeshVertices[0], numOfMeshVerts * Sizeof(integer));
      end
    else
      begin
        Seek(f, Lumps[kMeshVerts].offset);
        BlockRead(f, MeshVertices[0], numOfMeshVerts * Sizeof(integer));
      end;
  except
    ShowMessage('Error in mesh vertices');
    exit;
  end;

  // LUMP 12: EFFECTS **********************************************************
  // Fog volumes are defined via EFFECTS
  try
    numOfEffects := Round(Lumps[kEffects].Length / Sizeof(TFileEffect));
    SetLength(Effects, numOfEffects);
    SetLength(fEffects, numOfEffects);
    if inmemory then
      begin
        memory.Seek(Lumps[kEffects].offset, soFromBeginning);
        memory.ReadBuffer(fEffects[0], numOfEffects * Sizeof(TFileEffect));
      end
    else
      begin
        Seek(f, Lumps[kEffects].offset);
        BlockRead(f, fEffects[0], numOfEffects * Sizeof(TFileEffect));
      end;
    // chu y cho dong duoi day
    FShaderManager.ReadRequiredShaders;
    Cons.AddMsg('Loaded shaders = ' + IntToStr(ShaderManager.Count));
    Cons.AddMsg('Effects = ' + IntToStr(numOfEffects));
  except
    ShowMessage('Error in mesh vertices');
    exit;
  end;

  // assign shaderId
  skyboxShader := -1;
  for i := 0 to numOfTextures - 1 do
  begin // Go through all of the textures
    shaderFile := ShaderManager.AvailableShaders.Values
      [TextureInfo[i].TextureName];
    TextureInfo[i].shaderId := ShaderManager.IndexOf
        (TextureInfo[i].TextureName);
   if (shaderFile <> '')and(-1 <> TextureInfo[i].shaderId) then
    begin
      TextureInfo[i].surface := ShaderManager[TextureInfo[i].shaderId].surface;
      TextureInfo[i].TextureId := ShaderManager[TextureInfo[i].shaderId].qerId;
      // @@ NEW
      if ShaderManager[TextureInfo[i].shaderId].IsSkyBox then
      begin
        skyboxShader := TextureInfo[i].shaderId;
        if ShaderManager[TextureInfo[i].shaderId].SkyboxType = 2 then
        begin
          for j := 0 to 5 do
            ShaderManager[skyboxShader].SkyboxTextureIds[j] :=
              FShaderManager.LoadTexture(ShaderManager[skyboxShader]
              .SkyboxTextureNames[j], false, true);
        end;
      end;
    end
    else
      TextureInfo[i].TextureId := FShaderManager.LoadTexture
        (TextureInfo[i].TextureName, false, false);
  end;

  // LUMP 13: FACES ************************************************************
  try
    numOfFaces := Round(Lumps[kFaces].Length / Sizeof(TBSPFace));
    SetLength(Faces, numOfFaces);
    SetLength(IsModelFace, numOfFaces);
    if inmemory then
      begin
        memory.Seek(Lumps[kFaces].offset, soFromBeginning);
        memory.ReadBuffer(Faces[0], numOfFaces * Sizeof(TBSPFace));
      end
    else
      begin
        Seek(f, Lumps[kFaces].offset);
        BlockRead(f, Faces[0], numOfFaces * Sizeof(TBSPFace));
      end;
    SetLength(FacesDrawn, numOfFaces);
    SetLength(CenterPoints, numOfFaces);

    s := GetTickCount;
    for i := 0 to numOfFaces - 1 do
    begin
      IsModelFace[i] := false;
      temp := Faces[i].Normal.Y;
      Faces[i].Normal.Y := Faces[i].Normal.Z;
      Faces[i].Normal.Z := -temp;
      if Faces[i].FaceType = FACE_PATCH then
        PrepareQuadricPatch(i)
      else
      begin
        point := SetVector(0, 0, 0);
        for j := 0 to Faces[i].numMeshVerts - 1 do
        begin
          point.X := point.X + Vertices[Faces[i].startVertIndex + MeshVertices
            [Faces[i].meshVertIndex + j]].Position.X;
          point.Y := point.Y + Vertices[Faces[i].startVertIndex + MeshVertices
            [Faces[i].meshVertIndex + j]].Position.Y;
          point.Z := point.Z + Vertices[Faces[i].startVertIndex + MeshVertices
            [Faces[i].meshVertIndex + j]].Position.Z;
        end;
        CenterPoints[i].X := point.X / Faces[i].numMeshVerts;
        CenterPoints[i].Y := point.Y / Faces[i].numMeshVerts;
        CenterPoints[i].Z := point.Z / Faces[i].numMeshVerts;
      end;
    end;
    SetLength(TransparentFaces, numOfFaces);
    SetLength(SolidFaces, numOfFaces);
    SetLength(AdditiveFaces, numOfFaces);
    e := GetTickCount;
    Cons.AddMsg('Preparing faces ' + IntToStr(e - s) + ' ms');
  except
    ShowMessage('Error in faces');
    exit;
  end;

  // LUMP 14: LIGHTMAPS ********************************************************
  try
    numOfLightmaps := Round(Lumps[kLightmaps].Length / Sizeof(TBSPLightmap));
    SetLength(BSPLightMap, numOfLightmaps);
    SetLength(Lightmaps, numOfLightmaps);
    if inmemory then
      begin
        memory.Seek(Lumps[kLightmaps].offset, soFromBeginning);
        memory.ReadBuffer(BSPLightMap[0], Sizeof(TBSPLightmap) * numOfLightmaps);
      end
    else
      begin
        Seek(f, Lumps[kLightmaps].offset);
        BlockRead(f, BSPLightMap[0], Sizeof(TBSPLightmap) * numOfLightmaps);
      end;
    for i := 0 to numOfLightmaps - 1 do
    begin
      CreateLightmapTexture(Lightmaps[i], BSPLightMap[i], 128, 128);
    end;
  except
    ShowMessage('Error in lightmaps');
    exit;
  end;

  // LUMP 15: LIGHT VOLUMES ****************************************************
  // not implemented yet - only used by models

  // LUMO 16: VISDATA **********************************************************
  try
    if inmemory then
      memory.Seek(Lumps[kVisData].offset, soFromBeginning)
    else
      Seek(f, Lumps[kVisData].offset);
    if (Lumps[kVisData].Length > 0) then
    begin
      if inmemory then
      begin
        memory.ReadBuffer(clusters.numOfClusters, Sizeof(integer));
        memory.ReadBuffer(clusters.bytesPerCluster, Sizeof(integer));
        SetLength(clusters.Bitsets, size);
        memory.ReadBuffer(clusters.Bitsets[0], Sizeof(byte) * size);
      end
      else
      begin
        BlockRead(f, clusters.numOfClusters, Sizeof(integer));
        BlockRead(f, clusters.bytesPerCluster, Sizeof(integer));
        size := clusters.numOfClusters * clusters.bytesPerCluster;
        SetLength(clusters.Bitsets, size);
        BlockRead(f, clusters.Bitsets[0], Sizeof(byte) * size);
      end;
    end
    else
      SetLength(clusters.Bitsets, 0);
  except
    ShowMessage('Error in lightmaps');
    exit;
  end;

  // ALL DATA READ *************************************************************
  // assign effect indices to shaders
  if numOfEffects > 0 then
  begin
    for i := 0 to numOfEffects - 1 do
    begin
      effectAsString := StrPas(fEffects[i].name);
      effectAsString := StringReplace(lowerCase(effectAsString), '/', '\',
        [rfReplaceAll]);
      shaderFile := ShaderManager.AvailableShaders.Values[effectAsString];
      j := FShaderManager.RequiredShaders.IndexOf
        (shaderFile + '=' + effectAsString);
      if j <> -1 then
      begin
        Effects[i].shaderIndex := j;
      end;
    end;
  end;
  SetLength(fEffects, 0);
  // FShaderManager.RequiredShaders.SaveToFile('C:\RequiredShaders.txt');

  // Model[0] is world bounding box
  if numOfModels > 0 then
  begin
    if Models[0].min.X < 0 then
      dist := Models[0].max.X + abs(Models[0].min.X)
    else
      dist := Models[0].max.X - Models[0].min.X;
    dov := dist;

    if Models[0].min.Y < 0 then
      dist := Models[0].max.Y + abs(Models[0].min.Y)
    else
      dist := Models[0].max.Y - Models[0].min.Y;
    if dist > dov then
      dov := dist;
    if Models[0].min.Z < 0 then
      dist := Models[0].max.Z + abs(Models[0].min.Z)
    else
      dist := Models[0].max.Z - Models[0].min.Z;
    if dist > dov then
      dov := dist;
    WORLD_MAX := dov;
    DEPTH_OF_VIEW := trunc(dov * 3);

    if numOfModels > 1 then
    begin
      for i := 1 to numOfModels - 1 do
      begin
        j := Models[i].numOfFaces;
        if j > 0 then
        begin
          for k := 0 to j - 1 do
          begin
            IsModelFace[Models[i].FaceIndex + k] := true;
          end;
        end;
      end;
    end;
  end;

  if skyboxShader <> -1 then
    try
      FSkyBox.Init(Round(dov * pi / 2), SKY_RESOLUTION,
        FShaderManager.Items[skyboxShader].SkyboxType,
        FShaderManager.Items[skyboxShader].SkyboxTextureIds);
    except
      on e: Exception do
        ShowMessage('Error on Render skybox at map ' + BSP_NAME);
    end;

  if inmemory then
    memory.Free
  else CloseFile(f);
  // SetLength(fileTextures,0);
  result := true;
end;

/// //	This returns the leaf our camera is in
function TQuake3BSP.FindLeaf(vPos: TVector3f): integer;
var
  i: integer;
  distance: double;
  node: PBSPNode;
  plane: PBSPPlane;
begin
  i := 0;
  while (i >= 0) do
  begin
    node := @Nodes[i];
    plane := @Planes[node.plane];

    distance := plane.Normal.X * vPos.X + plane.Normal.Y * vPos.Y +
      plane.Normal.Z * vPos.Z - plane.d;

    // If the camera is in front of the plane
    if (distance >= 0) then
    begin
      // Assign the current node to the node in front of itself
      i := node.front;
    end
    else
    begin // Else if the camera is behind the plane
      // Assign the current node to the node behind itself
      i := node.back;
    end;
  end; // while

  result := -(i + 1);
end;

/// //	This tells us if the "current" cluster can see the "test" cluster
function TQuake3BSP.IsClusterVisible(current, test: integer): integer;
var
  visSet: byte;
  retVal: integer;
begin
  if (High(clusters.Bitsets) <= 0) or (current < 0) then
  begin
    result := 1;
    exit;
  end;
  // Use binary math to get the 8 bit visibility set for the current cluster
  visSet := clusters.Bitsets[(current * clusters.bytesPerCluster) +
    (test div 8)];
  // Now that we have our vector (bitset), do some bit shifting to find if
  // the "test" cluster is visible from the "current" cluster, according to the bitset.
  retVal := visSet and (1 shl ((test) and 7));
  // Return the result ( either 1 (visible) or 0 (not visible) )
  result := (retVal);
end;

procedure TQuake3BSP.PrepareQuadricPatch(FaceIndex: integer);
var
  face: PBSPFace;
  numPatchesWide, numPatchesHigh, numOfQuadricPatches: integer;
  vertexCount, indexCount: integer;
  oldNumOfVerts, oldNumOfIndices, pointOffset, startVertIndex: integer;
  Y, X, row, point: integer;
  i, j, cnt: integer;
  center: TVector3f;
  QuadricPatches: TBSPQuadricPatchArray;
begin
  face := @Faces[FaceIndex];

  numPatchesWide := (face.size[0] - 1) div 2;
  numPatchesHigh := (face.size[1] - 1) div 2;

  numOfQuadricPatches := numPatchesWide * numPatchesHigh;
  SetLength(QuadricPatches, numOfQuadricPatches);

  vertexCount := (tesselation + 1) * (tesselation + 1);
  indexCount := tesselation * (tesselation) * 6;
  pointOffset := 0;

  startVertIndex := numOfVerts;
  Faces[FaceIndex].meshVertIndex := numOfMeshVerts;
  Faces[FaceIndex].numMeshVerts := indexCount * numOfQuadricPatches;
  Faces[FaceIndex].numOfVerts := vertexCount * numOfQuadricPatches;
  for Y := 0 to numPatchesHigh - 1 do
  begin
    for X := 0 to numPatchesWide - 1 do
    begin
      // calc control points
      for row := 0 to 2 do
      begin
        for point := 0 to 2 do
        begin
          QuadricPatches[Y * numPatchesWide + X].controlPoints[row * 3 + point]
            := Vertices[face.startVertIndex + (Y * 2 * face.size[0] + X * 2) +
            row * face.size[0] + point];
        end;
      end;
      // create vertices and indices
      oldNumOfVerts := numOfVerts;
      oldNumOfIndices := numOfMeshVerts;
      numOfVerts := numOfVerts + vertexCount;
      numOfMeshVerts := numOfMeshVerts + indexCount;
      SetLength(Vertices, numOfVerts);
      SetLength(MeshVertices, numOfMeshVerts);
      // Tesselate(QuadricPatches[faceIndex, y*numPatchesWide+x]);
      CalcQuadricPatch(QuadricPatches[Y * numPatchesWide + X].controlPoints,
        oldNumOfVerts, oldNumOfIndices, pointOffset);
      inc(pointOffset, vertexCount);
    end;
  end;
  Faces[FaceIndex].startVertIndex := startVertIndex;
  center := SetVector(0, 0, 0);
  cnt := 0;
  // for i := (numOfVerts-1) downto (numOfVerts-1)-(vertexCount*numOfQuadricPatches) do begin
  for i := startVertIndex to (startVertIndex + Faces[FaceIndex]
    .numOfVerts - 1) do
  begin
    center.X := center.X + Vertices[i].Position.X;
    center.Y := center.Y + Vertices[i].Position.Y;
    center.Z := center.Z + Vertices[i].Position.Z;
    inc(cnt);
  end;
  CenterPoints[FaceIndex].X := center.X / cnt;
  CenterPoints[FaceIndex].Y := center.Y / cnt;
  CenterPoints[FaceIndex].Z := center.Z / cnt;
end;

procedure TQuake3BSP.BindTextures(texId, lmId: integer);
begin
  if not MultiTexture then
  begin
    if WireFrame = false then
    begin
      glColor3ub(255, 255, 255);
      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, TextureInfo[texId].TextureId);
    end
    else
    begin
      glColor3ub(255, 255, 255);
      glDisable(GL_TEXTURE_2D);
    end;
  end
  else
  begin
    if WireFrame = false then
    begin
      if GL_ARB_multitexture then
        glActiveTextureARB(GL_TEXTURE1_ARB);
      if lmId > -1 then
      begin
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, Lightmaps[lmId]);
      end
      else
      begin
        glDisable(GL_TEXTURE_2D);
      end;
      if GL_ARB_multitexture then
        glActiveTextureARB(GL_TEXTURE0_ARB);
      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, TextureInfo[texId].TextureId);
    end
    else
    begin
      glColor3ub(255, 255, 255);
      if GL_ARB_multitexture then
        glActiveTextureARB(GL_TEXTURE1_ARB);
      glDisable(GL_TEXTURE_2D);
      if GL_ARB_multitexture then
        glActiveTextureARB(GL_TEXTURE0_ARB);
      glDisable(GL_TEXTURE_2D);
    end;
  end;
end;

(*
  procedure TQuake3BSP.RenderPatchShader(faceIndex, shaderId : integer);
  var shader : TShader;
  i, p, row : integer;
  Face : PBSPFace;
  texId : Cardinal;
  begin
  try
  Face := @Faces[faceIndex];
  shader := ShaderManager[shaderId];

  // culling
  if shader.Cull = GL_NONE then begin
  glDisable(GL_CULL_FACE);
  end
  else begin
  glEnable(GL_CULL_FACE);
  glCullFace(shader.Cull);
  end;

  if multiTexture then begin
  glActiveTextureARB(GL_TEXTURE1_ARB);
  glDisable(GL_TEXTURE_2D);

  glActiveTextureARB(GL_TEXTURE0_ARB);
  glDisable(GL_TEXTURE_2D);
  end
  else
  glDisable(GL_TEXTURE_2D);

  glEnable(GL_COLOR);
  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
  glColor3ub(255,255,255);

  if shader.numOfLayers > 0 then begin
  for p := 0 to High(QuadricPatches[faceIndex]) do begin
  Move(QuadricPatches[faceIndex, p].verts[0], inputBuffer[0], QuadricPatches[faceIndex, p].numOfVerts*sizeof(TBSPVertex));
  SetVertexCoords(shaderId, QuadricPatches[faceIndex, p].numOfVerts);
  glVertexPointer(3, GL_FLOAT, sizeof(TBSPVERTEX), @inputBuffer[0].position);
  for i := 0 to shader.numOfLayers-1 do begin

  SetVertexColors(shaderId, i, QuadricPatches[faceIndex, p].numOfVerts);
  SetTextureCoordinates(shaderId, i, QuadricPatches[faceIndex, p].numOfVerts);

  if multiTexture then
  glClientActiveTextureARB(GL_TEXTURE0_ARB);

  glTexCoordPointer(2, GL_FLOAT, 0,  @texCoordBuffer[0]);

  if (shader.Layers[i].UseLightmap) then begin
  if not MultiTexture then begin
  texId := 0;
  end
  else begin
  glClientActiveTextureARB(GL_TEXTURE0_ARB);
  glTexCoordPointer(2, GL_FLOAT, sizeof(TBSPVERTEX), @inputBuffer[0].LightmapCoord);
  if Lightmaps[face.lightmapID] > -1 then
  texId := Lightmaps[face.lightmapID]
  else
  texId := 0;
  end;
  end
  else begin
  texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];
  end;

  if multiTexture then
  glActiveTextureARB(GL_TEXTURE0_ARB);
  glEnable(GL_TEXTURE_2D);
  glBindTexture(GL_TEXTURE_2D, texId);
  shaderManager.SetState(shaderId, i );
  //Draw a triangle strip for each row
  {for row :=0 to tesselation-1 do begin
  glDrawElements(GL_TRIANGLE_STRIP, 2*(tesselation+1), GL_UNSIGNED_INT, @QuadricPatches[faceIndex, p].indx[row*2*(tesselation+1)]);
  end;
  }
  glDrawElements(GL_TRIANGLES, QuadricPatches[faceIndex, p].numOfIndices, GL_UNSIGNED_INT, QuadricPatches[faceIndex, p].meshIndex );
  //SetDefaults;
  end;
  end;
  end;
  SetDefaults;
  except
  lastError := glGetError();
  lastErrorString := gluErrorString(lastError);
  if DumpErrors then AddError('RenderPatchShader ' + lastErrorString);
  end;
  end;
*)
(* procedure TQuake3BSP.RenderSkyboxOld;
  var shader : TShader;
  i : integer;
  texId : Cardinal;
  begin
  glCullFace(GL_BACK);
  shader := ShaderManager[skyBoxShader];

  if MultiTexture then begin
  glActiveTextureARB(GL_TEXTURE1_ARB);
  glDisable(GL_TEXTURE_2D);
  glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);

  try
  if shader.numOfLayers > 0 then begin
  for i := 0 to shader.numOfLayers-1 do begin
  ShaderManager.SetLayer(skyBoxShader, i);
  glDisableClientState(GL_COLOR_ARRAY);

  glMatrixMode(GL_TEXTURE);
  glLoadIdentity;
  glMatrixMode(GL_MODELVIEW);

  shaderManager.SetMods(skyBoxShader, i);

  texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];
  if MultiTexture then
  glActiveTextureARB(GL_TEXTURE0_ARB);
  glEnable(GL_TEXTURE_2D);
  glBindTexture(GL_TEXTURE_2D, texId);
  shaderManager.SetState(skyBoxShader, i );

  FSkyBox.Draw(Camera.position);
  end;
  end;
  glMatrixMode(GL_TEXTURE);
  glLoadIdentity;
  glMatrixMode(GL_MODELVIEW);

  SetDefaults;
  except
  lastError := glGetError();
  lastErrorString := gluErrorString(lastError);
  if DumpErrors then AddError('RenderSkyBox ' + lastErrorString);
  end;
  end;
*)
procedure TQuake3BSP.RenderSkybox;
var
  shader: TShader;
  i, numOfVerts: integer;
  texId: cardinal;
begin
  glCullFace(GL_BACK);
  shader := ShaderManager[skyboxShader];

  if shader.SkyboxType = 2 then
  begin
    glDisableClientState(GL_COLOR_ARRAY);
    if GL_ARB_multitexture then
      glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisable(GL_TEXTURE_2D);
    if GL_ARB_multitexture then
      glActiveTextureARB(GL_TEXTURE0_ARB);
    glEnable(GL_TEXTURE_2D);
    glDisableClientState(GL_COLOR_ARRAY);

    FSkyBox.DrawBox(Camera.Position);
    SetDefaults;
    exit;
  end;

  if MultiTexture then
  begin
    glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisable(GL_TEXTURE_2D);
    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);

  try
    FSkyBox.CalcRenderPoints(Camera.Position); // only visible points
    glEnable(GL_COLOR);
    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    glColor3ub(255, 255, 255);

    // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
    FSkyBox.CopyData(inputBuffer);
    numOfVerts := FSkyBox.TriangleCount * 3;
    SetVertexCoords(skyboxShader, numOfVerts);
    glVertexPointer(3, GL_FLOAT, Sizeof(TBSPVertex), @inputBuffer[0].Position);

    // if LockArrays then glLockArraysEXT(0, numOfVerts);
    if shader.numOfLayers > 0 then
    begin
      for i := 0 to shader.numOfLayers - 1 do
      begin
        SetVertexColors(skyboxShader, i, numOfVerts);

        glColorPointer(4, GL_UNSIGNED_BYTE, 0, @colorBuffer[0]);
        glDisableClientState(GL_COLOR_ARRAY);
        SetTextureCoordinates(skyboxShader, i, numOfVerts);

        if MultiTexture then
          glClientActiveTextureARB(GL_TEXTURE0_ARB);

        glTexCoordPointer(2, GL_FLOAT, 0, @texCoordBuffer[0]);
        texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];

        if MultiTexture then
          glActiveTextureARB(GL_TEXTURE0_ARB);
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, texId);

        ShaderManager.SetState(skyboxShader, i);
        glDrawArrays(GL_TRIANGLES, 0, numOfVerts);
      end;
    end;
    // if LockArrays then glUnlockArraysEXT(0);
    SetDefaults;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    Cons.AddIfDifferent('RenderSkyBox ' + lastErrorString);
    // if DumpErrors then AddError('RenderSkyBox ' + lastErrorString);
  end;
end;

(*
  procedure TQuake3BSP.RenderFaceShader(faceIndex, shaderId : integer);
  var shader : TShader;
  i : integer;
  Face : PBSPFace;
  texId : Cardinal;
  FogPoint : TVector3f;
  distance : single;
  begin
  Face := @Faces[faceIndex];
  shader := ShaderManager[shaderId];
  try
  // culling
  if shader.Cull = GL_NONE then
  glDisable(GL_CULL_FACE)
  else begin
  glEnable(GL_CULL_FACE);
  glCullFace(shader.Cull);
  end;

  if multiTexture then begin
  glActiveTextureARB(GL_TEXTURE1_ARB);
  glDisable(GL_TEXTURE_2D);
  glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);

  glEnable(GL_COLOR);
  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
  glColor3ub(255,255,255);

  // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
  Move(Vertices[face.startVertIndex], inputBuffer, face.numOfVerts*sizeof(TBSPVertex));
  SetVertexCoords(shaderId, face.numOfVerts);
  glVertexPointer(3, GL_FLOAT, sizeof(TBSPVertex), @inputBuffer[0].Position);

  if shader.numOfLayers > 0 then begin
  for i := 0 to shader.numOfLayers-1 do begin
  //for i := 1 to 1 do begin

  SetVertexColors(shaderId, i, face.numOfVerts);

  glColorPointer(4, GL_UNSIGNED_BYTE, 0, @colorBuffer[0]);
  glEnableClientState(GL_COLOR_ARRAY);

  SetTextureCoordinates(shaderId, i, face.numOfVerts);

  if multiTexture then
  glClientActiveTextureARB(GL_TEXTURE0_ARB);
  glTexCoordPointer(2, GL_FLOAT, 0,  @texCoordBuffer[0]);


  if (shader.Layers[i].UseLightmap) then begin
  if not MultiTexture then begin
  texId := 0;
  end
  else begin
  glClientActiveTextureARB(GL_TEXTURE0_ARB);
  glTexCoordPointer(2, GL_FLOAT, sizeof(TBSPVERTEX), @inputBuffer[0].LightmapCoord);
  if Lightmaps[face.lightmapID] > -1 then
  texId := Lightmaps[face.lightmapID]
  else
  texId := 0;
  end;
  end
  else begin
  texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];
  end;

  if multiTexture then
  glActiveTextureARB(GL_TEXTURE0_ARB);
  glEnable(GL_TEXTURE_2D);
  glBindTexture(GL_TEXTURE_2D, texId);

  shaderManager.SetState(shaderId, i );
  glDrawArrays(GL_TRIANGLE_FAN, 0, Face.numOfVerts);
  //SetDefaults;
  end;
  end;
  SetDefaults;
  except
  lastError := glGetError();
  lastErrorString := gluErrorString(lastError);
  if DumpErrors then AddError('RenderFaceShader ' + lastErrorString);
  end;
  end;
*)
procedure TQuake3BSP.RenderSurfaceShader(FaceIndex, shaderId: integer);
var
  shader: TShader;
  i, texId, planeIdx: integer;
  face: PBSPFace;
begin
  try
    face := @Faces[FaceIndex];
    shader := ShaderManager[shaderId];
    // culling
    if shader.Cull = GL_NONE then
      glDisable(GL_CULL_FACE)
    else
    begin
      glEnable(GL_CULL_FACE);
      glCullFace(shader.Cull);
    end;

    if MultiTexture then
    begin
      glActiveTextureARB(GL_TEXTURE1_ARB);
      glDisable(GL_TEXTURE_2D);

      glActiveTextureARB(GL_TEXTURE0_ARB);
    end;
    glDisable(GL_TEXTURE_2D);

    glEnable(GL_COLOR);
    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    glColor3ub(255, 255, 255);

    // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
    for i := 0 to face.numMeshVerts - 1 do
      inputBuffer[i] := Vertices[face.startVertIndex + MeshVertices
        [face.meshVertIndex + i]];

    SetVertexCoords(shaderId, face.numMeshVerts);
    glVertexPointer(3, GL_FLOAT, Sizeof(TBSPVertex), @inputBuffer[0].Position);
    // if LockArrays then glLockArraysEXT(0, Face.numMeshVerts);

    if shader.numOfLayers > 0 then
    begin
      for i := 0 to shader.numOfLayers - 1 do
      begin
        if (ShaderManager[shaderId].Layers[i].numOfrgbGen > 0) or
          (face.FaceType = FACE_MESH) then
        begin
          SetVertexColors(shaderId, i, face.numMeshVerts);
          glColorPointer(4, GL_UNSIGNED_BYTE, 0, @colorBuffer[0]);
          glEnableClientState(GL_COLOR_ARRAY);
        end
        else
          glDisableClientState(GL_COLOR_ARRAY);
        SetTextureCoordinates(shaderId, i, face.numMeshVerts);

        if MultiTexture then
          glClientActiveTextureARB(GL_TEXTURE0_ARB);
        glTexCoordPointer(2, GL_FLOAT, 0, @texCoordBuffer[0]);

        if (shader.Layers[i].UseLightmap) then
        begin
          if not MultiTexture then
          begin
            texId := 0;
          end
          else
          begin
            if MultiTexture then
              glClientActiveTextureARB(GL_TEXTURE0_ARB);
            glTexCoordPointer(2, GL_FLOAT, Sizeof(TBSPVertex),
              @inputBuffer[0].LightmapCoord);
            if (face.lightmapId > -1) and (Lightmaps[face.lightmapId] > -1) then
              texId := Lightmaps[face.lightmapId]
            else
              texId := 0;
          end;
        end
        else
        begin
          texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];
        end;
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, texId);

        ShaderManager.SetState(shaderId, i);
        glDrawArrays(GL_TRIANGLES, 0, face.numMeshVerts);
        // SetDefaults;
      end;
    end;
    // if LockArrays then glUnlockArraysEXT(0);
    SetDefaults;
    if (numOfEffects > 0) and (Faces[FaceIndex].effect > -1) and
      (not simpleRender) and (ShowFog) then
    begin
      // RenderFogFace(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside].plane );
      // RenderFog(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Effects[Faces[faceIndex].effect].visibleSide].plane);
      if (Effects[Faces[FaceIndex].effect].visibleside >= 0) then
        planeIdx := BrushSides
          [Brushes[Effects[Faces[FaceIndex].effect].brushIndex].brushside +
          Effects[Faces[FaceIndex].effect].visibleside].plane
      else
        planeIdx := -1;
      RenderFog(FaceIndex, Effects[Faces[FaceIndex].effect].shaderIndex,
        planeIdx);
      SetDefaults;
    end;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    Cons.AddIfDifferent('RenderSurfaceShader ' + lastErrorString + ' ' +
      IntToStr(FaceIndex));

    // if DumpErrors then AddError('RenderSurfaceShader ' + lastErrorString);
  end;

end;

(*
  procedure TQuake3BSP.RenderPatch(faceIndex : integer);
  var p, row  : integer;
  begin
  try
  for p := 0 to High(QuadricPatches[faceIndex]) do begin
  glVertexPointer(3, GL_FLOAT, sizeof(TBSPVERTEX), @QuadricPatches[faceIndex, p].verts[0].position);

  if MultiTexture then begin
  glClientActiveTextureARB(GL_TEXTURE1_ARB);
  glTexCoordPointer(2, GL_FLOAT, sizeof(TBSPVERTEX), @QuadricPatches[faceIndex, p].verts[0].LightmapCoord);
  glClientActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glTexCoordPointer(2, GL_FLOAT, sizeof(TBSPVERTEX), @QuadricPatches[faceIndex, p].verts[0].TextureCoord);

  BindTextures(Faces[faceIndex].textureID, Faces[faceIndex].lightmapID);
  //Draw a triangle strip for each row
  for row :=0 to tesselation-1 do begin
  glDrawElements(GL_TRIANGLE_STRIP, 2*(tesselation+1), GL_UNSIGNED_INT, @QuadricPatches[faceIndex, p].indx[row*2*(tesselation+1)]);
  end;
  //glDrawElements(GL_TRIANGLES, QuadricPatches[faceIndex, p].numOfIndices, GL_UNSIGNED_INT, QuadricPatches[faceIndex, p].meshIndex );
  end;
  SetDefaults;
  except
  lastError := glGetError();
  lastErrorString := gluErrorString(lastError);
  if DumpErrors then AddError('RenderPatch ' + lastErrorString);
  end;
  end;
*)
procedure TQuake3BSP.RenderSurface(FaceIndex: integer);
var
  face: PBSPFace;
  planeIdx: integer;
begin
  try
    face := @Faces[FaceIndex];
    glVertexPointer(3, GL_FLOAT, Sizeof(TBSPVertex),
      @Vertices[face.startVertIndex].Position);

    if MultiTexture then
    begin
      glClientActiveTextureARB(GL_TEXTURE1_ARB);
      glDisableClientState(GL_COLOR_ARRAY);
      glTexCoordPointer(2, GL_FLOAT, Sizeof(TBSPVertex),
        @Vertices[face.startVertIndex].LightmapCoord);
      glClientActiveTextureARB(GL_TEXTURE0_ARB);
    end;
    glTexCoordPointer(2, GL_FLOAT, Sizeof(TBSPVertex),
      @Vertices[face.startVertIndex].TextureCoord);

    if face.FaceType = FACE_MESH then
    begin
      glColorPointer(4, GL_UNSIGNED_BYTE, Sizeof(TBSPVertex),
        @Vertices[face.startVertIndex].color);
      glEnableClientState(GL_COLOR_ARRAY);
    end
    else
      glColor3ub(255, 255, 255);
    // if LockArrays then glLockArraysEXT(0, Face.numMeshVerts);

    BindTextures(face.TextureId, face.lightmapId);
    // Faces[faceIndex].lightmapID);
    glDrawElements(GL_TRIANGLES, face.numMeshVerts, GL_UNSIGNED_INT,
      @MeshVertices[face.meshVertIndex]);
    // if LockArrays then glUnlockArraysEXT(0);
    SetDefaults;
    if (numOfEffects > 0) and (Faces[FaceIndex].effect > -1) and
      (not simpleRender) and ShowFog then
    begin
      // RenderFogFace(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside].plane );
      // RenderFog(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, 0);
      if (Effects[Faces[FaceIndex].effect].visibleside >= 0) then
        planeIdx := BrushSides
          [Brushes[Effects[Faces[FaceIndex].effect].brushIndex].brushside +
          Effects[Faces[FaceIndex].effect].visibleside].plane
      else
        planeIdx := -1;
      RenderFog(FaceIndex, Effects[Faces[FaceIndex].effect].shaderIndex,
        planeIdx);
      SetDefaults;
    end;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    Cons.AddIfDifferent('RenderSurface ' + lastErrorString + ' ' +
      IntToStr(FaceIndex));

    // if DumpErrors then AddError('RenderSurface ' + lastErrorString);
  end;
end;

(*
  procedure TQuake3BSP.RenderFace(faceIndex: integer);
  var Face : PBSPFace;
  shader : TShader;
  i : integer;
  begin
  try
  SetDefaults;
  Face := @Faces[faceIndex];

  glVertexPointer(3, GL_FLOAT, sizeof(TBSPVertex), @Vertices[0].Position);

  if multiTexture then begin
  glClientActiveTextureARB(GL_TEXTURE1_ARB);
  glTexCoordPointer(2, GL_FLOAT, sizeof(tBSPVertex), @Vertices[0].LightmapCoord);
  glClientActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glTexCoordPointer(2, GL_FLOAT, sizeof(tBSPVertex),  @Vertices[0].TextureCoord);

  BindTextures(Face.textureID, Face.lightmapID);
  glDrawArrays(GL_TRIANGLE_FAN, Face.startVertIndex, Face.numOfVerts);

  SetDefaults;
  if Faces[faceIndex].effect > -1 then begin
  RenderFogFace(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside].plane    );
  end;
  except
  lastError := glGetError();
  lastErrorString := gluErrorString(lastError);
  if DumpErrors then AddError('RenderFaceShader ' + lastErrorString);
  end;
  end;
*)
procedure TQuake3BSP.RenderBSP(const Pos: TVector3f; leafIndex: integer);
var
  i, l, j, k, cluster, faceCount, FaceIndex, shaderId: integer;
  Leaf: PBSPLeaf;
  tmp, txt: string;
  st, et: longword;
  allEqual: boolean;
begin
  glEnableClientState(GL_VERTEX_ARRAY);
  if MultiTexture then
  begin
    glClientActiveTextureARB(GL_TEXTURE1_ARB);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glClientActiveTextureARB(GL_TEXTURE0_ARB);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    // default = vertex, tex1+tex2, no color
  end
  else
  begin
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  end;
  FillChar(FacesDrawn[0], Sizeof(boolean) * numOfFaces, 0);
  cluster := Leafs[leafIndex].cluster;
  i := numOfLeafs;
  VisibleTriangles := 0;
  renderedLeaves := 0;
  PVSLeaves := 0;
  frustumLeaves := 0;
  BSPLeaves := numOfLeafs;
  if simpleRender then
  begin
    while (i > 0) do
    begin
      dec(i);
      Leaf := @Leafs[i];
      if (IsClusterVisible(cluster, Leaf.cluster) = 0) then
      begin
        inc(PVSLeaves);
        continue;
      end;
      if (not Frust.BoxInFrustum(Leaf.min.X, Leaf.min.Y, Leaf.min.Z, Leaf.max.X,
        Leaf.max.Y, Leaf.max.Z)) then
      begin
        inc(frustumLeaves);
        continue;
      end;
      inc(renderedLeaves);
      faceCount := Leaf.numOfLeafFaces;
      while (faceCount > 0) do
      begin
        dec(faceCount);
        FaceIndex := LeafFaces[Leaf.leafface + faceCount];
        if (Faces[FaceIndex].FaceType = FACE_BILLBOARD) then
          continue;
        if (FacesDrawn[FaceIndex] = false) then
        begin
          FacesDrawn[FaceIndex] := true;
          RenderSurface(FaceIndex);
        end;
      end; // while faceCount
    end;
  end
  else
  begin
    numSolid := 0;
    numTransparent := 0;
    numAdditive := 0;
    while (i > 0) do
    begin
      dec(i);
      Leaf := @Leafs[i];
      if (IsClusterVisible(cluster, Leaf.cluster) = 0) then
      begin
        inc(PVSLeaves);
        continue;
      end;
      if (not Frust.BoxInFrustum(Leaf.min.X, Leaf.min.Y, Leaf.min.Z, Leaf.max.X,
        Leaf.max.Y, Leaf.max.Z)) then
      begin
        inc(frustumLeaves);
        continue;
      end;
      inc(renderedLeaves);
      WalkLeaf(i, SortFaces);
    end;

    // All faces are associated with the corresponding face arrays
    // now we have to depth sort all transparent
    if numSolid > 0 then
    begin
      if SortFaces then
        QSort(numSolid, CompareSolid, SwapSolid);
      for l := 0 to numSolid - 1 do
      begin
        FaceIndex := SolidFaces[l].FaceIndex;
        RenderSurface(FaceIndex);
      end;
    end;

    if numAdditive > 0 then
    begin
      if SortFaces then
        QSort(numAdditive, CompareAdditive, SwapAdditive);
      for l := 0 to numAdditive - 1 do
      begin
        FaceIndex := AdditiveFaces[l].FaceIndex;
        shaderId := TextureInfo[Faces[FaceIndex].TextureId].shaderId;
        RenderSurfaceShader(FaceIndex, shaderId);
      end;
    end;

    if (skyboxShader <> -1) and RenderSky then
    begin
      RenderSkybox;
    end;

    if numTransparent > 0 then
    begin
      if SortFaces then
      begin
        QSort(numTransparent, CompareTransparent, SwapTransparent);
      end;
      for l := numTransparent - 1 downto 0 do
      begin
        FaceIndex := TransparentFaces[l].FaceIndex;
        shaderId := TextureInfo[Faces[FaceIndex].TextureId].shaderId;
        RenderSurfaceShader(FaceIndex, shaderId);
      end;
      (*
        for l := numTransparent-1 downto 0 do begin
        faceIndex := TransparentFaces[l].FaceIndex;
        shaderId := TextureInfo[Faces[faceIndex].textureID].ShaderId;
        if ShaderManager.Items[shaderId].Cull = GL_NONE then
        glColor3ub(0,128, 255)
        else
        glColor3ub(255, 255, 0);
        glEnable(GL_COLOR);
        glDisable(GL_TEXTURE_2D);
        glLineWidth(1);
        glBegin(GL_LINES);
        with CenterPoints[faceIndex] do begin
        glVertex3f(x+0,  y+0, z+0);
        glVertex3f(x+16, y+0, z+0);
        glVertex3f(x+0,  y+0, z+0);
        glVertex3f(x-16, y+0, z+0);

        glVertex3f(x+0,  y+0, z+0);
        glVertex3f(x+0,  y+16, z+0);
        glVertex3f(x+0,  y+0, z+0);
        glVertex3f(x+0,  y-16, z+0);

        glVertex3f(x+0,  y+0, z+0);
        glVertex3f(x+0,  y+0, z+16);
        glVertex3f(x+0,  y+0, z+0);
        glVertex3f(x+0,  y+0, z-16);
        end;
        glEnd;
        glLineWidth(1);
        glDisable(GL_COLOR);
        glColor3ub(255, 255, 255);
        end; *)
    end;
  end;

  if WireFrame then
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE or GL_POINT);
  if DumpMsg <> '' then
  begin
    // Fnt.Draw(5, 25, DumpMsg, 1, SCREEN_WIDTH, SCREEN_HEIGHT);
    Cons.TextOut(1, Cons.Lines, DumpMsg);
  end;
  // with Camera do
  // fnt.Draw(5, 50, Format('Position: %d/%d/%d ', [Trunc(Position.x),Trunc(Position.y),Trunc(Position.z)]), 1, SCREEN_WIDTH, SCREEN_HEIGHT);

  // if ShowLog then
  // DisplayErrors;
  if WireFrame then
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
end;

procedure ChangeGamma(var color: array of byte; factor: single);
var
  i, j: integer;
  scale, r, g, b: single;
begin
  scale := 1;
  // extract the current RGB values
  r := color[0];
  g := color[1];
  b := color[2];

  // Multiply the factor by the RGB values, while keeping it to a 255 ratio
  r := r * factor / 255.0;
  g := g * factor / 255.0;
  b := b * factor / 255.0;

  // Check if the the values went past the highest value
  if (r > 1.0) and ((1.0 / r) < scale) then
    scale := (1.0 / r);
  if (g > 1.0) and ((1.0 / g) < scale) then
    scale := (1.0 / g);
  if (b > 1.0) and ((1.0 / b) < scale) then
    scale := (1.0 / b);

  // Get the scale for this pixel and multiply it by our pixel values
  scale := scale * 255.0;
  r := r * scale;
  g := g * scale;
  b := b * scale;

  // Assign the new gamma'nized RGB values to our image
  color[0] := trunc(r);
  color[1] := trunc(g);
  color[2] := trunc(b);
end;

procedure TQuake3BSP.ChangeGammaLightmap(var pImage: TBSPLightmap;
  const Width, height: integer; factor: glFloat);
var
  i, j: integer;
  scale, r, g, b: single;
begin
  // Go through every pixel in the lightmap
  for i := 0 to Width - 1 do
    for j := 0 to Width - 1 do
    begin
      scale := 1;
      // temp := 0;
      // extract the current RGB values
      r := pImage.imageBits[i, j, 0];
      g := pImage.imageBits[i, j, 1];
      b := pImage.imageBits[i, j, 2];

      // Multiply the factor by the RGB values, while keeping it to a 255 ratio
      r := r * factor / 255.0;
      g := g * factor / 255.0;
      b := b * factor / 255.0;

      // Check if the the values went past the highest value
      if (r > 1.0) and ((1.0 / r) < scale) then
        scale := (1.0 / r);
      if (g > 1.0) and ((1.0 / g) < scale) then
        scale := (1.0 / g);
      if (b > 1.0) and ((1.0 / b) < scale) then
        scale := (1.0 / b);

      // Get the scale for this pixel and multiply it by our pixel values
      scale := scale * 255.0;
      r := r * scale;
      g := g * scale;
      b := b * scale;

      // Assign the new gamma'nized RGB values to our image
      pImage.imageBits[i, j, 0] := trunc(r);
      pImage.imageBits[i, j, 1] := trunc(g);
      pImage.imageBits[i, j, 2] := trunc(b);
    end;
end;

Procedure TQuake3BSP.CreateLightmapTexture(var texture: GLUINT;
  pImageBits: TBSPLightmap; Width, height: integer);
begin
  // Generate a texture with the associative texture ID stored in the array
  glGenTextures(1, @texture);
  // This sets the alignment requirements for the start of each pixel row in memory.
  glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
  // Bind the texture to the texture arrays index and init the texture
  glBindTexture(GL_TEXTURE_2D, texture);
  // Change the lightmap gamma values by our desired gamma
  ChangeGammaLightmap(pImageBits, Width, height, Gamma);

  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

  // Assign the mip map levels
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER,
    GL_LINEAR_MIPMAP_LINEAR);

  // Build Mipmaps (builds different versions of the picture for distances - looks better)
  gluBuild2DMipmaps(GL_TEXTURE_2D, GL_RGB, Width, height, GL_RGB,
    GL_UNSIGNED_BYTE, @pImageBits);

end;

// Movement clipping
function TQuake3BSP.checkMove(sp, ep, extent: TVector3f): TBSPMove;
var
  MoveMove: TBSPMove;
begin
  // moveMove.BBsize := extent;//ScaleVector(extent, 1.5);
  MoveMove.brush := -1; //
  MoveMove.extents := extent;
  MoveMove.startPoint := sp;
  MoveMove.EndPoint := ep;
  MoveMove.Normal.X := 0;
  MoveMove.Normal.Y := 0;
  MoveMove.Normal.Z := 0;
  MoveMove.fraction := 1;
  MoveMove.leafIndex := -1;
  // If nothing is hit, full movement by defaultmoveMove.fraction = 1;
  MoveMove.allSolid := false;

  checkMoveNode(0, 1, sp, ep, 0, MoveMove);

  // Calculate final coordinates
  if MoveMove.fraction <> 1 then
  begin
    MoveMove.EndPoint.X := sp.X + (ep.X - sp.X) * MoveMove.fraction;
    MoveMove.EndPoint.Y := sp.Y + (ep.Y - sp.Y) * MoveMove.fraction;
    MoveMove.EndPoint.Z := sp.Z + (ep.Z - sp.Z) * MoveMove.fraction;
  end;
  result := MoveMove;
end;

procedure TQuake3BSP.checkMoveNode(sf, ef: single; sp, ep: TVector3f;
  node: integer; var Move: TBSPMove);
var
  t1, t2: single;
  plane: TBSPPlane;
  offset: single;
  idist, frac, frac2, midf: single;
  midP: TVector3f;
  isFront: boolean;
begin
  // If the path was blocked by a nearer obstacle, don't bother checking
  if (Move.fraction <= sf) then
    exit;
  // We found a leaf, check the whole path against its brushes
  if (node < 0) then
  begin
    checkMoveLeaf(-(node + 1), Move);
    exit;
  end;

  plane := Planes[Nodes[node].plane];

  t1 := planeDistance(sp, plane.Normal, plane.d); // startDistance
  t2 := planeDistance(ep, plane.Normal, plane.d); // endDistance

  // offset := abs(Move.BBsize.x*plane.normal.x) + abs(Move.BBsize.y*plane.normal.y) + abs(Move.BBsize.z*plane.normal.z);
  // abs nicht vergessen, wegen negative plane.normal-Werte
  offset := abs(Move.extents.X * plane.Normal.X) +
    abs(Move.extents.Y * plane.Normal.Y) + abs(Move.extents.Z * plane.Normal.Z);

  // The whole volume is in front of the plane
  if ((t1 >= offset) and (t2 >= offset)) then
  begin
    checkMoveNode(sf, ef, sp, ep, Nodes[node].front, Move);
    exit;
  end;

  // The whole volume is in the back of the plane
  if ((t1 < -offset) and (t2 < -offset)) then
  begin
    checkMoveNode(sf, ef, sp, ep, Nodes[node].back, Move);
    exit;
  end;

  // Else, the box is split. Check the two halves.
  if (t1 < t2) then
  begin
    isFront := false;
    idist := 1.0 / (t1 - t2);
    frac := (t1 - offset - DIST_EPSILON) * idist;
    frac2 := (t1 + offset + DIST_EPSILON) * idist;
  end
  else if (t1 > t2) then
  begin
    isFront := true;
    idist := 1.0 / (t1 - t2);
    frac := (t1 + offset + DIST_EPSILON) * idist;
    frac2 := (t1 - offset - DIST_EPSILON) * idist;
  end
  else
  begin
    isFront := true;
    frac := 1;
    frac2 := 0;
  end;

  // Move from start to the plane
  if (frac < 0) then
    frac := 0;
  if (frac > 1) then
    frac := 1;

  midf := sf + (ef - sf) * frac;
  midP.X := sp.X + (ep.X - sp.X) * frac;
  midP.Y := sp.Y + (ep.Y - sp.Y) * frac;
  midP.Z := sp.Z + (ep.Z - sp.Z) * frac;

  if isFront then
    checkMoveNode(sf, midf, sp, midP, Nodes[node].front, Move)
  else
    checkMoveNode(sf, midf, sp, midP, Nodes[node].back, Move);

  // Move from the plane to the end
  if (frac2 < 0) then
    frac2 := 0;
  if (frac2 > 1) then
    frac2 := 1;

  midf := sf + (ef - sf) * frac2;
  midP.X := sp.X + (ep.X - sp.X) * frac2;
  midP.Y := sp.Y + (ep.Y - sp.Y) * frac2;
  midP.Z := sp.Z + (ep.Z - sp.Z) * frac2;
  if isFront then
    checkMoveNode(midf, ef, midP, ep, Nodes[node].back, Move)
  else
    checkMoveNode(midf, ef, midP, ep, Nodes[node].front, Move);
end;

procedure TQuake3BSP.checkMoveLeaf(leafIndex: integer; var Move: TBSPMove);
var
  bb, bc, bi: integer;
  brush: TBSPBrush;
  sb, sc: integer;
  enterf, exitf: single;
  startOut, endOut, fullOut: boolean;
  hitNormal: TVector3f;
  pi: integer;
  plane: TBSPPlane;
  ofs: TVector3f;
  dist, d1, d2: single;
  f: single;
begin
  bb := Leafs[leafIndex].leafBrush;
  bc := Leafs[leafIndex].numOfLeafBrushes;

  while (bc > 0) do
  begin
    dec(bc);
    bi := Leafbrushes[bb + bc];
    brush := Brushes[bi];

    if (TextureInfo[brush.texture].contents and MASK_PLAYERSOLID) = 0 then
    // MASK_PLAYERSOLID then
      continue;

    if (brush.numOfBrushSides = 0) then
      continue;

    sb := brush.brushside;
    sc := brush.numOfBrushSides;

    enterf := -1;
    exitf := 1;

    startOut := false;
    endOut := false;
    fullOut := false;

    while (sc > 0) do
    begin
      dec(sc);

      pi := BrushSides[sb + sc].plane;
      plane := Planes[pi];

      // Calculate distances, taking the bounding box dimensions into account
      ofs := ScaleVector(Move.extents, -1);
      // ofs := InvertVector(move.BBsize);
      if (plane.Normal.X < 0) then
        ofs.X := -ofs.X;

      if (plane.Normal.Y < 0) then
        ofs.Y := -ofs.Y;

      if (plane.Normal.Z < 0) then
        ofs.Z := -ofs.Z;

      dist := plane.d - DotProduct(ofs, plane.Normal);
      d1 := DotProduct(Move.startPoint, plane.Normal) - dist;
      d2 := DotProduct(Move.EndPoint, plane.Normal) - dist;

      if (d1 >= -DIST_EPSILON) then
        startOut := true;
      if (d2 >= -DIST_EPSILON) then
        endOut := true;

      if (d2 > 0) then
        endOut := true;
      if (d1 > 0) then
        startOut := true;

      // Both in front of face : outside this brush
      if ((d1 > 0) AND (d2 >= d1)) then
      begin
        fullOut := true;
        break;
      end;

      // Both behind the face : will get clipped by another plane
      if ((d1 <= 0) AND (d2 <= 0)) then
        continue;

      // float f;
      if (d1 > d2) then
      begin // Entering the brush
        f := (d1 - DIST_EPSILON) / (d1 - d2);
        if (f > enterf) then
        begin
          enterf := f;
          hitNormal := plane.Normal;
        end;
      end
      else
      begin
        f := (d1 + DIST_EPSILON) / (d1 - d2);
        if (f < exitf) then
          exitf := f;
      end;
    end; // while sc

    if (not fullOut) then
    begin
      if ((not startOut) and (not endOut)) then
      begin
        Move.fraction := 0;
        // move.leafIndex := leafIndex;
        nextLeaf := leafIndex;
        Move.allSolid := true;
        Move.brush := bi;
        Move.Normal := hitNormal;
        exit;
      end;

      if (enterf < exitf) then
      begin
        if (enterf > -1) and (enterf < Move.fraction) then
        begin
          if (enterf < 0) then
            enterf := 0;
          Move.fraction := enterf;
          Move.Normal := hitNormal;
          Move.brush := bi;
        end;
      end;
    end;

    // Already fully blocked
    if (Move.fraction = 0) then
      exit;

  end; // while bc
end;

// Walk through the leaf and sort the faces
procedure TQuake3BSP.WalkLeaf(leafIndex: integer; sort: boolean);
var
  faceCount, FaceIndex, shaderId, FogShader: integer;
  distance: single;
  facePoint: TVector3f;
  texInfo: TBSPTextureInfo;
  i: integer;
  y1, y2: single;
begin
  FogShader := -1;
  for faceCount := 0 to Leafs[leafIndex].numOfLeafFaces - 1 do
  begin
    FaceIndex := LeafFaces[Leafs[leafIndex].leafface + faceCount];
    if IsModelFace[FaceIndex] then
      continue;

    if sort then
    begin
      facePoint.X := CenterPoints[FaceIndex].X - Camera.Position.X;
      facePoint.Y := CenterPoints[FaceIndex].Y - Camera.Position.Y;
      facePoint.Z := CenterPoints[FaceIndex].Z - Camera.Position.Z;
      distance := sqrt(facePoint.X * facePoint.X + facePoint.Y * facePoint.Y +
        facePoint.Z * facePoint.Z);
      if distance < 0 then
        distance := abs(distance);
    end
    else
      distance := 0;

    if not FacesDrawn[FaceIndex] then
    begin

      shaderId := TextureInfo[Faces[FaceIndex].TextureId].shaderId;
      if shaderId > -1 then
      begin
        (* if shaderManager[shaderId].hasFog then begin
          //currentFog := shaderId;  // remember fog
          continue; // fog faces are invisible
          end;
        *)
        if (ShaderManager[shaderId].surface and 2048) = 2048 then
          continue; // nodraw

        if ShaderManager[shaderId].IsSkyBox then
        begin
          skyboxRequired := true;
          continue;
        end;

        if (ShaderManager[shaderId].Cull = GL_NONE) or
          (ShaderManager[shaderId].TotallyTrans) or
          (ShaderManager[shaderId].hasFog) then
        begin
          TransparentFaces[numTransparent].FaceIndex := FaceIndex;
          TransparentFaces[numTransparent].distance := distance;
          inc(numTransparent);
        end
        else
        begin
          AdditiveFaces[numAdditive].FaceIndex := FaceIndex;
          AdditiveFaces[numAdditive].distance := distance;
          inc(numAdditive);
        end;
      end
      else
      begin
        { id := Faces[faceIndex].textureID;
          if id > 0 then begin
          texInfo := TextureInfo[Faces[faceIndex].textureID];
          if (texInfo.contents and CONTENTS_FOG) = CONTENTS_FOG then begin
          currentFog := currentFog;
          end;
          end; }
        SolidFaces[numSolid].FaceIndex := FaceIndex;
        SolidFaces[numSolid].distance := distance;
        inc(numSolid);
      end;

      FacesDrawn[FaceIndex] := true;
      inc(VisibleTriangles, Faces[FaceIndex].numMeshVerts div 3);
    end;
  end; // faceCount
end;

procedure TQuake3BSP.SetDefaults;
begin
  glDepthFunc(GL_LEQUAL);
  glEnable(GL_DEPTH_TEST);
  glDisable(GL_ALPHA_TEST);
  glDepthMask(1);
  glDisable(GL_BLEND);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

  // glDisable(GL_COLOR);
  if MultiTexture then
  begin
    glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisableClientState(GL_COLOR_ARRAY);
    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisableClientState(GL_COLOR_ARRAY);
  glColor3ub(255, 255, 255);
  glCullFace(GL_FRONT);
  glEnable(GL_CULL_FACE);
end;

procedure TQuake3BSP.SetVertexCoords(shaderId, numOfVerts: integer);
var
  shader: TShader;
  i, j, nv: integer;
  args: TWaveFunc;
  startoff, off, wavesize, inc: single;
  p, v, middle, d, h: TVector3f;
  st: TVector2f;
const
  speed = 2.0;
begin
  shader := FShaderManager[shaderId];
  if shader.numOfDeformVertexes > 0 then
  begin
    startoff := 0;
    wavesize := 1;
    for i := 0 to shader.numOfDeformVertexes - 1 do
    begin
      case shader.DeformVertexes[i].deformType of
        DEFORMVERTEXES_WAVE:
          begin
            args.func := enWave(trunc(shader.DeformVertexes[i].Values[1]));
            args.base := shader.DeformVertexes[i].Values[2];
            args.amp := shader.DeformVertexes[i].Values[3];
            wavesize := shader.DeformVertexes[i].Values[0];
            startoff := shader.DeformVertexes[i].Values[4];
            args.freq := shader.DeformVertexes[i].Values[5];
            nv := numOfVerts;
            for j := 0 to numOfVerts - 1 do
            begin
              v := inputBuffer[j].Normal;
              p := inputBuffer[j].Position; // buffer it
              off := (p.X + p.Y + p.Z) / wavesize;
              args.phase := startoff + off;
              inc := Eval(args);
              inputBuffer[j].Position.X := p.X + inc * v.X;
              inputBuffer[j].Position.Y := p.Y + inc * v.Y;
              inputBuffer[j].Position.Z := p.Z + inc * v.Z;
            end;
          end;
        DEFORMVERTEXES_NORMAL:
          begin
            args.func := enWave(trunc(shader.DeformVertexes[i].Values[1]));
            args.base := shader.DeformVertexes[i].Values[2];
            args.amp := shader.DeformVertexes[i].Values[3];
            args.freq := shader.DeformVertexes[i].Values[4];
            nv := numOfVerts;
            for j := 0 to numOfVerts - 1 do
            begin
              v := inputBuffer[j].Normal;
              p := inputBuffer[j].Position; // buffer it
              off := (p.X + p.Y + p.Z) / (speed * wavesize);
              args.phase := startoff + off;
              inc := Eval(args);
              inputBuffer[j].Normal.X := p.X + inc * v.X;
              inputBuffer[j].Normal.Y := p.Y + inc * v.Y;
              inputBuffer[j].Normal.Z := p.Z + inc * v.Z;
            end;
          end;
        DEFORMVERTEXES_MOVE:
          begin
            args.func := enWave(trunc(shader.DeformVertexes[i].Values[3]));
            args.base := shader.DeformVertexes[i].Values[4];
            args.amp := shader.DeformVertexes[i].Values[5];
            args.phase := shader.DeformVertexes[i].Values[6];
            args.freq := shader.DeformVertexes[i].Values[7];
            for j := 0 to numOfVerts - 1 do
            begin
              inc := Eval(args);
              inputBuffer[j].Position.X := inputBuffer[j].Position.X + inc *
                shader.DeformVertexes[i].Values[0];
              inputBuffer[j].Position.Y := inputBuffer[j].Position.Y + inc *
                shader.DeformVertexes[i].Values[1];
              inputBuffer[j].Position.Z := inputBuffer[j].Position.Z + inc *
                shader.DeformVertexes[i].Values[2];
            end;
          end;
        DEFORMVERTEXES_AUTOSPRITE:
          begin
            (*
              glGetFloatv(GL_MODELVIEW_MATRIX, @cam_mat);
              right := Make3DVector_f(cam_mat[0], cam_mat[4], cam_mat[8]);
              up := Make3DVector_f(cam_mat[1], cam_mat[5], cam_mat[9]);
              right := vec_normalize(right);
              up := vec_normalize(up);
              middle := Make3DVector_f(0,0,0);
              // Compute middle of quad
              for j := 0 to numOfVerts-1 do begin
              middle.X := middle.X + inputBuffer[j].position.x;
              middle.Y := middle.Y + inputBuffer[j].position.y;
              middle.Z := middle.Z + inputBuffer[j].position.z;
              end;
              middle := vec_scale(middle, 1/numOfVerts);
              //glColor3ub(255, 0, 0);
              //glPointSize(2);
              // middle point
              //glBegin(GL_POINTS);
              //  glVertex3f(middle.X, middle.y, middle.Z);
              //glEnd;
              //glPointSize(4);
              //glColor3ub(0, 0, 255);
              //glBegin(GL_POINTS);
              // world points
              for j := 0 to numOfVerts-1 do begin
              p.x := middle.X + (inputBuffer[j].Position.X - middle.x);
              p.y := middle.y + (inputBuffer[j].Position.y - middle.y);
              p.z := middle.z + (inputBuffer[j].Position.z - middle.z);
              //   glVertex3f(p.X, p.y, p.Z);
              end;
              //glEnd;
              //glPointSize(8);
              //glColor3ub(255, 255, 0);
              //glBegin(GL_POINTS);
              // billboard points
              for j := 0 to numOfVerts-1 do begin
              dx := (inputBuffer[j].Position.X - middle.x);
              dy := (inputBuffer[j].Position.y - middle.y);
              dz := (inputBuffer[j].Position.z - middle.z);
              {              if (dx < 0) or (dz < 0) then
              if (dx < 0) and (dz < 0) then
              dx := -Sqrt(dx*dx + dz*dz)
              else
              dx :=  Sqrt(dx*dx + dz*dz)
              else
              dx := Sqrt(dx*dx + dz*dz);}
              p := vec_add(vec_scale(up, dy), vec_scale(right, dx));
              p := vec_add(middle, p);
              //  glVertex3f(p.X, p.y, p.Z);
              inputBuffer[j].Position := p;
              end;
              //glEnd;
              //glColor3ub(255, 255, 255);
            *)
          end;
        DEFORMVERTEXES_BULGE:
          begin
            args.func := WF_SIN;
            args.base := 0;
            args.amp := shader.DeformVertexes[i].Values[1];
            args.freq := 1 / (speed * shader.DeformVertexes[i].Values[0]);
            nv := numOfVerts;
            for j := 0 to numOfVerts - 1 do
            begin
              st := inputBuffer[j].TextureCoord;
              v := inputBuffer[j].Normal;
              p := inputBuffer[j].Position; // buffer it
              args.phase := st.X * speed * shader.DeformVertexes[i].Values[2];
              inc := Eval(args);
              inputBuffer[j].Position.X := p.X + inc * v.X;
              inputBuffer[j].Position.Y := p.Y + inc * v.Y;
              inputBuffer[j].Position.Z := p.Z + inc * v.Z;
            end;
          end;
      end;
    end;
  end;
end;

procedure TQuake3BSP.SetVertexColors(shaderId, stageId, numOfVerts: integer);
var
  shader: TShader;
  i, j: integer;
  c: integer;
begin
  shader := FShaderManager[shaderId];
  for j := 0 to numOfVerts - 1 do
  begin
    colorBuffer[j, 0] := inputBuffer[j].color[0]; // red
    colorBuffer[j, 1] := inputBuffer[j].color[1]; // green
    colorBuffer[j, 2] := inputBuffer[j].color[2]; // blue
    colorBuffer[j, 3] := inputBuffer[j].color[3]; // gamma
  end;

  if shader.numOfLayers > 0 then
  begin
    if shader.Layers[stageId].numOfrgbGen > 0 then
    begin
      case shader.Layers[stageId].rgbGen[0].rgbGType of
        rgbGen_IdentityLightning:
          begin
            for j := 0 to numOfVerts - 1 do
            begin
              colorBuffer[j, 0] := 127; // red
              colorBuffer[j, 1] := 127; // green
              colorBuffer[j, 2] := 127; // blue
              colorBuffer[j, 3] := 255; // gamma
            end;
          end;
        rgbGen_Identity:
          begin
            for j := 0 to numOfVerts - 1 do
            begin
              colorBuffer[j, 0] := 255; // red
              colorBuffer[j, 1] := 255; // green
              colorBuffer[j, 2] := 255; // blue
              colorBuffer[j, 3] := 255; // gamma
            end;
          end;
        rgbGen_Wave:
          begin
            c := Round(255 * Eval(shader.Layers[stageId].rgbGen[0].Wave));
            if c < 0 then
              c := 0;
            if c > 255 then
              c := 255;
            for j := 0 to numOfVerts - 1 do
            begin
              colorBuffer[j, 0] := c; // red
              colorBuffer[j, 1] := c; // green
              colorBuffer[j, 2] := c; // blue
              colorBuffer[j, 3] := 255; // gamma
            end;
          end;
      else
        begin
          for j := 0 to numOfVerts - 1 do
          begin
            colorBuffer[j, 0] := inputBuffer[j].color[0]; // red
            colorBuffer[j, 1] := inputBuffer[j].color[1]; // green
            colorBuffer[j, 2] := inputBuffer[j].color[2]; // blue
            colorBuffer[j, 3] := inputBuffer[j].color[3]; // gamma
          end;
        end;
      end;
    end
    else
    begin
      // no rgbgen use vertex colors
      for j := 0 to numOfVerts - 1 do
      begin
        colorBuffer[j, 0] := inputBuffer[j].color[0]; // red
        colorBuffer[j, 1] := inputBuffer[j].color[1]; // green
        colorBuffer[j, 2] := inputBuffer[j].color[2]; // blue
        colorBuffer[j, 3] := inputBuffer[j].color[3]; // gamma
      end;
    end;
  end;
end;

{ ****************************************************************************** }
{ TQuake3BSP - Prepares all texture coordinates
  {****************************************************************************** }

procedure TQuake3BSP.SetTextureCoordinates(shaderId, stageId,
  numOfVerts: integer);
var
  i, j: integer;
  shader: TShader;
  dir: TVector3f;
  // tcmod
  angulo, cost, sint, factor: single;
  v, scroll: TVector2f;
  v2: TVector3f;
  now: single;
  frame: integer;
begin
  shader := FShaderManager[shaderId];
  (* for j := 0 to numOfVerts-1 do
    texCoordBuffer[j] := inputBuffer[j].TextureCoord;
  *)
  if shader.numOfLayers > 0 then
  begin
    // Animation
    if shader.Layers[stageId].animFreq <> 0 then
    begin
      frame := trunc(gTimer.TotalTime * shader.Layers[stageId].animFreq)
        mod shader.Layers[stageId].numOfTextures;
      if frame >= shader.Layers[stageId].numOfTextures then
        frame := 0;
      shader.Layers[stageId].curTexture := frame;
    end
    else
      shader.Layers[stageId].curTexture := 0;
    // tcGen  ******************************************************************
    case shader.Layers[stageId].tcGen of
      TCGEN_LIGHTMAP:
        begin
          for j := 0 to numOfVerts - 1 do
            texCoordBuffer[j] := inputBuffer[j].LightmapCoord;
        end;
      TCGEN_ENVIRONMENT:
        begin
          // wrong calc !!!!
          for j := 0 to numOfVerts - 1 do
          begin
            dir := SubtractVector(inputBuffer[j].Position, Camera.Position);
            // vec_sub(inputBuffer[j].Position, Camera.Position);
            // dir := Normalize(dir);//vec_normalize(dir);
            Normalize(dir);
            { dir.x := dir.x + inputBuffer[j].Normal.X;
              dir.y := dir.y + inputBuffer[j].Normal.Y;
              texCoordBuffer[j].X := dir.x;
              texCoordBuffer[j].Y := dir.y; }
            dir.X := dir.X + inputBuffer[j].Normal.X;
            dir.Z := dir.Z + inputBuffer[j].Normal.Z;
            texCoordBuffer[j].X := dir.X;
            texCoordBuffer[j].Y := dir.Z;

          end;

        end;
    else
      for j := 0 to numOfVerts - 1 do
        texCoordBuffer[j] := inputBuffer[j].TextureCoord;
    end;

    // tcMod *******************************************************************
    if shader.Layers[stageId].numOftcMods > 0 then
    begin
      for i := 0 to numOfVerts - 1 do
      begin
        for j := 0 to shader.Layers[stageId].numOftcMods - 1 do
        begin
          case shader.Layers[stageId].tcMods[j].modType of
            TCMOD_ROTATE:
              begin
                angulo := shader.Layers[stageId].tcMods[j].Values[0] *
                  gTimer.TotalTime / M_180_PI;
                cost := cos(angulo);
                sint := sin(angulo);
                v := texCoordBuffer[i];
                v.X := v.X - 0.5;
                v.Y := v.Y + 0.5;
                texCoordBuffer[i].X := v.X * cost - v.Y * sint + 0.5;
                texCoordBuffer[i].Y := v.X * sint + v.Y * cost + 0.5;
              end;
            TCMOD_SCALE:
              begin
                texCoordBuffer[i].X := (texCoordBuffer[i].X - 0.5) *
                  shader.Layers[stageId].tcMods[j].Values[0] + 0.5;
                texCoordBuffer[i].Y := (texCoordBuffer[i].Y - 0.5) *
                  shader.Layers[stageId].tcMods[j].Values[1] + 0.5;
              end;
            TCMOD_SCROLL:
              begin
                scroll.X := shader.Layers[stageId].tcMods[j].Values[0] *
                  gTimer.TotalTime;
                scroll.Y := shader.Layers[stageId].tcMods[j].Values[1] *
                  gTimer.TotalTime;
                texCoordBuffer[i].X := texCoordBuffer[i].X + scroll.X;
                texCoordBuffer[i].Y := texCoordBuffer[i].Y - scroll.Y;
              end;
            TCMOD_STRETCH:
              begin
                factor := (1 / Eval(shader.Layers[stageId].tcMods[j].Wave));
                texCoordBuffer[i].X := (texCoordBuffer[i].X - 0.5) *
                  factor + 0.5;
                texCoordBuffer[i].Y := (texCoordBuffer[i].Y - 0.5) *
                  factor + 0.5;
              end;
            TCMOD_TRANSFORM:
              begin
                v := texCoordBuffer[i];
                texCoordBuffer[i].X := v.X * shader.Layers[stageId].tcMods[j]
                  .Values[0] + v.Y * shader.Layers[stageId].tcMods[j].Values[2]
                  + shader.Layers[stageId].tcMods[j].Values[4];
                texCoordBuffer[i].Y := v.X * shader.Layers[stageId].tcMods[j]
                  .Values[1] + v.Y * shader.Layers[stageId].tcMods[j].Values[3]
                  + shader.Layers[stageId].tcMods[j].Values[5];
              end;
            TCMOD_TURB:
              begin
                // v2 := inputBuffer[i].Position;
                v2.X := texCoordBuffer[i].X;
                v2.Y := texCoordBuffer[i].Y;
                v2.Z := inputBuffer[i].Position.Z;
                texCoordBuffer[i].X := texCoordBuffer[i].X +
                  sin((v2.X + v2.Z) * 0.1 * shader.Layers[stageId].tcMods[j]
                  .Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods
                  [j].Values[2]) * shader.Layers[stageId].tcMods[j]
                  .Values[1] * 0.5;
                texCoordBuffer[i].Y := texCoordBuffer[i].Y +
                  sin((v2.Y) * 0.1 * shader.Layers[stageId].tcMods[j].Values[3]
                  + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values
                  [2]) * shader.Layers[stageId].tcMods[j].Values[1] * 0.5;

                // v := texCoordBuffer[i];
                // texCoordBuffer[i].x := texCoordBuffer[i].x + Sin((v.x     )*0.1*shader.Layers[stageId].tcMods[j].Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values[2])*shader.Layers[stageId].tcMods[j].Values[1]*0.5;
                // texCoordBuffer[i].y := texCoordBuffer[i].y + Sin((v.y     )*0.1*shader.Layers[stageId].tcMods[j].Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values[2])*shader.Layers[stageId].tcMods[j].Values[1]*0.5;
              end;
          end;
        end;
      end;
    end;
  end;
end;

(*
  procedure TQuake3BSP.AddError(msg : string);
  begin
  FErrorList.Add(msg);
  end;

  procedure TQuake3BSP.DisplayErrors;
  var i, min, max : integer;
  begin
  if FErrorList.Count > 0 then begin
  //MessageBeep(0);
  if FErrorList.Count > 20 then begin
  max := FErrorList.Count-1;
  min := FErrorList.Count-21;
  end
  else begin
  min := 0;
  max := FErrorList.Count-1;
  end;
  for i := min to max do
  fnt.Draw(5, SCREEN_HEIGHT-((i-min)*20), FErrorList[i], 3, SCREEN_WIDTH, SCREEN_HEIGHT);
  end;

  end;
*)

procedure TQuake3BSP.SetFogColor(FaceIndex, planeIndex, numOfVerts: integer;
  red, green, blue, distanceToOpaque: single);
var
  FogPoint, vertex: TVector3f;
  distance, Gamma, pd: single;
  i: integer;
  face: PBSPFace;
  // plane : PBSPPlane;
begin
  try
    face := @Faces[FaceIndex];
    // Plane := @Planes[planeIndex];
    for i := 0 to Faces[FaceIndex].numOfVerts - 1 do
    begin
      colorBuffer[i, 0] := trunc(255 * red);
      colorBuffer[i, 1] := trunc(255 * green);
      colorBuffer[i, 2] := trunc(255 * blue);
      FogPoint := inputBuffer[i].Position;
      // Annahme: wenn die distance zur Fogplane 0 ist, immer auf transparent setzen
      // pd := PlaneDistance(FogPoint, plane.Normal, plane.d);
      // if pd = 0 then
      // gamma := 1;

      FogPoint.X := FogPoint.X - Camera.Position.X;
      FogPoint.Y := FogPoint.Y - Camera.Position.Y;
      FogPoint.Z := FogPoint.Z - Camera.Position.Z;
      // eye to point distance
      distance := sqrt(FogPoint.X * FogPoint.X + FogPoint.Y * FogPoint.Y +
        FogPoint.Z * FogPoint.Z);
      if distance >= distanceToOpaque then
        Gamma := 0
      else
        Gamma := 1 - (distance / distanceToOpaque);
      if Gamma < 0.1 then
        Gamma := 0.1;
      colorBuffer[i, 3] := trunc(255 * Gamma); // opaque = 0
    end;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    // if DumpErrors then AddError('RenderSurfaceShader ' + lastErrorString);
  end;
end;

procedure TQuake3BSP.RenderFog(FaceIndex, shaderId, planeId: integer);
var
  face: PBSPFace;
  shader: TShader;
begin
  try
    face := @Faces[FaceIndex];

    shader := ShaderManager.Items[shaderId];
    if GL_ARB_multitexture then
      glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisable(GL_TEXTURE_2D);

    if GL_ARB_multitexture then
      glActiveTextureARB(GL_TEXTURE0_ARB);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);

    glDisable(GL_TEXTURE_2D);

    glDepthMask(byte(true));
    glEnable(GL_BLEND);
    glBlendFunc(GL_ONE_MINUS_SRC_ALPHA, GL_SRC_ALPHA);

    // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
    Move(Vertices[face.startVertIndex], inputBuffer,
      face.numOfVerts * Sizeof(TBSPVertex));
    glVertexPointer(3, GL_FLOAT, Sizeof(TBSPVertex), @inputBuffer[0].Position);

    SetFogColor(FaceIndex, planeId, face.numOfVerts, shader.Fog.red,
      shader.Fog.green, shader.Fog.blue, shader.Fog.distance);
    glColorPointer(4, GL_UNSIGNED_BYTE, 4, @colorBuffer[0]);
    glEnableClientState(GL_COLOR_ARRAY);
    // default = vertex, tex1+tex2, no color
    // glDrawArrays(GL_TRIANGLE_FAN, 0, Face.numOfVerts);
    glDrawElements(GL_TRIANGLES, face.numMeshVerts, GL_UNSIGNED_INT,
      @MeshVertices[face.meshVertIndex]);

    // restore rendering state
    glEnable(GL_TEXTURE_2D);
    glDisable(GL_BLEND);

    if MultiTexture then
    begin
      glActiveTextureARB(GL_TEXTURE1_ARB);
      glEnableClientState(GL_TEXTURE_COORD_ARRAY);
      glEnable(GL_TEXTURE_2D);
      glActiveTextureARB(GL_TEXTURE0_ARB);
    end;
    if GL_ARB_multitexture then
      glClientActiveTextureARB(GL_TEXTURE0_ARB);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glDisableClientState(GL_COLOR_ARRAY);
    SetDefaults;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    // if DumpErrors then AddError('RenderSurfaceShader ' + lastErrorString);
  end;
end;

procedure TQuake3BSP.SwapBoundingBoxFloat(var min, max: TVector3f);
var
  temp: single;
begin
  // Swap the min y and z values, then negate the new Z
  temp := min.Y;
  min.Y := min.Z;
  min.Z := -temp;
  // Swap the max y and z values, then negate the new Z
  temp := max.Y;
  max.Y := max.Z;
  max.Z := -temp;
  // swap min/max if necessary
  if min.Y > max.Y then
  begin
    temp := min.Y;
    min.Y := max.Y;
    max.Y := temp;
  end;
  if min.Z > max.Z then
  begin
    temp := min.Z;
    min.Z := max.Z;
    max.Z := temp;
  end;
end;

procedure TQuake3BSP.SwapBoundingBoxInteger(var min, max: TVector3i);
var
  temp: integer;
begin
  // Swap the min y and z values, then negate the new Z
  temp := min.Y;
  min.Y := min.Z;
  min.Z := -temp;
  // Swap the max y and z values, then negate the new Z
  temp := max.Y;
  max.Y := max.Z;
  max.Z := -temp;
  // swap min/max if necessary
  if min.Y > max.Y then
  begin
    temp := min.Y;
    min.Y := max.Y;
    max.Y := temp;
  end;
  if min.Z > max.Z then
  begin
    temp := min.Z;
    min.Z := max.Z;
    max.Z := temp;
  end;
end;

function TQuake3BSP.GetSurfaceType(brushIndex: integer): string;
var
  texId: integer;
begin
  result := '';
  texId := Brushes[brushIndex].texture;
  if (fileTextures[texId].flags and SURF_METALSTEPS) = SURF_METALSTEPS then
    result := 'METAL'
  else
    result := 'NORMAL';
  (* if (fileTextures[texId].contents and CONTENTS_WATER) = CONTENTS_WATER then
    result := 'WATER';
  *)
end;

end.
