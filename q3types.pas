unit q3types;

interface

uses OpenGl;

const FACE_POLYGON   = 1;
      FACE_PATCH     = 2;
      FACE_MESH      = 3;
      FACE_BILLBOARD = 4;

      DIST_EPSILON = 1/32; //0.000001;

      Q3_FONT = 0;
      Q3_BACK = 1;

      CONTENTS_SOLID = 1; // an eye is never valid in a solid
      CONTENTS_WINDOW = 2; // translucent, but not watery
      CONTENTS_AUX = 4;
      CONTENTS_LAVA = 8;
      CONTENTS_SLIME = 16;
      CONTENTS_WATER = 32;
      CONTENTS_FOG = 64;
      LAST_VISIBLE_CONTENTS = 64;

      // remaining contents are non-visible, and don't eat brushes
      CONTENTS_AREAPORTAL =    $8000;
      CONTENTS_PLAYERCLIP =    $10000;
      CONTENTS_MONSTERCLIP =   $20000;
      CONTENTS_TELEPORTER  =   $40000;
      CONTENTS_JUMPPAD	   =   $80000;
      CONTENTS_CLUSTERPORTAL = $100000;
      CONTENTS_DONOTENTER  =   $200000;
      CONTENTS_BOTCLIP	   =   $400000;
      CONTENTS_MOVER	   =   $800000;

      CONTENTS_ORIGIN =      $1000000; // removed before bsping an entity
      CONTENTS_MONSTER =     $2000000; // should never be on a brush, only in game
      CONTENTS_DEADMONSTER = $4000000;
      CONTENTS_DETAIL =      $8000000; // brushes to be added after vis leafs
      CONTENTS_STRUCTURAL  = $10000000;
      CONTENTS_TRANSLUCENT = $20000000; // auto set if any surface has trans
      CONTENTS_LADDER =      $20000000;
      CONTENTS_NODROP =      $80000000;
                             
      MASK_PLAYERSOLID = CONTENTS_SOLID + CONTENTS_PLAYERCLIP + CONTENTS_MONSTER + CONTENTS_WINDOW ;

      // Following flags are used in surface_flags (cf. shader)
      SURF_NODAMAGE	   = $1;	// never give falling damage
      SURF_SLICK	   = $2;	// effects game physics
      SURF_SKY		   = $4;	// lighting from environment map
      SURF_LADDER	   = $8;
      SURF_NOIMPACT	   = $10;	// don't make missile explosions
      SURF_NOMARKS	   = $20;	// don't leave missile marks
      SURF_FLESH	   = $40;	// make flesh sounds and effects
      SURF_NODRAW	   = $80;	// don't generate a drawsurface at all
      SURF_HINT		   = $100;	// make a primary bsp splitter
      SURF_SKIP		   = $200;	// completely ignore, allowing non-closed brushes
      SURF_NOLIGHTMAP	   = $400;	// surface doesn't need a lightmap
      SURF_POINTLIGHT      = $800;	// generate lighting info at vertexes
      SURF_METALSTEPS	   = $1000;	// clanking footsteps
      SURF_NOSTEPS	   = $2000;	// no footstep sounds
      SURF_NONSOLID	   = $4000;	// don't collide against curves with this set
      SURF_LIGHTFILTER	   = $8000;	// act as a light filter during q3map -light
      SURF_ALPHASHADOW	   = $10000;	// do per-pixel light shadow casting in q3map
      SURF_NODLIGHT	   = $20000;	// don't light even if solid (solid lava, skies)
      SURF_DUST		   = $40000;   // leave a dust trail when walking on this surface


type TRGBA = array[0..3] of GLUbyte;

type TVector3i = record
  X, Y, Z : integer;                    // The x y and z position of our integer vector
end;

type TVector2f = record
  X, Y : single;
end;

type TVector3f = record
  X, Y, Z : single;
end;

type TBSPBoundingBox = record
  min : TVector3f;      				// The bounding box min position.
  max : TVector3f;	        			// The bounding box max position.
end;

type TBSPPosition = record
  Position : TVector3f;
  Angle : single;
end;

type TBSPHeader = record
  strID : array[0..3] of ansichar;           // This should always be 'IBSP'
  Version : integer;                     // This should be 0x2e for Quake 3 files
end;

type TBSPLump = record
  Offset : integer;                      // The offset into the file for the start of this lump
  Length : integer;                      // The length in bytes for this lump
end;

type TBSPVertex = record
  Position      : TVector3f;             // (x, y, z) position.
  TextureCoord  : TVector2f;             // (u, v) texture coordinate
  LightmapCoord : TVector2f;             // (u, v) lightmap coordinate
  Normal        : TVector3f;             // (x, y, z) normal vector
  Color         : array[0..3] of Byte    // RGBA color for the vertex
end;

type TBSPFace = record
  textureID : integer;                   // The index into the texture array
  effect    : integer;                   // The index for the effects (or -1 = n/a)
  FaceType  : integer;                   // 1=polygon, 2=patch, 3=mesh, 4=billboard
  startVertIndex : integer;              // The starting index into this face's first vertex
  numOfVerts     : integer;              // The number of vertices for this face
  meshVertIndex  : integer;              // The index into the first meshvertex
  numMeshVerts   : integer;              // The number of mesh vertices
  lightmapID     : integer;              // The texture index for the lightmap
  lMapCorner : array[0..1] of integer;   // The face's lightmap corner in the image
  lMapSize   : array[0..1] of integer;   // The size of the lightmap section
  lMapPos  : TVector3f;                  // The 3D origin of lightmap.
  lMapVecs : array[0..1] of TVector3f;   // The 3D space for s and t unit vectors.
  Normal  : TVector3f;                  // The face normal.
  Size : array[0..1] of integer;         // The bezier patch dimensions.
end;
type PBSPFace = ^TBSPFace;

type TBSPQuadricPatch = record
  ControlPoints : array[0..8] of TBSPVertex;
  Verts : array of TBSPVertex;
  numOfVerts : integer;
  Indx : array of cardinal;
  meshIndex : array of cardinal;
  numOfIndices : integer;
  trianglesPerRow : array of integer;
  rowIndexPointers : array of ^integer;
end;

type TBSPQuadricPatchArray = array of TBSPQuadricPatch;

type TQ3FileTexture = record
  TextureName : array[0..63] of ansichar;    // The name of the texture w/o the extension
  flags    : cardinal;                    // The surface flags (unknown)
  contents : cardinal;                    // The content flags (unknown)
end;

// enhancemanet of textures
// the array is used for faces.textureId
type TBSPTextureInfo = record
  TextureName : string;    // The name of the texture w/o the extension
  TextureId : cardinal;    // OGL texture id
  surface   : cardinal;    // The surface flags (unknown)
  contents : cardinal;     // The content flags (unknown)
  ShaderId : integer;      //
  Format  : integer;       // rgb or rgba
  PicMip : boolean;
  MipMap : boolean;
  Clamp : boolean; 
end;

type TBSPLightmap = record
  imageBits : array[0..127, 0..127, 0..2] of byte;   // The RGB data in a 128x128 image
end;

type TBSPNode = record
  plane : integer;					// The index into the planes array
  front : integer;					// The child index for the front node
  back : integer;					// The child index for the back node
  min : TVector3i;      				// The bounding box min position.
  max : TVector3i;	        			// The bounding box max position.
end;

type PBSPNode = ^TBSPNode;

type TBSPLeaf = record
  cluster : integer;				// The visibility cluster
  area : integer;				// The area portal
  min :  TVector3i;      			// The bounding box min position.
  max : TVector3i;	        		// The bounding box max position.
  leafface : integer;				// The first index into the face array
  numOfLeafFaces : integer;			// The number of faces for this leaf
  leafBrush : integer;				// The first index for into the brushes
  numOfLeafBrushes : integer;   		// The number of brushes for this leaf
end;
type PBSPLeaf = ^TBSPLeaf;

type TBSPPlane = record
    Normal : TVector3f;			// Plane normal.
    d : single;	                        // The plane distance from origin
end;
type PBSPPlane = ^TBSPPlane;

type TBSPVisData = record
  numOfClusters : integer;		// The number of clusters
  bytesPerCluster : integer;		// The amount of bytes (8 bits) in the cluster's bitset
  Bitsets : array of byte;		// The array of bytes that holds the cluster bitsets
end;

type TBSPBrush = record
  brushside       ,           // First brushside for brush
  numOfBrushsides ,           // Number of brushsides for brush
  Texture         : integer;  // Texture index
end;

type TBSPBrushSide=record
  plane   ,                   // Plane Index
  texture : integer;          // Texture Index
end;

type TBSPModel = record
  min              : TVector3f;       // The min position for the bounding box
  max              : TVector3f;       // The max position for the bounding box.
  faceIndex        : integer;         // The first face index in the model
  numOfFaces       : integer;         // The number of faces in the model
  brushIndex       : integer;         // The first brush index in the model
  numOfBrushes     : integer;         // The number brushes for the model
end;

type TFileEffect = record
  Name        : array[0..63] of ansichar;  // effect shader
  brushIndex  : integer;               // brush that generated this effect
  visibleSide : integer;               // the brush side that ray tests need to clip against (-1 == none)
end;

type TBSPEffect = record
  shaderIndex : integer; 
  brushIndex  : integer;               // brush that generated this effect
  visibleSide : integer;               // the brush side that ray tests need to clip against (-1 == none)
end;

type TBSPMove = record // structure used for collision check
  fraction   : single;
  startPoint : TVector3f;
  endPoint   : TVector3f;
  extents    : TVector3f;
//  BBsize     : TVector3f; // Size of the bounding box / 2
//  BBmin      : TVector3i; // Bounding box info
//  BBmax      : TVector3i;
  Normal     : TVector3f; // Normal at collision point
  allSolid   : boolean;
  leafIndex  : integer;
  brush : integer;
end;

const
  kEntities    = 0;            // Stores player/object positions, etc...
  kTextures    = 1;            // Stores texture information
  kPlanes      = 2;            // Stores the splitting planes
  kNodes       = 3;            // Stores the BSP nodes
  kLeafs       = 4;            // Stores the leafs of the nodes
  kLeafFaces   = 5;            // Stores the leaf's indices into the faces
  kLeafBrushes = 6;            // Stores the leaf's indices into the brushes
  kModels      = 7;            // Stores the info of world models
  kBrushes     = 8;            // Stores the brushes info (for collision)
  kBrushSides  = 9;            // Stores the brush surfaces info
  kVertices    = 10;           // Stores the level vertices
  kMeshVerts   = 11;           // Stores the model vertices offsets
  kEffects     = 12;           // Stores the effect shaders (face to brush)
  kFaces       = 13;           // Stores the faces for the level
  kLightmaps   = 14;           // Stores the lightmaps for the level
  kLightVolumes= 15;           // Stores extra world lighting information
  kVisData     = 16;           // Stores PVS and cluster info (visibility)
  kMaxLumps    = 19;           // A constant to store the number of lumps



implementation

end.
