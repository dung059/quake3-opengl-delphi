unit Q3win;

interface

Uses OpenGL, Windows;

type
  PBoolean = ^Boolean;
  Pwindow = ^TWindow;

  PAppWindow = ^TAppWindow;
  TAppWindow = Record
    Width, Height : Integer;
    CaptionBarHeight : Integer;
  end;

  // Structure for the mouse
  PMouse = ^TMouse;
  TMouse = Record
    X, Y : Integer;
    Button : Integer;   // 1=left, 2=right, 3=middle
  end;
  TMouseDrag = Record
    Drag : Boolean;     // window draggin enabled
    X, Y : Integer;   // X and Y coords when drag started
    Window : PWindow;
  end;        

  PButton = ^TButton;
  TButton = Object
    X, Y    : Integer;
    Width, Height : Integer;
    Caption : String;
    Pressed : Boolean;
    Index   : Integer;
    Parent  : PWindow;
    onClick : procedure;
    procedure Init(bX, bY, bWidth, bHeight : Integer; bCaption : String);
    Procedure Render;
  end;

  TText = Object
    X, Y    : Integer;
    Visible : Boolean;
    Caption : String;
    Parent  : PWindow;
    procedure Init(tX, tY : Integer; Text : String);
    Procedure Render;
  end;

  TPanel = Object
    X, Y    : Integer;
    Width, Height : Integer;
    Visible : Boolean;
    Parent  : PWindow;
    procedure Init(pX, pY, pWidth, pHeight : Integer);
    Procedure Render;
  end;

  TCheckbox = Object
    X, Y    : Integer;
    Visible : Boolean;
    Checked : Boolean;
    Parent  : PWindow;
    onClick : procedure;
    procedure Init(cbX, cbY : Integer; cbChecked : Boolean);
    Procedure Render;
  end;

  TRadioButton = Object
    X, Y    : Integer;
    Visible : Boolean;
    Checked : Boolean;
    Group   : Integer;
    Parent  : PWindow;
    onClick : procedure;
    procedure Init(rbX, rbY, rbGroup : Integer; rbChecked : Boolean);
    Procedure Render;
  end;

  TWindow = Object
    X, Y    : Integer;
    Width, Height : Integer;
    Visible : Boolean;
    ZOrder  : single;
    Alpha   : Single;
    Button      : Array of TButton;
    Text        : Array of TText;
    Panel       : Array of TPanel;
    Checkbox    : Array of TCheckBox;
    RadioButton : Array of TRadioButton;
    ChildWindow : Array of PWindow;
    procedure Init(wX, wY, wWidth, wHeight : Integer);
    Procedure AddButton(btnX, btnY, btnWidth, btnHeight : Integer; btnCaption : String);
    Procedure AddText(tX, tY : Integer; tCaption : String);
    Procedure AddPanel(pX, pY, pWidth, pHeight : Integer);
    Procedure AddCheckbox(cbX, cbY : Integer; Checked : Boolean);
    Procedure AddRadioButton(rbX, rbY, rbGroup : Integer; Checked : Boolean);
    Procedure AddWindow(Child : PWindow);
    Procedure Render;
  end;

var GUITexture  : glUint;      // the GUI texture
    FontTexture : glUint;      // the font texture
    Window : TAppWindow = (Width:800; Height:600; CaptionBarHeight:26);
    Mouse  : TMouse;

  procedure BuildFont;
  Procedure drawMouse;
  procedure onMouseUp;
  function onMouseDown(Wnd : PWindow) : boolean;

implementation

procedure glBindTexture(target: GLenum; texture: GLuint); stdcall; external opengl32;

var ButtonPressed : PButton;    // used to remember which button was pressed
    MouseDrag : TMouseDrag;
    FontList : glUint;          // font display list
    FontWidth : Array[0..255] of Byte;  // array of font character widths


{------------------------------------------------------------------}
{  Procedure to create the font display list                       }
{------------------------------------------------------------------}
procedure BuildFont;
var I : Integer;
    X, Y, xs : glFloat;
    F : File of Byte;
    W : Byte;
begin
  // Load the character widths from the font.fnt file
  AssignFile(F, 'images/GUI/font.fnt');
{$I-}
  Reset(F);
{$I+}
  if IOResult <> 0 then
  begin
    MessageBox(0, 'Unable to find font.fnt', 'Font Loader', MB_OK);
    exit;
  end;
  For I :=0 to 255 do
  begin
    Read(F, w);
    FontWidth[I] :=W;
  end;
  CloseFile(F);

  // create the font display list
  FontList := glGenLists(256);               // Storage For 128 Characters
  for I := 0 to 255 do
  begin
    x := (I mod 16) / 16;	     		// X Position Of Current Character
    y := (I div 16) / 16;	     		// Y Position Of Current Character
    glNewList(FontTexture+I, GL_COMPILE);       // Start Building A List
    glBegin(GL_QUADS);
      xs := (16-FontWidth[I])/2/256;
      glTexCoord2f(x+xs,1-y-0.0625);         glVertex2i(0, 0);
      glTexCoord2f(x+xs + FontWidth[I]/256 + 1/512, 1-y-0.0625);  glVertex2i( FontWidth[I], 0);
      glTexCoord2f(x+xs + FontWidth[I]/256 + 1/512, 1-y);         glVertex2i( FontWidth[I], 16);
      glTexCoord2f(x+xs,1-y);                glVertex2i(0, 16);
    glEnd();
    glTranslate(FontWidth[I]+1, 0, 0);
    glEndList();
  end;
end;


{------------------------------------------------------------------}
{  Write a pice of text using the font DL                          }
{------------------------------------------------------------------}
procedure glWrite(x, y : Integer; text : String);
begin
  glBindTexture(GL_TEXTURE_2D, FontTexture);
  glPushMatrix();
    glTranslate(x, y, 0.05);
    glListBase(FontList+1);
    glCallLists(length(text), GL_BYTE, PChar(text));
  glPopMatrix();
  glBindTexture(GL_TEXTURE_2D, GUITexture);
end;


{ TWindow }

{------------------------------------------------------------------}
{  Adds a button onto the window                                   }
{------------------------------------------------------------------}
procedure TWindow.AddButton(btnX, btnY, btnWidth, btnHeight : Integer; btnCaption : String);
begin
  SetLength(Button, High(Button)+2);
  Button[High(Button)].Init(btnX, btnY, btnWidth, btnHeight, btnCaption);
  Button[High(Button)].Parent :=@self;
  Button[High(Button)].Index :=High(Button);
end;


{------------------------------------------------------------------}
{  Adds text to a window                                           }
{------------------------------------------------------------------}
procedure TWindow.AddText(tX, tY: Integer; tCaption : String);
begin
  SetLength(Text, High(Text)+2);
  Text[High(Text)].Init(tX, tY, tCaption);
  Text[High(Text)].Parent :=@self;
end;

{------------------------------------------------------------------}
{  Adds a panel onto the window                                    }
{------------------------------------------------------------------}
procedure TWindow.AddPanel(pX, pY, pWidth, pHeight: Integer);
begin
  SetLength(Panel, High(Panel)+2);
  Panel[High(Panel)].Init(pX, pY, pWidth, pHeight);
  Panel[High(Panel)].Parent :=@self;
end;


{------------------------------------------------------------------}
{  Adds a checkbox onto the window                                 }
{------------------------------------------------------------------}
procedure TWindow.AddCheckbox(cbX, cbY: Integer; Checked: Boolean);
begin
  SetLength(Checkbox, High(Checkbox)+2);
  Checkbox[High(Checkbox)].Init(cbX, cbY, Checked);
  Checkbox[High(Checkbox)].Parent :=@self;
end;


{------------------------------------------------------------------}
{  Adds a radiobutton onto the window                              }
{------------------------------------------------------------------}
procedure TWindow.AddRadioButton(rbX, rbY, rbGroup: Integer; Checked: Boolean);
begin
  SetLength(RadioButton, High(RadioButton)+2);
  RadioButton[High(RadioButton)].Init(rbX, rbY, rbGroup, Checked);
  RadioButton[High(RadioButton)].Parent :=@self;
end;


{------------------------------------------------------------------}
{  Adds a new child window                                         }
{------------------------------------------------------------------}
procedure TWindow.AddWindow(Child : PWindow);
begin
  SetLength(ChildWindow, High(ChildWindow)+2);
  ChildWindow[High(ChildWindow)] :=Child;
end;


{------------------------------------------------------------------}
{  Initialise window and setup defaults                            }
{------------------------------------------------------------------}
procedure TWindow.Init(wX, wY, wWidth, wHeight: Integer);
begin
  X :=wX;
  Y :=wY;
  zOrder :=0;         // used if you specifically want to set a window higher
  Width  :=wWidth;
  Height :=wHeight;
  Visible :=TRUE;     // start off visible
  Alpha :=0.9;        // defult for alpha blending
end;


{------------------------------------------------------------------}
{  Render the window. Calls render button, child windows ...       }
{------------------------------------------------------------------}
procedure TWindow.Render;
var I : Integer;
begin
  if Visible then
  begin
    glBindTexture(GL_TEXTURE_2D, GUITexture);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_BLEND);
    glColor4f(1.0, 1.0, 1.0, Alpha);

    glPushMatrix();
      glTranslate(X, Window.Height - Window.CaptionBarHeight-Y, zOrder);
      glBegin(GL_QUADS);
        // top left corner of window.
        glTexCoord2f( 0/128, 1);        glVertex2f(0, 0);
        glTexCoord2f( 0/128, 1-27/128); glVertex2f(0, -27);
        glTexCoord2f(64/128, 1-27/128); glVertex2f(63, -27);
        glTexCoord2f(64/128, 1);        glVertex2f(63, 0);

        // top of window.
        glTexCoord2f(64/128, 1);        glVertex2f(63, 0);
        glTexCoord2f(64/128, 1-27/128); glVertex2f(63, -27);
        glTexCoord2f(96/128, 1-27/128); glVertex2f(Width-32, -27);
        glTexCoord2f(96/128, 1);        glVertex2f(Width-32, 0);

        // top right corder of window.
        glTexCoord2f(96/128, 1);        glVertex2f(Width-32, 0);
        glTexCoord2f(96/128, 1-27/128); glVertex2f(Width-32, -27);
        glTexCoord2f(1, 1-27/128);      glVertex2f(Width, -27);
        glTexCoord2f(1, 1);             glVertex2f(Width, 0);

        // left side of window.
        glTexCoord2f(0/128, 1-27/128);  glVertex2f(0, -27);
        glTexCoord2f(0/128, 27/128);    glVertex2f(0, -Height+27);
        glTexCoord2f(6/128, 27/128);    glVertex2f(6,-Height+27);
        glTexCoord2f(6/128, 1-27/128);  glVertex2f(6, -27);

        // draw the main body of the window
        glTexCoord( 9/128, 96/128);     glVertex2f(6, 0);
        glTexCoord( 9/128, 64/128);     glVertex2f(6, 25-Height);
        glTexCoord(39/128, 64/128);     glVertex2f(Width-7, 25-Height);
        glTexCoord(39/128, 96/128);     glVertex2f(Width-7, 0);

        // right side of window.
        glTexCoord2f(1-7/128, 1-27/128);glVertex2f(Width-7, -27);
        glTexCoord2f(1-7/128, 27/128);  glVertex2f(Width-7, -Height+27);
        glTexCoord2f(1,   27/128);      glVertex2f(Width,-Height+27);
        glTexCoord2f(1, 1-27/128);      glVertex2f(Width, -27);

        // bottom left corner of window.
        glTexCoord2f( 0/128, 27/128);   glVertex2f(0, 27-Height);
        glTexCoord2f( 0/128,  0/128);   glVertex2f(0, -Height);
        glTexCoord2f(64/128,  0/128);   glVertex2f(63, -Height);
        glTexCoord2f(64/128, 27/128);   glVertex2f(63, 27-Height);

        // bottom of window.
        glTexCoord2f(64/128, 27/128);   glVertex2f(63, 27-Height);
        glTexCoord2f(64/128, 0/128);    glVertex2f(63, -Height);
        glTexCoord2f(96/128, 0/128);    glVertex2f(Width-32, -Height);
        glTexCoord2f(96/128, 27/128);   glVertex2f(Width-32, 27-Height);

        // bottom right corder of window.
        glTexCoord2f(96/128, 27/128);   glVertex2f(Width-32, 27-Height);
        glTexCoord2f(96/128, 0/128);    glVertex2f(Width-32, -Height);
        glTexCoord2f(1, 0/128);         glVertex2f(Width, -Height);
        glTexCoord2f(1, 27/128);        glVertex2f(Width, 27-Height);

        // window close button
        glTexCoord2f(104/128, 96/128); glVertex3f(Width-22, -8,  0.01);
        glTexCoord2f(104/128, 80/128); glVertex3f(Width-22, -24, 0.01);
        glTexCoord2f(120/128, 80/128); glVertex3f(Width-6, -24, 0.01);
        glTexCoord2f(120/128, 96/128); glVertex3f(Width-6, -8,  0.01);
      glEnd();

      // draw the Panels
      glTranslate(0, 0, 0.02);
      for I :=0 to High(Panel) do
        Panel[I].Render;

      // draw the Buttons
      glTranslate(0, 0, 0.02);
      for I :=0 to High(Button) do
        Button[I].Render;

      // draw the Checkboxes
      for I :=0 to High(Checkbox) do
        Checkbox[I].Render;

      // draw the RadioButtons
      for I :=0 to High(RadioButton) do
        RadioButton[I].Render;

      // draw the Text
      for I :=0 to High(Text) do
        Text[I].Render;

    glPopMatrix();
    glBlendFunc(GL_ONE,GL_ONE);
    glDisable(GL_BLEND);

    // draw the child windows
    glPushMatrix();
      glTranslate(0, 0, 0.1);
      for I :=0 to High(ChildWindow) do
        ChildWindow[I].Render;
    glPopMatrix();
  end;
end;


{ TButton }

{------------------------------------------------------------------}
{  Initialise a button                                             }
{------------------------------------------------------------------}
procedure TButton.Init(bX, bY, bWidth, bHeight: Integer; bCaption : String);
begin
  X :=bx;
  Y :=bY;
  Width   :=bWidth;
  Height  :=bHeight;
  Caption :=bCaption;
end;


{------------------------------------------------------------------}
{  Render the button                                               }
{------------------------------------------------------------------}
procedure TButton.Render;
begin
  if Pressed then
  begin
    glBegin(GL_QUADS);
      // left side
      glTexCoord2f(57/128, 95/128); glVertex2f(X, -Y);
      glTexCoord2f(57/128, 70/128); glVertex2f(X, -Y-Height);
      glTexCoord2f(62/128, 70/128); glVertex2f(X+6,-Y-Height);
      glTexCoord2f(62/128, 95/128); glVertex2f(X+6, -Y);

      // middle
      glTexCoord2f(62/128, 95/128); glVertex2f(X+6, -Y);
      glTexCoord2f(62/128, 70/128); glVertex2f(X+6, -Y-Height);
      glTexCoord2f(66/128, 70/128); glVertex2f(X+Width-6, -Y-Height);
      glTexCoord2f(66/128, 95/128); glVertex2f(X+Width-6, -Y);

      // right side
      glTexCoord2f(66/128, 95/128); glVertex2f(X+Width-6, -Y);
      glTexCoord2f(66/128, 70/128); glVertex2f(X+Width-6, -Y-Height);
      glTexCoord2f(71/128, 70/128); glVertex2f(X+Width, -Y-Height);
      glTexCoord2f(71/128, 95/128); glVertex2f(X+Width, -Y);
    glEnd();

    glWrite(X + 1 + (Width-Length(Caption)*6) DIV 2, -Y-21, Caption);
  end
  else
  begin
    glBegin(GL_QUADS);
      // left side
      glTexCoord2f(41/128, 95/128); glVertex2f(X, -Y);
      glTexCoord2f(41/128, 70/128); glVertex2f(X, -Y-Height);
      glTexCoord2f(46/128, 70/128); glVertex2f(X+6,-Y-Height);
      glTexCoord2f(46/128, 95/128); glVertex2f(X+6, -Y);

      // middle
      glTexCoord2f(46/128, 95/128); glVertex2f(X+6, -Y);
      glTexCoord2f(46/128, 70/128); glVertex2f(X+6, -Y-Height);
      glTexCoord2f(50/128, 70/128); glVertex2f(X+Width-6, -Y-Height);
      glTexCoord2f(50/128, 95/128); glVertex2f(X+Width-6, -Y);

      // right side
      glTexCoord2f(50/128, 95/128); glVertex2f(X+Width-6, -Y);
      glTexCoord2f(50/128, 70/128); glVertex2f(X+Width-6, -Y-Height);
      glTexCoord2f(55/128, 70/128); glVertex2f(X+Width, -Y-Height);
      glTexCoord2f(55/128, 95/128); glVertex2f(X+Width, -Y);
    glEnd();

    glWrite(X + (Width-Length(Caption)*6) DIV 2, -Y-20, Caption);
  end;
end;


{ TPanel }

{------------------------------------------------------------------}
{  Initialise a panel                                              }
{------------------------------------------------------------------}
procedure TPanel.Init(pX, pY, pWidth, pHeight: Integer);
begin
  X :=pX;
  Y :=pY;
  Width   :=pWidth;
  Height  :=pHeight;
  Visible :=TRUE;
end;


{------------------------------------------------------------------}
{  Render the Panel                                                }
{------------------------------------------------------------------}
procedure TPanel.Render;
begin
  if Visible then
  begin
    glBegin(GL_QUADS);
      // top left corner of panel.
      glTexCoord2f( 8/128, 64/128); glVertex2f(X, -Y);
      glTexCoord2f( 8/128, 54/128); glVertex2f(X, -Y-10);
      glTexCoord2f(18/128, 54/128); glVertex2f(X+10, -Y-10);
      glTexCoord2f(18/128, 64/128); glVertex2f(X+10, -Y);

      // top of panel.
      glTexCoord2f(18/128, 64/128); glVertex2f(X+10, -Y);
      glTexCoord2f(18/128, 54/128); glVertex2f(X+10, -Y-10);
      glTexCoord2f(30/128, 54/128); glVertex2f(X+10+(Width-20), -Y-10);
      glTexCoord2f(30/128, 64/128); glVertex2f(X+10+(Width-20), -Y);

      // top right corder of panel.
      glTexCoord2f(30/128, 64/128); glVertex2f(X+Width-10, -Y);
      glTexCoord2f(30/128, 54/128); glVertex2f(X+Width-10, -Y-10);
      glTexCoord2f(40/128, 54/128); glVertex2f(X+Width, -Y-10);
      glTexCoord2f(40/128, 64/128); glVertex2f(X+Width, -Y);

      // left side of panel.
      glTexCoord2f( 8/128, 54/128); glVertex2f(X, -Y-10);
      glTexCoord2f( 8/128, 42/128); glVertex2f(X, -Y-Height+10);
      glTexCoord2f(18/128, 42/128); glVertex2f(X+10, -Y-Height+10);
      glTexCoord2f(18/128, 54/128); glVertex2f(X+10, -Y-10);

      // middle of panel.
      glTexCoord2f(18/128, 54/128); glVertex2f(X+10, -Y-10);
      glTexCoord2f(18/128, 42/128); glVertex2f(X+10, -Y-Height+10);
      glTexCoord2f(30/128, 42/128); glVertex2f(X+10+(Width-20), -Y-Height+10);
      glTexCoord2f(30/128, 54/128); glVertex2f(X+10+(Width-20), -Y-10);

      // right side of panel.
      glTexCoord2f(30/128, 54/128); glVertex2f(X+Width-10, -Y-10);
      glTexCoord2f(30/128, 42/128); glVertex2f(X+Width-10, -Y-Height+10);
      glTexCoord2f(40/128, 42/128); glVertex2f(X+Width, -Y-Height+10);
      glTexCoord2f(40/128, 54/128); glVertex2f(X+Width, -Y-10);

      // bottom left corner of panel.
      glTexCoord2f( 8/128, 42/128); glVertex2f(X, -Y-Height+10);
      glTexCoord2f( 8/128, 32/128); glVertex2f(X, -Y-Height);
      glTexCoord2f(18/128, 32/128); glVertex2f(X+10, -Y-Height);
      glTexCoord2f(18/128, 42/128); glVertex2f(X+10, -Y-Height+10);

      // bottom middle of panel.
      glTexCoord2f(18/128, 42/128); glVertex2f(X+10, -Y-Height+10);
      glTexCoord2f(18/128, 32/128); glVertex2f(X+10, -Y-Height);
      glTexCoord2f(30/128, 32/128); glVertex2f(X+10+(Width-20), -Y-Height);
      glTexCoord2f(30/128, 42/128); glVertex2f(X+10+(Width-20), -Y-Height+10);

      // bottom right corner of panel.
      glTexCoord2f(30/128, 42/128); glVertex2f(X+Width-10, -Y-Height+10);
      glTexCoord2f(30/128, 32/128); glVertex2f(X+Width-10, -Y-Height);
      glTexCoord2f(40/128, 32/128); glVertex2f(X+Width, -Y-Height);
      glTexCoord2f(40/128, 42/128); glVertex2f(X+Width, -Y-Height+10);

    glEnd();
  end;
end;


{ TCheckbox }

{------------------------------------------------------------------}
{  Initialise a checkbox                                           }
{------------------------------------------------------------------}
procedure TCheckbox.Init(cbX, cbY : Integer; cbChecked : Boolean);
begin
  X :=cbX;
  Y :=cbY;
  Visible :=TRUE;
  Checked :=cbChecked;
end;


{------------------------------------------------------------------}
{  Render a Checkbox                                               }
{------------------------------------------------------------------}
procedure TCheckbox.Render;
begin
  if Visible then
  begin
    if Checked then
    begin
      glBegin(GL_QUADS);
        glTexCoord2f(88/128, 96/128); glVertex2f(X, -Y);
        glTexCoord2f(88/128, 80/128); glVertex2f(X, -Y-16);
        glTexCoord2f(104/128, 80/128); glVertex2f(X+16,-Y-16);
        glTexCoord2f(104/128, 96/128); glVertex2f(X+16, -Y);
      glEnd();
    end
    else
    begin
      glBegin(GL_QUADS);
        glTexCoord2f(72/128, 96/128); glVertex2f(X, -Y);
        glTexCoord2f(72/128, 80/128); glVertex2f(X, -Y-16);
        glTexCoord2f(88/128, 80/128); glVertex2f(X+16,-Y-16);
        glTexCoord2f(88/128, 96/128); glVertex2f(X+16, -Y);
      glEnd();
    end;
  end;
end;


{ TRadioButton }

{------------------------------------------------------------------}
{  Initialise a Radio Button                                       }
{------------------------------------------------------------------}
procedure TRadioButton.Init(rbX, rbY, rbGroup : Integer; rbChecked : Boolean);
begin
  X :=rbX;
  Y :=rbY;
  Visible :=TRUE;
  Checked :=rbChecked;
  Group :=rbGroup;
end;


{------------------------------------------------------------------}
{  Render Radio Button                                             }
{------------------------------------------------------------------}
procedure TRadioButton.Render;
begin
  if Visible then
  begin
    if Checked then
    begin
      glBegin(GL_QUADS);
        glTexCoord2f(88/128, 80/128); glVertex2f(X, -Y);
        glTexCoord2f(88/128, 64/128); glVertex2f(X, -Y-16);
        glTexCoord2f(104/128, 64/128); glVertex2f(X+16,-Y-16);
        glTexCoord2f(104/128, 80/128); glVertex2f(X+16, -Y);
      glEnd();
    end
    else
    begin
      glBegin(GL_QUADS);
        glTexCoord2f(72/128, 80/128); glVertex2f(X, -Y);
        glTexCoord2f(72/128, 64/128); glVertex2f(X, -Y-16);
        glTexCoord2f(88/128, 64/128); glVertex2f(X+16,-Y-16);
        glTexCoord2f(88/128, 80/128); glVertex2f(X+16, -Y);
      glEnd();
    end;
  end;
end;


{ TText }

{------------------------------------------------------------------}
{  Initialise the Text                                             }
{------------------------------------------------------------------}
procedure TText.Init(tX, tY : Integer; Text : String);
begin
  X :=tX;
  Y :=tY;
  Caption :=Text;
end;

{------------------------------------------------------------------}
{  Render Radio Text                                               }
{------------------------------------------------------------------}
procedure TText.Render;
begin
  glWrite(X, -Y-16, Caption);
end;


{ TMouse }

{------------------------------------------------------------------}
{  Procedure to draw the mouse                                     }
{------------------------------------------------------------------}
Procedure drawMouse;
begin
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  glEnable(GL_TEXTURE_2D);
  glcolor4f(1,1,1,1);
  glBegin(GL_QUADS);
    glTexCoord(40/128, 64/128); glVertex(Mouse.X,    Mouse.Y, 1);
    glTexCoord(72/128, 64/128); glVertex(Mouse.X+32, Mouse.Y, 1);
    glTexCoord(72/128, 32/128); glVertex(Mouse.X+32, Mouse.Y-32, 1);
    glTexCoord(40/128, 32/128); glVertex(Mouse.X,    Mouse.Y-32, 1);
  glEnd();
  glDisable(GL_TEXTURE_2D);
  glDisable(GL_BLEND);
end;


{------------------------------------------------------------------}
{  Procedure to check if the user clicked in a window or object    }
{------------------------------------------------------------------}
function onMouseDown(Wnd : PWindow) : boolean;
var WndClick : Boolean;
    I, J : Integer;
    MouseX, MouseY : Integer;
begin
  if Wnd.Visible = FALSE then
    exit;

  if MouseDrag.Drag then
  begin
    MouseDrag.Window^.X :=MouseDrag.X + Mouse.X;
    MouseDrag.Window^.Y :=MouseDrag.Y - Mouse.Y + window.Height;
    onMouseDown :=TRUE;
    exit;
  end;

  WndClick :=FALSE;

  // First check child windows since they can be on top.
  for I :=0 to High(Wnd.ChildWindow) do
    if (Wnd.ChildWindow[I].Visible) AND (wndClick = FALSE) then
      wndClick := onMouseDown(Wnd.ChildWindow[I]);

  if WndCLick then
  begin
    onMouseDown :=TRUE;
    exit;
  end;

  // test to see if user clicked in a window
  MouseX   :=Mouse.X;
  MouseY   :=Window.Height - Mouse.Y - window.CaptionBarHeight;
  if (MouseX > Wnd.X) AND (MouseX < Wnd.X + Wnd.Width) then
    if (MouseY > Wnd.Y) AND (MouseY < Wnd.Y + Wnd.Height) then
      WndClick :=TRUE;

  // if something inside the window was clicked, then find the object
  if WndClick then
  begin
    onMouseDown :=TRUE;

    // Test to see if user clicked on window close icon
    if (MouseX > Wnd.X + Wnd.Width-22) AND (MouseX < Wnd.X + Wnd.Width-6) then
      if (MouseY > Wnd.Y+8) AND (MouseY < Wnd.Y + 24) then
      begin
        Wnd.Visible :=FALSE;
        exit;
      end;

    // Test to see if user clicked in caption bar
    if (MouseX > Wnd.X) AND (MouseX < Wnd.X + Wnd.Width) then
      if (MouseY > Wnd.Y+1) AND (MouseY < Wnd.Y + 26) then
      begin
        MouseDrag.Drag :=TRUE;
        MouseDrag.X    :=Wnd.X - Mouse.X;
        MouseDrag.Y    :=Wnd.Y - (Window.Height - Mouse.Y);
        MouseDrag.Window := Wnd;
        exit;
      end;

    // recalculate coordinates relative to window
    MouseX :=MouseX - Wnd.X;
    MouseY :=MouseY - Wnd.Y;

    // Test and execute button click
    for I :=0 to High(Wnd.Button) do
    begin
      if (MouseX > Wnd.Button[I].X) AND (MouseX < Wnd.Button[I].X + Wnd.Button[I].Width) then
        if (MouseY > Wnd.Button[I].Y) AND (MouseY < Wnd.Button[I].Y + Wnd.Button[I].Height) then
        begin
          Wnd.Button[I].Pressed :=TRUE;
          ButtonPressed := @Wnd.Button[I];
          exit;
        end;
    end;

    // Test and execute checkbox click
    for I :=0 to High(Wnd.CheckBox) do
    begin
      if (MouseX > Wnd.CheckBox[I].X) AND (MouseX < Wnd.CheckBox[I].X + 16) then
        if (MouseY > Wnd.CheckBox[I].Y) AND (MouseY < Wnd.CheckBox[I].Y + 16) then
        begin
          Wnd.CheckBox[I].Checked :=NOT(Wnd.CheckBox[I].Checked);
          if Assigned(Wnd.CheckBox[I].onClick) then       // if there is a click procedure, run it
            Wnd.CheckBox[I].onClick;
          exit;
        end;
    end;

    // Test and execute RadioButton click
    for I :=0 to High(Wnd.RadioButton) do
    begin
      if (MouseX > Wnd.RadioButton[I].X) AND (MouseX < Wnd.RadioButton[I].X + 16) then
        if (MouseY > Wnd.RadioButton[I].Y) AND (MouseY < Wnd.RadioButton[I].Y + 16) then
        begin
          // uncheck all the other radio buttons in this group
          for J :=0 to High(Wnd.RadioButton) do
            if Wnd.RadioButton[J].Group = Wnd.RadioButton[I].Group then
              Wnd.RadioButton[J].Checked :=FALSE;

          Wnd.RadioButton[I].Checked :=TRUE;
          if Assigned(Wnd.RadioButton[I].onClick) then       // if there is a click procedure, run it
            Wnd.RadioButton[I].onClick;
          exit;
        end;
    end;

  end;

  onMouseDown :=WndClick;
end;


{------------------------------------------------------------------}
{  Event that runs when mouse button is released                   }
{------------------------------------------------------------------}
procedure onMouseUp;
begin
  MouseDrag.Drag :=FALSE;
  Mouse.Button :=0;
  if ButtonPressed <> nil then
    ButtonPressed.Pressed :=FALSE;

  if ButtonPressed <> nil then
  begin
    // if there is a click procedure, run it.
    if Assigned(ButtonPressed^.onClick) then
      ButtonPressed^.onClick;
    ButtonPressed.Pressed :=FALSE;
  end             
end;

end.

