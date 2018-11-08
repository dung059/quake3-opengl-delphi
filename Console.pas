unit Console;

interface

uses OpenGL, classes, Textures, Winapi.Windows;

const
  FONT_HEIGHT = 12;
  FONT_WIDTH = 9;

type
  FontRect = Record
                  T1,U1,T2,U2, W, H: single;
                 end;
  FontObj = Object
                 F: array of FontRect;
                 StartChar, FontLen, CharOffset: integer;
                 TexInd: glUInt;
                 SpaceWidth: single;
                 Procedure Load(const Path:string);
                 Procedure Draw(Const X,Y: single;Const Txt:string; Lev:single);
                 Function TextLen(Const Txt: string): single;
                end;


  TConsole = class(TObject)
    private
      // Font
      Fnt: FontObj;
      texFont : glUint;
      FList : GLuint;                // Offset for the Display list
      FSTT,
      FLines : integer;
      FLogLines : integer;
      FCols : integer;
      FLog : TStringList;
      FCmd : TStringList;
      FParams : TStringList;
      FLogPos : integer;
      FCmdPos : integer;
      FVisible : boolean;
      FStats : boolean;
      FInput : string;
      procedure PrintString(s : string);
      procedure glImgWrite(strText : string);
      procedure glWrite(X, Y : GLUint; text : PansiChar);
      procedure MakeRasterFont;
      function EvalCmd(s : string) : boolean;
    protected
    public
      constructor Create(Width, Height : integer);
      destructor Destroy;  override;
      procedure TextOut(x, y : byte; s : ansistring);
      procedure AddMsg(msg : string);
      procedure Display;
      procedure AddIfDifferent(msg : string);
      procedure EvalKeys(var keys :array of boolean); overload;
      procedure EvalKeys(var wParam: WPARAM); overload;
      property Lines : integer read FLines;
      property Cols : integer read FCols;
      property Visible : boolean read FVisible write FVisible;
      property ShowStats : boolean read FStats;
  end;

implementation

uses Global, StrUtils, SysUtils, ExtOpenGL;

constructor TConsole.Create(Width, Height : integer);
begin
  inherited Create;

  FVisible := false;
  FStats := false;
  FLines := SCREEN_HEIGHT div FONT_HEIGHT;
  FCols := SCREEN_WIDTH div FONT_WIDTH;
  FLog := TStringList.Create;
  FCmd := TStringList.Create;
  FParams := TStringList.Create;
  FSTT := 0;
  FLogPos := 0;
  FCmdPos := 0;
  FInput := '';
  MakeRasterFont;
  FLogLines := FLines-2-5;
  LoadTexture('images\FontLines2.tga', texFont, false, false);
  Fnt.Load('images\GUI\Test.tga');
end;

destructor TConsole.Destroy;
begin
  FParams.Free;
  FCmd.Free;
  FLog.Free;
  inherited Destroy;
end;

procedure TConsole.MakeRasterFont;
var fnt : HFONT;
begin
  FList := glGenLists (128);             // generate 128 display lists
  fnt := CreateFont(12, 0,0,0, FW_NORMAL, 0, 0, 0, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY	, FF_DONTCARE + DEFAULT_PITCH, 'Tahoma');  //Terminal
  // or below
  {
  fnt := CreateFont(-16,                           // height of font
		     0,                             // average character width
		     0,                             // angle of escapement
		     0,                             // base-line orientation angle
		     FW_BOLD,                       // font weight
		     0,			            // italic
		     0,                             // underline
		     0,			            // strikeout
		     ANSI_CHARSET,                  // character set
		     OUT_TT_PRECIS,	            // output precision
		     CLIP_DEFAULT_PRECIS,           // clipping precision
		     ANTIALIASED_QUALITY,           // output quality
		     FF_DONTCARE or DEFAULT_PITCH,  // pitch and family
		     'Arial');                      // font
  }
  SelectObject(h_DC, fnt);
  wglUseFontBitmaps(h_DC, 0, 127, FList);
end;

procedure TConsole.PrintString(s : string);
var i: Integer;
begin
  glPushAttrib (GL_LIST_BIT);
    glColor3f(125, 126, 127);
    glListBase(FList);
    glCallLists(length(s)*2, GL_UNSIGNED_BYTE,  PChar(s));
//    for i := 1 to length(s) do
//      glutBitmapCharacter(GLUT_BITMAP_TIMES_ROMAN_24, s[i]);
  glPopAttrib();
end;


procedure TConsole.TextOut(x, y : byte; s : ansistring);
begin
  //glWrite(X, Y, PansiChar(s));
  //exit;
  Fnt.Draw(30, Screen_Height-45, 'Width | Height: ' + FloatToStr(Screen_Width) + ' | ' + FloatToStr(Screen_Height), 1);

  if MultiTexture then begin
    glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisable(GL_TEXTURE_2D);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);

  glDisable(GL_DEPTH_TEST);
  glMatrixMode(GL_PROJECTION);
  glPushMatrix;
  glLoadIdentity;
  glOrtho(0,Screen_Width,0,Screen_Height,-1,1);
  glMatrixMode(GL_MODELVIEW);
  glPushMatrix;
  glLoadIdentity;

  glRasterPos2i((x-1)*FONT_WIDTH, SCREEN_HEIGHT-((y)*FONT_HEIGHT-3));                        // Set the position for the text to be rendered
  PrintString(s);

  // after
  glMatrixMode(GL_PROJECTION);
  glPopMatrix;
  glMatrixMode(GL_MODELVIEW);
  glPopMatrix;

  glEnable(GL_DEPTH_TEST);
  glDisable(GL_BLEND);
  if MultiTexture then begin
    glActiveTextureARB(GL_TEXTURE1_ARB);
    glEnable(GL_TEXTURE_2D);
    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glEnable(GL_TEXTURE_2D);
end;

procedure TConsole.AddMsg(msg : string);
var s: string; len: integer; a: Boolean;
begin
  // check lenght of msg
  inc(FSTT);
  len := 150;
  while length(msg) > len do begin
    s := copy(msg, 1, len);
    if not a then
      FLog.Add(Format('%4d %s', [FSTT, s]))
    else FLog.Add(Format('       %s', [s]));
    a := true;
    msg := copy(msg, len + 1, length(msg));
  end;
  if not a then
    FLog.Add(Format('%4d %s', [FSTT, msg]))
  else FLog.Add(Format('       %s', [s]));
  FLogPos := 0;
end;

procedure TConsole.Display;
var i, j, min, max : integer;
begin
  if MultiTexture then begin
    glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisable(GL_TEXTURE_2D);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);
    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glDisable(GL_TEXTURE_2D);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);

  glDisable(GL_DEPTH_TEST);
  glMatrixMode(GL_PROJECTION);
  glPushMatrix;
  glLoadIdentity;
  glOrtho(0,Screen_Width,0,Screen_Height,-1,1);
  glMatrixMode(GL_MODELVIEW);
  glPushMatrix;
  glLoadIdentity;

  // Prompt
  if  FVisible then begin
    glRasterPos2i(0, SCREEN_HEIGHT-((FLines)*FONT_HEIGHT-3));                        // Set the position for the text to be rendered
    if (GetTickCount mod 1000) < 10 then
      PrintString('>'+FInput)
    else
      PrintString('>'+FInput+'_');
  end;
  // Messages  
  if FLog.Count > 0 then begin
    i := FLines - 2;
    j := FLog.Count-1-FLogPos;
    while (i > 4) and (j >= 0) do begin
      glRasterPos2i(0, SCREEN_HEIGHT-((i)*FONT_HEIGHT-3));                        // Set the position for the text to be rendered
      PrintString(FLog[j]);
      dec(i);
      dec(j);
    end;
  end;
  // after
  glMatrixMode(GL_PROJECTION);
  glPopMatrix;
  glMatrixMode(GL_MODELVIEW);
  glPopMatrix;

  glEnable(GL_DEPTH_TEST);
  glDisable(GL_BLEND);
  if MultiTexture then begin
    glActiveTextureARB(GL_TEXTURE1_ARB);
    glEnable(GL_TEXTURE_2D);
    glActiveTextureARB(GL_TEXTURE0_ARB);
  end;
  glEnable(GL_TEXTURE_2D);
end;

procedure TConsole.EvalKeys(var keys :array of boolean);
var i : byte;
    l : integer;
begin
  for i := 0 to 255 do begin
    if keys[i] then begin
      case i of
        VK_HOME  : FlogPos := FLog.Count-FLogLines-1;
        VK_END   : FLogPos := 0;
        VK_PRIOR : begin
                    inc(FLogPos, FLogLines);
                    if FLogPos >= (FLog.Count-FLogLines) then
                      FlogPos := FLog.Count-FLogLines-1;
                  end;
        VK_NEXT  : begin
                     FLogPos := FLogPos - FLogLines;
                     if FLogPos < 0 then
                       FLogPos := 0;
                   end;
        32, 48..127 : begin
                    FInput := FInput + Chr(i);
                  end;
        13      : begin
                    // exec cmd
                    if Length(FInput) > 0 then begin
                      if EvalCmd(FInput) then
                        AddMsg(Finput);
                      FCmd.Add(FInput);
                      FCmdPos := FCmd.Count;
                      FInput := '';
                    end;
                  end;
        8 :       begin
                    l := Length(FInput);
                    if l > 0 then
                      FInput := LeftStr(Finput,l-1);
                  end;
        VK_UP :   begin
                    if FCmd.Count > 0 then begin
                      dec(FCmdPos);
                      if FCmdPos < 0 then
                        FCmdPos := FCmd.Count - 1;
                      FInput := FCmd[FCmdPos];
                    end;
                  end;
        VK_DOWN:  begin
                    if FCmd.Count > 0 then begin
                      inc(FCmdPos);
                      if FCmdPos >= FCmd.Count then
                        FCmdPos := 0;
                      FInput := FCmd[FCmdPos];
                    end;
                  end;
        else begin
        end;
      end;
      keys[i] := false;
    end;
  end;
end;

{------------------------------------------------------------------}
{  Renders the text to a row of polygons and keeps the origin      }
{  in the centre of the string                                     }
{------------------------------------------------------------------}
procedure TConsole.glImgWrite(strText: string);
var I, intAsciiCode : integer;
    imgcharWidth : GLfloat;
    imgcharPosX : GLfloat;
begin
glPushMatrix;

  glBindTexture(GL_TEXTURE_2D, texFont);  // Bind the Texture to the object
  glAlphaFunc(GL_GREATER, 0.4);

  glRotatef(-(ElapsedTime/10), 1, 0, 0);

  imgcharWidth := 1.0/66;
  strText := UpperCase(strText);

  for I := 1 to length(strText) do
  begin

    if ord(strText[I]) > 31 then //only handle 66 chars
    begin
      intAsciiCode := ord(strText[I]) - 32;
      imgcharPosX := length(strText)/2*0.08-length(strText)*0.08 + (i-1) * 0.08; // Find the character position from the origin [0.0 , 0.0 , 0.0]  to center the text
      glBegin(GL_QUADS);

        glTexCoord2f(imgcharWidth*intAsciiCode, 0.0);
        glVertex3f(-0.04+imgcharPosX, -0.04,  0.0);

        glTexCoord2f(imgcharWidth*intAsciiCode+imgcharWidth, 0.0);
        glVertex3f( 0.04+imgcharPosX, -0.04,  0.0);

        glTexCoord2f(imgcharWidth*intAsciiCode+imgcharWidth, 1.0);
        glVertex3f( 0.04+imgcharPosX,  0.04,  0.0);

        glTexCoord2f(imgcharWidth*intAsciiCode, 1.0);
        glVertex3f(-0.04+imgcharPosX,  0.04,  0.0);
      glEnd;
    end;
  end;
glPopMatrix;
end;

procedure TConsole.glWrite(X, Y : GLUint; text : PansiChar);
var drawRect : TRect;
begin
  glPushAttrib(GL_DEPTH_TEST);  // Save the current Depth test settings (Used for blending )
  glDisable(GL_DEPTH_TEST);     // Turn off depth testing (otherwise we get no FPS)
  glDisable(GL_TEXTURE_2D);     // Turn off textures, don't want our text textured
  glMatrixMode(GL_PROJECTION);  // Switch to the projection matrix
  glPushMatrix();               // Save current projection matrix
  glLoadIdentity();

  GetWindowRect(GetDesktopWindow(), drawRect);  // Get current window size
  glOrtho(0, drawRect.right, 0, drawRect.bottom, -1, 1);  // Change the projection matrix using an orthgraphic projection
  glMatrixMode(GL_MODELVIEW);  // Return to the modelview matrix
  glPushMatrix();              // Save the current modelview matrix
  glLoadIdentity();
  glColor3f(1.0, 1.0, 1.0);    // Text color

  glRasterPos2i(X, Y);                                // Position the Text
  glPushAttrib(GL_LIST_BIT);                          // Save's the current base list
  glListBase(FList - 32);                              // Set the base list to our character list
  glCallLists(length(text), GL_UNSIGNED_BYTE, PChar(text));  // Display the text
  glPopAttrib();                                      // Restore the old base list

  glMatrixMode(GL_PROJECTION);  // Switch to projection matrix
  glPopMatrix();                // Restore the old projection matrix
  glMatrixMode(GL_MODELVIEW);   // Return to modelview matrix
  glPopMatrix();                // Restore old modelview matrix
  glEnable(GL_TEXTURE_2D);      // Turn on textures, don't want our text textured
  glPopAttrib();                // Restore depth testing
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


function TConsole.EvalCmd(s : string) : boolean;
var unknown : boolean;
    byteVal : integer;
begin
  unknown := true;
  s := trim(s);
  if Length(s) > 0 then begin
    Tokenize(s, FParams);
    if FParams.Count = 1 then begin
      if FParams[0] = 'POS' then begin
        skipNextMove := true;
        with Q3Level.PlayerPosition do begin
          Camera.Init(FOV, SCREEN_WIDTH, SCREEN_HEIGHT, 1, 1, Angle);
          Camera.position.X := Position.x;
          Camera.position.Y := Position.y+40;
          Camera.position.Z := Position.z;
          Camera.ApplyCamera;
        end;
        currentLeaf := Q3Level.FindLeaf(Camera.Position);
        unknown := false;
      end
      else if (FParams[0] = '?') or (FParams[0] = 'HELP') then begin
        FLog.Add('QUIT - terminate program');
        FLog.Add('CLR - clear log');
        FLog.Add('STATS 1/0 - Show statistics on/off');
        FLog.Add('POS - change camera position');
        FLog.Add('COLLISION 1/0 - collision test on/off');
        FLog.Add('SORT 1/0 - depth sort faces on/off');
        FLog.Add('MULTITEXTURE 1/0 - Multitexturing on/off');
        FLog.Add('SHADERS 1/0 - Use shaders on/off');
        FLog.Add('WIREFRAME 1/0 - Wireframe on/off');
        FLog.Add('SKYBOX 1/0 - Render skybox on/off');
        FLog.Add('FOG 1/0 - Render fog on/off');
        FLog.Add('MUSIC 0..255 - Music volume');
        FLog.Add('FX 0..255 - FX volume');
        unknown := false;
      end
      else if (FParams[0] = 'CLR') then begin
        FLog.Clear;
        unknown := false;
      end
      else if (FParams[0] = 'QUIT') then begin
        finished := true;
        unknown := false;
      end;
    end
    else if FParams.Count = 2 then begin
      if (FParams[1] = '0') or (FParams[1] = '1') then begin
        if FParams[0] = 'COLLISION' then begin
          TestCollision := StrToBool(FParams[1]);
          unknown := false;
        end
        else if FParams[0] = 'SORT' then begin
          SortFaces := StrToBool(FParams[1]);
          unknown := false;
        end
        else if FParams[0] = 'MULTITEXTURE' then begin
          if GL_ARB_multitexture then begin
            MultiTexture := StrToBool(FParams[1]);
            if not Multitexture then begin
              glActiveTextureARB(GL_TEXTURE1_ARB);
              glDisable(GL_TEXTURE_2D);
              glActiveTextureARB(GL_TEXTURE0_ARB);
            end;
          end;
          unknown := false;
        end
        else if FParams[0] = 'SHADERS' then begin
          SimpleRender := not StrToBool(FParams[1]);
          unknown := false;
        end
        else if FParams[0] = 'WIREFRAME' then begin
          WireFrame := StrToBool(FParams[1]);
          if Wireframe then begin
            glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
            RenderSky := false;
          end
          else
            glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
          unknown := false;
        end
        else if FParams[0] = 'SKYBOX' then begin
          RenderSky := StrToBool(FParams[1]);
          unknown := false;
        end
        else if FParams[0] = 'STATS' then begin
          FStats := StrToBool(FParams[1]);
          unknown := false;
        end
        else if FParams[0] = 'FOG' then begin
          ShowFog := StrToBool(FParams[1]);
          unknown := false;
        end;
      end
      else begin
        byteVal := StrToInt(FParams[1]);
        if (byteVal >=0) and (byteVal < 256) then begin
          if FParams[0] = 'MUSIC' then begin
            MUSIC_VOL := byteVal;
            unknown := false;
          end
          else if FParams[0] = 'FX' then begin
            FX_VOL := byteVal;
            unknown := false;
          end;
        end;
      end;
    end;
  end;
  if unknown then begin
    MessageBeep(0);
    FLog.Add('Unknown command: '+s);
  end;
  result := not unknown;
end;

procedure TConsole.EvalKeys(var wParam: WPARAM);
var l: integer;
begin
      case wParam of
        VK_HOME  : FlogPos := FLog.Count-FLogLines-1;
        VK_END   : FLogPos := 0;
        VK_PRIOR : begin
                    inc(FLogPos, FLogLines);
                    if FLogPos >= (FLog.Count-FLogLines) then
                      FlogPos := FLog.Count-FLogLines-1;
                  end;
        VK_NEXT  : begin
                     FLogPos := FLogPos - FLogLines;
                     if FLogPos < 0 then
                       FLogPos := 0;
                   end;
        32, 48..127 : begin
                    FInput := FInput + Chr(wParam);
                  end;
        13      : begin
                    // exec cmd
                    if Length(FInput) > 0 then begin
                      if EvalCmd(FInput) then
                        AddMsg(Finput);
                      FCmd.Add(FInput);
                      FCmdPos := FCmd.Count;
                      FInput := '';
                    end;
                  end;
        8 :       begin
                    l := Length(FInput);
                    if l > 0 then
                      FInput := LeftStr(Finput,l-1);
                  end;
        VK_UP :   begin
                    if FCmd.Count > 0 then begin
                      dec(FCmdPos);
                      if FCmdPos < 0 then
                        FCmdPos := FCmd.Count - 1;
                      FInput := FCmd[FCmdPos];
                    end;
                  end;
        VK_DOWN:  begin
                    if FCmd.Count > 0 then begin
                      inc(FCmdPos);
                      if FCmdPos >= FCmd.Count then
                        FCmdPos := 0;
                      FInput := FCmd[FCmdPos];
                    end;
                  end;
        else begin
        end;
      end;
end;

procedure TConsole.AddIfDifferent(msg : string);
begin
  if FLog.Count > 0 then begin
    if LowerCase(FLog[FLog.Count-1]) <> LowerCase(msg) then
      FLog.Add(msg);
  end
  else
    FLog.Add(msg);
end;

{ FontObj }

procedure FontObj.Draw(const X, Y: single; const Txt: string; Lev: single);

Procedure DrawQuadRT(X, Y, Wid, Hgt, Lev, Tu, Tu2, Tv,Tv2: single);
begin
  Tv := 1-Tv;
  Tv2 := 1-Tv2;
  glBegin(GL_QUADS);
    glTexCoord2f(Tu,  Tv); glVertex3f(X,     Y, -lev);
    glTexCoord2f(Tu2, Tv); glVertex3f(X+Wid, Y, -lev);
    glTexCoord2f(Tu2,Tv2); glVertex3f(X+Wid, Y-Hgt, -lev);
    glTexCoord2f(Tu, Tv2); glVertex3f(X,     Y-Hgt, -lev);
  glEnd;
end;

Var I, Let: integer;
    Xx: Single;
begin
  if txt = '' then exit;

  glBindTexture(GL_TEXTURE_2D,TexInd);

  Xx := X;
  For I := 1 to length(Txt) do
  begin
     Let := Ord(Txt[I])-StartChar;
     if (Let <> -1) and not (let > FontLen) then
     begin
      DrawQuadRT(Xx,Y, F[Let].W+1.25,F[Let].H+1.25,Lev,F[Let].T1,F[Let].T2+0.005,F[Let].U1,F[Let].U2+0.005);
      Xx := Xx + F[Let].W+1.25-CharOffset;
     end
     else
     Xx := Xx + SpaceWidth;
  end;
end;

procedure FontObj.Load(const Path: string);
Var Fi: TfileStream;
    I, Data: integer;
    StPos: longint;
begin
  LoadTexture(Path, TexInd, False, false);
  SpaceWidth := 5;
  Fi := TFileStream.Create(Path, $0000);
  Fi.Seek(-sizeof(longint), soFromEnd);
  Fi.Read(Stpos, sizeof(longint));
  Fi.Seek(Stpos, soFromBeginning);

  Fi.Read(Data, Sizeof(integer));
  FontLen := Data;
  Fi.Read(Data, Sizeof(integer));
  StartChar := Data;
  Fi.Read(Data, Sizeof(integer));
  CharOffset := Data;

  Setlength(F, FontLen+1);
  For I := 0 to high(F) do
   begin
     Fi.Read(F[I], sizeof(FontRect));
   end;
  Fi.Free;
end;

function FontObj.TextLen(const Txt: string): single;
Var I, Let: integer;
    Len: single;
begin
   Len := 0;
   For I := 0 to length(Txt) do
   begin
      Let := Ord(Txt[I])-StartChar;
      if (Let <> -1) then
      begin
       Len := Len + F[Let].W+1-CharOffset;
      end
      else
      Len := Len + SpaceWidth;
   end;
   Result := Len;
end;

end.
