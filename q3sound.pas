unit q3sound;

interface

uses fmod, fmodtypes, fmoderrors, SysUtils, q3types, Bass;

type
  // sound lib entry
  TSample = record
    Name : string;
    SamplePtr : PFSoundSample;
    SampleBass: HSTREAM;
    Loop : boolean;
    Use3D : boolean;
    //Position : TVector3f;
    //Volume : integer;
    //UsePosition : boolean;
  end;
  // emitters can share the same samples
  TEmitter = record
    SampleId : integer;
    SamplePtr : PFSoundSample;
    SampleBass: HSTREAM;
    Position : TVector3f;
    UsePosition :boolean;
    //Loop : boolean;
  end;


const
  MaxChannels = 128; // = Max. emitters
  MaxSamples = 256;  // = Max. entries in sound lib
  // 8 untits = 1 foot = 12 inches = 30,48cm
  // 8 units * 3.2 = 25.6 units = 1 m

type
  TSoundEngine = class(TObject)
  private
    FSoundLib : array[0..MaxSamples-1] of TSample;
    FnumOfSamples : integer;
    FEmitters : array[0..MaxChannels-1] of TEmitter;
    FnumOfEmitters : integer;
    FSampleRate : integer;
    FEnabled : boolean;
    FCameraChannel : integer;
  protected
  public
    // Var for BASS Sound
    Stream   : array of HSTREAM;
    BassInit : Boolean;
    constructor Create;
    destructor Destroy; override;
    // returns index of FSoundLib
    function LoadSample(name : string; Loop, Use3D : boolean) : integer; overload;
    function LoadSample( inmemory: Boolean; name : ansistring) : integer; overload;
    // returns index of FEmitters ( = channel)
    function NewEmitter(SampleId : integer; Position : TVector3f; UsePosition, IsCamera : boolean) : integer;
    //procedure Play(Channel : integer; Pause : boolean);
    //procedure Update(Channel : integer; Position : TVector3f);
    procedure PlayStream(soundname: String; flush: BOOL; flags: DWORD);
    procedure Update(PlayerPosition : TVector3f);
    function CPU_Usage : single;
    property Enabled : boolean read FEnabled;
    property Count : integer read FnumOfSamples;
  end;

implementation

uses Global, Winapi.Windows, System.Classes;

constructor TSoundEngine.Create;
var caps: Cardinal;
    i : integer;
    enm: TFSoundOutputTypes;
begin
  inherited Create;
  FEnabled := false;
  FSampleRate := 44100;
  FnumOfSamples := 0;
  FnumOfEmitters := 0;
  FCameraChannel := -1;
  if FMOD_VERSION <= FSOUND_GetVersion then begin
    FSOUND_SetOutput(FSOUND_OUTPUT_DSOUND);

    enm := FSOUND_GetOutput();
    if enm <> FSOUND_OUTPUT_DSOUND then begin
      Cons.AddMsg('Err: DirectSound Output was not successfully set!');
      case enm of
        FSOUND_OUTPUT_WINMM:    Cons.AddMsg('  Sound Output is now: Windows Multimedia Waveout');
        FSOUND_OUTPUT_DSOUND:   Cons.AddMsg('  Sound Output is now: Direct Sound - Dont believe what you read.');
        FSOUND_OUTPUT_A3D:      Cons.AddMsg('  Sound Output is now: A3D');
        FSOUND_OUTPUT_NOSOUND:  Cons.AddMsg('  Sound Output is now: No Sound - Thats usefull...');
      end;
    end;

    Cons.AddMsg('Init Sound');
    Cons.AddMsg('--- DRIVER LIST ---');
    for i := 0 to FSOUND_GetNumDrivers() - 1 do begin
      Cons.AddMsg(inttostr(i + 1) + ' - ' + FSOUND_GetDriverName(i)); // print driver names
      FSOUND_GetDriverCaps(i, caps);
      if caps and FSOUND_CAPS_HARDWARE <> 0 then
        Cons.AddMsg('  - Driver supports hardware 3D sound!');
      if caps and FSOUND_CAPS_EAX2 <> 0 then
        Cons.AddMsg('  - Driver supports EAX 2 reverb!');
      if caps and FSOUND_CAPS_EAX3 <> 0 then
        Cons.AddMsg('  - Driver supports EAX 3 reverb!');
      if Caps = 0 then
        Cons.AddMsg('  - This sound card cannot support hardware 3D. Software mode will be used.');
    end;
    Cons.AddMsg('Setting Driver to '+ FSound_GetDriverName(1));
    FSOUND_SetDriver(1);
    FSOUND_SetMixer(FSOUND_MIXER_QUALITY_AUTODETECT);
    FSOUND_SetMinHardwareChannels(MaxChannels);

    if FSOUND_Init(FSampleRate, MaxChannels, 0) then begin
      FEnabled := true;
      //FSOUND_SetVolume(FSOUND_ALL, 0);
    end;
    case (FSOUND_GetMixer()) of
      FSOUND_MIXER_BLENDMODE:     Cons.AddMsg('Mixer Mode: FSOUND_MIXER_BLENDMODE');
      FSOUND_MIXER_MMXP5:         Cons.AddMsg('Mixer Mode: FSOUND_MIXER_MMXP5');
      FSOUND_MIXER_MMXP6:         Cons.AddMsg('Mixer Mode: FSOUND_MIXER_MMXP6');
      FSOUND_MIXER_QUALITY_FPU:   Cons.AddMsg('Mixer Mode: FSOUND_MIXER_QUALITY_FPU');
      FSOUND_MIXER_QUALITY_MMXP5: Cons.AddMsg('Mixer Mode: FSOUND_MIXER_QUALITY_MMXP5');
      FSOUND_MIXER_QUALITY_MMXP6: Cons.AddMsg('Mixer Mode: FSOUND_MIXER_QUALITY_MMXP6');
    end;
  end;

  // BASS
  //--- Initialize and Start BASS Sound system ----//
  Stream := 0;
  BASSInit :=FALSE;
  if BASS_GetVersion() <> MAKELONG(0,8) then    //  Check that BASS 0.8+ was loaded
  begin
    MessageBox(0, 'BASS version 0.8 Sound System was not loaded', 'Sound', MB_OK or MB_ICONERROR);
    exit;
  end;

  // Initialize digital sound - default device, 44100hz, stereo, 16 bits
  if not BASS_Init(-1, 44100, 0, h_Wnd) then
  begin
    MessageBox(0, 'Can''t initialize digital sound system', 'Sound', MB_OK or MB_ICONERROR);
    exit;
  end;

  //  Start digital output
  BASS_Start;
  {Stream := BASS_StreamCreateFile(FALSE, PAnsiChar('E:\GAME\Quake III\baseq3\pak0\sound\player\footsteps\step2.wav'), 0, 0, 0);
  if Stream = 0 then
  begin
    MessageBox(0, 'Can''t create digital sound stream. Music file might be missing', 'Sound', MB_OK or MB_ICONERROR);
    exit;
  end;
  }
  BASSInit :=TRUE;

end;

destructor TSoundEngine.Destroy;
begin
  FSOUND_Close();

  inherited Destroy;
end;

function TSoundEngine.LoadSample(inmemory: Boolean; name: ansistring): integer;
var Stream1   : HSTREAM;
  fs: TMemoryStream;
  memp: Pointer;
begin
  if inmemory then
    begin
      fs := Pk3Zip.GetFileBytes(name);
      GetMem(memp, fs.size);
      fs.Read(memp^, fs.Size);
      Stream1 := BASS_StreamCreateFile(true, memp, 0, fs.Size, 0);
      fs.Free;
    end
  else
    Stream1 := BASS_StreamCreateFile(FALSE, PChar(name), 0, 0, 0);
  if Stream1 = 0 then
  begin
    //MessageBox(0, 'Can''t create digital sound stream. Music file might be missing', 'Sound', MB_OK or MB_ICONERROR);
    exit;
  end else begin
    FSoundLib[FnumOfSamples].Name := name;
    FSoundLib[FnumOfSamples].SampleBass := Stream1;
    FSoundLib[FnumOfSamples].Loop := false;
    FSoundLib[FnumOfSamples].Use3D := false;
    result := FnumOfSamples;
    inc(FnumOfSamples);
  end;
end;

//function TSoundEngine.LoadSample(name : string; Position : TVector3f; UsePosition, Loop : boolean) : integer;
function TSoundEngine.LoadSample(name : string; Loop, Use3D : boolean) : integer;
var sptr : PFSoundSample; mdl: PFMusicModule;
    i, Mode : integer;
begin
  result := -1;
  if not FEnabled then begin
    result := -1;
    exit;
  end;

  name := LowerCase(name);
  name := StringReplace(name, '/', '\', [rfReplaceAll]); // remove linux style path delimiters

(*  if FnumOfSamples > 0 then begin
    for i := 0 to FNumOfSamples-1 do begin
      if (FSoundLib[i].Name = name) and (FSoundLib[i].Loop = Loop) and (FSoundLib[i].Use3D = Use3D)then begin
        result := i; // sample already loaded
        exit;
      end;
    end;
  end;
*)
  Mode := 0;
  if Loop then
    Mode := Mode + FSOUND_LOOP_NORMAL
  else
    Mode := Mode + FSOUND_LOOP_OFF;
  if Use3D then
    Mode := Mode + FSOUND_HW3D
  else
    Mode := Mode + FSOUND_2D;

  sptr := FSOUND_Sample_Load(FSOUND_FREE, PChar(name), Mode ,0,0);
  if sptr <> nil then begin
    FSoundLib[FnumOfSamples].Name := name;
    FSoundLib[FnumOfSamples].SamplePtr := sptr;
    FSoundLib[FnumOfSamples].Loop := Loop;
    FSoundLib[FnumOfSamples].Use3D := Use3D;
    result := FnumOfSamples;
    inc(FnumOfSamples);
    if Use3D then
      begin FSOUND_Sample_SetMinMaxDistance(sptr, 1, 1000);FSOUND_Sample_SetMode(sptr, FSOUND_LOOP_NORMAL);
      end;
    inc(Result);
  end;

  mdl := FMUSIC_LoadSong('E:\GAME\Quake III\baseq3\pak0\sound\player\footsteps\invtro94.s3m'); {can be xm, s3m...}
  if mdl <> nil then begin
    FMUSIC_PlaySong(mdl);
    FMUSIC_SetPanSeperation(mdl, 0.15); // 15% crossover
    FMUSIC_SetOrder(mdl, FMUSIC_GetOrder(mdl) - 1);
  end;

  // this section is evaluated only if the sample isn't loaded
(*
  if Loop then
    Mode := FSOUND_LOOP_NORMAL
  else
    Mode := 0;
  if UsePosition then begin
    Mode := Mode+FSOUND_HW3D;
    //Mode := Mode + FSOUND_2D;
  end
  else
    Mode := Mode + FSOUND_2D;
//  if Loop then
//    Mode := Mode + FSOUND_LOOP_NORMAL;
  sptr := FSOUND_Sample_Load(FSOUND_FREE, PChar(name), Mode ,0,0);
  if UsePosition then
    FSOUND_Sample_SetMinMaxDistance(sptr, 1, 1);
  if sptr <> nil then begin
    position.Z := - Position.Z;
    FSampleList[FnumOfSamples].Name := name;
    FSampleList[FnumOfSamples].SamplePtr := sptr;
    FSampleList[FnumOfSamples].Position  := Position;
    FSampleList[FnumOfSamples].UsePosition  := UsePosition;
    //FSampleList[FnumOfSamples].Volume := Volume;

    result := FnumOfSamples;
    inc(FnumOfSamples);
  end
  else
    result := -1;
*)
end;

function TSoundEngine.NewEmitter(SampleId : integer; Position : TVector3f; UsePosition, IsCamera : boolean) : integer;
begin
  if not FEnabled then exit;

  if (FnumOfEmitters < (MaxChannels-1)) then begin
    if (SampleId >= 0) {and (SampleId < FnumOfSamples)} then begin
      FEmitters[FnumOfEmitters].SampleId := SampleId;
      if BassInit then
        FEmitters[FnumOfEmitters].SampleBass := FSoundLib[FnumOfEmitters].SampleBass
      else 
        FEmitters[FnumOfEmitters].SamplePtr := FSoundLib[SampleId].SamplePtr;
      FEmitters[FnumOfEmitters].Position := Position;
      FEmitters[FnumOfEmitters].UsePosition := UsePosition;
//      FSOUND_SetVolume(FnumOfEmitters, 0);
      if not IsCamera then
        if BassInit then
           BASS_StreamPlay(FEmitters[FnumOfEmitters].SampleBass, FALSE, 0)
        else
          FSOUND_PlaySoundEx(FnumOfEmitters, FEmitters[FnumOfEmitters].SamplePtr, nil, true);
      result := FnumOfEmitters;
      if IsCamera then
        FCameraChannel := FnumOfEmitters;
      inc(FnumOfEmitters);
    end
    else
      result := -1;
  end
  else
    result := -1;

(*  if (Channel >= 0) and (Channel < FnumOfSamples) then begin
    FSOUND_PlaySoundEx(Channel, FSampleList[Channel].SamplePtr, nil, Pause);
    FSOUND_SetVolume(Channel, 0);
  end;
*)
end;

procedure TSoundEngine.PlayStream(soundname: String; flush: BOOL;
  flags: DWORD);
begin
  if BassInit then
    BASS_StreamPlay(stream[0], FALSE, 0);
end;

(*
procedure TSoundEngine.Update(Channel : integer; Position : TVector3f);
var vel : TVector3f;
begin
  vel.x := 0;
  vel.y := 0;
  vel.z := 0;
  FSOUND_3D_SetAttributes(Channel, @Position, @vel);
  //FSOUND_3D_Listener_SetAttributes
  //FSOUND_3D_Update();
end;
*)
procedure TSoundEngine.Update(PlayerPosition : TVector3f);
var i : integer;
    vel, pos, point : TVector3f;
    distance : single;
    vol_factor : single;

begin
  if FEnabled and (FnumOfSamples > 0) then begin
    vol_factor := 255 / FX_VOL;
    vel.x := 0; vel.y := 0; vel.z := 0;
    pos := PlayerPosition;
    //@@pos.Z := -pos.z;
    //@@FSOUND_3D_Listener_SetAttributes(@pos, @vel, camera.eyedir.X, camera.eyedir.Y, -camera.eyedir.Z, 0, 1, 0);
    FSOUND_3D_Listener_SetAttributes(@pos, @vel, camera.eyedir.X, camera.eyedir.Y, camera.eyedir.Z, 0, 1, 0);
    for i := 0 to FnumOfEmitters-1 do begin
      FSOUND_SetPaused(i, false);
      // Distance -> volume
      if FEmitters[i].UsePosition then begin
        Point.x := FEmitters[i].Position.x  - PlayerPosition.x;
        Point.y := FEmitters[i].Position.y  - PlayerPosition.y;
        Point.z := FEmitters[i].Position.z  - PlayerPosition.z;
        distance := sqrt(Point.x*Point.x + Point.y*Point.y + Point.z*Point.z);
        if distance < 0 then
          distance := abs(distance);
        if distance <= 512 then begin
          FSOUND_SetVolume(i, Trunc((255 - Round(distance/2))/vol_factor));
          //FSOUND_3D_SetAttributes(i, @FSampleList[i].Position, @vel);
        end
        else
          FSOUND_SetVolume(i, 1);
      end
      else begin
        if (FCameraChannel = i) then begin
          FSOUND_SetVolume(i, FX_VOL);
          if Camera.PlaySound then begin
            if GroundType = 'NORMAL' then
              if BassInit then
                 BASS_StreamPlay(FSoundLib[Camera.NormalSound+Camera.sndCnt].SampleBass, FALSE, 0)
              else
                FSOUND_PlaySoundEx(FCameraChannel, FSoundLib[Camera.NormalSound+Camera.sndCnt].SamplePtr, nil, false);
            if GroundType = 'METAL' then
              if BassInit then
                 BASS_StreamPlay(FSoundLib[Camera.MetalSound+Camera.sndCnt].SampleBass, FALSE, 0)
              else
                FSOUND_PlaySoundEx(FCameraChannel, FSoundLib[Camera.MetalSound+Camera.sndCnt].SamplePtr, nil, false);
            if GroundType = 'WATER' then
              if BassInit then
                 BASS_StreamPlay(FSoundLib[Camera.WaterSound+Camera.sndCnt].SampleBass, FALSE, 0)
              else
                FSOUND_PlaySoundEx(FCameraChannel, FSoundLib[Camera.WaterSound+Camera.sndCnt].SamplePtr, nil, false);
(*            inc(Camera.sndCnt);
            if Camera.sndCnt > 3 then
              Camera.sndCnt := 0;*)
            Camera.sndCnt := Random(2);  
            Camera.PlaySound := false;
          end;  
        end
        else
          FSOUND_SetVolume(i, MUSIC_VOL);
      end;
      FSOUND_Update();

    end;
  end;
end;

function TSoundEngine.CPU_Usage : single;
begin
  if FEnabled then
    result := FSOUND_GetCPUUsage
  else
    result := 0;
end;

end.
