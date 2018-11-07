unit shaderValues;

interface

uses OpenGL12, classes, sysutils, Hashes;

var ValueList : TIntegerHash;
function LookUp(name : string) : integer;

implementation

uses Dialogs, q3shaders;

function LookUp(name : string) : integer;
begin
  result := -1;
  if (Copy(name, 1, 1) >= '0') and (Copy(name, 1, 1) <= '9') then begin
    result := StrToInt(name);
    exit;
  end;

  try
    if ValueList.Exists(name) then
      result := ValueList[name]
  except
    ShowMessage('value ' + name + ' not found in lookup list!');
    result := -1;
  end;
end;

initialization
  ValueList := TIntegerHash.Create;
  // CULL
  ValueList['front'] := GL_FRONT;
  ValueList['back'] := GL_BACK;
  ValueList['backsided'] := GL_BACK;
  ValueList['disable'] := GL_NONE;
  ValueList['none'] := GL_NONE;
  ValueList['twosided'] := GL_NONE;
  // SORT
  ValueList['portal'] := Ord(SK_PORTAL);
  ValueList['sky'] := Ord(SK_SKY);
  ValueList['opaque'] := Ord(SK_OPAQUE);
  ValueList['banner'] := Ord(SK_BANNER);
  ValueList['trans'] := Ord(SK_TRANS);
  ValueList['underwater'] := Ord(SK_UNDERWATER);
  ValueList['additive'] := Ord(SK_ADDITIVE);
  ValueList['nearest'] := Ord(SK_NEAREST);
  // depth func
  ValueList['equal'] := GL_EQUAL;
  ValueList['lequal'] := GL_LEQUAL;
  // alpha func
  ValueList['gt0'] := GL_GREATER;
  ValueList['lt128'] := GL_LESS;
  ValueList['ge128'] := GL_GEQUAL;
  ValueList['noalpha'] := GL_ALWAYS;
  // tcmod func
  ValueList['unused'] := Ord(TCMOD_UNUSED);
  ValueList['rotate'] := Ord(TCMOD_ROTATE);
  ValueList['scale'] := Ord(TCMOD_SCALE);
  ValueList['scroll'] := Ord(TCMOD_SCROLL);
  ValueList['stretch'] := Ord(TCMOD_STRETCH);
  ValueList['transform'] := Ord(TCMOD_TRANSFORM);
  ValueList['turb'] := Ord(TCMOD_TURB);
  // wave funcs
  ValueList['sin'] := Ord(WF_SIN);
  ValueList['triangle'] := Ord(WF_TRIANGLE);
  ValueList['square'] := Ord(WF_SQUARE);
  ValueList['sawtooth'] := Ord(WF_SAWTOOTH);
  ValueList['inversesawtooth'] := Ord(WF_INVSAWTOOTH);
  ValueList['noise'] := Ord(WF_NOISE);
  // rgbGen
  ValueList['identitylighting'] := Ord(RGBGEN_IDENTITYLIGHTNING);
  ValueList['identity'] := Ord(RGBGEN_IDENTITY);
  ValueList['wave'] := Ord(RGBGEN_WAVE);
  ValueList['entity'] := Ord(RGBGEN_ENTITY);
  ValueList['oneminusentity'] := Ord(RGBGEN_ONEMINUSENTITY);
  ValueList['vertex'] := Ord(RGBGEN_VERTEX);
  ValueList['exactvertex'] := Ord(RGBGEN_VERTEX);
  ValueList['oneminusvertex'] := Ord(RGBGEN_ONEMINUSVERTEX);
  ValueList['lightingdiffuse'] := Ord(RGBGEN_LIGHTNINGDIFFUSE);
  // tcGen
  ValueList['environment'] := Ord(TCGEN_ENVIRONMENT);
  ValueList['base'] := Ord(TCGEN_BASE);
  ValueList['lightmap'] := Ord(TCGEN_LIGHTMAP);
  ValueList['vector'] := Ord(TCGEN_VECTOR);
  // blending
  ValueList['gl_zero'] := GL_ZERO;
  ValueList['gl_one'] := GL_ONE;
  ValueList['gl_src_color'] := GL_SRC_COLOR;
  ValueList['gl_one_minus_src_color'] := GL_ONE_MINUS_SRC_COLOR;
  ValueList['gl_src_alpha'] := GL_SRC_ALPHA;
  ValueList['gl_one_minus_src_alpha'] := GL_ONE_MINUS_SRC_ALPHA;
  ValueList['gl_dst_alpha'] := GL_DST_ALPHA;
  ValueList['gl_one_minus_dst_alpha'] := GL_ONE_MINUS_DST_ALPHA;
  ValueList['gl_dst_color'] := GL_DST_COLOR;
  ValueList['gl_one_minus_dst_color'] := GL_ONE_MINUS_DST_COLOR;
  ValueList['gl_src_alpha_saturate'] := GL_SRC_ALPHA_SATURATE;
  // DEFORMVERTEXES
  ValueList['def_wave'] := Ord(DEFORMVERTEXES_WAVE);
  ValueList['def_normal'] := Ord(DEFORMVERTEXES_NORMAL);
  ValueList['def_bulge'] := Ord(DEFORMVERTEXES_BULGE);
  ValueList['def_move'] := Ord(DEFORMVERTEXES_MOVE);
  ValueList['def_autosprite'] := Ord(DEFORMVERTEXES_AUTOSPRITE);
  ValueList['def_autosprite2'] := Ord(DEFORMVERTEXES_AUTOSPRITE2);

  // SURFACEPARM
  ValueList['alphashadow']   := 2;
  ValueList['areaportal']    := 4;
  ValueList['clusterportal'] := 8;
  ValueList['donotenter']    := 16;
  ValueList['flesh']         := 32;
  ValueList['fog']           := 64;
  ValueList['lava']          := 128;
  ValueList['metalsteps']    := 256;
  ValueList['nodamage']      := 512;
  ValueList['nodlight']      := 1024;
  ValueList['nodraw']        := 2048;
  ValueList['nodrop']        := 4096;
  ValueList['noimpact']      := 8192;
  ValueList['nomarks']       := 16384;
  ValueList['nolightmap']    := 32768;
  ValueList['nosteps']       := 65536;
  ValueList['nonsolid']      := 131072;
  ValueList['origin']        := 262144;
  ValueList['playerclip']    := 524288;
  ValueList['slick']         := 1048576;
  ValueList['slime']         := 2097152;
  ValueList['structural']    := 4194304;
  ValueList['trans']         := 8388608;
  ValueList['water']         := 16777216;
  ValueList['detail']        := 33554432;
  ValueList['nomipmaps']     := 67108864;
  ValueList['sky']           := 134217728;
  ValueList['hint']          := 1; // @@@ check value 


finalization
  ValueList.Free;
end.
