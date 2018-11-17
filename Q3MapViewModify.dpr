program Q3MapViewModify;

uses
  Forms,
  Windows,
  Messages,
  SysUtils,
  Opengl,
  math,
  Dialogs,
  fmodtypes,
  fmoderrors,
  Jpeg,
  Graphics,
  Q3BSP in 'Q3BSP.pas',
  Cam in 'Cam.pas',
  Textures in 'Textures.pas',
  Frustum in 'Frustum.pas',
  math3d in 'math3d.pas',
  q3shaders in 'q3shaders.pas',
  global in 'global.pas',
  q3types in 'q3types.pas',
  q3timer in 'q3timer.pas',
  q3SkyBox in 'q3SkyBox.pas',
  qsortunit in 'qsortunit.pas',
  Console in 'Console.pas',
  q3sound in 'q3sound.pas',
  fmod in 'fmod.pas',
  ExtOpenGL in 'ExtOpenGL.pas',
  glFlash in 'glFlash.pas',
  Bass in 'Bass.pas',
  Setup in 'Setup.pas',
  q3Threads in 'q3Threads.pas',
  Q3Pk3Read in 'Q3Pk3Read.pas',
  Q3MD3 in 'Q3MD3.pas',
  Q3client in 'Q3client.pas';

var
 (* h_Wnd  : HWND;                     // Global window handle
  h_DC   : HDC;                      // Global device context
  h_RC   : HGLRC;                    // OpenGL rendering context
*)  
  TimedFPS : cardinal;


{$R *.RES}

procedure CheckCollision(sp, ep : TVector3f); forward;
procedure glInit(); forward;
procedure startmap();  forward;
procedure shutdownmap(); forward;
procedure glResizeWnd(Width, Height : Integer); forward;

procedure ShowInitial;
begin

  if SimpleRender then
    Cons.AddMsg('simple rendering')
  else
    Cons.AddMsg('normal rendering');

  if TestCollision then
    Cons.AddMsg('collision test on')
  else
    Cons.AddMsg('collision test off');
  if RenderSky then
    Cons.AddMsg('skybox on')
  else
    Cons.AddMsg('skybox off');
  if Multitexture then
    Cons.AddMsg('lightmaps on')
  else
    Cons.AddMsg('lightmaps off');
end;

// this procedure will capture the screen content into the suppliet ABitmap parameter.
procedure CaptureScreen(ABitmap: Graphics.TBitmap);
var
  vDesktopDC: HDC;   // variable to store the device context handle of desktop window
begin
  // get the device context handle of current desktop window
  vDesktopDC := GetWindowDC(GetActiveWindow);   //GetDesktopWindow
  try
      // adjust the dimension and format of the supplied bitmap to match the screen
      ABitmap.PixelFormat := pf24bit;
      ABitmap.Height := Screen.Height;
      ABitmap.Width := Screen.Width;

      // draw the content of desktop into ABitmap
      BitBlt(ABitmap.Canvas.Handle, 0, 0, ABitmap.Width, ABitmap.Height, vDesktopDC, 0, 0, SRCCOPY);
  finally
    // mark that we have done with the desktop device context
    ReleaseDC(GetActiveWindow, vDesktopDC);
  end;
end;
procedure CaptureScreenToFile(const AFilename: string);
var
  vJpg: TJpegImage;
  vBmp: TBitmap;
begin
  // create temporary bitmap
  vBmp := TBitmap.Create;
  try
    CaptureScreen(vBmp);
    // create Jpg image object
    vJpg := TJpegImage.Create;
    try
      vJpg.Assign(vBmp);
      // compress the image to have quality 70% of original
      vJpg.CompressionQuality := 70;
      // save the captured screen into a file in jpg format
      vJpg.SaveToFile(AFileName);
    finally
      vJpg.Free;  //destroy the jpg image object
    end;
  finally
    vBmp.Free; // destroy temporary bitmap
  end;
end;
(*
procedure ShowHelp;
begin
  Q3Level.AddError('**************************************************');
  Q3Level.AddError('F1 = show this info');
  Q3Level.AddError('F2 = info on/off');
  Q3Level.AddError('F3 = change position');
  Q3Level.AddError('F4 = collision test on/off');
  Q3Level.AddError('F5 = sort on/off');
  Q3Level.AddError('F6 = render mode');
  Q3Level.AddError('F7 = lightmaps on/off');
  Q3Level.AddError('F8 = wireframe on/off');
  Q3Level.AddError('F9 = skybox on/off');
  Q3Level.AddError('ESC = end');

  Q3Level.AddError('W = forward');
  Q3Level.AddError('S = backward');
  Q3Level.AddError('A = strafe left');
  Q3Level.AddError('D = strafe right');
  Q3Level.AddError('P = pause on/off');

  Q3Level.AddError('**************************************************');
  Q3Level.AddError('');
end;
*)
procedure ProcessKeys;
var inputs:string;
begin
  if keys[220] {or (keys[Ord('H')])} then begin  // phím '\'
    Cons.Visible := not Cons.Visible;
    keys[220] := false;
  end
  else begin
    if (keys[VK_UP]) or (keys[Ord('W')])   then
      Camera.moveForward := true;
    if (keys[VK_DOWN]) or (keys[Ord('S')]) then
      Camera.moveBackward := true;
    if (keys[VK_RIGHT]) or (keys[Ord('D')])then
      Camera.moveRight := true;
    if (keys[VK_LEFT]) or (keys[Ord('A')]) then
      Camera.moveLeft := true;
    if (keys[VK_PRIOR]) or keys[166] then  //PgUp
      Camera.moveUp := true;
    if (keys[VK_NEXT]) or keys[167] then   //PgDn
      Camera.moveDown := true;
  end;

  if keys[Ord('Q')] then      // go to previous leg movement
  begin

    keys[Ord('Q')] :=FALSE;
  end;

  if keys[Ord('N')] then       // Reset Position to default
  begin
    Player.animLower :=LEGS_WALK;
    Player.animUpper :=TORSO_STAND;
    Player.SetAnim(Player.animLower);
    Player.SetAnim(Player.animUpper);
    keys[Ord('N')] :=FALSE;
  end;

  if keys[Ord('B')] then      // Reset Position to default
  begin
    Player.animLower :=LEGS_WALK;
    Player.animUpper :=TORSO_STAND;
    Player.SetAnim(Player.animLower);
    Player.SetAnim(Player.animUpper);
    keys[Ord('B')] :=FALSE;
  end;

  if keys[Ord('Z')] then       // Go to next leg movement
  begin
    Inc(Player.animLower);
    if (Player.animLower > BOTH_DEAD3) AND (Player.animLower < LEGS_WALKCR) then
    begin
       Player.animLower := LEGS_WALKCR;
       Player.animUpper := TORSO_STAND;
       Player.SetAnim(Player.animUpper);
    end;
    if Player.animLower > LEGS_TURN then
       Player.animLower :=BOTH_DEATH1;
    Player.SetAnim(Player.animLower);
    keys[Ord('Z')] :=FALSE;
  end;

  if keys[Ord('X')] then      // go to previous leg movement
  begin
    Dec(Player.animLower);
    if (Player.animLower > BOTH_DEAD3) AND (Player.animLower < LEGS_WALKCR) then
       Player.animLower := BOTH_DEAD3;
    if Player.animLower < BOTH_DEATH1 then
       Player.animLower :=LEGS_TURN;
    Player.SetAnim(Player.animLower);
    keys[Ord('X')] :=FALSE;
  end;

  if keys[Ord('C')] then      // go to next torso movement
  begin
    Inc(Player.animUpper);
    if Player.animUpper > TORSO_STAND2 then
       Player.animUpper :=TORSO_GESTURE;
    Player.SetAnim(Player.animUpper);
    keys[Ord('C')] :=FALSE;
  end;

  if keys[Ord('V')] then      // go to previous torso movement
  begin
    Dec(Player.animUpper);
    if Player.animUpper < TORSO_GESTURE then
       Player.animUpper :=TORSO_STAND2;
    Player.SetAnim(Player.animUpper);
    keys[Ord('V')] :=FALSE;
  end;

  if (keys[VK_PAUSE]) or keys[Ord('P')] then begin   //Pause
    Pause := not Pause;
    keys[VK_PAUSE] := false;
    keys[Ord('P')] := false;
  end;

  if keys[VK_INSERT] then
    begin
      // cencel = 2;
//      if (messagedlg('Custom dialog: ban muon load map: ' + LIST_BSP_NAME.Strings[BSP_MAP_INDEX + 1]
//            ,mtConfirmation, [mbYes,mbAll,mbCancel], 0) =  6) then begin
    keys[VK_INSERT] := false;
    inputs := IntToStr(Pk3Zip.BSP_LIST.IndexOf(BSP_NAME) + 1);
    ShowCursor(true);
    if not InputQuery('Nhap vao so map ban muon tu!', '0--' + Inttostr(Pk3Zip.BSP_LIST.Count - 1), inputs) then
      begin
        ShowCursor(false);
        exit;
      end;

    if StrToInt(inputs) >= Pk3Zip.BSP_LIST.Count then
      inputs := '0';
//       Pk3Zip.PK3_INDEX.ItemIndex := 0;

    BSP_NAME := Pk3Zip.BSP_LIST.Strings[StrToInt(inputs)];
    //BSP_NAME := LIST_BSP_NAME.Strings[Random(LIST_BSP_NAME.Count - 1)];
    Camera.ResetPosition;
    Drawgame := FLASHINIT;
    ShowCursor(false);
    //end;
  end;
  if (keys[VK_SCROLL]) then    //phim ScrLk
  begin
    Camera.screenlock := Not(Camera.screenlock);
    if Camera.screenlock then   // Không tạo cảm giác bị giật màn hình
      begin
        SetCursorPos((SCREEN_WIDTH  DIV 2) + SCREEN_LEFT, (SCREEN_HEIGHT DIV 2) + SCREEN_TOP);
        ShowCursor(false);
      end
    else
      ShowCursor(true);
    keys[VK_SCROLL] :=FALSE;
  end;
  // Toggle wireframe mode
  if (keys[VK_DELETE])  then
  begin
    WireFrame :=Not(WireFrame);
    if WireFrame then
      glPolygonMode(GL_FRONT_AND_BACK, GL_LINE or GL_POINT)
    else
      glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    keys[VK_DELETE] :=FALSE;
  end;

  FlashProcessKeys;

  if (keys[VK_SPACE]) or keys[VK_F12] then    //phim Fly
  begin
    skipNextMove := Not(skipNextMove);
    keys[VK_SPACE] :=FALSE;
    keys[VK_F12] :=FALSE;
  end;

  if (keys[VK_HOME]) then    //phim Fly
  begin
    Camera.move_mouse_y := Camera.move_mouse_y + 10;

    keys[VK_HOME] :=FALSE;
  end;

  if (keys[VK_F9]) then    //
  begin
    CreateDir('screenshot');
    CaptureScreenToFile(format('screenshot\screenshot_%s.jpg', [formatdatetime('dd-mm-yy_hh-mm-ss', now())]));

    keys[VK_F9] :=FALSE;
  end;
end;

procedure SplashScreen(h_dc : HDC);
begin
    // begin render
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);    // Clear The Screen And The Depth Buffer
    glLoadIdentity();                                       // Reset The View

    glDisable(GL_CULL_FACE);

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    glPushAttrib(GL_ALL_ATTRIB_BITS);
    glMatrixMode(GL_PROJECTION);
    glPushMatrix;
    glLoadIdentity;

    glDisable(GL_DEPTH_TEST);                                                     // Disables Depth Testing

    glOrtho(0, SCREEN_WIDTH, 0, SCREEN_HEIGHT, -1, 1);                                    // Set Up An Ortho Screen
    glMatrixMode(GL_MODELVIEW);                                                   // Select The Modelview Matrix
    glPushMatrix();
    glLoadIdentity();

    // RenderBackground;

    glColor4f(1, 1, 1, 1);

    //TEXTURE LAYER 0
    if GL_ARB_multitexture then
      glActiveTextureARB(GL_TEXTURE0_ARB);
    GLBindTexture(GL_TEXTURE_2D, splashId);
//    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
    glEnable(GL_TEXTURE_2D);
    //TEXTURE LAYER 1
    if GL_ARB_multitexture then
      glActiveTextureARB(GL_TEXTURE1_ARB);
    glDisable(GL_TEXTURE_2D);

    glBegin(GL_QUADS);
      //1
    if GL_ARB_multitexture then
      glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 0, 0);
    glVertex2i(0, 0);
    glColor4f(1, 1, 1, 1);
      //2
    if GL_ARB_multitexture then
      glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 1, 0);
    glVertex2i(SCREEN_WIDTH, 0);
    glColor4f(1, 1, 1, 1);
      //3
    if GL_ARB_multitexture then
      glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 1, 1);
    glVertex2i(SCREEN_WIDTH, SCREEN_HEIGHT);
    glColor4f(1, 1, 1, 1);
      //4
    if GL_ARB_multitexture then
      glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 0, 1);
    glVertex2i(0, SCREEN_HEIGHT);
    glColor4f(1, 1, 1, 1);
    glEnd;

    glPopMatrix;
    glMatrixMode(GL_PROJECTION);
    glPopMatrix;
    glPopAttrib;
    glMatrixMode(GL_MODELVIEW);

    //FixedFont.TextOut(1,1, 'Loading...');
    glFinish;
    //SwapBuffers(h_DC);
    //DrawIt := true;
    //exit;
end;

procedure glDraw(h_dc : HDC);
begin
  if gTimer <> nil then
    gTimer.Refresh;

  case drawgame of
  FLASHINIT:
    begin
      FlashglInit();
      drawgame := FLASHDRAW;
    end;
   FLASHDRAW:
      begin
        FlashglDraw();  // tam on
        //SplashScreen(h_dc);  // very slow
      end;
    BSPINIT:
      glInit();

    BSPDRAW:
      begin
             glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);    // Clear The Screen And The Depth Buffer
             glLoadIdentity();                                       // Reset The View
             Camera.ApplyCamera;

             Sound.Update(Camera.Position);
             Frust.CalculateFrustum;
             currentLeaf := Q3Level.FindLeaf(Camera.Position);
             Q3Level.RenderBSP(Camera.Position, currentLeaf);

             glPushMatrix;
               glScalef(0.3, 0.3, 0.3);
               glTranslatef(60, -40, 0);
               //glTranslatef(Camera.position.X + 30, Camera.position.Y, Camera.position.Y + 6);
               glRotatef(90, 0, 1, 0);
               glRotatef(-90, 0, 0, 1);
               glRotatef(Camera.move_mouse_click_x, 1, 0, 0);
               glRotatef(Camera.move_mouse_click_y, 0, 0, 1);
               Player.Draw(ElapsedTime/1000);
             glPopMatrix;

             if Cons.Visible or Cons.ShowStats then begin
               with camera do begin
                 Cons.TextOut(20,1, Format('POS:  %10.2f%10.2f%10.2f%10d%10d', [position.x,position.y,position.z, Q3Level.currentPosition+1, Q3Level.PositionCount]));
                 Cons.TextOut(20,2, Format('VIEW: %10.2f%10.2f%10.2f%10.2f%10.2f', [eyedir.x,eyedir.y,eyedir.z, x_angle, y_angle]));
                 Cons.TextOut(20,3, Format('SPEED:%10.2f%10.2f%10.2f%12s', [velocity.x,velocity.y,velocity.z, GroundType]));
               end;
               Cons.TextOut(45, 1, Format('FPS: %6d%6d%6.2f (SND)', [TimedFPS ,gTimer.GetAverageFPS, Sound.CPU_Usage]));
               Cons.TextOut(45, 2, Format('MAP: %6d%6d%6d%6d', [VisibleTriangles, numSolid, numAdditive, numTransparent]));
               Cons.TextOut(45, 3, Format('BSP: %6d%6d%6d%6d%6d (t,r,p,f,c)', [BSPLeaves, renderedLeaves, PVSLeaves, frustumLeaves, currentLeaf]));

               // Log
               Cons.Display;
             end;

             drawORGLine();
        end;

  end;


  SwapBuffers(h_DC);
  endTime := gTimer.GetTime;

  RenderTime := gTimer.DiffTime(startTime, endTime);


end;

procedure glInit();
var snd, channel : integer;
begin
  if not Assigned(gTimer) then
    gTimer := THiResTimer.Create;

  // load all other init first

  if not Assigned(Cons) then
    begin
      Cons := TConsole.Create(SCREEN_WIDTH, SCREEN_HEIGHT);
      Cons.AddMsg('OpenGL vendor ' + glGetString(GL_VENDOR));
      Cons.AddMsg('OpenGL renderer ' + glGetString(GL_RENDERER));
      Cons.AddMsg('OpenGL version ' + glGetString(GL_VERSION));
      Cons.AddMsg('Supported OpenGL extensions ' + glGetString(GL_EXTENSIONS));
    end;
  if not Assigned(Sound) then
    begin
      Sound := TSoundEngine.Create;
      // load walk sound
      Camera.NormalSound  := Sound.LoadSample('\sound\player\footsteps\step1.wav', false, false);
      channel := Sound.NewEmitter(Camera.NormalSound, SetVector(0,0,0), false, true);
      Camera.Channel := channel;
      Camera.MetalSound  := Sound.LoadSample('\sound\player\footsteps\clank1.wav', false, false);
      Camera.WaterSound  := Sound.LoadSample('\sound\player\footsteps\splash1.wav', false, false);
      // fmod
      Sound.LoadSample('\sound\player\footsteps\step2.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\step3.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\step4.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\clank2.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\clank3.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\clank4.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\splash2.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\splash3.wav', false, false);
      Sound.LoadSample('\sound\player\footsteps\splash4.wav', false, false);
      // bass
      Sound.LoadSample(false, '\sound\player\footsteps\step2.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\step3.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\step4.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\clank2.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\clank3.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\clank4.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\splash2.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\splash3.wav');
      Sound.LoadSample(false, '\sound\player\footsteps\splash4.wav');
      Camera.NormalSound  := Sound.LoadSample(false, '\sound\player\footsteps\step1.wav');
      Camera.MetalSound  := Sound.LoadSample(false, '\sound\player\footsteps\clank1.wav');
      Camera.WaterSound  := Sound.LoadSample(false, '\sound\player\footsteps\splash1.wav');
    end;

  lastKeyPress := GetTickCount;

  //DrawIt := true;
  ShowInitial;

  if drawgame in [FLASHINIT, BSPINIT] then
    begin
      glClearColor(0.0, 0.0, 0.0, 0.0); 	   // Black Background
      glShadeModel(GL_SMOOTH);                 // Enables Smooth Color Shading
      glClearDepth(1);                         // Depth Buffer Setup
      glEnable(GL_DEPTH_TEST);                 // Enable Depth Buffer
      glDepthFunc(GL_LEQUAL);	           // The Type Of Depth Test To Do

      glEnable(GL_COLOR);
      glDepthMask(byte(true));

      glCullFace(GL_FRONT);
      glEnable(GL_CULL_FACE);
      glEnable(GL_TEXTURE_2D);                 // Enable Texture Mapping
      glEnable(GL_BLEND);                 // Enable Texture Mapping
      glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);

      checkthread := false;
      if drawgame = BSPINIT then
        drawgame := BSPDRAW;

      glResizeWnd(SCREEN_WIDTH, SCREEN_HEIGHT); // DOV !!!!!
  end;
      // OpenGL initialized and viewport is set  splashName := IncludeTrailingPathDelimiter(ExtractFilePath(QUAKE_FOLDER));
  if drawgame = BSPDRAW then    //   BSPDRAW đã load trong thread
    begin
      splashName := 'levelshots\' + ChangeFileExt(BSP_NAME, '.jpg');
      splashId := ShaderManager.LoadTexture(splashName, false, false);
      // glDraw(h_DC);

      Camera.screenlock := true;
      Camera.ResetPosition;

      //Loaded := Q3Level.LoadBSP(QUAKE_FOLDER , BSP_NAME, BSP_MAP_INDEX);
      if not Q3Level.LoadBSP('' , BSP_NAME, true) then PostQuitMessage(0);

      Player.LoadPlayer('models\players\anarki', 'default');
      Player.SetAnim(0);
      //LoadRailgun;

      with Q3Level.PlayerPosition do begin
        Camera.Init(FOV, SCREEN_WIDTH, SCREEN_HEIGHT, 1, 1, Angle);
        Camera.position.X := Position.x;
        Camera.position.Y := Position.y + 40;
        Camera.position.Z := Position.z + 0;
        Camera.ApplyCamera;
      end;
      currentLeaf := Q3Level.FindLeaf(Camera.Position);
      SetCursorPos((SCREEN_WIDTH  DIV 2) + SCREEN_LEFT, (SCREEN_HEIGHT DIV 2) + SCREEN_TOP);
    end;

  SetTimer(h_Wnd, FPS_TIMER, FPS_INTERVAL, nil);  // we don't show/update performance number each frame
end;

procedure glResizeWnd(Width, Height : Integer);
begin
  if (Height = 0) then                // prevent divide by zero exception
    Height := 1;
  glViewport(0, 0, Width, Height);    // Set the viewport for the OpenGL window
  glMatrixMode(GL_PROJECTION);        // Change Matrix Mode to Projection
  glLoadIdentity();                   // Reset View
//  gluPerspective(FOV, Width/Height, 1.0, DEPTH_OF_VIEW);  // Do the perspective calculations. Last value = max clipping depth
  if drawgame = FLASHDRAW then
    gluPerspective(FOV, Width/Height, 1.0, 300);  // Do the perspective calculations. Last value = max clipping depth
  if drawgame in [FLASHINIT, BSPDRAW, BSPINIT] then
    gluPerspective(FOV, Width/Height, 1.0, DEPTH_OF_VIEW);  // Do the perspective calculations. Last value = max clipping depth
//  PerspectiveGL(FOV, Width/Height, 4.0, DEPTH_OF_VIEW);
//   glFrustum(-4.0, 4.0, -2.704225, 2.704225, 4.0, 4096.0);  //GLQuake Mode

  SCREEN_WIDTH  := Width;
  SCREEN_HEIGHT := Height;

  glMatrixMode(GL_MODELVIEW);         // Return to the modelview matrix
  glLoadIdentity();                   // Reset View
end;

procedure CheckCollision(sp, ep : TVector3f); // oldPos, Camera.Position
var trace, backup : TBSPMove;
    extents,
    step_up,
    step_down,		  // minimal height that can be considered as a hole
    endPoint,		  // final position
    startPoint,		  // start position
    reqMove,
    remain,
    slide,
    endBackup : TVector3f;// backup end pos for comparison (to detect step climbing)
begin
  // WICHTIG: step_up und step_down müssen dieselbe Länge besizten !!!!
  step_down  := SetVector(0, -16, 0);
  step_up    := SetVector(0, 16, 0);
  // WICHTIG: extents.y muss grösser 2*abs(step_up.y) sein !!!!
  //extents    := SetVector(16, 74, 16); // CAKE values
  extents    := SetVector(16, 35, 16); // CAKE values
  startPoint := sp;
  endPoint   := ep;

  // Versuch den Zielpunkt zuerreichen
  trace := Q3Level.checkMove(startPoint, endPoint, extents);
  if (trace.fraction <> 1) then begin //  collision
    // collision point merken
    endBackup := trace.endPoint;
    backUp := trace;
    startPoint := AddVector(sp, step_up);
    endPoint := AddVector(ep, step_up);
    trace := Q3Level.checkMove(startPoint, endPoint, extents);
    // Versuchen höher zu gehen
    if (trace.fraction = 1) then begin // no collision
      Camera.position := endPoint;
    end
    else begin // try slide
      reqMove.x := endPoint.x - startPoint.x;
      reqMove.y := endPoint.y - startPoint.y;
      reqMove.z := endPoint.z - startPoint.z;
      remain := ScaleVector(reqMove, 1-backup.fraction);
      Normalize(backup.Normal);
      slide := SubtractVector(remain, ScaleVector(backUp.Normal, dotProduct(backup.Normal, remain)));
      startPoint := sp;
      endPoint := AddVector(startPoint, slide);
      trace := Q3Level.checkMove(startPoint, endPoint, extents);
      if trace.fraction <> 0 then
        Camera.position := trace.endPoint
      else 
        Camera.position := endBackup;
    end;
  end
  else  // no collision
    Camera.position := ep;

  // test ground
  endPoint := AddVector(camera.position, step_down);
  trace := Q3Level.checkMove(camera.position, endPoint, extents);
  if trace.fraction = 1 then
    Camera.position := endPoint
  else
    Camera.position := trace.endPoint;
  if trace.brush = -1 then
    GroundType := ''
  else begin
    GroundType := Q3Level.GetSurfaceType(trace.brush);
  end;
end;

function WndProc(hWnd: HWND; Msg: UINT;  wParam: WPARAM;  lParam: LPARAM): LRESULT; stdcall;
begin
  result := 0;
  //if not Loaded then begin
  //  Result := DefWindowProc(hWnd, Msg, wParam, lParam);    // Default result if nothing happens
  //  exit;
  //end;

  case (Msg) of
    WM_CREATE:
      begin
        // Insert stuff you want executed when the program starts
      end;
    WM_CLOSE:
      begin
        PostQuitMessage(0);
        Result := 0
      end;
    WM_SHOWWINDOW:
      drawgame := FLASHDRAW;
    WM_KEYDOWN:       // Set the pressed key (wparam) to equal true so we can check if its pressed
      begin
        keys[wParam] := True;
        lastKeyPress := GetTickCount;
        if Cons.Visible then begin
          Pause := false;
          Cons.EvalKeys(wParam);
        end;
        Result := 0;
      end;
    WM_KEYUP:         // Set the released key (wparam) to equal false so we can check if its pressed
      begin
        keys[wParam] := False;
        Result := 0;
      end;
    WM_SIZE:          // Resize the window with the new width and height
      begin
        glResizeWnd(LOWORD(lParam),HIWORD(lParam));
        Result := 0;
      end;
    WM_MOVE: //top, left
      begin
        SCREEN_TOP := LOWORD(lParam);
        SCREEN_LEFT :=  HIWORD(lParam);
        glResizeWnd(SCREEN_WIDTH, SCREEN_HEIGHT);
      end;
    WM_TIMER :                     // Add code here for all timers to be used.
      begin
        if wParam = FPS_TIMER then begin
          //FPSCount :=Round((FPSCount * 1000)/FPS_INTERVAL);
          //TimedFPS := FPSCount;
          if Pause then
            DumpMsg := 'PAUSE (press ''P'' to continue)'//+ IntToStr(FPScount)
          else
            DumpMsg := '';
          SetWindowText(h_Wnd, PChar(WND_TITLE + format(
                '[%s index: %d\%d | FPS: %d, rot(X/Y: %0.8f-%0.8f) CAM(%0.8f|%0.8f|%0.8f) VIEW(%0.8f|%0.8f|%0.8f)]',
                [BSP_NAME, Pk3Zip.BSP_LIST.IndexOf(BSP_NAME), Pk3Zip.BSP_LIST.Count - 1, gTimer.GetFPS,
                //X/Y
                Camera.move_mouse_click_x, Camera.move_mouse_click_y, Camera.position.X, Camera.position.Y, Camera.position.Z,
                //VIEW
                camera.eyedir.x,camera.eyedir.y,camera.eyedir.z])));
          //FPSCount := 0;
          Result := 0;
        end;
      end;
    WM_RBUTTONDOWN :                                                    // If we hit the right mouse button
      begin
        if keys[VK_CONTROL] then
          begin
            skipNextMove := true;
            Camera.ResetPosition;
          end
        else
        with Q3Level.PlayerPosition do begin
          Camera.Init(FOV, SCREEN_WIDTH, SCREEN_HEIGHT, 1, 1, Angle);
          Camera.position.X := Position.x;
          Camera.position.Y := Position.y + 40;
          Camera.position.Z := Position.z + 0;
          Camera.ApplyCamera;
        end;
      end;
    WM_LBUTTONDOWN:  							// If we hit the left mouse button
      Camera.mouseclick := not Camera.mouseclick;
    WM_MOUSEWHEEL:  							// If we hit the left mouse button
      begin
        //skipNextMove := Not(skipNextMove);
        if keys[VK_CONTROL] then
           Camera.position.X := Camera.position.X + HIWORD(lParam)/120*2
        else
           Camera.position.Z := Camera.position.Z - HIWORD(lParam)/120*2
      end;
    WM_MOUSEHWHEEL:  							// If we hit the left mouse button
      begin
        glScalef(1.0, 1.0, 0.0);
        Camera.position.X := Camera.position.X - 100;
      end;
    WM_MOUSEMOVE:
      if Camera.mouseclick then
        begin
          Camera.move_mouse_x := LOWORD(lParam);
          Camera.move_mouse_x := HIWORD(lParam);
          Camera.mouseclick := not Camera.mouseclick;
        end;
    else
      Result := DefWindowProc(hWnd, Msg, wParam, lParam);    // Default result if nothing happens
  end;
end;

procedure glKillWnd(Fullscreen : Boolean);
var
  i: integer;
begin
  BASS_Stop;
  if Sound.BASSInit then
    for I := Low(Sound.Stream) to High(Sound.Stream) do
      BASS_StreamFree(Sound.Stream[i]);     // Free the stream
  BASS_Free;

//  if Assigned(Player) then
//    FreeAndNil(Player);

  if Fullscreen then begin            // Change back to non fullscreen
    //Loaded := false;
    ChangeDisplaySettings(devmode(nil^), 0);
    ShowCursor(True);
  end;

  // Makes current rendering context not current, and releases the device
  // context that is used by the rendering context.
  if (not wglMakeCurrent(h_DC, 0)) then
    MessageBox(0, 'Release of DC and RC failed!', 'Error', MB_OK or MB_ICONERROR);

  // Attempts to delete the rendering context
  if (not wglDeleteContext(h_RC)) then begin
    MessageBox(0, 'Release of rendering context failed!', 'Error', MB_OK or MB_ICONERROR);
    h_RC := 0;
  end;

  // Attemps to release the device context
  if ((h_DC > 0) and (ReleaseDC(h_Wnd, h_DC) = 0)) then begin
    MessageBox(0, 'Release of device context failed!', 'Error', MB_OK or MB_ICONERROR);
    h_DC := 0;
  end;

  // Attempts to destroy the window
  if ((h_Wnd <> 0) and (not DestroyWindow(h_Wnd))) then begin
    MessageBox(0, 'Unable to destroy window!', 'Error', MB_OK or MB_ICONERROR);
    h_Wnd := 0;
  end;

  // Attempts to unregister the window class
  if (not UnRegisterClass('OpenGL', hInstance)) then begin
    MessageBox(0, 'Unable to unregister window class!', 'Error', MB_OK or MB_ICONERROR);
    hInstance := 0;
  end;
end;

function glCreateWnd(Width, Height : Integer; Fullscreen : Boolean; PixelDepth, TextureDepth : Integer) : Boolean;
var
  wndClass : TWndClass;         // Window class
  dwStyle : DWORD;              // Window styles
  dwExStyle : DWORD;            // Extended window styles
  dmScreenSettings : DEVMODE;   // Screen settings (fullscreen, etc...)
  PixelFormat : GLuint;         // Settings for the OpenGL rendering
  h_Instance : HINST;           // Current instance
  pfd : TPIXELFORMATDESCRIPTOR;  // Settings for the OpenGL window
begin
  //InitOpenGL;

  h_Instance := GetModuleHandle(nil);       //Grab An Instance For Our Window
  ZeroMemory(@wndClass, SizeOf(wndClass));  // Clear the window class structure

  with wndClass do  begin                  // Set up the window class
    style         := CS_HREDRAW or    // Redraws entire window if length changes
                     CS_VREDRAW or    // Redraws entire window if height changes
                     CS_OWNDC;        // Unique device context for the window
    lpfnWndProc   := @WndProc;        // Set the window procedure to our func WndProc
    hInstance     := h_Instance;
    hCursor       := LoadCursor(0, IDC_ARROW);
    hIcon         := LoadIcon(hInstance, 'MAINICON');
    lpszClassName := 'OpenGL';
  end;

  if (RegisterClass(wndClass) = 0) then  begin// Attemp to register the window class
    MessageBox(0, 'Failed to register the window class!', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit
  end;

  // Change to fullscreen if so desired
  if Fullscreen then begin
    ZeroMemory(@dmScreenSettings, SizeOf(dmScreenSettings));
    with dmScreenSettings do begin              // Set parameters for the screen setting
      dmSize       := SizeOf(dmScreenSettings);
      dmPelsWidth  := Width;                    // Window width
      dmPelsHeight := Height;                   // Window height
      dmBitsPerPel := PixelDepth;               // Window color depth
      dmFields     := DM_PELSWIDTH or DM_PELSHEIGHT or DM_BITSPERPEL;
    end;

    // Try to change screen mode to fullscreen
    if (ChangeDisplaySettings(dmScreenSettings, CDS_FULLSCREEN) = DISP_CHANGE_FAILED) then begin
      MessageBox(0, 'Unable to switch to fullscreen!', 'Error', MB_OK or MB_ICONERROR);
      Fullscreen := False;
    end;
  end;

  // If we are still in fullscreen then
  if (Fullscreen) then begin
    dwStyle := WS_POPUP or                // Creates a popup window
               WS_CLIPCHILDREN            // Doesn't draw within child windows
               or WS_CLIPSIBLINGS;        // Doesn't draw within sibling windows
    dwExStyle := WS_EX_APPWINDOW;         // Top level window
    ShowCursor(false);                    // Turn of the cursor (gets in the way)
  end
  else begin
       dwStyle := WS_OVERLAPPEDWINDOW or     // Creates an overlapping window
               WS_CLIPCHILDREN or         // Doesn't draw within child windows
               WS_CLIPSIBLINGS;           // Doesn't draw within sibling windows

    dwExStyle := WS_EX_APPWINDOW or       // Top level window
                 WS_EX_WINDOWEDGE;        // Border with a raised edge
    ShowCursor(false);                    // Turn of the cursor (gets in the way)
  end;

  // Attempt to create the actual window
  h_Wnd := CreateWindowEx(dwExStyle,      // Extended window styles
                          'OpenGL',       // Class name
                          WND_TITLE,      // Window title (caption)
                          dwStyle,        // Window styles
                          0, 0,           // Window position
                          Width, Height,  // Size of window
                          0,              // No parent window
                          0,              // No menu
                          h_Instance,     // Instance
                          nil);           // Pass nothing to WM_CREATE
  if h_Wnd = 0 then begin
    glKillWnd(Fullscreen);                // Undo all the settings we've changed
    MessageBox(0, 'Unable to create window!', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit;
  end;

  // Try to get a device context
  h_DC := GetDC(h_Wnd);
  if (h_DC = 0) then begin
    glKillWnd(Fullscreen);
    MessageBox(0, 'Unable to get a device context!', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit;
  end;

  // Settings for the OpenGL window
  with pfd do begin
    nSize           := SizeOf(TPIXELFORMATDESCRIPTOR); // Size Of This Pixel Format Descriptor
    nVersion        := 1;                    // The version of this data structure
    dwFlags         := PFD_DRAW_TO_WINDOW    // Buffer supports drawing to window
                       or PFD_SUPPORT_OPENGL // Buffer supports OpenGL drawing
                       or PFD_DOUBLEBUFFER;  // Supports double buffering
    iPixelType      := PFD_TYPE_RGBA;        // RGBA color format
    cColorBits      := PixelDepth;           // OpenGL color depth
    cRedBits        := 0;                    // Number of red bitplanes
    cRedShift       := 0;                    // Shift count for red bitplanes
    cGreenBits      := 0;                    // Number of green bitplanes
    cGreenShift     := 0;                    // Shift count for green bitplanes
    cBlueBits       := 0;                    // Number of blue bitplanes
    cBlueShift      := 0;                    // Shift count for blue bitplanes
    cAlphaBits      := 0;                    // Not supported
    cAlphaShift     := 0;                    // Not supported
    cAccumBits      := 0;                    // No accumulation buffer
    cAccumRedBits   := 0;                    // Number of red bits in a-buffer
    cAccumGreenBits := 0;                    // Number of green bits in a-buffer
    cAccumBlueBits  := 0;                    // Number of blue bits in a-buffer
    cAccumAlphaBits := 0;                    // Number of alpha bits in a-buffer
    cDepthBits      := TextureDepth;           // Specifies the depth of the depth buffer
    cStencilBits    := 0;                    // Turn off stencil buffer
    cAuxBuffers     := 0;                    // Not supported
    iLayerType      := PFD_MAIN_PLANE;       // Ignored
    bReserved       := 0;                    // Number of overlay and underlay planes
    dwLayerMask     := 0;                    // Ignored
    dwVisibleMask   := 0;                    // Transparent color of underlay plane
    dwDamageMask    := 0;                     // Ignored
  end;

  // Attempts to find the pixel format supported by a device context that is the best match to a given pixel format specification.
  PixelFormat := ChoosePixelFormat(h_DC, @pfd);
  if (PixelFormat = 0) then begin
    glKillWnd(Fullscreen);
    MessageBox(0, 'Unable to find a suitable pixel format', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit;
  end;

  // Sets the specified device context's pixel format to the format specified by the PixelFormat.
  if (not SetPixelFormat(h_DC, PixelFormat, @pfd)) then begin
    glKillWnd(Fullscreen);
    MessageBox(0, 'Unable to set the pixel format', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit;
  end;

  // Create a OpenGL rendering context
  h_RC := wglCreateContext(h_DC);
  if (h_RC = 0) then begin
    glKillWnd(Fullscreen);
    MessageBox(0, 'Unable to create an OpenGL rendering context', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit;
  end;

  // Makes the specified OpenGL rendering context the calling thread's current rendering context
  if (not wglMakeCurrent(h_DC, h_RC)) then begin
    glKillWnd(Fullscreen);
    MessageBox(0, 'Unable to activate OpenGL rendering context', 'Error', MB_OK or MB_ICONERROR);
    Result := False;
    Exit;
  end;
  //ReadExtensions;
  //ReadImplementationProperties;
  CheckExtensions;
  if GL_EXT_compiled_vertex_array then begin
    LockingAvailable := true;
    LockArrays := true;
  end;
  // Settings to ensure that the window is the topmost window
  ShowWindow(h_Wnd, SW_SHOWMAXIMIZED);
  SetForegroundWindow(h_Wnd);
  SetFocus(h_Wnd);

  // Ensure the OpenGL window is resized properly
  glInit();
  glResizeWnd(Width, Height); // DOV !!!!!

  Result := True;
end;

function WinMain(hInstance : HINST; hPrevInstance : HINST; lpCmdLine : PChar; nCmdShow : Integer) : Integer; stdcall;

  function CallSetup(hInstance : HINST; hPrevInstance : HINST): boolean;
  begin
    Result := true;
    if not SetupWin(hInstance, hPrevInstance) then
    begin
      Result := false;
      Exit;
    end;
  end;


var msg : TMsg;
    oldPos, newPos : TVector3f;
  DemoStart, LastTime : DWord;
begin
  finished := False;

{
  if not SetupWin(hInstance, hPrevInstance) then
  begin
    Result := 0;
    Exit;
  end;
}

  // Perform application initialization:
  if not glCreateWnd(SCREEN_WIDTH, SCREEN_HEIGHT, fullscreen, COLOR_DEPTH, TEXTURE_DEPTH) then begin
    Result := 0;
    Exit;
  end;

  // Main message loop:
  while not finished do begin
    if (PeekMessage(msg, 0, 0, 0, PM_REMOVE)) then begin // Check if there is a message for this window
      if (msg.message = WM_QUIT) then     // If WM_QUIT message received then we are done
        finished := True
      else begin                               // Else translate and dispatch the message to this window
  	TranslateMessage(msg);
        DispatchMessage(msg);
      end;
    end
    else begin
      // Inc(FPSCount);                      // Increment FPS Counter

      LastTime := ElapsedTime;
      ElapsedTime := GetTickCount() - DemoStart; // Calculate Elapsed Time
      ElapsedTime := (LastTime + ElapsedTime) DIV 2;

//      if LockScreen and (GetForegroundWindow = h_Wnd) then begin
//        Camera.MoveCameraByMouse; // ShowCursor(false);
//      end;// else ShowCursor(true);

      if (GetForegroundWindow = h_Wnd) then
        begin
          if drawgame = BSPDRAW then
            begin
              //ShowCursor(false);
              Camera.MoveCameraByMouse;
            end;

         oldPos := Camera.position;
         //ProcessKeys;

         if (lastKeyPress + START_PAUSE_AFTER) < GetTickCount then
           Pause := true;
         if Pause then
           Camera.AutoRotate;

         Camera.Update(gTimer.FrameTime);
         newPos := Camera.position;
         glDraw(h_dc);                           // Draw the scene
         if TestCollision and not skipNextMove and (Drawgame = BSPDRAW) then
           CheckCollision(oldPos, newPos);
         //skipNextMove := false;
      end;

      if (keys[VK_ESCAPE]) then           // If user pressed ESC then set finised TRUE
        begin
          ShowCursor(true);
          if (messagedlg('AN HUY - THUY TRANG muon thoat', mtConfirmation, [mbYes,mbCancel], 0)) = 6 then
            finished := True;
          ShowCursor(false);
          keys[VK_ESCAPE] := false;
        end
      else
        ProcessKeys;
    end;
  end;
  glKillWnd(FALSE);
  Result := msg.wParam;
end;

procedure startmap();
begin
  Pk3Zip := TZipPK3.Create(Q3_BASE_PATH, BSP_NAME);
//  Pk3Zip.IndexOf(BSP_NAME);
//  if Pk3Zip.IsOpenIndex = -1 then
//    Pk3Zip.IndexOf(Pk3Zip.BSP_LIST.Strings[0]);

  if not Assigned(frust) then
    frust := TFrustum.Create;
  if not Assigned(ShaderManager) then
    ShaderManager := TShaderManager.Create(Pk3Zip);
  if not Assigned(Camera) then
    Camera := TCamera.Create;
  Camera.max_speed := CAM_SPEED;
  Camera.acceleration := CAM_ACCEL;
  Camera.friction := CAM_FRICT;

  if not Assigned(Q3Level) then
    Q3Level := TQuake3BSP.Create;
  Q3Level.ShaderManager := ShaderManager;
  Q3Level.Camera := Camera;
end;

procedure shutdownmap();
begin
  if Assigned(Q3Level) then
    Q3Level.Free;
  if Assigned(Camera) then
    Camera.Free;
  if Assigned(ShaderManager) then
    ShaderManager.free;
  if Assigned(gTimer) then
    gTimer.Free;
  if Assigned(Cons) then
    Cons.Free;
  if Assigned(Sound) then
    Sound.Free;
  if Assigned(frust) then
    frust.Free;
end;

begin
  startmap(); // not need

  WinMain( hInstance, hPrevInst, CmdLine, CmdShow );

  shutdownmap();
end.
