unit ExtOpenGL;

interface

uses OpenGL, Winapi.Windows;

procedure glBindTexture(target: GLenum; texture: Gluint); stdcall;
  external opengl32;

{ --------------------------------------------------------------------- }
{ Extentions for standard Delphi OPENGL.PAS }
{ --------------------------------------------------------------------- }

var
  glMultiTexCoord2fARB: procedure(target: GLenum; s, t: GLfloat); stdcall;
  glActiveTextureARB: procedure(target: GLenum); stdcall;
  glClientActiveTextureARB: procedure(target: GLenum); stdcall;

CONST
  GL_TEXTURE0_ARB = $84C0;
  GL_TEXTURE1_ARB = $84C1;
  GL_COMBINE_ARB = $8570;
  GL_RGB_SCALE_ARB = $8573;

  GL_CLAMP_TO_EDGE = $812F;

const
  GL_ARB_multitexture = false;
  GL_EXT_compiled_vertex_array = true;

procedure OrthoMode(left, top, right, bottom: integer);
procedure PerspectiveMode;

implementation

procedure OrthoMode(left, top, right, bottom: integer);
begin
  glMatrixMode(GL_PROJECTION);
  // Push on a new matrix so that we can just pop it off to go back to perspective mode
  glPushMatrix();
  // Reset the current matrix to our identify matrix
  glLoadIdentity();
  // Pass in our 2D ortho screen coordinates.like so (left, right, bottom, top).  The last
  // 2 parameters are the near and far planes.
  glOrtho(left, right, bottom, top, 0, 1);
  // Switch to model view so that we can render the scope image
  glMatrixMode(GL_MODELVIEW);
  // Initialize the current model view matrix with the identity matrix
  glLoadIdentity();
end;

procedure PerspectiveMode;
begin
  // Enter into our projection matrix mode
  glMatrixMode(GL_PROJECTION);
  // Pop off the last matrix pushed on when in projection mode (Get rid of ortho mode)
  glPopMatrix();
  // Go back to our model view matrix like normal
  glMatrixMode(GL_MODELVIEW);
end;

var
  LeRepere, LeRepere2: GLUint;

procedure CreerRepere();
begin
  LeRepere := glGenLists(1);
  glNewList(LeRepere, GL_COMPILE);
  glLineWidth(4.0);
  glBegin(GL_LINES);
  glcolor3f(1, 0, 0);
  glVertex3f(0, 0, 0);
  glVertex3f(20, 0, 0);

  glcolor3f(0, 1, 0);
  glVertex3f(0, 0, 0);
  glVertex3f(0, 20, 0);

  glcolor3f(0, 0, 1);
  glVertex3f(0, 0, 0);
  glVertex3f(0, 0, 20);
  glEnd();
  glEndList();

  LeRepere2 := glGenLists(1);
  glNewList(LeRepere2, GL_COMPILE);
  glLineWidth(4.0);
  glBegin(GL_LINES);
  glcolor3f(1, 1, 0);
  glVertex3f(0, 0, 0);
  glVertex3f(20, 0, 0);

  glcolor3f(0, 1, 1);
  glVertex3f(0, 0, 0);
  glVertex3f(0, 20, 0);

  glcolor3f(1, 0, 1);
  glVertex3f(0, 0, 0);
  glVertex3f(0, 0, 20);
  glEnd();
  glEndList();
end;

procedure DessinerRepere(x, y, z: real);
begin
  // glDisable(GL_DEPTH_TEST);
  glPushMatrix();
  gltranslated(x, y, z);
  glcallList(LeRepere);
  glPopMatrix();
  // glEnable(GL_DEPTH_TEST);
end;

procedure DessinerRepere2(x, y, z: real);
begin
  // glDisable(GL_DEPTH_TEST);
  glPushMatrix();
  gltranslated(x, y, z);
  glcallList(LeRepere2);
  glPopMatrix();
  // glEnable(GL_DEPTH_TEST);
end;

end.
