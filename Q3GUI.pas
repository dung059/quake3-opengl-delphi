unit Q3gui;

interface

  Uses Q3Win;

  var Mouse  : PMouse;
      Window : PAppWindow;

  procedure InitGUI;
  procedure RenderGUI;
  procedure MouseDown;
  procedure MouseUp;

implementation

Uses Textures, OpenGL;

// The windows you want to use
var wMain  : TWindow;
    wSetup : TWindow;


{------------------------------------------------------------------}
{  Custom button functions                                         }
{------------------------------------------------------------------}
procedure showSetupWindow;
begin
  wSetup.Visible :=TRUE;
end;

procedure CloseSetupWindow;
begin
  wSetup.Visible :=FALSE;
end;

procedure alphaUp;
begin
  if wMain.Alpha < 1 then
    wMain.Alpha := wMain.Alpha + 0.1;
end;

procedure alphaDown;
begin
  if wMain.Alpha > 0 then
    wMain.Alpha := wMain.Alpha - 0.1;
end;

procedure closeApp;
begin
  Halt(1);
end;


{------------------------------------------------------------------}
{  Procedure to create all the windows and their buttton           }
{------------------------------------------------------------------}
procedure InitGUI;
begin
  LoadTexture('images/GUI/GUI.TGA', GUITexture, FALSE);
  LoadTexture('images/GUI/Font.tga', FontTexture, FALSE);
  BuildFont;

  // Create the main window
  wMain.Init(300, 260, 300, 250);               // create the window
  wMain.AddButton(185, 60, 75, 25, 'Setup');
  wMain.AddButton(185, 90, 75, 25, 'Exit');
  wMain.Button[0].onClick :=showSetupWindow;
  wMain.Button[1].onClick :=closeApp;
  wMain.AddPanel(30, 50, 130, 60);             // create a panel on the window
  wMain.AddText(37, 55, 'Sample app to show');
  wMain.AddText(37, 70, 'how to use the ');
  wMain.AddText(37, 85, 'windows class.');

  wMain.AddPanel(30, 130, 230, 70);             // create a panel on the window
  wMain.AddText(40, 140, 'Adjust window Alpha blending level.');
  wMain.AddButton(60, 165, 75, 25, 'Up');
  wMain.AddButton(155, 165, 75, 25, 'Down');
  wMain.Button[2].onClick :=alphaUp;
  wMain.Button[3].onClick :=alphaDown;

  // Create the setup window
  wSetup.Init(490, 210, 200, 220);
  wSetup.Visible :=FALSE;
  wSetup.AddPanel(20, 50, 160, 110);       // create a panel on the window
  wSetup.AddCheckbox(35, 70, TRUE);          wSetup.AddText(53, 70, 'Fullscreen');
  wSetup.AddRadioButton(35, 95, 1, FALSE);   wSetup.AddText(53, 95, '640x480');
  wSetup.AddRadioButton(35,110, 1, TRUE);    wSetup.AddText(53, 110, '800x600');
  wSetup.AddRadioButton(35,125, 1, FALSE);   wSetup.AddText(53, 125, '1024x768');
  wSetup.AddButton(20, 165, 75, 25, 'OK');
  wSetup.AddButton(105, 165, 75, 25, 'Cancel');
  wSetup.Button[0].onClick :=closeSetupWindow;
  wSetup.Button[1].onClick :=closeSetupWindow;
  wMain.AddWindow(@wSetup);
end;


{------------------------------------------------------------------}
{  Procedure to render the GUI                                     }
{------------------------------------------------------------------}
Procedure RenderGUI;
begin
  glMatrixMode(GL_PROJECTION);  // Change Matrix Mode to Projection
  glLoadIdentity();             // Reset View
  glOrtho(0, window.Width, 0, window.Height, 0, 4000);
  glMatrixMode(GL_MODELVIEW);   // Change Projection to Matrix Mode
  glLoadIdentity;

  //glTranslate(0, 0, -1);
  glEnable(GL_TEXTURE_2D);
  wMain.Render;                 // draw the main window and it will draw child windows
  drawMouse;                    // draw the mouse

  glMatrixMode(GL_PROJECTION);  // Change Matrix Mode to Projection
  glLoadIdentity();             // Reset View
  gluPerspective(45.0, window.Width/window.Height, 1.0, 4000.0);
  glMatrixMode(GL_MODELVIEW);   // Change Projection to Matrix Mode
  glLoadIdentity;
end;


{------------------------------------------------------------------}
{  Mouse events                                                    }
{------------------------------------------------------------------}
procedure MouseDown;
begin
  onMouseDown(@wMain);
end;

procedure MouseUp;
begin
  onMouseUp;
end;


begin
  Window :=@Q3win.Window;
  Mouse  :=@Q3win.Mouse;
end.
