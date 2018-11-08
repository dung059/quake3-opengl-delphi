unit Frustum;

interface

uses OpenGL;

// This is the index in our selection buffer that has the closet object ID clicked
const FIRST_OBJECT_ID  = 3;
// We create an enum of the sides so we don't have to call each side 0 or 1.
// This way it makes it more understandable and readable when dealing with frustum sides.
// enum FrustumSide
      RIGHT	= 0;		// The RIGHT side of the frustum
      LEFT	= 1;		// The LEFT	 side of the frustum
      BOTTOM	= 2;		// The BOTTOM side of the frustum
      TOP  	= 3;		// The TOP side of the frustum
      BACK	= 4;		// The BACK	side of the frustum
      FRONT	= 5;  		// The FRONT side of the frustum
// Like above, instead of saying a number for the ABC and D of the plane, we
// want to be more descriptive.
// enum PlaneData
      A = 0;			// The X value of the plane's normal
      B = 1;			// The Y value of the plane's normal
      C = 2;			// The Z value of the plane's normal
      D = 3;			// The distance the plane is from the origin


type
  TFrustumArray =  array[0..5, 0..3] of single;
  TFrustum = class(TObject)
  private
    mFrustum : TFrustumArray;
  public
    // Call this every time the camera moves to update the frustum
    procedure CalculateFrustum;
    // This takes a 3D point and returns TRUE if it's inside of the frustum
    function PointInFrustum(x, y, z : single) : boolean;
    // This takes a 3D point and a radius and returns TRUE if the sphere is inside of the frustum
    function SphereInFrustum(x, y, z, radius : single) : boolean;
    // This takes the center and half the length of the cube.
    function CubeInFrustum(x, y, z, size : single) : boolean;
    // This checks if a box is in the frustum
    function BoxInFrustum(x, y, z, x2, y2, z2 : single) : boolean;
    procedure NormalizePlane(side : integer);
  end;

var frust : TFrustum;

implementation

///////////////////////////////// NORMALIZE PLANE \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
/////
/////	This normalizes a plane (A side) from a given frustum.
/////
///////////////////////////////// NORMALIZE PLANE \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
procedure TFrustum.NormalizePlane(side : integer);
var magnitude : single;
begin
  // Here we calculate the magnitude of the normal to the plane (point A B C)
  // Remember that (A, B, C) is that same thing as the normal's (X, Y, Z).
  // To calculate magnitude you use the equation:  magnitude = sqrt( x^2 + y^2 + z^2)
  magnitude := Sqrt(mFrustum[side, A] * mFrustum[side, A] +
                    mFrustum[side, B] * mFrustum[side, B] +
                    mFrustum[side, C] * mFrustum[side, C] );

  // Then we divide the plane's values by it's magnitude.
  // This makes it easier to work with.
  mFrustum[side, A] := mFrustum[side, A] / magnitude;
  mFrustum[side, B] := mFrustum[side, B] / magnitude;
  mFrustum[side, C] := mFrustum[side, C] / magnitude;
  mFrustum[side, D] := mFrustum[side, D] / magnitude;
end;

///////////////////////////////// CALCULATE mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
/////
/////	This extracts our mFrustum from the projection and modelview matrix.
/////
///////////////////////////////// CALCULATE mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
procedure TFrustum.CalculateFrustum;
var proj : array[0..15] of single;// This will hold our projection matrix
    modl : array[0..15] of single;// This will hold our modelview matrix
    clip : array[0..15] of single;// This will hold the clipping planes
begin
  // glGetFloatv() is used to extract information about our OpenGL world.
  // Below, we pass in GL_PROJECTION_MATRIX to abstract our projection matrix.
  // It then stores the matrix into an array of [16].
  glGetFloatv( GL_PROJECTION_MATRIX, @proj );

  // By passing in GL_MODELVIEW_MATRIX, we can abstract our model view matrix.
  // This also stores it in an array of [16].
  glGetFloatv( GL_MODELVIEW_MATRIX, @modl );

  // Now that we have our modelview and projection matrix, if we combine these 2 matrices,
  // it will give us our clipping planes.  To combine 2 matrices, we multiply them.
  clip[ 0] := modl[ 0] * proj[ 0] + modl[ 1] * proj[ 4] + modl[ 2] * proj[ 8] + modl[ 3] * proj[12];
  clip[ 1] := modl[ 0] * proj[ 1] + modl[ 1] * proj[ 5] + modl[ 2] * proj[ 9] + modl[ 3] * proj[13];
  clip[ 2] := modl[ 0] * proj[ 2] + modl[ 1] * proj[ 6] + modl[ 2] * proj[10] + modl[ 3] * proj[14];
  clip[ 3] := modl[ 0] * proj[ 3] + modl[ 1] * proj[ 7] + modl[ 2] * proj[11] + modl[ 3] * proj[15];

  clip[ 4] := modl[ 4] * proj[ 0] + modl[ 5] * proj[ 4] + modl[ 6] * proj[ 8] + modl[ 7] * proj[12];
  clip[ 5] := modl[ 4] * proj[ 1] + modl[ 5] * proj[ 5] + modl[ 6] * proj[ 9] + modl[ 7] * proj[13];
  clip[ 6] := modl[ 4] * proj[ 2] + modl[ 5] * proj[ 6] + modl[ 6] * proj[10] + modl[ 7] * proj[14];
  clip[ 7] := modl[ 4] * proj[ 3] + modl[ 5] * proj[ 7] + modl[ 6] * proj[11] + modl[ 7] * proj[15];

  clip[ 8] := modl[ 8] * proj[ 0] + modl[ 9] * proj[ 4] + modl[10] * proj[ 8] + modl[11] * proj[12];
  clip[ 9] := modl[ 8] * proj[ 1] + modl[ 9] * proj[ 5] + modl[10] * proj[ 9] + modl[11] * proj[13];
  clip[10] := modl[ 8] * proj[ 2] + modl[ 9] * proj[ 6] + modl[10] * proj[10] + modl[11] * proj[14];
  clip[11] := modl[ 8] * proj[ 3] + modl[ 9] * proj[ 7] + modl[10] * proj[11] + modl[11] * proj[15];

  clip[12] := modl[12] * proj[ 0] + modl[13] * proj[ 4] + modl[14] * proj[ 8] + modl[15] * proj[12];
  clip[13] := modl[12] * proj[ 1] + modl[13] * proj[ 5] + modl[14] * proj[ 9] + modl[15] * proj[13];
  clip[14] := modl[12] * proj[ 2] + modl[13] * proj[ 6] + modl[14] * proj[10] + modl[15] * proj[14];
  clip[15] := modl[12] * proj[ 3] + modl[13] * proj[ 7] + modl[14] * proj[11] + modl[15] * proj[15];

  // Now we actually want to get the sides of the mFrustum.  To do this we take
  // the clipping planes we received above and extract the sides from them.

  // This will extract the RIGHT side of the mFrustum
  mFrustum[RIGHT, A] := clip[ 3] - clip[ 0];
  mFrustum[RIGHT, B] := clip[ 7] - clip[ 4];
  mFrustum[RIGHT, C] := clip[11] - clip[ 8];
  mFrustum[RIGHT, D] := clip[15] - clip[12];

  // Now that we have a normal (A,B,C) and a distance (D) to the plane,
  // we want to normalize that normal and distance.

  // Normalize the RIGHT side
  //NormalizePlane(RIGHT);

  // This will extract the LEFT side of the mFrustum
  mFrustum[LEFT, A] := clip[ 3] + clip[ 0];
  mFrustum[LEFT, B] := clip[ 7] + clip[ 4];
  mFrustum[LEFT, C] := clip[11] + clip[ 8];
  mFrustum[LEFT, D] := clip[15] + clip[12];

  // Normalize the LEFT side
  //NormalizePlane(LEFT);

  // This will extract the BOTTOM side of the mFrustum
  mFrustum[BOTTOM, A] := clip[ 3] + clip[ 1];
  mFrustum[BOTTOM, B] := clip[ 7] + clip[ 5];
  mFrustum[BOTTOM, C] := clip[11] + clip[ 9];
  mFrustum[BOTTOM, D] := clip[15] + clip[13];

  // Normalize the BOTTOM side
  //NormalizePlane(BOTTOM);

  // This will extract the TOP side of the mFrustum
  mFrustum[TOP, A] := clip[ 3] - clip[ 1];
  mFrustum[TOP, B] := clip[ 7] - clip[ 5];
  mFrustum[TOP, C] := clip[11] - clip[ 9];
  mFrustum[TOP, D] := clip[15] - clip[13];

  // Normalize the TOP side
  //NormalizePlane(TOP);

  // This will extract the BACK side of the mFrustum
  mFrustum[BACK, A] := clip[ 3] - clip[ 2];
  mFrustum[BACK, B] := clip[ 7] - clip[ 6];
  mFrustum[BACK, C] := clip[11] - clip[10];
  mFrustum[BACK, D] := clip[15] - clip[14];

  // Normalize the BACK side
  //NormalizePlane(BACK);

  // This will extract the FRONT side of the mFrustum
  mFrustum[FRONT, A] := clip[ 3] + clip[ 2];
  mFrustum[FRONT, B] := clip[ 7] + clip[ 6];
  mFrustum[FRONT, C] := clip[11] + clip[10];
  mFrustum[FRONT, D] := clip[15] + clip[14];

  // Normalize the FRONT side
  //NormalizePlane(FRONT);
end;

// The code below will allow us to make checks within the mFrustum.  For example,
// if we want to see if a point, a sphere, or a cube lies inside of the mFrustum.
// Because all of our planes point INWARDS (The normals are all pointing inside the mFrustum)
// we then can assume that if a point is in FRONT of all of the planes, it's inside.

///////////////////////////////// POINT IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
/////
/////	This determines if a point is inside of the mFrustum
/////
///////////////////////////////// POINT IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
function TFrustum. PointInFrustum(x, y, z : single) : boolean;
var i : integer;
begin
  // Go through all the sides of the mFrustum
  for i := 0 to 5 do begin
    // Calculate the plane equation and check if the point is behind a side of the mFrustum
    if (mFrustum[i, A] * x + mFrustum[i, B] * y + mFrustum[i, C] * z + mFrustum[i, D] <= 0) then begin
      // The point was behind a side, so it ISN'T in the mFrustum
      result := false;
      exit;
    end;
  end;
  // The point was inside of the mFrustum (In front of ALL the sides of the mFrustum)
  result := true;
end;


///////////////////////////////// SPHERE IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
/////
/////	This determines if a sphere is inside of our mFrustum by it's center and radius.
/////
///////////////////////////////// SPHERE IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
function TFrustum.SphereInFrustum(x, y, z, radius : single) : boolean;
var i : integer;
begin
  // Go through all the sides of the mFrustum
  for i := 0 to 5 do begin
    // If the center of the sphere is farther away from the plane than the radius
    if (mFrustum[i, A] * x + mFrustum[i, B] * y + mFrustum[i, C] * z + mFrustum[i, D] <= -radius ) then begin
      // The distance was greater than the radius so the sphere is outside of the mFrustum
      result := false;
      exit;
    end;
  end;
  // The sphere was inside of the mFrustum!
  result := true;
end;


///////////////////////////////// CUBE IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
/////
/////	This determines if a cube is in or around our mFrustum by it's center and 1/2 it's length
/////
///////////////////////////////// CUBE IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
function TFrustum.CubeInFrustum(x, y, z, size : single) : boolean;
var i : integer;
begin
  // Basically, what is going on is, that we are given the center of the cube,
  // and half the length.  Think of it like a radius.  Then we checking each point
  // in the cube and seeing if it is inside the mFrustum.  If a point is found in front
  // of a side, then we skip to the next side.  If we get to a plane that does NOT have
  // a point in front of it, then it will return false.
  // *NOTE* - This will sometimes say that a cube is inside the mFrustum when it isn't.
  // This happens when all the corners of the bounding box are not behind any one plane.
  // This is rare and shouldn't effect the overall rendering speed.

  for i := 0 to 5 do begin
    if (mFrustum[i, A] * (x - size) + mFrustum[i, B] * (y - size) + mFrustum[i, C] * (z - size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x + size) + mFrustum[i, B] * (y - size) + mFrustum[i, C] * (z - size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x - size) + mFrustum[i, B] * (y + size) + mFrustum[i, C] * (z - size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x + size) + mFrustum[i, B] * (y + size) + mFrustum[i, C] * (z - size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x - size) + mFrustum[i, B] * (y - size) + mFrustum[i, C] * (z + size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x + size) + mFrustum[i, B] * (y - size) + mFrustum[i, C] * (z + size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x - size) + mFrustum[i, B] * (y + size) + mFrustum[i, C] * (z + size) + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * (x + size) + mFrustum[i, B] * (y + size) + mFrustum[i, C] * (z + size) + mFrustum[i, D] > 0) then continue;
    // If we get here, it isn't in the mFrustum
    result := false;
    exit;
  end;
  result := true;
end;

///////////////////////////////// BOX IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
/////
/////	This determines if a BOX is in or around our mFrustum by it's min and max points
/////
///////////////////////////////// BOX IN mFrustum \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*
function TFrustum.BoxInFrustum(x, y, z, x2, y2, z2 : single) : boolean;
var i : integer;
begin
  // Go through all of the corners of the box and check then again each plane
  // in the mFrustum.  If all of them are behind one of the planes, then it most
  // like is not in the mFrustum.
  for i := 0 to 5 do begin
    if (mFrustum[i, A] * x  + mFrustum[i, B] * y  + mFrustum[i, C] * z  + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x2 + mFrustum[i, B] * y  + mFrustum[i, C] * z  + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x  + mFrustum[i, B] * y2 + mFrustum[i, C] * z  + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x2 + mFrustum[i, B] * y2 + mFrustum[i, C] * z  + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x  + mFrustum[i, B] * y  + mFrustum[i, C] * z2 + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x2 + mFrustum[i, B] * y  + mFrustum[i, C] * z2 + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x  + mFrustum[i, B] * y2 + mFrustum[i, C] * z2 + mFrustum[i, D] > 0) then continue;
    if (mFrustum[i, A] * x2 + mFrustum[i, B] * y2 + mFrustum[i, C] * z2 + mFrustum[i, D] > 0) then continue;
    result := false;
    exit;
  end;
  // Return a true for the box being inside of the mFrustum
  result := true;
end;

/////////////////////////////////////////////////////////////////////////////////
//
// * QUICK NOTES * 
//
// This file holds the mFrustum and debug class prototypes.
//
// 
// Ben Humphrey (DigiBen)
// Game Programmer
// DigiBen@GameTutorials.com
// Co-Web Host of www.GameTutorials.com
//

end.
