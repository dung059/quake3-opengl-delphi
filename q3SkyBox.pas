unit q3SkyBox;

interface

uses OpenGL12, q3types;

const
  SKY_SEQGS: integer = 180;
  RAD : single = Pi / 180;

type
  TSkyBox = class(TObject)
  private
    SKY_MAX : Single;
    SKY_RES : integer;

    FSkyType : integer;
    FIndex : integer;
    FnumOfVerts : integer;
    FGlobePoints : array of TBSPVertex;


    FPoints : array of TBSPVertex;
    FnumOfPoints  : integer;

    Ftriangle_count : integer;
    FTextures : array [0..5] of cardinal;

    FList : integer;

    procedure MakeSphereVert(sx, sy, xadd, yadd : integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Init(DepthOfView, Resolution, SkyType : integer; texIds : array of cardinal);
    procedure CalcRenderPoints(pos : TVector3f);
    procedure CopyData(var Dest );
    procedure DrawBox(pos : TVector3f);
    property TriangleCount : integer read Ftriangle_count;
    property SkyType : integer read FSkyType;
  end;


implementation

uses Frustum, Global;

constructor TSkybox.Create;
begin
  SKY_MAX := 5000;
  SKY_RES := 18;
  FList := -1;
end;

destructor TSkybox.Destroy;
begin
  SetLength(FGlobePoints, 0);
  SetLength(FPoints, 0);
  inherited Destroy;
end;

procedure TSkybox.Init(DepthOfView, Resolution, SkyType : integer; texIds : array of cardinal);
var sx, sy : integer;
    i : integer;
begin
  SKY_MAX := WORLD_MAX*1.4;
  SKY_RES := Resolution;

  FSkyType := SkyType;

  if FSkyType = 1 then begin
    // spherical
    FnumOfVerts := ((SKY_SEQGS div SKY_RES) * (180 div SKY_RES)) * 10;
    SetLength(FGlobePoints, FnumOfVerts);
    SetLength(FPoints, FnumOfVerts);
    FIndex := 0;

    sx := 0;
    while (sx < (SKY_SEQGS-1)) do begin
      sy := 0;
      while sy < 90 do begin
        MakeSphereVert( sx, sy, 0, 0);
        MakeSphereVert( sx, sy, 0, SKY_RES);
        MakeSphereVert( sx, sy, SKY_RES, 0);

        MakeSphereVert( sx, sy, SKY_RES, 0);
        MakeSphereVert( sx, sy, 0, SKY_RES);
        MakeSphereVert( sx, sy, SKY_RES, SKY_RES);
        inc(sy, SKY_RES);
      end;

      sy := 270;
      while sy < 360 do begin
        MakeSphereVert( sx, sy, 0, 0);
        MakeSphereVert( sx, sy, 0, SKY_RES);
        MakeSphereVert( sx, sy, SKY_RES, 0);

        MakeSphereVert( sx, sy, SKY_RES, 0);
        MakeSphereVert( sx, sy, 0, SKY_RES);
        MakeSphereVert( sx, sy, SKY_RES, SKY_RES);
        inc(sy, SKY_RES);
      end;
      inc(sx, SKY_RES);
    end;
  end
  else begin
    // real box
    for i := 0 to 5 do
      FTextures[i] := texIds[i];
  end;
end;

procedure TSkybox.MakeSphereVert(sx, sy, xadd, yadd : integer);
begin
  FGlobePoints[Findex].Position.x := (SKY_MAX * Cos((sx + xadd) * Rad)) * (Cos((sy + yadd) * Rad));
  FGlobePoints[Findex].Position.y := (SKY_MAX * Sin((sx + xadd) * Rad)) * (Cos((sy + yadd) * Rad)) - SKY_MAX/2;
  FGlobePoints[Findex].Position.z :=  SKY_MAX * Sin((sy + yadd) * Rad);
  FGlobePoints[Findex].TextureCoord.x := ((sx + xadd) / 90);
  FGlobePoints[Findex].TextureCoord.y := ((sy + yadd) / 90);
  FGlobePoints[Findex].Color[0] := 255;
  FGlobePoints[Findex].Color[1] := 255;
  FGlobePoints[Findex].Color[2] := 255;
  inc(Findex);
end;

procedure TSkybox.CalcRenderPoints(pos : TVector3f);
var i, j : integer;
begin
  if FSkyType = 1 then begin
    Ftriangle_count := 0;
    FnumOfPoints := 0;
    i := 0;
    while (i < FNumOfVerts) do begin
      if frust.PointInFrustum(FGlobePoints[i].Position.x+pos.x,   FGlobePoints[i].Position.y+pos.y,   FGlobePoints[i].Position.z+pos.z) or
         frust.PointInFrustum(FGlobePoints[i+1].Position.x+pos.x, FGlobePoints[i+1].Position.y+pos.y, FGlobePoints[i+1].Position.z+pos.z) or
         frust.PointInFrustum(FGlobePoints[i+2].Position.x+pos.x, FGlobePoints[i+2].Position.y+pos.y, FGlobePoints[i+2].Position.z+pos.z) or
         frust.PointInFrustum(FGlobePoints[i+5].Position.x+pos.x, FGlobePoints[i+5].Position.y+pos.y, FGlobePoints[i+5].Position.z+pos.z) then begin

        for j := 0 to 5 do begin
          FPoints[FnumOfPoints+j] := FGlobePoints[i+j];
          FPoints[FnumOfPoints+j].Position.x := FPoints[FnumOfPoints+j].Position.x + pos.x;
          FPoints[FnumOfPoints+j].Position.y := FPoints[FnumOfPoints+j].Position.y + pos.y;
          FPoints[FnumOfPoints+j].Position.z := FPoints[FnumOfPoints+j].Position.z + pos.z;
        end;
        inc(Ftriangle_count, 2);
        inc(FnumOfPoints, 6);
       end;

      inc(i, 6);
    end;
  end
  else begin
    for i := 0 to FnumOfVerts-1 do begin
       FPoints[i] := FGlobePoints[i];
       FPoints[i].Position.x := FPoints[i].Position.x + pos.x;
       FPoints[i].Position.y := FPoints[i].Position.y + pos.y;
       FPoints[i].Position.z := FPoints[i].Position.z + pos.z;
    end;
  end;
end;

procedure TSkybox.CopyData(var Dest);
begin
  Move(FPoints[0], Dest, FnumOfPoints*sizeof(TBSPVertex));
end;

procedure TSkybox.DrawBox(pos : TVector3f);
var px,py,pz : TGLFloat;
    dov : single;
begin
  if FList = -1 then begin
    dov := WORLD_MAX*2;
    // left, back und top sind falsch
    px := (- dov  / 2);//+pos.x;
    py := (- dov / 2);//+pos.y;
    pz := (- dov / 2);//+pos.z;

    FList := glGenLists(1);
    glNewList(FList, GL_COMPILE);
    // Back
    glBindTexture(GL_TEXTURE_2D, FTextures[3]);
    glBegin(GL_QUADS);
      glTexCoord2f(1, 0); glVertex3f(px + dov, py,           pz);
      glTexCoord2f(1, 1); glVertex3f(px + dov, py + dov, pz);
      glTexCoord2f(0, 1); glVertex3f(px,          py + dov, pz);
      glTexCoord2f(0, 0); glVertex3f(px,          py,           pz);

    glEnd;
    // Front
    glBindTexture(GL_TEXTURE_2D, FTextures[2]);
    glBegin(GL_QUADS);
      glTexCoord2f(1, 0); glVertex3f(px,	      py,           pz + dov);
      glTexCoord2f(1, 1); glVertex3f(px,          py + dov, pz + dov);
      glTexCoord2f(0, 1); glVertex3f(px + dov, py + dov, pz + dov);
      glTexCoord2f(0, 0); glVertex3f(px + dov, py,           pz + dov);
    glEnd;
    // Bottom
    glBindTexture(GL_TEXTURE_2D, FTextures[5]);
    glBegin(GL_QUADS);
      glTexCoord2f(1, 1); glVertex3f(px,	     py, pz);
      glTexCoord2f(1, 0); glVertex3f(px,	     py, pz + dov);
      glTexCoord2f(0, 0); glVertex3f(px + dov, py, pz + dov);
      glTexCoord2f(0, 1); glVertex3f(px + dov, py, pz);
    glEnd;
    // Top
    glBindTexture(GL_TEXTURE_2D, FTextures[4]);
    glBegin(GL_QUADS);
      glTexCoord2f(0, 0); glVertex3f(px+dov, py + dov, pz);
      glTexCoord2f(1, 0); glVertex3f(px+dov, py + dov, pz + dov);
      glTexCoord2f(1, 1); glVertex3f(px,       py + dov, pz + dov);
      glTexCoord2f(0, 1); glVertex3f(px,       py + dov, pz);
    glEnd;
    // Left
    glBindTexture(GL_TEXTURE_2D, FTextures[1]);
    glBegin(GL_QUADS);
      glTexCoord2f(1, 1); glVertex3f(px, py + dov, pz);
      glTexCoord2f(0, 1); glVertex3f(px, py + dov, pz + dov);
      glTexCoord2f(0, 0); glVertex3f(px, py,           pz + dov);
      glTexCoord2f(1, 0); glVertex3f(px, py,           pz);
    glEnd;

    // Right
    glBindTexture(GL_TEXTURE_2D, FTextures[0]);
    glBegin(GL_QUADS);
      glTexCoord2f(0, 0); glVertex3f(px + dov, py,           pz);
      glTexCoord2f(1, 0); glVertex3f(px + dov, py,           pz + dov);
      glTexCoord2f(1, 1); glVertex3f(px + dov, py + dov, pz + dov);
      glTexCoord2f(0, 1); glVertex3f(px + dov, py + dov, pz);
    glEnd;
    glEndList;
  end;
  // Call the Displaylist of our Skybox
  glMatrixMode(GL_MODELVIEW);
  glPushMatrix;
  glTranslatef(pos.X, pos.y, pos.Z);
  glCallList(FList);
  glPopMatrix;
end;

end.

