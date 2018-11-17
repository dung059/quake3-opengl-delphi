unit glFlash;

interface

procedure FlashglDraw();
procedure FlashProcessKeys;
procedure FlashglInit();

implementation

uses
  Winapi.OpenGL, global, Textures, q3timer, Winapi.Windows, System.SysUtils,
  q3Threads, System.Classes;

var
  ShowCube   : Boolean;
  Blend : Boolean;
  MyQuadratic : GLUquadricObj;	// Storage For Our Quadratic Objects
  point : Array[0..36, 0..36, 1..3] of glFloat;
  ProgressTex, Imagetextlogo: glUint;
  Stage, frameflash: Integer;

procedure Scene1();
var x, y : Integer;
    xf, xf2, yf, yf2 : glfloat;
    Angle : glFLoat;
begin
  Angle :=(startTime + ElapsedTIme)/2;   // provides smoother movement
  ANgle :=Angle/4;
  endTime := ElapsedTime;

    glTranslatef(0, 0, -6);
    glRotatef(-Angle/5,0, 0, 1);
    glBindTexture(GL_TEXTURE_2D, BackgroundTex);

    glBegin(GL_QUADS);
      for x :=0 to 15 do
      begin
        xf :=x/16;
        xf2 :=(x+1)/16;

        for y := 0 to 15 do
        begin
          yf :=y/16;
          yf2 :=(y+1)/16;

          glTexCoord2f(xf, yf);
          glVertex3f(point[x, y, 1], point[x, y, 2], point[x, y, 3]);

          glTexCoord2f(xf, yf2);
          glVertex3f(point[x, y+1, 1], point[x, y+1, 2], point[x, y+1, 3]);

          glTexCoord2f(xf2, yf2);
          glVertex3f(point[x+1, y+1, 1], point[x+1, y+1, 2], point[x+1, y+1, 3]);

          glTexCoord2f(xf2, yf);
          glVertex3f(point[x+1, y, 1], point[x+1, y, 2], point[x+1, y, 3]);
        end;
      end;

    if Round(gTimer.GetFPS) MOD 2 = 0 then
    begin
      // We have 0 - 16 points, but we only draw 15 squares
      for x :=0 to 16 do
      begin
        for y :=0 to 16 do
        begin
          point[x, y, 1] :=x*2 - 16 + sin(Angle/60 + x*10*pi/360)*2;
          point[x, y, 2] :=y*2 - 16 + cos(Angle/95 + x*10*2*pi/360)*8;
          point[x, y, 3] :=sin(Angle/180 + x*10*2*pi/360)*2;
        end;
      end;
    end;
    glEnd;

end;

procedure Scene2(Angle : glFLoat);
begin
    glTranslatef(0, 0, 5);
    glRotatef(Angle/2,1.0,0.0,0.0);
    glRotatef(Angle/3,0.0,1.0,0.0);

    glBindTexture(GL_TEXTURE_2D, BackgroundTex);
    glBegin(GL_QUADS);
      // Front Face
      glNormal3f( 0.0, 0.0, 1.0);
      glTexCoord2f(0.0, 0.0); glVertex3f(-1.0, -1.0,  1.0);
      glTexCoord2f(1.0, 0.0); glVertex3f( 1.0, -1.0,  1.0);
      glTexCoord2f(1.0, 1.0); glVertex3f( 1.0,  1.0,  1.0);
      glTexCoord2f(0.0, 1.0); glVertex3f(-1.0,  1.0,  1.0);
      // Back Face
      glNormal3f( 0.0, 0.0,-1.0);
      glTexCoord2f(1.0, 0.0); glVertex3f(-1.0, -1.0, -1.0);
      glTexCoord2f(1.0, 1.0); glVertex3f(-1.0,  1.0, -1.0);
      glTexCoord2f(0.0, 1.0); glVertex3f( 1.0,  1.0, -1.0);
      glTexCoord2f(0.0, 0.0); glVertex3f( 1.0, -1.0, -1.0);
      // Top Face
      glNormal3f( 0.0, 1.0, 0.0);
      glTexCoord2f(0.0, 1.0); glVertex3f(-1.0,  1.0, -1.0);
      glTexCoord2f(0.0, 0.0); glVertex3f(-1.0,  1.0,  1.0);
      glTexCoord2f(1.0, 0.0); glVertex3f( 1.0,  1.0,  1.0);
      glTexCoord2f(1.0, 1.0); glVertex3f( 1.0,  1.0, -1.0);
      // Bottom Face
      glNormal3f( 0.0,-1.0, 0.0);
      glTexCoord2f(1.0, 1.0); glVertex3f(-1.0, -1.0, -1.0);
      glTexCoord2f(0.0, 1.0); glVertex3f( 1.0, -1.0, -1.0);
      glTexCoord2f(0.0, 0.0); glVertex3f( 1.0, -1.0,  1.0);
      glTexCoord2f(1.0, 0.0); glVertex3f(-1.0, -1.0,  1.0);
      // Right face
      glNormal3f( 1.0, 0.0, 0.0);
      glTexCoord2f(1.0, 0.0); glVertex3f( 1.0, -1.0, -1.0);
      glTexCoord2f(1.0, 1.0); glVertex3f( 1.0,  1.0, -1.0);
      glTexCoord2f(0.0, 1.0); glVertex3f( 1.0,  1.0,  1.0);
      glTexCoord2f(0.0, 0.0); glVertex3f( 1.0, -1.0,  1.0);
      // Left Face
      glNormal3f(-1.0, 0.0, 0.0);
      glTexCoord2f(0.0, 0.0); glVertex3f(-1.0, -1.0, -1.0);
      glTexCoord2f(1.0, 0.0); glVertex3f(-1.0, -1.0,  1.0);
      glTexCoord2f(1.0, 1.0); glVertex3f(-1.0,  1.0,  1.0);
      glTexCoord2f(0.0, 1.0); glVertex3f(-1.0,  1.0, -1.0);
    glEnd();
end;

procedure Scene3(Angle : glFLoat);
begin
    glBindTexture(GL_TEXTURE_2D, BackgroundTex);
    glTranslatef(0, 0, 5);
    glRotatef(Angle/1.3,1.0,0.0,0.0);
    glRotatef(Angle/2,0.0,1.0,0.0);
    gluSphere(MyQuadratic,1.3,32,32);
end;

Procedure drawBackgroundEffect;
const P180 = Pi/180;
Var S: single;
    I: integer;
    R,G,B: single;
begin
  glBegin(GL_TRIANGLE_STRIP);
    For I := 0 to 72 do
    begin
      S := 0.5+Sin(ElapsedTime/465)*0.2+Cos(ElapsedTime/657)*0.1;
      R := 0.5+Sin(Elapsedtime/100+I/1.6)*0.5;
      G := 0.5+Sin(Elapsedtime/200+720+I/1.6)*0.5;
      B := 0.5+Sin(Elapsedtime/100+720+I/1.6)*0.5;
      glColor3f(R,G,B);
      glVertex3f(Sin(P180*I*5)*S, Cos(P180*I*5)*S, Sin(P180*(I*10+Elapsedtime/500))*(0.5+sin(ElapsedTime/300)*0.3));
      glColor3f(B,G,R);
      glVertex3f(Sin(P180*I*5)*S*2, Cos(P180*I*5)*S*2, 1+Sin(P180*(I*(20)+ElapsedTime/500))*(0.5+sin(ElapsedTime/800)*0.4+cos(Elapsedtime/450)*0.4));
    end;
  glEnd;
end;

procedure ShowProcess;
begin
  glPushMatrix();
    glTranslatef(0.0,-3.3,-4);
    glRotatef(-90, 0, 1, 0);
    //glScalef(3.5, 3.5, 1);

    // Background image
    glBindTexture(GL_TEXTURE_2D, ProgressTex);
    glBegin(GL_QUADS);
      glTexCoord2f(0, 0); glVertex3f(-1,-0.125, 0);
      glTexCoord2f(1, 0); glVertex3f( 1,-0.125, 0);
      glTexCoord2f(1, 1); glVertex3f( 1, 0.125, 0);
      glTexCoord2f(0, 1); glVertex3f(-1, 0.125, 0);
    glEnd();
  glPopMatrix;
  //ElapsedTime :=0;
end;

{----------------------------------------------------------}
{  Initialise Demo. Loads textures and creates objects     }
{----------------------------------------------------------}
procedure ShowLoading;
begin
  glPushMatrix();
    glTranslatef(0.0,-3.0,-4);
    glScalef(3.5, 3.5, 1);

    // Background image
    glBindTexture(GL_TEXTURE_2D, Imagetextlogo);
    glBegin(GL_QUADS);
      glTexCoord2f(0, 0); glVertex3f(-1,-0.125, 0);
      glTexCoord2f(1, 0); glVertex3f( 1,-0.125, 0);
      glTexCoord2f(1, 1); glVertex3f( 1, 0.125, 0);
      glTexCoord2f(0, 1); glVertex3f(-1, 0.125, 0);
    glEnd();
    //ShowProcess;
  glPopMatrix;
  //ElapsedTime :=0;
end;

{------------------------------------------------------------------}
{  Function to draw the actual scene                               }
{------------------------------------------------------------------}
procedure FlashglDraw();
var x, y : Integer;
    xf, xf2, yf, yf2 : glfloat;
    Angle : glFLoat;
begin
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);    // Clear The Screen And The Depth Buffer
  glLoadIdentity();                                       // Reset The View

  glTranslatef(0, 0, -6);

  gluPerspective(FOV, SCREEN_WIDTH/SCREEN_HEIGHT, 1.0, 300.0);  // Do the perspective calculations. Last value = max clipping depth
  glMatrixMode(GL_MODELVIEW);         // Return to the modelview matrix
  glLoadIdentity();                   // Reset View

  Angle :=(startTime + ElapsedTIme)/2;   // provides smoother movement
  ANgle :=Angle/4;
  endTime := ElapsedTime;

  //----------------------------------------
  //  Draw the background
  //----------------------------------------
  glPushMatrix;
    glScaled(1.25, 1.25, 1.25);
    Scene1();
    drawBackgroundEffect;
  glPopMatrix;

  case Stage of
   -1 : ShowLoading;
    0 : Scene1();
    1 : Sound.PlayStream('flash.mp3', FALSE, 0);


  end;

  SetWindowText(h_Wnd, PChar(WND_TITLE + format('[FPS: %d] - DiffTime: %d', [gTimer.GetFPS, gTimer.GetTime])));

  glFinish;

  //exit;
  inc(frameflash);
  if frameflash > 300 then
    drawgame := BSPINIT;
//    with Q3Thread.Create(true) do
//      begin
//        SetFunc('Q3LevelLoad');
//        Priority := tpLower;
//        Resume;
//        drawgame := BSPINIT;
//        Suspend;
//        Terminate;
//        checkthread := true;
//      end;
  //  DrawFlash := false;
end;

{------------------------------------------------------------------}
{  Processes all the keystrokes                                    }
{------------------------------------------------------------------}
procedure FlashProcessKeys;
begin
  if (keys[ord('B')]) then
  begin
    blend := not(blend);
    if (blend) then
    begin
      glEnable(GL_BLEND);                // Turn Blending On
      glBlendFunc(GL_SRC_ALPHA,GL_ONE);  // Set The Blending Function For Translucency
      glDisable(GL_DEPTH_TEST);
    end
    else
    begin
      glDisable(GL_BLEND);               // Turn Blending Off
      glEnable(GL_DEPTH_TEST);           // Turn Depth Buffer Writes On
    end;
    keys[ord('B')] :=FALSE;
  end;
end;

procedure FlashglInit();
var
  MyClass: TObject;
begin
  //Blend := true;
  ShowCube := false;

  glClearColor(0.0, 0.0, 0.0, 0.0); 	   // Black Background
  glShadeModel(GL_SMOOTH);                 // Enables Smooth Color Shading
  glClearDepth(1.0);                       // Depth Buffer Setup
  glDisable(GL_DEPTH_TEST);                // Disable Depth Buffer
  glDepthFunc(GL_LESS);		           // The Type Of Depth Test To Do

  glEnable(GL_BLEND);                      // Turn Blending On
  glBlendFunc(GL_SRC_ALPHA,GL_ONE);        // Set The Blending Function For Translucency

  glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);   //Realy Nice perspective calculations

  glEnable(GL_TEXTURE_2D);                     // Enable Texture Mapping

  Stage := -1;
  frameflash := 0;

  //LoadTexture('cube.bmp', CubeTex, false);
  LoadTexture('temps/images/volitionlogo.jpg', ProgressTex, false, false);
  LoadTexture('temps/images/freewill.jpg', Imagetextlogo, false, false);
  LoadTexture('temps/images/chrome.jpg', BackgroundTex, false, false);

  MyQuadratic := gluNewQuadric();							// Create A Pointer To The Quadric Object (Return 0 If No Memory) (NEW)
  gluQuadricNormals(MyQuadratic, GLU_SMOOTH);			// Create Smooth Normals (NEW)
  gluQuadricTexture(MyQuadratic, GL_TRUE);				// Create Texture Coords (NEW)

end;

initialization



end.
