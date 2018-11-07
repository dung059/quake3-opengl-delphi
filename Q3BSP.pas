unit Q3BSP;

interface

uses OpenGL12, Windows, Frustum, classes, Dialogs, math3d, q3shaders,  q3types, q3SkyBox, cam;

procedure ChangeGamma(var color : array of byte; factor : single);

type
  TBSPFaceSort = record
    FaceIndex : integer;
    distance  : single;
  end;

var
  numSolid,
  numAdditive,
  numTransparent : integer;
  SolidFaces, AdditiveFaces, TransparentFaces : array of TBSPFaceSort;


// This is our Quake3 BSP class
type TQuake3BSP = class(TObject)
  private
//    FErrorList : TStringList;
    FShaderManager : TShaderManager;
    FSkyBox : TSkyBox;
    FPath : string;
    numOfVerts     : integer;             // The number of verts in the model
    numOfFaces     : integer;             // The number of faces in the model
    numOfTextures  : integer;             // The number of texture maps
    numOfLightmaps : integer;             // The number of light maps
    numOfNodes     : integer;             // The number of nodes
    numOfLeafs     : integer;             // The number of leafes
    numOfLeafFaces : integer;             // The number of leaf faces
    numOfPlanes    : integer;             // The number of planes
    numOfMeshVerts  : integer;            // The number of mesh verts
    numOfModels    : integer;             // The number of Models
    numOfBrushes    : integer;            // The number of brushes
    numOfBrushSides : integer;            // The number of brushsides
    numOfLeafBrushes: integer;            // The number of leaf brushes
    numOfEffects    : integer;            // The number of effects
    numOfFogVolumes : integer;
    MeshVertices    : array of integer;   // The objects mesh vertices
    Vertices       : array of TBSPVertex; // The object's vertices
    Faces          : array of TBSPFace;   // The faces information of the object
    EntityList        : TStringList;            // All the Entities of the level
    Nodes          : array of TBSPNode;
    Leafs          : array of TBSPLeaf;
    Planes         : array of TBSPPlane;
    LeafFaces      : array of integer;
    Models         : array of TBSPModel;
    Effects        : array of TBSPEffect;
    clusters       : TBSPVisData;
    FacesDrawn     : array of boolean;	  // The bitset for the faces that have/haven't been drawn
    TextureInfo    : array of TBSPTextureInfo;
    Brushes         : array of TBSPBrush;         // The Brushes of the BSP
    BrushSides      : array of TBSPBrushSide;     // The Brush Sides of the BSP
    Leafbrushes     : array of integer;           // The bruhes of the leafs
    Lightmaps : array of GLUINT;                  // The texture and lightmap array for the level
    fogVolumes : array of TBSPBoundingBox;
    CenterPoints : array of TVector3f;            // Used for depth sort of shaded surfaces
    IsModelFace : array of boolean;
    fileTextures : array of TQ3FileTexture; // local only !!!!

    // Position data from entity list
    numOfPositions : integer;
    Positions : array of TBSPPosition;
    curPosition : integer;
    skyboxRequired : boolean;

    procedure SetPositions(l : TStringList);
    procedure SetWorldSpawn(l : TStringList);
    procedure SetSoundEmitters(l : TStringList);

    procedure SwapBoundingBoxFloat(var min, max : TVector3f);
    procedure SwapBoundingBoxInteger(var min, max : TVector3i);
    procedure RenderSkybox;
    procedure RenderFog(faceIndex, shaderId, planeId : integer);
    procedure RenderSurfaceShader(faceIndex, shaderId: integer);
    procedure RenderSurface(faceIndex : integer);

    procedure PrepareQuadricPatch(faceIndex : integer);
    function  CalcQuadricPatch(controlPoints : array of TBSPVertex; VertexOffset, IndexOffset, pointOffset : integer) : boolean;

    procedure ChangeGammaLightmap(var pImage:TBSPLightmap;const Width,height:integer; factor: glFloat);
    procedure CreateLightmapTexture(var texture: GLUINT; pImageBits:TBSPLightmap; width,height:integer);
    function  IsClusterVisible(current, test : integer) : integer;
    procedure LoadEntities(var f:file;Lump:TBSPLump);
    procedure BindTextures(texId, lmId : integer);
    procedure WalkLeaf(leafIndex : integer; sort : boolean);
    procedure SetDefaults;
    procedure CalcFogBuffer(faceIndex : integer; distance : single);
    procedure SetVertexCoords(shaderId, numOfVerts : integer);
    procedure SetVertexColors(shaderId, stageId, numOfVerts : integer);
    procedure SetTextureCoordinates(shaderId, stageId, numOfVerts : integer);
    procedure SetFogColor(faceIndex, planeIndex, numOfVerts : integer; red, green, blue, distanceToOpaque : single);
  public
    skyboxShader : integer;
    Camera : TCamera;

    constructor Create;
    destructor Destroy; override;

//    procedure AddError(msg : string);
//    procedure DisplayErrors;
    function  PlayerPosition : TBSPPosition; // position of the player
    function  FindLeaf(vPos : TVector3f) : integer;
    function  LoadBSP(const Folder, FileName : String) : Boolean;
    procedure RenderBSP(const Pos : TVector3f; leafIndex : integer);
    function  checkMove(sp, ep, extent : TVector3f) : TBSPMove;
    procedure checkMoveNode(sf, ef : single; sp, ep : TVector3f; node : integer; var Move : TBSPMove);
    procedure checkMoveLeaf(leafIndex : integer; var Move : TBSPMove);
    function GetSurfaceType(brushIndex : integer) : string;

    property  ShaderManager : TShaderManager read FShaderManager write FShaderManager;
    property  CurrentPosition : integer read CurPosition;
    property  PositionCount : integer read numOfPositions;
    property  SkyBox : TSkybox read FSkybox;
end;

implementation

uses SysUtils, Textures, Global, q3timer, qsortunit, fmod, fmodtypes, fmoderrors, StrUtils;

var fogBuffer : array of single;
    inputBuffer : array[0..16383] of TBSPVertex;
    texCoordBuffer :  array[0..16383] of TVector2f;
    colorBuffer : array[0..16383] of TRGBA;


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
var s: TBSPFaceSort;
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
var s: TBSPFaceSort;
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
var s: TBSPFaceSort;
begin
  s := AdditiveFaces[e1];
  AdditiveFaces[e1] := AdditiveFaces[e2];
  AdditiveFaces[e2] := s;
end;

function VertexAdd(v1, v2 : TBSPVertex) : TBSPVertex;
var tmp : TBSPVertex;
    norm : TVector3f;
begin
  tmp.Position.X := v1.Position.X + v2.Position.X;
  tmp.Position.Y := v1.Position.y + v2.Position.y;
  tmp.Position.Z := v1.Position.z + v2.Position.z;

  tmp.TextureCoord.X := v1.TextureCoord.X + v2.TextureCoord.x;
  tmp.TextureCoord.y := v1.TextureCoord.y + v2.TextureCoord.y;

  tmp.LightmapCoord.X := v1.LightmapCoord.x + v2.LightmapCoord.x;
  tmp.LightmapCoord.y := v1.LightmapCoord.y + v2.LightmapCoord.y;

  Norm.X := v1.Normal.X + v2.Normal.X;
  Norm.Y := v1.Normal.Y + v2.Normal.Y;
  Norm.Z := v1.Normal.Z + v2.Normal.Z;
  //Normalize(norm);
  tmp.Normal := Norm;
  result := tmp;
end;

function VertexScale(v1 : TBSPVertex; s: double) : TBSPVertex;
var tmp : TBSPVertex;
begin
  tmp.Position.X := v1.Position.X * s;
  tmp.Position.Y := v1.Position.y * s;
  tmp.Position.Z := v1.Position.z * s;

  tmp.TextureCoord.X := v1.TextureCoord.X * s;
  tmp.TextureCoord.y := v1.TextureCoord.y * s;

  tmp.LightmapCoord.X := v1.LightmapCoord.x * s;
  tmp.LightmapCoord.y := v1.LightmapCoord.y * s;

  tmp.Normal.X := v1.Normal.X*s;
  tmp.Normal.Y := v1.Normal.Y*s;
  tmp.Normal.Z := v1.Normal.Z*s;
  result := tmp;
end;

function TQuake3BSP.CalcQuadricPatch(controlPoints : array of TBSPVertex; VertexOffset, IndexOffset, pointOffset : integer) : boolean;
var px, py : double;
    temp : array[0..2] of TBSPVertex;
    v1, v2, v3, u1, u2, u3 : TBSPVertex;
    i, v, u, row, point, numOfIndices : integer;
begin
  result := false;

  for v :=0 to tesselation do begin // first row ???
    px := v / tesselation;
    v1 := VertexScale(controlPoints[0], ((1.0-px)*(1.0-px)));
    v2 := VertexScale(controlPoints[3], ((1.0-px)*px*2));
    v3 := VertexScale(controlPoints[6], (px*px));
    Vertices[VertexOffset+v] := VertexAdd(VertexAdd(v1, v2), v3);
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
      //verts[u*(tesselation+1)+v] := VertexAdd(VertexAdd(u1, u2), u3);
      Vertices[VertexOffset+u*(tesselation+1)+v] := VertexAdd(VertexAdd(u1, u2), u3);
    end; // v
  end; // u
  // new indices
  i := IndexOffset;
  for row :=0 to tesselation-1 do begin
    for point := 0 to tesselation-1 do begin
      MeshVertices[i+0] := pointOffset+row*(tesselation+1)+point;
      MeshVertices[i+1] := pointOffset+row*(tesselation+1)+point+1;
      MeshVertices[i+2] := pointOffset+(row+1)*(tesselation+1)+point;

      MeshVertices[i+3] := pointOffset+(row+1)*(tesselation+1)+point;
      MeshVertices[i+4] := pointOffset+row*(tesselation+1)+point+1;
      MeshVertices[i+5] := pointOffset+(row+1)*(tesselation+1)+point+1;
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
function StrToVector3f(s : string) : TVector3f;
var v : TVector3f;
    p,l : integer;
    tmp : string;
begin
  l := Length(s);
  if l > 0 then begin
    p := 1;
    tmp := '';
    while s[p] <> ' ' do begin
      tmp := tmp + s[p];
      inc(p);
    end;
    v.x := StrToInt(tmp);
    inc(p);

    tmp := '';
    while s[p] <> ' ' do begin
      tmp := tmp + s[p];
      inc(p);
    end;
    v.z := -StrToInt(tmp);
    inc(p);
    tmp := '';
    while p <= l do begin
      tmp := tmp + s[p];
      inc(p);
    end;
    v.y := StrToInt(tmp);
  end;
  result := v;
end;

{ TQuake3BSP }
constructor TQuake3BSP.Create;
begin
  inherited Create;

  skyboxShader   := -1;
  numOfVerts     := 0;
  numOfFaces     := 0;
  numOfTextures  := 0;
  numOfLightmaps := 0;
  numOfNodes	 := 0;
  numOfLeafs	 := 0;
  numOfLeafFaces := 0;
  numOfPlanes	 := 0;
  numOfModels    := 0;
  numOfEffects   := 0;
  numOfFogVolumes := 0;

  EntityList := TStringList.Create;
  FSkybox := TSkyBox.Create;
//  FErrorList := TStringList.Create;
end;

destructor TQuake3BSP.Destroy;
begin
//  FErrorList.Free;
  EntityList.Free;

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
//  SetLength(QuadricPatches, 0);
  SetLength(Models, 0);
  SetLength(Effects, 0);
  SetLength(fogVolumes, 0);

  SetLength(SolidFaces, 0);
  SetLength(TransparentFaces, 0);
  SetLength(AdditiveFaces, 0);

  inherited Destroy;
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

procedure TQuake3BSP.CalcFogBuffer(faceIndex : integer; distance : single);
var face : PBSPFace;
    i : integer;
    tmp : TVector3f;
    x, y, z : single;
begin
  face := @Faces[faceIndex];
  for i := 0 to face.numOfVerts-1 do begin
    tmp := SubtractVector(Camera.position, Vertices[face.startVertIndex+i].Position);
    x := Camera.position.x - Vertices[face.startVertIndex+i].Position.x;
    y := Camera.position.y - Vertices[face.startVertIndex+i].Position.y;
    z := Camera.position.z - Vertices[face.startVertIndex+i].Position.z;
    fogBuffer[face.startVertIndex+i] := 1700;//-640*-12-Vertices[face.startVertIndex+i].Position.y
  end;
end;

function TQuake3BSP.PlayerPosition : TBSPPosition;
begin
  if numOfPositions > 0 then begin
    result := Positions[curPosition];
    inc(curPosition);
    if curPosition >= numofPositions then
      curPosition := 0;
  end;
end;

procedure TQuake3BSP.SetPositions(l : TStringList);
var i : integer;
    v, p : string;
begin
  numOfPositions := 0;
  if l.Count > 0 then begin
    inc(numOfPositions);
    SetLength(Positions, numOfPositions);
    i := 0;
    while i < l.Count do begin
      v := l[i];
      p := l[i+1];
      if v = 'origin' then
        Positions[numOfPositions-1].Position := StrToVector3f(p)
      else if v = 'angle' then
        Positions[numOfPositions-1].Angle := StrToFloat(p)
      else if v = 'spawnflags' then
        curPosition := numOfPositions-1;
      inc(i, 2);
    end;
  end;
end;

procedure TQuake3BSP.SetWorldSpawn(l : TStringList);
var i,channel, snd, pi : integer;
    v, p, fn : string;
begin
  if l.Count > 0 then begin
    i := 0;
    while i < l.Count do begin
      v := l[i];
      p := l[i+1];
      if v = 'music' then begin
        // right now we use just the last wav in the list
        pi := Pos(#32, p);
        if pi > 0 then
          p := RightStr(p, Length(p)-pi);
        fn := QUAKE_FOLDER+'\' + p
      end
      else if v = 'message' then
        Cons.AddMsg('MESSAGE '+p);

      inc(i, 2);
    end;
    i := Pos(#32, fn);
    if i > 0 then
      fn := RightStr(fn, Length(fn)-i);
    Cons.AddMsg('MUSIC: ' + fn);
    snd := Sound.LoadSample(fn, true, false); //SetVector(0,0,0), false, true, MUSIC_VOL); // flags are missing
    channel := Sound.NewEmitter(snd, SetVector(0,0,0), false, false);
    //Sound.Play(channel, false);
  end;
end;

procedure TQuake3BSP.SetSoundEmitters(l : TStringList);
var i, flags ,channel, snd: integer;
    pos : TVector3f;
    v, p, fn : string;
    UsePosition, Loop : boolean;
begin
  if l.Count > 0 then begin
    i := 0;
    flags := 0;
    while i < l.Count do begin
      v := l[i];
      p := l[i+1];
      if v = 'origin' then
        Pos:= StrToVector3f(p)
      else if v = 'noise' then
        fn := QUAKE_FOLDER+'\' + p
      else if v = 'spawnflags' then
        flags := StrToInt(p)
      else if v = 'targetname' then begin
        Cons.AddMsg('Skipped target name');
        exit;
      end;
      inc(i, 2)
    end;
    //@@pos.Z := -pos.Z;

    Cons.AddMsg(Format('FX: %s (%f/%f/%f), %d',[fn, pos.x, pos.y, pos.z, Flags]));
    UsePosition := (Flags and 4) = 0;
    Loop := ((Flags and 1) = 1) OR ((Flags and 4) = 4);
    //channel := Sound.Load(fn, Pos, UsePosition, Loop, FX_VOL); // flags are missing

    //if UsePosition then
    //Sound.Play(channel, false);
    snd := Sound.LoadSample(fn, Loop, UsePosition); //SetVector(0,0,0), false, true, MUSIC_VOL); // flags are missing
    channel := Sound.NewEmitter(snd, Pos, UsePosition, false);

    if UsePosition then
      FSOUND_3D_SetAttributes(channel, @pos, nil);
  end;
end;

procedure TQuake3BSP.LoadEntities(var f:file;Lump:TBSPLump);
var ents : array of char;
    tmp, value, name, entityName, class_name : string;
    i, cnt, k, idx : integer;
    block : TStringList;
begin
  SetLength(ents, lump.Length);
  EntityList.Clear;
  block := TStringList.Create;
  //block.Sorted := true; // uses for info_player_death_match
  Seek(f,lump.offset);
  BlockRead(f,ents[0],lump.Length);

  curPosition := 0;

  // scan all chars
  cnt := 0;
  for i := 0 to lump.Length-1 do begin
    case ents[i] of
      '{', #10, #13, #9 : ; // NOP
      '}' : begin
              idx := block.IndexOf('classname')+1;
              class_name := block[idx];
              if class_name = 'worldspawn' then
                SetWorldSpawn(block)
              else if class_name = 'info_player_deathmatch' then
                SetPositions(block)
              else if class_name = 'target_speaker' then
                SetSoundEmitters(block);

(*              if (class_name = 'worldspawn') or (class_name = 'info_player_deathmatch') or (class_name = 'target_speaker') then begin
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
      '"' : begin
              inc(cnt);
              if cnt = 1 then begin
                tmp := '';
              end
              else begin
                cnt := 0;
                if not Odd(block.Count) then
                  block.Add(lowerCase(tmp))
                else
                  block.Add(tmp);
                tmp := '';
              end;
            end;
      else tmp := tmp + ents[i];
    end;
  end;
//  EntityList.SaveToFile('C:\entities.txt');
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
function TQuake3BSP.LoadBSP(const Folder, FileName: String): Boolean;
var F : File;
    i, j, k, l,  size, tempInt : integer;
    Temp  : glFloat;
    Header : TBSPHeader;
    Lumps  : array of TBSPLump;
    BSPLightMap : array of TBSPLightMap;
    dump : Text;
    shaderFile : string;
    mapName, effectAsString: string;
    dmp : TextFile;
    tmp :string;
    tmpPlane, newPlane : TBSPPlane;
    point : TVector3f;
    tt, tl : single;
    s, e : cardinal;
    dov : single;
    dist : single;
    fEffects : array of TFileEffect;
    newDistance, side : single;
begin
  result := false;
  FPath := IncludeTrailingPathDelimiter(Folder);
  mapName := FPath + 'maps\' + FileName;
  AssignFile(F, mapName);   // Check if the .bsp file can be opened
{$I-}
  Reset(F,1);
{$I+}
  if IOResult <> 0 then begin
    MessageBox(0, 'Could not find the BSP file!', 'Error', MB_OK);
    exit;
  end;

  // Read in the header and lump data
  BlockRead(F, Header, Sizeof(Header));
  if (Header.strID[0] <> 'I') or (Header.strID[1] <> 'B') or (Header.strID[2] <> 'S') or(Header.strID[3] <> 'P') or (Header.Version <> $2E) then begin
    MessageBox(0, 'Wrong header information!', 'Error', MB_OK);
    exit;
  end;

  // Initialize the header and lump structures *********************************
  SetLength(Lumps, kMaxLumps);
  BlockRead(F, Lumps[0], kMaxLumps*sizeof(TBSPLump));

  // LUMP 0: ENTITIES **********************************************************
  try
    LoadEntities(F, lumps[kEntities]);       // Load the entities
  except
    ShowMessage('Error in entities');
    exit;
  end;

  // LUMP 1: TEXTURES **********************************************************
  try
    numOfTextures := Round(lumps[kTextures].length / sizeof(TQ3FileTexture));
    SetLength(fileTextures, numOfTextures);
    SetLength(TextureInfo, numOfTextures);
    Seek(F, lumps[kTextures].offset);
    BlockRead(F, fileTextures[0], numOfTextures*sizeOf(TQ3FileTexture));

    s := GetTickCount();
    // Reset ShaderManager required list
    FShaderManager.RequiredShaders.Clear;
    for i :=0 to numOfTextures-1 do begin // Go through all of the textures
      TextureInfo[i].TextureName := StringReplace(LowerCase(fileTextures[i].TextureName), '/', '\', [rfReplaceAll]);
      TextureInfo[i].surface := fileTextures[i].flags;
      TextureInfo[i].contents := fileTextures[i].contents;
      TextureInfo[i].ShaderId := -1; // intial only
      TextureInfo[i].TextureId := 0;
      shaderFile := ShaderManager.AvailableShaders.Values[TextureInfo[i].TextureName];

      if  shaderFile <> ''  then begin // texture as defined in a shader
        // unique shaders only
        if FShaderManager.RequiredShaders.IndexOf(shaderFile+'='+TextureInfo[i].TextureName) = -1 then
          FShaderManager.RequiredShaders.Add(shaderFile+'='+TextureInfo[i].TextureName);
      end;
    end;
    //FShaderManager.RequiredShaders.SaveToFile('C:\RequiredShaders.txt');
    Cons.AddMsg('Required shaders = ' + IntToStr(ShaderManager.RequiredShaders.Count));
    //for i := 0 to ShaderManager.RequiredShaders.Count-1 do
    //  Cons.AddMsg(ShaderManager.RequiredShaders[i]);
  except
    ShowMessage('Error in textures');
    exit;
  end;

  // LUMP 2: PLANES ************************************************************
  try
    numOfPlanes := Round(lumps[kPlanes].length / sizeof(TBSPPlane));
    SetLength(Planes, numOfPlanes);
    Seek(f, lumps[kPlanes].offset);
    BlockRead(F, Planes[0], numOfPlanes*sizeof(TBSPPlane));
    for i := 0 to numOfPlanes-1 do begin
      Point := ScaleVector(Planes[i].Normal, -Planes[i].d);
      // Swap normal coords
      temp := Planes[i].Normal.y;
      Planes[i].Normal.y := Planes[i].Normal.z;
      Planes[i].Normal.z := -temp;
(*      temp := point.y;
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
    numOfNodes := Round(lumps[kNodes].length / sizeof(TBSPNode));
    SetLength(Nodes, numOfNodes);
    Seek(F, lumps[kNodes].offset);
    BlockRead(F, Nodes[0], numOfNodes*sizeof(TBSPNode));
    for i := 0 to numOfNodes-1 do begin
      SwapBoundingBoxInteger(Nodes[i].min, Nodes[i].max);
    end;
  except
    ShowMessage('Error in nodes');
    exit;
  end;

  // LUMP 4: LEAFS *************************************************************
  try
    numOfLeafs := Round(lumps[kLeafs].length / sizeof(TBSPLeaf));
    SetLength(Leafs, numOfLeafs);
    Seek(F, lumps[kLeafs].offset);
    BlockRead(F, Leafs[0], numOfLeafs*sizeof(TBSPLeaf));
    for i := 0 to numOfLeafs-1 do begin // Now we need to go through and convert all the leaf bounding boxes to the normal OpenGL Y up axis.
      SwapBoundingBoxInteger(Leafs[i].min, Leafs[i].max);
    end;
  except
    ShowMessage('Error in leafs');
    exit;
  end;

  // LUMP 5: LEAF FACES ********************************************************
  try
    numOfLeafFaces := Round(lumps[kLeafFaces].length / sizeof(integer));
    SetLength(LeafFaces, numOfLeafFaces);
    Seek(F, lumps[kLeafFaces].offset);
    BlockRead(F, LeafFaces[0], numOfLeafFaces*sizeof(integer));
  except
    ShowMessage('Error in leaf faces');
    exit;
  end;

  // LUMP 6: LEAF BRUSHES ******************************************************
  try
    numOfLeafBrushes := round(lumps[kLeafBrushes].length / sizeof(integer));
    SetLength(LeafBrushes, numOfLeafBrushes);
    Seek(f,lumps[kLeafBrushes].offset);
    Blockread(f,LeafBrushes[0],sizeof(integer)*numOfLeafBrushes);
  except
    ShowMessage('Error in leaf brushes');
    exit;
  end;

  // LUMP 7: MODELS ************************************************************
  try
    numOfModels := Round(lumps[kModels].length / sizeof(TBSPModel));
    SetLength(Models, numOfModels);
    Seek(F, lumps[kModels].offset);
    BlockRead(F, Models[0], sizeOf(TBSPModel)*numOfModels);
    for i := 0 to numOfModels-1 do begin
      SwapBoundingBoxFloat(Models[i].min, Models[i].max);
    end;
  except
    ShowMessage('Error in models');
    exit;
  end;

  // LUMP 8: BRUSHES *******************************************************************
  try
    numOfBrushes := round(lumps[kBrushes].length / sizeof(TBSPBrush));
    SetLength(Brushes,numOfBrushes);
    Seek(f,lumps[kBrushes].offset);
    Blockread(f,Brushes[0],sizeof(TBSPBrush)*numOfBrushes);
  except
    ShowMessage('Error in brushes');
    exit;
  end;

  // LUMP 9: BRUSH SIDES *******************************************************
  try
    numOfBrushSides := round(lumps[kBrushSides].length / sizeof(TBSPBrushSide));
    SetLength(BrushSides,numOfBrushSides);
    seek(f,lumps[kBrushSides].offset);
    Blockread(f,BrushSides[0],sizeof(TBSPBrushSide)*numOfBrushSides);
  except
    ShowMessage('Error in brush sides');
    exit;
  end;

  // LUMP 10: VERTEX ***********************************************************
  try
    numOfVerts := Round(lumps[kVertices].length / sizeof(TBSPVertex));
    SetLength(Vertices, numOfVerts);
    SetLength(fogBuffer, numOfVerts);
    Seek(F, lumps[kVertices].offset);
    for i :=0 to numOfVerts-1 do   begin
      BlockRead(F, Vertices[i], sizeOf(TBSPVertex));
      Temp := Vertices[i].Position.Y;
      Vertices[i].Position.Y := Vertices[i].Position.Z;
      Vertices[i].Position.Z := -temp;
      Vertices[i].TextureCoord.Y := -Vertices[i].TextureCoord.Y;
      ChangeGamma(Vertices[i].Color, Gamma);
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
    numOfMeshVerts := Round(lumps[kMeshVerts].length / sizeof(integer));
    SetLength(MeshVertices, numOfMeshVerts);
    Seek(F, lumps[kMeshVerts].offset);
    BlockRead(F, MeshVertices[0], numOfMeshVerts*sizeof(integer));
  except
    ShowMessage('Error in mesh vertices');
    exit;
  end;

  // LUMP 12: EFFECTS **********************************************************
  // Fog volumes are defined via EFFECTS
  try
    numOfEffects := Round(lumps[kEffects].length / sizeof(TFileEffect));
    SetLength(Effects, numOfEffects);
    SetLength(fEffects, numOfEffects);
    Seek(F, lumps[kEffects].offset);
    BlockRead(F, fEffects[0], numOfEffects*sizeof(TFileEffect));
    FShaderManager.ReadRequiredShaders;
    Cons.AddMsg('Loaded shaders = ' + IntToStr(ShaderManager.Count));
    Cons.AddMsg('Effects = ' + IntToStr(numOfEffects));
  except
    ShowMessage('Error in mesh vertices');
    exit;
  end;

  // assign shaderId
  for i :=0 to numOfTextures-1 do begin // Go through all of the textures
    shaderFile := ShaderManager.AvailableShaders.Values[TextureInfo[i].TextureName];
    if  shaderFile <> ''  then begin
      TextureInfo[i].ShaderId := ShaderManager.IndexOf(TextureInfo[i].TextureName);
      TextureInfo[i].surface  := ShaderManager[TextureInfo[i].ShaderId].Surface;
      TextureInfo[i].TextureId := ShaderManager[TextureInfo[i].ShaderId].qerId; // @@ NEW
      if ShaderManager[TextureInfo[i].ShaderId].IsSkyBox then begin
        skyboxShader := TextureInfo[i].ShaderId;
        if ShaderManager[TextureInfo[i].ShaderId].SkyboxType = 2 then begin
          for j := 0 to 5 do
            ShaderManager[skyboxShader].SkyboxTextureIds[j] := FShaderManager.LoadTexture(FPath+ShaderManager[skyboxShader].SkyboxTextureNames[j], false, true);
        end;
      end;
    end
    else
      TextureInfo[i].TextureId := FShaderManager.LoadTexture(FPath+TextureInfo[i].TextureName, false, false);
  end;

  // LUMP 13: FACES ************************************************************
  try
    numOfFaces := Round(lumps[kFaces].length / sizeof(TBSPFace));
    SetLength(Faces, numOfFaces);
    SetLength(IsModelFace, numOfFaces);
    Seek(F, lumps[kFaces].offset);
    BlockRead(F, Faces[0], numOfFaces*sizeOf(TBSPFace));
    SetLength(FacesDrawn, numOfFaces);
    SetLength(CenterPoints, numOfFaces);

    s := GetTickCount;
    for i := 0 to numOfFaces-1 do begin
      IsModelFace[i] := false;
      Temp := Faces[i].Normal.Y;
      Faces[i].Normal.Y := Faces[i].Normal.Z;
      Faces[i].Normal.Z := -temp;
      if Faces[i].FaceType = FACE_PATCH then
        PrepareQuadricPatch(i)
      else begin
        point := SetVector(0, 0, 0);
        for j := 0 to Faces[i].numMeshVerts-1 do begin
          point.x := point.x + Vertices[Faces[i].startVertIndex+MeshVertices[Faces[i].meshVertIndex+j]].Position.x;
          point.y := point.y + Vertices[Faces[i].startVertIndex+MeshVertices[Faces[i].meshVertIndex+j]].Position.y;
          point.z := point.z + Vertices[Faces[i].startVertIndex+MeshVertices[Faces[i].meshVertIndex+j]].Position.z;
        end;
        CenterPoints[i].x := point.x / Faces[i].numMeshVerts;
        CenterPoints[i].y := point.y / Faces[i].numMeshVerts;
        CenterPoints[i].z := point.z / Faces[i].numMeshVerts;
      end;
    end;
    SetLength(TransparentFaces, numOfFaces);
    SetLength(SolidFaces, numOfFaces);
    SetLength(AdditiveFaces, numOfFaces);
    e := GetTickCount;
    Cons.AddMsg('Preparing faces ' + IntToStr(e-s) + ' ms');
  except
    ShowMessage('Error in faces');
    exit;
  end;

  // LUMP 14: LIGHTMAPS ********************************************************
  try
    numOfLightmaps := Round(lumps[kLightmaps].length / sizeof(TBSPLightmap));
    SetLength(BSPLightmap, numOfLightmaps);
    SetLength(Lightmaps, numOfLightmaps);
    Seek(F, lumps[kLightMaps].offset);
    BlockRead(F, BSPLightmap[0], sizeof(TBSPLightmap)*numOfLightmaps);
    for i := 0 to numOfLightmaps-1 do begin
      CreateLightmapTexture(Lightmaps[i],BSPLightmap[i], 128, 128);
    end;
  except
    ShowMessage('Error in lightmaps');
    exit;
  end;

  // LUMP 15: LIGHT VOLUMES ****************************************************
  // not implemented yet - only used by models

  // LUMO 16: VISDATA **********************************************************
  try
    Seek(f, lumps[kVisData].offset);
    if (lumps[kVisData].length > 0 ) then begin
      BlockRead(F, clusters.numOfClusters, sizeof(integer));
      BlockRead(F, clusters.bytesPerCluster, sizeof(integer));
      size := clusters.numOfClusters * clusters.bytesPerCluster;
      SetLength(clusters.Bitsets, size);
      BlockRead(F, clusters.Bitsets[0],sizeof(byte)* size);
    end
    else
      SetLength(clusters.Bitsets, 0);
  except
    ShowMessage('Error in lightmaps');
    exit;
  end;

  // ALL DATA READ *************************************************************
  // assign effect indices to shaders
  if numOfEffects > 0 then begin
    for i := 0 to numOfEffects-1 do begin
      EffectAsString := StrPas(fEffects[i].Name);
      EffectAsString := StringReplace(LowerCase(EffectAsString), '/', '\', [rfReplaceAll]);
      shaderFile := ShaderManager.AvailableShaders.Values[EffectAsString];
      j := FShaderManager.RequiredShaders.IndexOf(shaderFile+'='+EffectAsString);
      if  j <> -1 then begin
        Effects[i].shaderIndex := j;
      end;
    end;
  end;
  SetLength(fEffects, 0);
//  FShaderManager.RequiredShaders.SaveToFile('C:\RequiredShaders.txt');


  // Model[0] is world bounding box
  if numOfModels > 0 then begin
    if Models[0].min.x < 0 then
      dist := Models[0].max.x + abs(Models[0].min.x)
    else
      dist := Models[0].max.x - Models[0].min.x;
    dov := dist;

    if Models[0].min.y < 0 then
      dist := Models[0].max.y + abs(Models[0].min.y)
    else
      dist := Models[0].max.y - Models[0].min.y;
    if dist > dov then dov := dist;
    if Models[0].min.z < 0 then
      dist := Models[0].max.z + abs(Models[0].min.z)
    else
      dist := Models[0].max.z - Models[0].min.z;
    if dist > dov then dov := dist;
    WORLD_MAX := dov;
    DEPTH_OF_VIEW := trunc(dov*3);

    if numOfModels > 1 then begin
      for i := 1 to numOfModels-1 do begin
        j := Models[i].numOfFaces;
        if j > 0 then begin
          for k := 0 to j-1 do begin
            IsModelFace[Models[i].faceIndex+k] := true;
          end;
        end;
      end;
    end;
  end;

  if skyboxShader <> -1 then
    FSkybox.Init(Round(dov*PI/2), SKY_RESOLUTION,
                 FShaderManager.Items[skyboxShader].SkyboxType,
                 FShaderManager.Items[skyboxShader].SkyboxTextureIds);

  CloseFile(F);
  //SetLength(fileTextures,0);
  result := true;
end;

/////	This returns the leaf our camera is in
function TQuake3BSP.FindLeaf(vPos : TVector3f) : integer;
var i : integer;
    distance : double;
    node : PBSPNode;
    plane : PBSPPlane;
begin
  i := 0;
  while(i >= 0) do begin
    node := @Nodes[i];
    plane := @Planes[node.plane];

    distance :=	plane.Normal.x * vPos.x +
		plane.Normal.y * vPos.y +
		plane.Normal.z * vPos.z - plane.d;

    // If the camera is in front of the plane
    if (distance >= 0) then begin
      // Assign the current node to the node in front of itself
      i := node.front;
    end
    else begin // Else if the camera is behind the plane
      // Assign the current node to the node behind itself
      i := node.back;
    end;
  end; // while

  result := -(i + 1);
end;


/////	This tells us if the "current" cluster can see the "test" cluster
function TQuake3BSP.IsClusterVisible(current, test : integer) : integer;
var visSet : byte;
    retVal : integer;
begin
  if (High(clusters.Bitsets) <= 0) or (current < 0) then begin
    result := 1;
    exit;
  end;
  // Use binary math to get the 8 bit visibility set for the current cluster
  visSet := clusters.Bitsets[(current*clusters.bytesPerCluster) + (test div 8)];
  // Now that we have our vector (bitset), do some bit shifting to find if
  // the "test" cluster is visible from the "current" cluster, according to the bitset.
  retVal := visSet and (1 shl ((test) and 7));
  // Return the result ( either 1 (visible) or 0 (not visible) )
  result := ( retVal );
end;

procedure TQuake3BSP.PrepareQuadricPatch(faceIndex: integer);
var Face : PBSPFace;
    numPatchesWide, numPatchesHigh, numOfQuadricPatches : integer;
    vertexCount, indexCount : integer;
    oldNumOfVerts, oldNumOfIndices, pointOffset, startVertIndex : integer;
    y, x, row, point  : integer;
    i, j, cnt : integer;
    center : TVector3f;
    QuadricPatches : TBSPQuadricPatchArray;
begin
  Face := @Faces[faceIndex];

  numPatchesWide := (Face.Size[0]-1) div 2;
  numPatchesHigh := (Face.Size[1]-1) div 2;

  numOfQuadricPatches := numPatchesWide*numPatchesHigh;
  SetLength(QuadricPatches, numofQuadricPatches);

  vertexCount  := (tesselation+1)*(tesselation+1);
  indexCount := tesselation*(tesselation)*6;
  pointOffset := 0;

  startVertIndex := numOfVerts;
  Faces[faceIndex].meshVertIndex := numOfMeshVerts;
  Faces[faceIndex].numMeshVerts := indexCount*numOfQuadricPatches;
  Faces[faceIndex].numOfVerts :=  VertexCount*numOfQuadricPatches;
  for y := 0 to numPatchesHigh-1 do begin
    for x := 0 to numPatchesWide-1 do begin
      // calc control points
      for row := 0 to 2 do begin
        for point := 0 to 2 do begin
          QuadricPatches[y*numPatchesWide+x].ControlPoints[row*3+point] := Vertices[Face.startVertIndex+(y*2*Face.Size[0]+x*2)+row*Face.Size[0]+point];
        end;
      end;
      // create vertices and indices
      oldNumOfVerts := numOfVerts;
      oldNumOfIndices := numOfMeshVerts;
      numOfVerts := numOfVerts + vertexCount;
      numOfMeshVerts := numOfMeshVerts + indexCount;
      SetLength(Vertices, numOfVerts);
      SetLength(MeshVertices, numOfMeshVerts);
      //Tesselate(QuadricPatches[faceIndex, y*numPatchesWide+x]);
      CalcQuadricPatch(QuadricPatches[y*numPatchesWide+x].ControlPoints, oldNumOfVerts, oldNumOfIndices, pointOffset);
      inc(pointOffset, vertexCount);
    end;
  end;
  Faces[faceIndex].startVertIndex := startVertIndex;
  center := SetVector(0,0,0);
  cnt := 0;
  //for i := (numOfVerts-1) downto (numOfVerts-1)-(vertexCount*numOfQuadricPatches) do begin
  for i := startVertIndex to (startVertindex+Faces[faceIndex].numOfVerts-1) do begin
    center.x := center.x + Vertices[i].Position.x;
    center.y := center.y + Vertices[i].Position.y;
    center.z := center.z + Vertices[i].Position.z;
    inc(cnt);
  end;
  CenterPoints[faceIndex].X := center.X / cnt;
  CenterPoints[faceIndex].y := center.y / cnt;
  CenterPoints[faceIndex].z := center.z / cnt;
end;

procedure TQuake3BSP.BindTextures(texId, lmId : integer);
begin

  if not MultiTexture then begin
    if  WireFrame = false then begin
      glColor3ub(255,255,255);
      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, TextureInfo[texId].TextureId);
    end
    else begin
      glColor3ub(255,255,255);
      glDisable(GL_TEXTURE_2D);
    end;
  end
  else begin
    if  WireFrame = false then begin
      //glActiveTextureARB(GL_TEXTURE1_ARB);
      if lmId > -1 then begin
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, Lightmaps[lmId]);
      end
      else begin
        glDisable(GL_TEXTURE_2D);
      end;
      //glActiveTextureARB(GL_TEXTURE0_ARB);
      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, TextureInfo[texId].TextureId);
    end
    else begin
      glColor3ub(255,255,255);
      //glActiveTextureARB(GL_TEXTURE1_ARB);
      //glDisable(GL_TEXTURE_2D);
      //glActiveTextureARB(GL_TEXTURE0_ARB);
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
(*procedure TQuake3BSP.RenderSkyboxOld;
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
var shader : TShader;
    i, numOfVerts : integer;
    texId : Cardinal;
begin
  glCullFace(GL_BACK);
  shader := ShaderManager[skyBoxShader];

  if shader.SkyboxType = 2 then begin
    glDisableClientState(GL_COLOR_ARRAY);
    //glActiveTextureARB(GL_TEXTURE1_ARB);
    //glDisable(GL_TEXTURE_2D);
    //glActiveTextureARB(GL_TEXTURE0_ARB);
    glEnable(GL_TEXTURE_2D);
    glDisableClientState(GL_COLOR_ARRAY);

    FSkybox.DrawBox(camera.position);
    SetDefaults;
    exit;
  end;

  if MultiTexture then begin
    //glActiveTextureARB(GL_TEXTURE1_ARB);
    //glDisable(GL_TEXTURE_2D);
    //glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);


  try
    FSkyBox.CalcRenderPoints(camera.position); // only visible points
    glEnable(GL_COLOR);
    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
    glColor3ub(255,255,255);

    // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
    FSkybox.CopyData(inputBuffer);
    numOfVerts := FSkybox.TriangleCount * 3;
    SetVertexCoords(skyBoxShader, numOfVerts);
    glVertexPointer(3, GL_FLOAT, sizeof(TBSPVertex), @inputBuffer[0].Position);

//    if LockArrays then glLockArraysEXT(0, numOfVerts);
    if shader.numOfLayers > 0 then begin
      for i := 0 to shader.numOfLayers-1 do begin
        SetVertexColors(skyBoxShader, i, numOfVerts);

        glColorPointer(4, GL_UNSIGNED_BYTE, 0, @colorBuffer[0]);
        glDisableClientState(GL_COLOR_ARRAY);
        SetTextureCoordinates(skyBoxShader, i, numOfVerts);

        //if multiTexture then
          //glClientActiveTextureARB(GL_TEXTURE0_ARB);

        glTexCoordPointer(2, GL_FLOAT, 0,  @texCoordBuffer[0]);
        texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];

        //if multiTexture then
          //glActiveTextureARB(GL_TEXTURE0_ARB);
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, texId);

        shaderManager.SetState(skyBoxShader, i );
        glDrawArrays(GL_TRIANGLES, 0, numOfVerts);
      end;
    end;
    if LockArrays then glUnlockArraysEXT();
    SetDefaults;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    Cons.AddIfDifferent('RenderSkyBox ' + lastErrorString);
//    if DumpErrors then AddError('RenderSkyBox ' + lastErrorString);
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
procedure TQuake3BSP.RenderSurfaceShader(faceIndex, shaderId: integer);
var shader : TShader;
    i, texId, planeIdx : integer;
    Face : PBSPFace;
begin
  try
  Face := @Faces[faceIndex];
  shader := ShaderManager[shaderId];
  // culling
  if shader.Cull = GL_NONE then
    glDisable(GL_CULL_FACE)
  else begin
    glEnable(GL_CULL_FACE);
    glCullFace(shader.cull);
  end;

  if multiTexture then begin
//    glActiveTextureARB(GL_TEXTURE1_ARB);
//    glDisable(GL_TEXTURE_2D);
//
//    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);

  glEnable(GL_COLOR);
  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
  glColor3ub(255,255,255);

  // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
  for i := 0 to face.numMeshVerts-1 do
    inputBuffer[i] := Vertices[Face.startVertIndex+MeshVertices[face.meshVertIndex+i]];

  SetVertexCoords(shaderId, face.numMeshVerts);
  glVertexPointer(3, GL_FLOAT, sizeof(TBSPVertex), @inputBuffer[0].Position);
//  if LockArrays then glLockArraysEXT(0, Face.numMeshVerts);

  if shader.numOfLayers > 0 then begin
    for i := 0 to shader.numOfLayers-1 do begin
      if (ShaderManager[shaderId].Layers[i].numOfrgbGen > 0) or (Face.FaceType = FACE_MESH) then begin
        SetVertexColors(shaderId, i, face.numMeshVerts);
        glColorPointer(4, GL_UNSIGNED_BYTE, 0, @colorBuffer[0]);
        glEnableClientState(GL_COLOR_ARRAY);
      end
      else
        glDisableClientState(GL_COLOR_ARRAY);
      SetTextureCoordinates(shaderId, i, face.numMeshVerts);

//      if multiTexture then
//        glClientActiveTextureARB(GL_TEXTURE0_ARB);
      glTexCoordPointer(2, GL_FLOAT, 0,  @texCoordBuffer[0]);

      if (shader.Layers[i].UseLightmap) then begin
        if not multiTexture then begin
          texId := 0;
        end
        else begin
          //glClientActiveTextureARB(GL_TEXTURE0_ARB);
          glTexCoordPointer(2, GL_FLOAT, sizeof(TBSPVERTEX), @inputBuffer[0].LightmapCoord);
          if (face.lightmapId > -1) and (Lightmaps[face.lightmapID] > -1) then
            texId := Lightmaps[face.lightmapID]
          else
            texId := 0;
        end;
      end
      else begin
        texId := shader.Layers[i].TextureId[shader.Layers[i].curTexture];
      end;
      glEnable(GL_TEXTURE_2D);
      glBindTexture(GL_TEXTURE_2D, texId);

      shaderManager.SetState(shaderId, i );
      glDrawArrays(GL_TRIANGLES, 0, Face.numMeshVerts);
      //SetDefaults;
    end;
  end;
  if LockArrays then glUnlockArraysEXT();
  SetDefaults;
  if (numOfEffects > 0) and (Faces[faceIndex].effect > -1) and (not simpleRender) and (ShowFog) then begin
    //RenderFogFace(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside].plane );
    //RenderFog(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Effects[Faces[faceIndex].effect].visibleSide].plane);
    if (Effects[Faces[faceIndex].effect].visibleside >= 0) then
      planeIdx := BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside + Effects[Faces[faceIndex].effect].visibleside].plane
    else
      planeIdx :=  -1;
    RenderFog(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, planeIdx);
    SetDefaults;
  end;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    Cons.AddIfDifferent('RenderSurfaceShader ' + lastErrorString + ' ' + IntToStr(faceIndex));

//    if DumpErrors then AddError('RenderSurfaceShader ' + lastErrorString);
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
procedure TQuake3BSP.RenderSurface(faceIndex: integer);
var Face : PBSPFace;
    planeIdx : integer; 
begin
  try
    Face := @Faces[faceIndex];
    glVertexPointer(3, GL_FLOAT, sizeof(TBSPVertex), @Vertices[Face.startVertIndex].Position);

    if multiTexture then begin
      //glClientActiveTextureARB(GL_TEXTURE1_ARB);
      glDisableClientState(GL_COLOR_ARRAY);
      glTexCoordPointer(2, GL_FLOAT, sizeof(tBSPVertex), @Vertices[Face.startVertIndex].LightmapCoord);
      //glClientActiveTextureARB(GL_TEXTURE0_ARB);
    end;
    glTexCoordPointer(2, GL_FLOAT, sizeof(tBSPVertex), @Vertices[Face.startVertIndex].TextureCoord);

    if Face.FaceType = FACE_MESH then begin
      glColorPointer(4, GL_UNSIGNED_BYTE, sizeof(TBSPVertex), @Vertices[Face.startVertIndex].Color);
      glEnableClientState(GL_COLOR_ARRAY);
    end
    else
      glColor3ub(255,255,255);
//    if LockArrays then glLockArraysEXT(0, Face.numMeshVerts);

    BindTextures(Face.textureID, Face.lightmapID); //Faces[faceIndex].lightmapID);
    glDrawElements(GL_TRIANGLES, face.numMeshVerts, GL_UNSIGNED_INT, @MeshVertices[face.meshVertIndex]);
    if LockArrays then glUnlockArraysEXT();
    SetDefaults;
    if (numOfEffects > 0) and (Faces[faceIndex].effect > -1) and (not SimpleRender) and ShowFog then begin
      //RenderFogFace(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside].plane );
      //RenderFog(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, 0);
      if (Effects[Faces[faceIndex].effect].visibleside >= 0) then
        planeIdx := BrushSides[Brushes[Effects[Faces[faceIndex].effect].brushIndex].brushside + Effects[Faces[faceIndex].effect].visibleside].plane
      else
        planeIdx :=  -1;
      RenderFog(faceIndex, Effects[Faces[faceIndex].effect].shaderIndex, planeIdx);
      SetDefaults;
    end;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
    Cons.AddIfDifferent('RenderSurface ' + lastErrorString + ' ' + IntToStr(faceIndex));

//    if DumpErrors then AddError('RenderSurface ' + lastErrorString);
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
procedure TQuake3BSP.RenderBSP(const Pos: TVector3f; leafIndex : integer);
var i, l, j, k, cluster, faceCount, faceIndex, shaderId : integer;
    Leaf : PBSPLeaf;
    tmp, txt : string;
    st, et : longword;
    allEqual : boolean;
begin
  glEnableClientState(GL_VERTEX_ARRAY);
  if multiTexture then begin
    //glClientActiveTextureARB(GL_TEXTURE1_ARB);
    //glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    //glClientActiveTextureARB(GL_TEXTURE0_ARB);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY); // default = vertex, tex1+tex2, no color
  end
  else begin
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  end;
  FillChar(FacesDrawn[0], sizeof(boolean)*numOfFaces, 0);
  cluster := Leafs[leafIndex].cluster;
  i := numOfLeafs;
  VisibleTriangles := 0;
  renderedLeaves := 0;
  PVSLeaves :=0;
  frustumLeaves :=0;
  BSPLeaves := numOfLeafs;
  if SimpleRender then begin
    while (i > 0) do begin
      dec(i);
      Leaf := @Leafs[i];
      if (IsClusterVisible(cluster, Leaf.cluster) = 0) then begin
        inc(PVSLeaves);
        continue;
      end;  
      if (not Frust.BoxInFrustum(Leaf.min.x, Leaf.min.y, Leaf.min.z, Leaf.max.x, Leaf.max.y, Leaf.max.z)) then begin
        inc(frustumLeaves);
        continue;
      end;
      inc(renderedLeaves);
      faceCount := Leaf.numOfLeafFaces;
      while(faceCount > 0) do begin
        Dec(faceCount);
        faceIndex := LeafFaces[Leaf.leafface + faceCount];
        if (Faces[faceIndex].FaceType  = FACE_BILLBOARD) then continue;
        if (FacesDrawn[faceIndex] = false) then begin
          FacesDrawn[faceIndex] := true;
          RenderSurface(faceIndex);
        end;
      end; // while faceCount
    end;
  end
  else begin
    numSolid := 0;
    numTransparent := 0;
    numAdditive := 0;
    while (i > 0) do begin
      dec(i);
      Leaf := @Leafs[i];
      if (IsClusterVisible(cluster, Leaf.cluster) = 0) then begin
        inc(PVSLeaves);
        continue;
      end;
      if (not Frust.BoxInFrustum(Leaf.min.x, Leaf.min.y, Leaf.min.z, Leaf.max.x, Leaf.max.y, Leaf.max.z)) then begin
        inc(frustumLeaves);
        continue;
      end;
      inc(renderedLeaves);
      WalkLeaf(i, SortFaces);
    end;

    // All faces are associated with the corresponding face arrays
    // now we have to depth sort all transparent
    if numSolid > 0 then begin
      if SortFaces then
        QSort(numSolid, CompareSolid, SwapSolid);
      for l := 0 to numSolid-1 do begin
        faceIndex := SolidFaces[l].FaceIndex;
        RenderSurface(faceIndex);
      end;
    end;

    if numAdditive  > 0 then begin
      if SortFaces then
        QSort(numAdditive, CompareAdditive, SwapAdditive);
      for l := 0 to numAdditive-1 do begin
        faceIndex := AdditiveFaces[l].FaceIndex;
        shaderId := TextureInfo[Faces[faceIndex].textureID].ShaderId;
        RenderSurfaceShader(faceIndex, shaderId);
      end;
    end;

    if (skyboxShader <> -1) and RenderSky then begin
      RenderSkybox;
    end;

    if numTransparent  > 0 then begin
      if SortFaces then  begin
        QSort(numTransparent, CompareTransparent, SwapTransparent);
      end;
      for l := numTransparent-1 downto 0 do begin
        faceIndex := TransparentFaces[l].FaceIndex;
        shaderId := TextureInfo[Faces[faceIndex].textureID].ShaderId;
        RenderSurfaceShader(faceIndex, shaderId);
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
      end;  *)
    end;
  end;

  if WireFrame then
    glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
  if DumpMsg <> '' then begin
    //Fnt.Draw(5, 25, DumpMsg, 1, SCREEN_WIDTH, SCREEN_HEIGHT);
    Cons.TextOut(1,Cons.Lines, DumpMsg);
  end;
//  with Camera do
//  fnt.Draw(5, 50, Format('Position: %d/%d/%d ', [Trunc(Position.x),Trunc(Position.y),Trunc(Position.z)]), 1, SCREEN_WIDTH, SCREEN_HEIGHT);

//  if ShowLog then
//    DisplayErrors;
  if WireFrame then
    glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
end;

procedure ChangeGamma(var color : array of byte; factor : single);
var i, j : integer;
    scale, r, g, b : single;
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
  if (r > 1.0) and ((1.0/r) < scale) then scale:=(1.0/r);
  if (g > 1.0) and ((1.0/g) < scale) then scale:=(1.0/g);
  if (b > 1.0) and ((1.0/b) < scale) then scale:=(1.0/b);

  // Get the scale for this pixel and multiply it by our pixel values
  scale:=scale*255.0;
  r:=r*scale;	g:=g*scale;	b:=b*scale;

  // Assign the new gamma'nized RGB values to our image
  color[0] := Trunc(r);
  color[1] := Trunc(g);
  color[2] := Trunc(b);
end;

procedure TQuake3BSP.ChangeGammaLightmap(var pImage:TBSPLightmap;const Width,height:integer; factor:GlFloat);
var i, j : integer;
    scale, r, g, b : single;
begin
  // Go through every pixel in the lightmap
  for i := 0 to Width-1 do
    for j := 0 to Width-1 do begin
      scale := 1;
      //temp := 0;
      // extract the current RGB values
      r := pImage.imageBits[i,j,0];
      g := pImage.imageBits[i,j,1];
      b := pImage.imageBits[i,j,2];

      // Multiply the factor by the RGB values, while keeping it to a 255 ratio
      r := r * factor / 255.0;
      g := g * factor / 255.0;
      b := b * factor / 255.0;

      // Check if the the values went past the highest value
      if (r > 1.0) and ((1.0/r) < scale) then scale:=(1.0/r);
      if (g > 1.0) and ((1.0/g) < scale) then scale:=(1.0/g);
      if (b > 1.0) and ((1.0/b) < scale) then scale:=(1.0/b);

      // Get the scale for this pixel and multiply it by our pixel values
      scale:=scale*255.0;
      r:=r*scale;	g:=g*scale;	b:=b*scale;

      // Assign the new gamma'nized RGB values to our image
      pImage.imageBits[i,j,0] := Trunc(r);
      pImage.imageBits[i,j,1] := Trunc(g);
      pImage.imageBits[i,j,2] := Trunc(b);
    end;
end;

Procedure TQuake3BSP.CreateLightmapTexture(var texture:GLUINT; pImageBits:TBSPLightmap; width,height:integer);
begin
  // Generate a texture with the associative texture ID stored in the array
  glGenTextures(1, @texture);
  // This sets the alignment requirements for the start of each pixel row in memory.
  glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
  // Bind the texture to the texture arrays index and init the texture
  glBindTexture(GL_TEXTURE_2D, texture);
  // Change the lightmap gamma values by our desired gamma
  ChangeGammaLightmap(pImageBits, width,height, Gamma);

  glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

  //Assign the mip map levels
  glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);

  // Build Mipmaps (builds different versions of the picture for distances - looks better)
  gluBuild2DMipmaps(GL_TEXTURE_2D, GL_RGB, width, height, GL_RGB, GL_UNSIGNED_BYTE, @pImageBits);

end;


//  Movement clipping
function TQuake3BSP.checkMove(sp, ep, extent : TVector3f) : TBSPMove;
var MoveMove : TBSPMove;
begin
//  moveMove.BBsize := extent;//ScaleVector(extent, 1.5);
  MoveMove.brush := -1; //
  moveMove.extents := extent;
  moveMove.startPoint := sp;
  moveMove.EndPoint := ep;
  moveMove.Normal.X := 0;
  moveMove.Normal.Y := 0;
  moveMove.Normal.Z := 0;
  moveMove.fraction := 1;
  moveMove.leafIndex := -1;
  // If nothing is hit, full movement by defaultmoveMove.fraction = 1;
  moveMove.allSolid := false;

  checkMoveNode(0, 1, sp, ep, 0, moveMove);

  // Calculate final coordinates
  if moveMove.fraction <> 1 then begin
    moveMove.EndPoint.x := sp.x + (ep.x - sp.x) * moveMove.fraction;
    moveMove.EndPoint.y := sp.y + (ep.y - sp.y) * moveMove.fraction;
    moveMove.EndPoint.z := sp.z + (ep.z - sp.z) * moveMove.fraction;
  end;
  result := moveMove;
end;

procedure TQuake3BSP.checkMoveNode(sf, ef : single; sp, ep : TVector3f; node : integer; var Move : TBSPMove);
var t1, t2 : single;
    plane : TBSPPlane;
    offset : single;
    idist, frac, frac2, midf : single;
    midP : TVector3f;
    isFront : boolean;
begin
  // If the path was blocked by a nearer obstacle, don't bother checking
  if (Move.fraction <= sf) then  exit;
  // We found a leaf, check the whole path against its brushes
  if (node < 0) then  begin
    checkMoveLeaf(-(node + 1), Move);
    exit;
  end;

  plane := planes[nodes[node].plane];

  t1 := planeDistance(sp, Plane.Normal, Plane.d);  // startDistance
  t2 := planeDistance(ep, Plane.Normal, Plane.d);  // endDistance

  //offset := abs(Move.BBsize.x*plane.normal.x) + abs(Move.BBsize.y*plane.normal.y) + abs(Move.BBsize.z*plane.normal.z);
  // abs nicht vergessen, wegen negative plane.normal-Werte
  offset := abs(Move.extents.x*plane.normal.x) + abs(Move.extents.y*plane.normal.y) + abs(Move.extents.z*plane.normal.z);

  // The whole volume is in front of the plane
  if ((t1 >= offset) and (t2 >= offset)) then begin
    checkMoveNode(sf, ef, sp, ep, nodes[node].front, move );
    exit;
  end;

  // The whole volume is in the back of the plane
  if ((t1 < -offset) and (t2 < -offset)) then begin
    checkMoveNode(sf, ef, sp, ep, nodes[node].back, move);
    exit;
  end;

  // Else, the box is split. Check the two halves.
  if (t1 < t2) then begin
    isFront  := false;
    idist := 1.0 / (t1 - t2);
    frac  := (t1 - offset - DIST_EPSILON) * idist;
    frac2 := (t1 + offset + DIST_EPSILON) * idist;
  end
  else if (t1 > t2) then begin
    isFront  := true;
    idist := 1.0 / (t1 - t2);
    frac  := (t1 + offset + DIST_EPSILON) * idist;
    frac2 := (t1 - offset - DIST_EPSILON) * idist;
  end
  else begin
    isFront  := true;
    frac  := 1;
    frac2 := 0;
  end;

  // Move from start to the plane
  if (frac < 0) then
    frac := 0;
  if (frac > 1) then
    frac := 1;

  midf := sf + (ef - sf)*frac;
  midp.x := sp.x + (ep.x - sp.x)*frac;
  midp.y := sp.y + (ep.y - sp.y)*frac;
  midp.z := sp.z + (ep.z - sp.z)*frac;

  if IsFront then
    checkMoveNode(sf, midf, sp, midp, nodes[node].front, move)
  else
    checkMoveNode(sf, midf, sp, midp, nodes[node].back,  move);

  // Move from the plane to the end
  if (frac2 < 0) then
    frac2 := 0;
  if (frac2 > 1) then
    frac2 := 1;

  midf := sf + (ef - sf)*frac2;
  midp.x := sp.x + (ep.x - sp.x)*frac2;
  midp.y := sp.y + (ep.y - sp.y)*frac2;
  midp.z := sp.z + (ep.z - sp.z)*frac2;
  if IsFront then
    checkMoveNode(midf, ef, midp, ep, nodes[node].back, move)
  else
    checkMoveNode(midf, ef, midp, ep, nodes[node].front, move);
end;

procedure TQuake3BSP.checkMoveLeaf(leafIndex : integer; var Move : TBSPMove);
var bb, bc, bi : integer;
    brush : TBSPBrush;
    sb, sc : integer;
    enterf, exitf : single;
    startOut, endOut, fullOut : boolean;
    hitNormal : TVector3f;
    pi : integer;
    plane : TBSPPlane;
    ofs : TVector3f;
    dist, d1, d2 : single;
    f : single;
begin
  bb := leafs[leafIndex].leafBrush;
  bc := leafs[leafIndex].numOfLeafBrushes;

  while (bc > 0) do begin
    dec(bc);
    bi := leafBrushes[bb+bc];
    brush := Brushes[bi];

    if (TextureInfo[brush.Texture].Contents and MASK_PLAYERSOLID) = 0 then //MASK_PLAYERSOLID then
      continue;

    if (brush.numOfBrushsides = 0) then
      continue;

    sb := brush.brushside;
    sc := brush.numOfBrushsides;

    enterf := -1;
    exitf := 1;

    startOut := false;
    endOut := false;
    fullOut := false;

    while (sc > 0) do begin
      dec(sc);

      pi := brushSides[sb+sc].plane;
      plane := Planes[pi];

      // Calculate distances, taking the bounding box dimensions into account
      ofs := ScaleVector(move.extents, -1);
      //ofs := InvertVector(move.BBsize);
      if (plane.normal.x < 0) then
        ofs.x := -ofs.x;

      if (plane.normal.y < 0) then
        ofs.y := -ofs.y;

      if (plane.normal.z < 0) then
        ofs.z := -ofs.z;

      dist := plane.d - DotProduct(ofs, plane.normal);
      d1 := DotProduct(move.startPoint, plane.normal) - dist;
      d2 := DotProduct(move.endPoint, plane.normal) - dist;

      if (d1 >= -DIST_EPSILON) then
        startOut := true;
      if (d2 >= -DIST_EPSILON) then
        endOut := true;

      if (d2 > 0) then
        endOut := true;
      if (d1 > 0) then
        startOut := true;

      // Both in front of face : outside this brush
      if ((d1 > 0) AND (d2 >= d1)) then begin
        fullOut := true;
        break;
      end;

      // Both behind the face : will get clipped by another plane
      if ((d1 <= 0) AND (d2 <= 0)) then
        continue;

      //float f;
      if (d1 > d2) then begin // Entering the brush
        f := (d1 - DIST_EPSILON) / (d1 - d2);
        if (f > enterf) then begin
          enterf := f;
          hitNormal := plane.normal;
        end;
      end
      else begin
        f := (d1 + DIST_EPSILON) / (d1 - d2);
        if (f < exitf) then
          exitf := f;
      end;
    end; // while sc


    if (not fullOut) then begin
      if ((not startOut) and (not endOut)) then begin
        move.fraction := 0;
        //move.leafIndex := leafIndex;
        nextLeaf := leafIndex;
        move.allSolid := true;
        move.brush := bi;
        move.normal := hitNormal;
        exit;
      end;

      if (enterf < exitf) then begin
        if (enterf > -1) and (enterf < move.fraction) then begin
          if (enterf < 0) then
            enterf := 0;
          move.fraction := enterf;
          move.normal := hitNormal;
          move.brush := bi;
        end;
      end;
    end;

    // Already fully blocked
    if (move.fraction = 0) then
      exit;

  end; // while bc
end;

// Walk through the leaf and sort the faces
procedure TQuake3BSP.WalkLeaf(leafIndex : integer;  sort : boolean);
var faceCount, faceIndex, shaderId, FogShader : integer;
    distance : single;
    facePoint : TVector3f;
    texInfo : TBSPTextureInfo;
    i : integer;
    y1, y2 : single;
begin
  fogShader := -1;
  for faceCount := 0 to Leafs[leafIndex].numOfLeafFaces - 1 do begin
    faceIndex := LeafFaces[Leafs[leafIndex].leafface + FaceCount];
    if IsModelFace[faceIndex] then
      continue;

    if sort then begin
      facePoint.x := CenterPoints[faceIndex].x  - Camera.Position.x;
      facePoint.y := CenterPoints[faceIndex].y  - Camera.Position.y;
      facePoint.z := CenterPoints[faceIndex].z  - Camera.Position.z;
      distance := sqrt(facePoint.x*facePoint.x + facePoint.y*facePoint.y + facePoint.z*facePoint.z);
      if distance < 0 then
        distance := abs(distance);
    end
    else
      distance := 0;

    if not FacesDrawn[faceIndex] then begin

      shaderId :=TextureInfo[Faces[FaceIndex].textureID].ShaderId;
      if  shaderId > -1 then begin
(*        if shaderManager[shaderId].hasFog then begin
          //currentFog := shaderId;  // remember fog
          continue; // fog faces are invisible
        end;
*)        
        if (ShaderManager[shaderId].Surface and 2048) =  2048 then continue; // nodraw

        if ShaderManager[shaderId].IsSkyBox then begin
          skyboxRequired := true;
          continue;
        end;

        if (ShaderManager[shaderId].Cull = GL_NONE) or (ShaderManager[shaderId].TotallyTrans) or (shaderManager[shaderId].hasFog) then begin
          TransparentFaces[numTransparent].FaceIndex := faceIndex;
          TransparentFaces[numTransparent].distance  := distance;
          inc(numTransparent);
        end
        else begin
          AdditiveFaces[numAdditive].FaceIndex := faceIndex;
          AdditiveFaces[numAdditive].distance := distance;
          inc(numAdditive);
        end;
      end
      else begin
{        id := Faces[faceIndex].textureID;
        if id > 0 then begin
          texInfo := TextureInfo[Faces[faceIndex].textureID];
          if (texInfo.contents and CONTENTS_FOG) = CONTENTS_FOG then begin
            currentFog := currentFog;
          end;
        end;}
        SolidFaces[numSolid].FaceIndex := faceIndex;
        SolidFaces[numSolid].distance := distance;
        inc(numSolid);
      end;

    FacesDrawn[FaceIndex] := true;
    inc(VisibleTriangles, Faces[faceIndex].numMeshVerts div 3);
    end;
  end; // faceCount
end;


procedure TQuake3BSP.SetDefaults;
begin
  glDepthFunc(GL_LEQUAL);
  glEnable(GL_DEPTH_TEST);
  glDisable(GL_ALPHA_TEST);
  glDepthMask(true);
  glDisable(GL_BLEND);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

  //  glDisable(GL_COLOR);
  if MultiTexture then begin
    //glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisableClientState(GL_COLOR_ARRAY);
    //glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisableClientState(GL_COLOR_ARRAY);
  glColor3ub(255,255,255);
  glCullFace(GL_FRONT);
  glEnable(GL_CULL_FACE);
end;

procedure TQuake3BSP.SetVertexCoords(shaderId, numOfVerts : integer);
var shader : TShader;
    i, j, nv : integer;
    args : TWaveFunc;
    startoff, off, wavesize, inc : single;
    p, v, middle, d, h : TVector3f;
    st : TVector2f;
const speed = 2.0;
begin
  shader := FShaderManager[shaderId];
  if shader.numOfDeformVertexes > 0 then begin
    startoff := 0;
    wavesize := 1;
    for i := 0 to shader.numOfDeformVertexes-1 do begin
      case shader.DeformVertexes[i].deformType of
        DEFORMVERTEXES_WAVE :
          begin
            args.func := enWave(trunc(shader.DeformVertexes[i].values[1]));
            args.base := shader.DeformVertexes[i].values[2];
            args.amp  := shader.DeformVertexes[i].values[3];
            wavesize := shader.DeformVertexes[i].values[0];
            startoff := shader.DeformVertexes[i].values[4];
            args.freq := shader.DeformVertexes[i].values[5];
            nv := numOfVerts;
            for j := 0 to numOfVerts-1 do begin
              v := inputBuffer[j].normal;
              p := inputBuffer[j].Position; // buffer it
              off := (p.x+p.y+p.z) / waveSize;
              args.phase := startoff + off;
              inc := Eval(args);
              inputBuffer[j].Position.x := p.x + inc*v.x;
              inputBuffer[j].Position.y := p.y + inc*v.y;
              inputBuffer[j].Position.z := p.z + inc*v.z;
            end;
          end;
        DEFORMVERTEXES_NORMAL :
          begin
            args.func := enWave(trunc(shader.DeformVertexes[i].values[1]));
            args.base := shader.DeformVertexes[i].values[2];
            args.amp  := shader.DeformVertexes[i].values[3];
            args.freq := shader.DeformVertexes[i].values[4];
            nv := numOfVerts;
            for j := 0 to numOfVerts-1 do begin
              v := inputBuffer[j].normal;
              p := inputBuffer[j].Position; // buffer it
              off := (p.x+p.y+p.z) / (speed*waveSize);
              args.phase := startoff + off;
              inc := Eval(args);
              inputBuffer[j].Normal.x := p.x + inc*v.x;
              inputBuffer[j].Normal.y := p.y + inc*v.y;
              inputBuffer[j].Normal.z := p.z + inc*v.z;
            end;
          end;
        DEFORMVERTEXES_MOVE :
          begin
            args.func := enWave(trunc(shader.DeformVertexes[i].values[3]));
            args.base := shader.DeformVertexes[i].values[4];
            args.amp  := shader.DeformVertexes[i].values[5];
            args.phase := shader.DeformVertexes[i].values[6];
            args.freq := shader.DeformVertexes[i].values[7];
            for j := 0 to numOfVerts-1 do begin
              inc := Eval(args);
              inputBuffer[j].position.x := inputBuffer[j].position.x + inc*shader.DeformVertexes[i].values[0];
              inputBuffer[j].position.y := inputBuffer[j].position.y + inc*shader.DeformVertexes[i].values[1];
              inputBuffer[j].position.z := inputBuffer[j].position.z + inc*shader.DeformVertexes[i].values[2];
            end;
          end;
        DEFORMVERTEXES_AUTOSPRITE :
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
        DEFORMVERTEXES_BULGE :
          begin
            args.func := WF_SIN;
            args.base := 0;
            args.amp  := shader.DeformVertexes[i].values[1];
            args.freq := 1/(speed*shader.DeformVertexes[i].values[0]);
            nv := numOfVerts;
            for j := 0 to numOfVerts-1 do begin
              st := inputBuffer[j].TextureCoord;
              v := inputBuffer[j].normal;
              p := inputBuffer[j].Position; // buffer it
              args.phase := st.X*speed*shader.DeformVertexes[i].values[2];
              inc := Eval(args);
              inputBuffer[j].Position.x := p.x + inc*v.x;
              inputBuffer[j].Position.y := p.y + inc*v.y;
              inputBuffer[j].Position.z := p.z + inc*v.z;
            end;
          end;
      end;
    end;
  end;
end;

procedure TQuake3BSP.SetVertexColors(shaderId, stageId, numOfVerts : integer);
var shader : TShader;
    i, j : integer;
    c : integer;
begin
  shader := FShaderManager[shaderId];
  for j := 0 to numOfVerts-1 do begin
    colorBuffer[j, 0] := inputBuffer[j].Color[0]; // red
    colorBuffer[j, 1] := inputBuffer[j].Color[1]; // green
    colorBuffer[j, 2] := inputBuffer[j].Color[2]; // blue
    colorBuffer[j, 3] := inputBuffer[j].Color[3]; // gamma
  end;

  if shader.numOfLayers > 0 then begin
    if shader.Layers[stageId].numOfrgbGen > 0 then begin
      case shader.Layers[stageId].rgbGen[0].rgbGType of
        rgbGen_IdentityLightning :
          begin
            for j := 0 to numOfVerts-1 do begin
              colorBuffer[j, 0] := 127; // red
              colorBuffer[j, 1] := 127; // green
              colorBuffer[j, 2] := 127; // blue
              colorBuffer[j, 3] := 255; // gamma
            end;
          end;
        rgbGen_Identity :
          begin
            for j := 0 to numOfVerts-1 do begin
              colorBuffer[j, 0] := 255; // red
              colorBuffer[j, 1] := 255; // green
              colorBuffer[j, 2] := 255; // blue
              colorBuffer[j, 3] := 255; // gamma
            end;
          end;
        rgbGen_Wave :
          begin
            c := Round(255*Eval(shader.Layers[stageId].rgbGen[0].Wave));
            if c < 0 then c := 0;
            if c > 255 then c := 255;
            for j := 0 to numOfVerts-1 do begin
              colorBuffer[j, 0] := c;   // red
              colorBuffer[j, 1] := c;   // green
              colorBuffer[j, 2] := c;   // blue
              colorBuffer[j, 3] := 255; // gamma
            end;
          end;
       else begin
        for j := 0 to numOfVerts-1 do begin
          colorBuffer[j, 0] := inputBuffer[j].Color[0]; // red
          colorBuffer[j, 1] := inputBuffer[j].Color[1]; // green
          colorBuffer[j, 2] := inputBuffer[j].Color[2]; // blue
          colorBuffer[j, 3] := inputBuffer[j].Color[3]; // gamma
        end;
       end;
      end;
    end
    else begin
      // no rgbgen use vertex colors
      for j := 0 to numOfVerts-1 do begin
        colorBuffer[j, 0] := inputBuffer[j].Color[0]; // red
        colorBuffer[j, 1] := inputBuffer[j].Color[1]; // green
        colorBuffer[j, 2] := inputBuffer[j].Color[2]; // blue
        colorBuffer[j, 3] := inputBuffer[j].Color[3]; // gamma
      end;
    end;
  end;
end;

{******************************************************************************}
{  TQuake3BSP - Prepares all texture coordinates
{******************************************************************************}

procedure TQuake3BSP.SetTextureCoordinates(shaderId, stageId, numOfVerts : integer);
var i, j : integer;
    shader : TShader;
    dir : TVector3f;
    // tcmod
    angulo, cost, sint, factor : single;
    v, scroll : TVector2f;
    v2 : TVector3f;
    now : single;
    frame : integer;
begin
  shader := FShaderManager[shaderId];
(*  for j := 0 to numOfVerts-1 do
    texCoordBuffer[j] := inputBuffer[j].TextureCoord;
*)
  if shader.numOfLayers > 0 then begin
    //Animation
    if shader.Layers[StageID].animFreq <> 0 then begin
      frame := Trunc(gTimer.TotalTime *shader.Layers[StageID].animFreq) mod shader.Layers[StageID].numOfTextures;
      if frame >= shader.Layers[StageID].numOfTextures then
        frame := 0;
      Shader.Layers[StageID].curTexture := frame;
    end
    else
      Shader.Layers[StageID].curTexture := 0;
    // tcGen  ******************************************************************
    case shader.Layers[stageId].tcGen of
      TCGEN_LIGHTMAP :
        begin
          for j := 0 to numOfVerts-1 do
            texCoordBuffer[j] := inputBuffer[j].LightmapCoord;
        end;
      TCGEN_ENVIRONMENT :
        begin
          // wrong calc !!!!
          for j := 0 to numOfVerts-1 do begin
            dir := SubtractVector(inputBuffer[j].Position, Camera.Position);//vec_sub(inputBuffer[j].Position, Camera.Position);
            //dir := Normalize(dir);//vec_normalize(dir);
            Normalize(dir);
{            dir.x := dir.x + inputBuffer[j].Normal.X;
            dir.y := dir.y + inputBuffer[j].Normal.Y;
            texCoordBuffer[j].X := dir.x;
            texCoordBuffer[j].Y := dir.y;}
            dir.x := dir.x + inputBuffer[j].Normal.X;
            dir.z := dir.z + inputBuffer[j].Normal.z;
            texCoordBuffer[j].X := dir.x;
            texCoordBuffer[j].y := dir.z;

          end;

        end;
      else
        for j := 0 to numOfVerts-1 do
          texCoordBuffer[j] := inputBuffer[j].TextureCoord;
    end;

    // tcMod *******************************************************************
    if shader.Layers[stageId].numOftcMods > 0 then begin
      for i := 0 to numOfVerts-1 do begin
        for j := 0 to shader.layers[stageId].numOftcMods-1 do begin
          case shader.Layers[stageId].tcMods[j].modType of
            TCMOD_ROTATE :
              begin
                angulo := shader.Layers[stageId].tcMods[j].Values[0]*gTimer.TotalTime/M_180_PI;
                cost := cos(angulo);
                sint := sin(angulo);
                v := texCoordBuffer[i];
                v.x := v.x - 0.5;
                v.y := v.y + 0.5;
                texCoordBuffer[i].x := v.x*cost - v.y*sint + 0.5;
                texCoordBuffer[i].y := v.x*sint + v.y*cost + 0.5;
              end;
            TCMOD_SCALE :
              begin
                texCoordBuffer[i].x := (texCoordBuffer[i].x-0.5) * shader.Layers[stageId].tcMods[j].Values[0] + 0.5;
                texCoordBuffer[i].y := (texCoordBuffer[i].y-0.5) * shader.Layers[stageId].tcMods[j].Values[1] + 0.5;
              end;
            TCMOD_SCROLL :
              begin
                scroll.x := shader.Layers[stageId].tcMods[j].Values[0]*gTimer.TotalTime;
                scroll.y := shader.Layers[stageId].tcMods[j].Values[1]*gTimer.TotalTime;
                texCoordBuffer[i].x := texCoordBuffer[i].x + scroll.x;
                texCoordBuffer[i].y := texCoordBuffer[i].y - scroll.y;
              end;
            TCMOD_STRETCH :
              begin
                factor := (1/Eval(shader.Layers[StageID].tcMods[j].Wave));
                texCoordBuffer[i].x := (texCoordBuffer[i].x - 0.5) * factor + 0.5;
                texCoordBuffer[i].y := (texCoordBuffer[i].y - 0.5) * factor + 0.5;
              end;
            TCMOD_TRANSFORM :
              begin
                v := texCoordBuffer[i];
                texCoordBuffer[i].x := v.x*shader.Layers[stageId].tcMods[j].Values[0] + v.y*shader.Layers[stageId].tcMods[j].Values[2] + shader.Layers[stageId].tcMods[j].Values[4];
                texCoordBuffer[i].y := v.x*shader.Layers[stageId].tcMods[j].Values[1] + v.y*shader.Layers[stageId].tcMods[j].Values[3] + shader.Layers[stageId].tcMods[j].Values[5];
              end;
            TCMOD_TURB :
              begin
//                v2 := inputBuffer[i].Position;
                v2.x := texCoordBuffer[i].x;
                v2.y := texCoordBuffer[i].y;
                v2.z := inputBuffer[i].Position.z;
                texCoordBuffer[i].x := texCoordBuffer[i].x + Sin((v2.x+v2.z)*0.1*shader.Layers[stageId].tcMods[j].Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values[2])*shader.Layers[stageId].tcMods[j].Values[1]*0.5;
                texCoordBuffer[i].y := texCoordBuffer[i].y + Sin((v2.y     )*0.1*shader.Layers[stageId].tcMods[j].Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values[2])*shader.Layers[stageId].tcMods[j].Values[1]*0.5;

//                v := texCoordBuffer[i];
//                texCoordBuffer[i].x := texCoordBuffer[i].x + Sin((v.x     )*0.1*shader.Layers[stageId].tcMods[j].Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values[2])*shader.Layers[stageId].tcMods[j].Values[1]*0.5;
//                texCoordBuffer[i].y := texCoordBuffer[i].y + Sin((v.y     )*0.1*shader.Layers[stageId].tcMods[j].Values[3] + gTimer.TotalTime + shader.Layers[stageId].tcMods[j].Values[2])*shader.Layers[stageId].tcMods[j].Values[1]*0.5;
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

procedure TQuake3BSP.SetFogColor(faceIndex, planeIndex, numOfVerts : integer; red, green, blue, distanceToOpaque : single);
var FogPoint, vertex : TVector3f;
    distance, gamma, pd : single;
    i : integer;
    Face : PBSPFace;
    //plane : PBSPPlane;
begin
  try
  Face := @Faces[faceIndex];
  //Plane := @Planes[planeIndex];
  for i := 0 to Faces[faceIndex].numOfVerts-1 do begin
    colorBuffer[i, 0] := Trunc(255*red);
    colorBuffer[i, 1] := Trunc(255*green);
    colorBuffer[i, 2] := Trunc(255*blue);
    FogPoint := inputBuffer[i].position;
    // Annahme: wenn die distance zur Fogplane 0 ist, immer auf transparent setzen
    //pd := PlaneDistance(FogPoint, plane.Normal, plane.d);
    //if pd = 0 then
    //  gamma := 1;

    FogPoint.x := FogPoint.x  - Camera.Position.x;
    FogPoint.y := FogPoint.y  - Camera.Position.y;
    FogPoint.z := FogPoint.z  - Camera.Position.z;
    // eye to point distance
    distance := sqrt(FogPoint.x*FogPoint.x + FogPoint.y*FogPoint.y + FogPoint.z*FogPoint.z);
    if distance >= distanceToOpaque then
      gamma := 0
    else
      gamma := 1- (distance / distanceToOpaque);
    if gamma < 0.1 then gamma := 0.1;
    colorBuffer[i, 3] := Trunc(255*gamma); // opaque = 0
  end;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
//    if DumpErrors then AddError('RenderSurfaceShader ' + lastErrorString);
  end;
end;

procedure TQuake3BSP.RenderFog(faceIndex, shaderId, planeId : integer);
var Face : PBSPFace;
    shader : TShader;
begin
  try
  Face := @Faces[faceIndex];

  shader := ShaderManager.Items[shaderId];
  //glActiveTextureARB(GL_TEXTURE1_ARB);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisable(GL_TEXTURE_2D);

  //glActiveTextureARB(GL_TEXTURE0_ARB);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);

  glDisable(GL_TEXTURE_2D);

  glDepthMask(true);
  glEnable(GL_BLEND);
  glBlendFunc(GL_ONE_MINUS_SRC_ALPHA, GL_SRC_ALPHA);


  // prepare data for global deform operations - but texture coordinates must restored for each layer !!!!!
  Move(Vertices[face.startVertIndex], inputBuffer, face.numOfVerts*sizeof(TBSPVertex));
  glVertexPointer(3, GL_FLOAT, sizeof(TBSPVertex), @inputBuffer[0].Position);

  SetFogColor(faceIndex, planeId, Face.numOfVerts, Shader.Fog.Red,Shader.Fog.Green, Shader.Fog.Blue, Shader.Fog.Distance);
  glColorPointer(4, GL_UNSIGNED_BYTE, 4, @colorBuffer[0]);
  glEnableClientState(GL_COLOR_ARRAY); // default = vertex, tex1+tex2, no color
//  glDrawArrays(GL_TRIANGLE_FAN, 0, Face.numOfVerts);
  glDrawElements(GL_TRIANGLES, face.numMeshVerts, GL_UNSIGNED_INT, @MeshVertices[face.meshVertIndex]);

  // restore rendering state
  glEnable(GL_TEXTURE_2D);
  glDisable(GL_BLEND);

  if multiTexture then begin
    //glActiveTextureARB(GL_TEXTURE1_ARB);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnable(GL_TEXTURE_2D);

    //glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  //glClientActiveTextureARB(GL_TEXTURE0_ARB);
  glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);
  SetDefaults;
  except
    lastError := glGetError();
    lastErrorString := gluErrorString(lastError);
//    if DumpErrors then AddError('RenderSurfaceShader ' + lastErrorString);
  end;
end;

procedure TQuake3BSP.SwapBoundingBoxFloat(var min, max : TVector3f);
var temp : single;
begin
  // Swap the min y and z values, then negate the new Z
  temp := min.y;
  min.y := min.z;
  min.z := -temp;
  // Swap the max y and z values, then negate the new Z
  temp := max.y;
  max.y := max.z;
  max.z := -temp;
  // swap min/max if necessary
  if min.Y > max.Y then begin
    temp := min.Y;
    min.Y := max.Y;
    max.Y := temp;
  end;
  if min.z > max.z then begin
    temp := min.z;
    min.z := max.z;
    max.z := temp;
  end;
end;

procedure TQuake3BSP.SwapBoundingBoxInteger(var min, max : TVector3i);
var temp : integer;
begin
  // Swap the min y and z values, then negate the new Z
  temp := min.y;
  min.y := min.z;
  min.z := -temp;
  // Swap the max y and z values, then negate the new Z
  temp := max.y;
  max.y := max.z;
  max.z := -temp;
  // swap min/max if necessary
  if min.Y > max.Y then begin
    temp := min.Y;
    min.Y := max.Y;
    max.Y := temp;
  end;
  if min.z > max.z then begin
    temp := min.z;
    min.z := max.z;
    max.z := temp;
  end;
end;

function TQuake3BSP.GetSurfaceType(brushIndex : integer) : string;
var texId : integer;
begin
  result := '';
  texId := Brushes[brushIndex].Texture;
  if (fileTextures[texId].flags and SURF_METALSTEPS) = SURF_METALSTEPS then
    result := 'METAL'
  else
    result := 'NORMAL';
(*  if (fileTextures[texId].contents and CONTENTS_WATER) = CONTENTS_WATER then
    result := 'WATER';
*)
end;

end.
