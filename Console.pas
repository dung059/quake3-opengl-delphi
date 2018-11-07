unit Console;

interface

uses OpenGL12, classes;

const
  FONT_HEIGHT = 12;
  FONT_WIDTH = 9;

type
  TConsole = class(TObject)
    private
      // Font
      FList : GLuint;                // Offset for the Display list
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
      procedure MakeRasterFont;
      function EvalCmd(s : string) : boolean;
    protected
    public
      constructor Create(Width, Height : integer);
      destructor Destroy;  override;
      procedure TextOut(x, y : byte; s : string);
      procedure AddMsg(msg : string);
      procedure Display;
      procedure AddIfDifferent(msg : string);
      procedure EvalKeys(var keys :array of boolean);
      property Lines : integer read FLines;
      property Cols : integer read FCols;
      property Visible : boolean read FVisible write FVisible;
      property ShowStats : boolean read FStats;
  end;

implementation

uses Global, windows, StrUtils, SysUtils;

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
  FLogPos := 0;
  FCmdPos := 0;
  FInput := '';
  MakeRasterFont;
  FLogLines := FLines-2-5;
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
  fnt := CreateFont(9, 0,0,0, FW_NORMAL, 0, 0, 0, OEM_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY	, FF_DONTCARE + DEFAULT_PITCH, 'Terminal');
  SelectObject(h_DC, fnt);
  wglUseFontBitmaps(h_DC, 0, 127, FList);
end;

procedure TConsole.PrintString(s : string);
begin
  glPushAttrib (GL_LIST_BIT);
    glListBase(FList);
    glCallLists(2*length(s), GL_UNSIGNED_BYTE,  PAnsiChar(s));
  glPopAttrib();
end;


procedure TConsole.TextOut(x, y : byte; s : string);
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
begin
  FLog.Add(Format('%4d %s', [FLog.Count+1, msg]));
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
    if (GetTickCount mod 1000) < 500 then
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
        Camera.ScreenLock := true;
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

procedure TConsole.AddIfDifferent(msg : string);
begin
  if FLog.Count > 0 then begin
    if LowerCase(FLog[FLog.Count-1]) <> LowerCase(msg) then
      FLog.Add(msg);
  end
  else
    FLog.Add(msg);
end;

end.
