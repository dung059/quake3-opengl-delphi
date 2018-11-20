
// eq2 shaders - Feal free to change what you need.
// I recommend adding these to your own shader file and rename the paths accordingly.
// Do  find\replace: "/eq2/" to "/yourmapname/"  (no quotes)
// author: evillair (evillair.net)
//
//
//----------------------------------------------------------------------------------//
// -- teleporter panel -- //
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/eq2_telepanel
{
	qer_editorimage textures/aty3dm5v2/eq2_telepanel.tga
	q3map_lightimage textures/aty3dm5v2/eq2_telegoo.tga
	q3map_surfacelight 25
	{
		map textures/aty3dm5v2/eq2_telegoo.tga
		rgbGen identity
		tcMod turb 0 0.1 0 0.2
	}
	{
		map textures/aty3dm5v2/eq2_telepanel.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

//----------------------------------------------------------------------------------//
// banner - not moving
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/eq2_banner_still
{
     	qer_editorimage textures/aty3dm5v2/eq2_banner.tga
		cull disable
     surfaceparm alphashadow
     surfaceparm trans	
     surfaceparm nomarks
     tessSize 32
	{
        map textures/aty3dm5v2/eq2_banner.tga
        alphaFunc GE128
		depthWrite
		rgbGen vertex
    }
    {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

//----------------------------------------------------------------------------------//
// boucepad
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/eq2_bounce
{
	qer_editorimage textures/aty3dm5v2/eq2_bounce.tga
	
	{
		map textures/aty3dm5v2/eq2_bounce.tga
		rgbGen identity
	}
	{
		clampmap textures/aty3dm5v2/eq2_bouncefan.tga
		tcMod rotate 512
		blendFunc blend
		depthWrite
		rgbGen identity

	}
	{
		map textures/aty3dm5v2/eq2_bounce.tga
		blendfunc blend
		rgbGen identity
	}
		{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}

//----------------------------------------------------------------------------------//
// spawn lites //
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/eq2lt_spawnlite_1k
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	q3map_lightimage textures/aty3dm5v2/eq2_weap_spawnlite.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_weap_spawnlite.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_weap_spawnlite.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_weap_spawnlite.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//----------------------------------------------------------------------------------//
// -----lights ----- //
//----------------------------------------------------------------------------------//


textures/aty3dm5v2/eq2lt_clight_10k
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	q3map_lightimage textures/aty3dm5v2/eq2_32caplight.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_32caplight.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_32caplight.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_32caplight.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/aty3dm5v2/eq2lt_baselt03
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/aty3dm5v2/eq2_baselt03.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_baselt03.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_baselt03.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_baselt03.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/aty3dm5v2/eq2lt_baselt03b
{
	surfaceparm nomarks
	q3map_surfacelight 3000
	q3map_lightimage textures/aty3dm5v2/eq2_baselt03b.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_baselt03b.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_baselt03b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_baselt03b.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/aty3dm5v2/eq2lt_trimlight_3k
{
	surfaceparm nomarks
	q3map_surfacelight 1500
	q3map_lightsubdivide 32
	q3map_lightimage textures/aty3dm5v2/eq2_trimlight_01.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_trimlight_01.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimlight_01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimlight_01.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/aty3dm5v2/eq2lt_trimlight_s_3k
{
	surfaceparm nomarks
	q3map_surfacelight 100
	q3map_lightsubdivide 32
	q3map_lightimage textures/aty3dm5v2/eq2_trimlight_01s.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_trimlight_01s.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimlight_01s.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimlight_01s.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/aty3dm5v2/eq2lt_trimlite
{
	surfaceparm nomarks
	q3map_surfacelight 2500
	q3map_lightimage textures/aty3dm5v2/eq2_trimlite_side.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_trimlite_side.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimlite_side.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimlite_side.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/aty3dm5v2/eq2lt_trimv_lite_4k
{
	surfaceparm nomarks
	q3map_surfacelight 100
	q3map_lightimage textures/aty3dm5v2/eq2_trimv_lite.blend.tga
	qer_editorimage textures/aty3dm5v2/eq2_trimv_lite.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimv_lite.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm5v2/eq2_trimv_lite.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//----------------------------------------------------------------------------------//
//Decals//
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/esfl01
{
	qer_editorimage textures/aty3dm5v2/esfl01.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl01.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl02
{
	qer_editorimage textures/aty3dm5v2/esfl02.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl02.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl03
{
	qer_editorimage textures/aty3dm5v2/esfl03.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl03.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl04
{
	qer_editorimage textures/aty3dm5v2/esfl04.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl04.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl05
{
	qer_editorimage textures/aty3dm5v2/esfl05.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl05.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl06
{
	qer_editorimage textures/aty3dm5v2/esfl06.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl06.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl07
{
	qer_editorimage textures/aty3dm5v2/esfl07.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl07.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl08
{
	qer_editorimage textures/aty3dm5v2/esfl08.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl08.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl09
{
	qer_editorimage textures/aty3dm5v2/esfl09.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl09.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl10
{
	qer_editorimage textures/aty3dm5v2/esfl10.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl10.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl11
{
	qer_editorimage textures/aty3dm5v2/esfl11.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl11.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl12
{
	qer_editorimage textures/aty3dm5v2/esfl12.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl12.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl13
{
	qer_editorimage textures/aty3dm5v2/esfl13.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl13.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl14
{
	qer_editorimage textures/aty3dm5v2/esfl14.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl14.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl15
{
	qer_editorimage textures/aty3dm5v2/esfl15.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl15.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl16
{
	qer_editorimage textures/aty3dm5v2/esfl16.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl16.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esfl17
{
	qer_editorimage textures/aty3dm5v2/esfl17.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esfl17.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws01
{
	qer_editorimage textures/aty3dm5v2/esws01.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws01.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws02
{
	qer_editorimage textures/aty3dm5v2/esws02.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws02.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws03
{
	qer_editorimage textures/aty3dm5v2/esws03.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws03.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws04
{
	qer_editorimage textures/aty3dm5v2/esws04.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws04.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws05
{
	qer_editorimage textures/aty3dm5v2/esws05.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws05.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws06
{
	qer_editorimage textures/aty3dm5v2/esws06.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws06.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws07
{
	qer_editorimage textures/aty3dm5v2/esws07.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws07.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws08
{
	qer_editorimage textures/aty3dm5v2/esws08.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws08.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws09
{
	qer_editorimage textures/aty3dm5v2/esws09.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws09.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws10
{
	qer_editorimage textures/aty3dm5v2/esws10.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws10.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws11
{
	qer_editorimage textures/aty3dm5v2/esws11.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws11.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws12
{
	qer_editorimage textures/aty3dm5v2/esws12.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws12.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws13
{
	qer_editorimage textures/aty3dm5v2/esws13.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws13.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws14
{
	qer_editorimage textures/aty3dm5v2/esws14.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws14.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/esws15
{
	qer_editorimage textures/aty3dm5v2/esws15.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/esws15.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

//---------------------------------------------------------------------------------//
//glass//
//---------------------------------------------------------------------------------//
textures/aty3dm5v2/plainglass
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/aty3dm5v2/plainglass.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
              }
}

//----------------------------------------------------------------------------------//
//Phong shaders//
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/eq2_bmtl
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm5v2/eq2_bmtl.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm5v2/eq2_bmtl.tga
 		blendFunc filter
        }
}

textures/aty3dm5v2/eq2_trimv_00
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm5v2/eq2_trimv_00.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm5v2/eq2_trimv_00.tga
 		blendFunc filter
        }
}

//----------------------------------------------------------------------------------//
//Fan//
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/fan_grate
{
        surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm	metalsteps	
	cull none
        nopicmip
	{
		map textures/aty3dm5v2/fan_grate.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/aty3dm5v2/fan
{
        surfaceparm trans	
        surfaceparm nomarks	
	cull none
        nopicmip
	{
		clampmap textures/aty3dm5v2/fan.tga
		tcMod rotate 256 
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

//--------------------------------------------------------------------------------//
//Misc Decals//
//--------------------------------------------------------------------------------//
textures/aty3dm5v2/europa2
{
	qer_editorimage textures/aty3dm5v2/europa2.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/europa2.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/q3
{
	qer_editorimage textures/aty3dm5v2/q3.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/q3.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/z_xro1
{
	qer_editorimage textures/aty3dm5v2/z_xro1.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/z_xro1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/z_gor1
{
	qer_editorimage textures/aty3dm5v2/z_gor1.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/z_gor1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/z_hun1
{
	qer_editorimage textures/aty3dm5v2/z_hun1.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/z_hun1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/z_maj1
{
	qer_editorimage textures/aty3dm5v2/z_maj1.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/z_maj1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/z_sor1
{
	qer_editorimage textures/aty3dm5v2/z_sor1.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/z_sor1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/z_wrk1
{
	qer_editorimage textures/aty3dm5v2/z_wrk1.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/z_wrk1.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/w_decor
{
	qer_editorimage textures/aty3dm5v2/w_decor.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/w_decor.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}


textures/aty3dm5v2/w_dec2
{
	qer_editorimage textures/aty3dm5v2/w_dec2.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/w_dec2.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/y_gor
{
	qer_editorimage textures/aty3dm5v2/y_gor.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/y_gor.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/y_xae
{
	qer_editorimage textures/aty3dm5v2/y_xae.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/y_xae.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/y_hun
{
	qer_editorimage textures/aty3dm5v2/y_hun.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/y_hun.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/y_maj
{
	qer_editorimage textures/aty3dm5v2/y_maj.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/y_maj.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/y_sor
{
	qer_editorimage textures/aty3dm5v2/y_sor.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/y_sor.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm5v2/y_wrk
{
	qer_editorimage textures/aty3dm5v2/y_wrk.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm5v2/y_wrk.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

//----------------------------------------------------------------------------------//
//Fog//
//----------------------------------------------------------------------------------//
textures/aty3dm5v2/hellfog_pj_dm10
{
	qer_editorimage textures/aty3dm5v2/fog_red.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 50
	fogparms ( .5 .12 .1 ) 392

	
	
	{
		map textures/aty3dm5v2/kc_fogcloud3.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/aty3dm5v2/kc_fogcloud3.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

//----------------------------------------------------------------------------------//
// end //
//----------------------------------------------------------------------------------//

//=======================================================
// Aty3dm9
// Shaders By Lunaran ,Soc ,iD Software. Most modified by
// myself.
//=======================================================

//=======================================================
// Jump Pad
//=======================================================

textures/aty3dm9/jp_1
{
	qer_editorimage textures/aty3dm9/jp01b.tga
	q3map_lightimage textures/aty3dm9/jumppadsmall_r.tga	
	q3map_surfacelight 400
	{
		map textures/aty3dm9/red_telep.tga
                tcmod rotate 180
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		clampmap textures/aty3dm9/jumppadsmall_r.tga
		blendfunc ADD
		tcMod stretch sin 0.95 .7 0 1.25
		rgbGen wave square .5 .5 .25 1.25
		rgbgen identity
	}
	{
		map textures/aty3dm9/jp01b.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//========================================================
// Wall / Ceiling Lights
//========================================================

textures/aty3dm9/zinc_lite3
{
	q3map_lightimage textures/aty3dm9/sup_lite3fx.tga
	q3map_surfacelight 300
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/zinc_lite3.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/sup_lite3fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.1 0.25 0.30
	}
}

textures/aty3dm9/trilite1_1000
{
	qer_editorimage textures/aty3dm9/trilite1.tga
	q3map_lightimage textures/aty3dm9/trilite1fx.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/trilite1.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/trilite1fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.9 0.2 0 0.1
	}
}

textures/aty3dm9/litpan1_flik
{
	qer_editorimage textures/aty3dm9/litpan1.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/litpan1.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/litpan1fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave noise -.6 1.6 180 5.5
//		rgbGen wave square 0.5 0.5 0 0.5
	}
}

textures/aty3dm9/litpan1_500
{
	qer_editorimage textures/aty3dm9/litpan1.tga
	q3map_lightimage textures/aty3dm9/litpan1fx.tga
	surfaceparm nomarks
	q3map_surfacelight 500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/litpan1.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/litpan1fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.8 0.1 0 0.1
	}
}

textures/aty3dm9/litpan2_flik2
{
	qer_editorimage textures/aty3dm9/litpan2.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/litpan2.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/litpan2fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave noise -.4 1.2 450 8
//		rgbGen wave square 0.5 0.5 0 0.5
	}
}

textures/aty3dm9/litpan2_flik3
{
	qer_editorimage textures/aty3dm9/litpan2.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/litpan2.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/litpan2fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave noise -.6 1.6 1800 6
//		rgbGen wave square 0.5 0.5 0 0.5
	}
}

textures/aty3dm9/litpan2_flik
{
	qer_editorimage textures/aty3dm9/litpan2.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/litpan2.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/litpan2fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave noise -.6 1.6 45 5.5
//		rgbGen wave square 0.5 0.5 0 0.5
	}
}

textures/aty3dm9/litpan2_500
{
	qer_editorimage textures/aty3dm9/litpan2.tga
	q3map_lightimage textures/aty3dm9/litpan2fx.tga
	surfaceparm nomarks
	q3map_surfacelight 500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/litpan2.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/aty3dm9/litpan2fx.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.8 0.1 0 0.1
	}
}

//========================================================
// Stone cieling in lower level
//========================================================

textures/aty3dm9/stone3
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/stone3_phong.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/stone4_d2.tga
 		blendFunc filter
        }
}

//========================================================
// Step / Post / Ceiling Lights
//========================================================

textures/aty3dm9/lig_128-02r1-2k
{
	qer_editorimage textures/aty3dm9/sqrlig03ra.tga
	q3map_lightimage textures/aty3dm9/sqrlig03r.blend.tga
	q3map_surfacelight 2500
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/sqrlig03ra.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm9/sqrlig03r.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/aty3dm9/lig_128-02r3-2k
{
	qer_editorimage textures/aty3dm9/sqrlig03rc.tga
	q3map_lightimage textures/aty3dm9/sqrlig03r2.blend.tga
	q3map_surfacelight 2500
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/sqrlig03rc.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/aty3dm9/sqrlig03r2.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

//========================================================
// Sky
//========================================================

textures/aty3dm9/9skyxp
{
	qer_editorimage textures/aty3dm9/nubian3.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun 1 .9 .8 65 300 60
	q3map_surfacelight 85
	skyparms env/aty9sky/lun4 768 -
	
        {
                map textures/aty3dm9/nubian3.tga
		tcMod scroll 0.02 0.02
		tcMod scale 4 4
	}
        {                                         
		map textures/aty3dm9/nubian5.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll 0.02 0.02
		tcMod scale 4 4
	}
}
//========================================================
// Glass
//========================================================

textures/aty3dm9/aty3dm9glass
{
	qer_editorimage textures/aty3dm9/glass_gold.tga
	qer_alphafunc greater 0.5
	q3map_nonplanar
	q3map_shadeangle 90
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm nomarks
	qer_trans 0.99

	{
		map textures/aty3dm9/glass_gold.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity	// identity = light, vertex = dark
	}
}

//=========================================================
// iD Fog Texture
//=========================================================

textures/aty3dm9/fog
{
	qer_editorimage textures/aty3dm9/kc_fogcloud3.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	fogparms ( .211 .129 .097 ) 2395

	
	
	{
		map textures/aty3dm9/kc_fogcloud3.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/aty3dm9/kc_fogcloud3.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

//=========================================================
// Spotlights
//=========================================================

textures/aty3dm9/spotlight
{
	qer_editorimage textures/aty3dm9/proto1.tga
	q3map_lightimage textures/aty3dm9/proto1blend.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/aty3dm9/proto1.tga
		blendFunc GL_DST_COLOR GL_ZERO

		rgbGen identity
	}
	{	
		map textures/aty3dm9/proto1blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .75 0.25 0 .1
	}
	{	
		map textures/aty3dm9/proto1fx.tga
		blendfunc GL_ONE GL_ONE
		rgbgen wave noise 0.2 0.1 0 08
	}
}

//=========================================================
//Roof
//=========================================================

textures/aty3dm9/rooftiles
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/er_rof01.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/er_rof01.tga
 		blendFunc filter
        }
}

//=========================================================
// Billboard
//=========================================================

textures/aty3dm9/billboard
{
        surfaceparm nodlight
	surfaceparm nomarks
        nopicmip
	{
		animmap 0.5 textures/aty3dm9/maverickservers_768x512.tga textures/aty3dm9/massacreservers_768x512.tga textures/aty3dm9/sapphire_768x512.tga textures/aty3dm9/wacom_256x128.tga
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/effects/tinfx2.tga
		blendFunc GL_ONE GL_ONE
		tcGen environment
	}
}

//=========================================================
// Upper Running Ledge
//=========================================================

textures/aty3dm9/url
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/wcrete0.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete0.tga
 		blendFunc filter
        }
}

textures/aty3dm9/url1
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/e8warning256.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/e8warning256.tga
 		blendFunc filter
        }
}

textures/aty3dm9/url2
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/zinc_baseboard2.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/zinc_baseboard2.tga
 		blendFunc filter
        }
}

//=========================================================
// Misc Map Parts
//=========================================================

textures/aty3dm9/wall1
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/wcrete1.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete1.tga
 		blendFunc filter
        }
}

textures/aty3dm9/wall2
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/wcrete2.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete2.tga
 		blendFunc filter
        }
}

textures/aty3dm9/wall3
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/wcrete3.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete3.tga
 		blendFunc filter
        }
}

textures/aty3dm9/wall4
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/wcrete4.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete4.tga
 		blendFunc filter
        }
}

textures/aty3dm9/wall5
{
 	q3map_nonplanar
 	q3map_shadeangle 70
 	qer_editorimage textures/aty3dm9/wcrete5.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete5.tga
 		blendFunc filter
        }
}

textures/aty3dm9/wall6
{
 	q3map_nonplanar
 	q3map_shadeangle 60
 	qer_editorimage textures/aty3dm9/wcrete6.tga
 	{
 		map $lightmap
 		rgbGen identity
 	}
 	{
 		map textures/aty3dm9/wcrete6.tga
 		blendFunc filter
        }
}

//=========================================================
// Decals
//=========================================================

textures/aty3dm9/atystain_01
{
	qer_editorimage textures/aty3dm9/atystain_01.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_01.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_02
{
	qer_editorimage textures/aty3dm9/atystain_02.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_02.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_03
{
	qer_editorimage textures/aty3dm9/atystain_03.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_03.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_04
{
	qer_editorimage textures/aty3dm9/atystain_04.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_04.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_05
{
	qer_editorimage textures/aty3dm9/atystain_05.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_05.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_06
{
	qer_editorimage textures/aty3dm9/atystain_06.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_06.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_07
{
	qer_editorimage textures/aty3dm9/atystain_07.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_07.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_08
{
	qer_editorimage textures/aty3dm9/atystain_08.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_08.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_09
{
	qer_editorimage textures/aty3dm9/atystain_09.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_09.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_10
{
	qer_editorimage textures/aty3dm9/atystain_10.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_10.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_11
{
	qer_editorimage textures/aty3dm9/atystain_11.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_11.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_12
{
	qer_editorimage textures/aty3dm9/atystain_12.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_12.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_13
{
	qer_editorimage textures/aty3dm9/atystain_13.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_13.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_14
{
	qer_editorimage textures/aty3dm9/atystain_14.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_14.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_15
{
	qer_editorimage textures/aty3dm9/atystain_15.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_15.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}

textures/aty3dm9/atystain_16
{
	qer_editorimage textures/aty3dm9/atystain_16.tga
	q3map_bounceScale 0
   surfaceparm nonsolid
	surfaceparm trans
   surfaceparm nomarks
	surfaceparm nolightmap
   polygonOffset
   {
      map textures/aty3dm9/atystain_16.tga
      blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
      detail
   }
}


//=========================================================
// iD Beam Texture
//=========================================================

textures/aty3dm9/light_beam
{
	qer_editorimage textures/aty3dm9/beam_1.tga
        surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	surfaceparm nomipmaps
        //nopicmip
	{
		map textures/aty3dm9/beam_1.tga
                tcMod Scroll .3 0
                blendFunc add
	}
}


//=========================================================
//Grate
//=========================================================

textures/aty3dm9/e8bgrate01
{
	surfaceparm alphashadow
	surfaceparm metalsteps
	cull disable
	{
		map textures/aty3dm9/e8bgrate01.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}


//========================================================
//Teleporter
//========================================================

textures/aty3dm9/clear_calm1_aty
	{
		qer_editorimage textures/aty3dm9/pool3d_3e.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
	
		cull disable
		deformVertexes wave 64 sin .25 .25 0 .5	
		{ 
			map textures/aty3dm9/pool3d_5e.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 .01
		}
	
		{ 
			map textures/aty3dm9/pool3d_3e.tga
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .025
		}

	
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	
	

}


//=========================================================
//Antena Towers
//=========================================================

textures/aty3dm9/x_support_aty
{
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/aty3dm9/x_support_aty.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}


models/mapobjects/flame/flame
{
	surfaceparm alphashadow
	cull disable
	{
		animmap 15 models/mapobjects/flame/flame.jpg models/mapobjects/flame/flame01.jpg models/mapobjects/flame/flame02.jpg models/mapobjects/flame/flame03.jpg models/mapobjects/flame/flame04.jpg models/mapobjects/flame/flame05.jpg
		blendfunc add
		rgbGen identity
	}
}

models/mapobjects/flame/lord
{
	 {
		map models/mapobjects/flame/flame.jpg
		tcMod scroll 1 1
		rgbGen identity
	}
	{
		map models/mapobjects/flame/lord.tga
		blendfunc blend
		rgbgen vertex
	}	
}



textures/rrtex6/bbskull_1
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/bbskull_1.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}


textures/rrtex6/pdg_1
{
	qer_editorimage textures/rrtex6/pdg_1.tga
	{
		map textures/rrtex6/pdg_1.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/rrtex6/pdg_2.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 .5	
		depthfunc equal
	}
}


textures/rrtex6/hpc_1
{
	
	
	{
		map $lightmap
		rgbGen identity
	}

	{ 
		map textures/rrtex6/hpc_1.tga
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{	
        	map textures/rrtex6/hpc_2.tga
		blendfunc gl_one gl_one	
		rgbgen wave inversesawtooth 0 1 0 1	
	}

	}


textures/rrtex6/par_1
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/par_1.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}



textures/rrtex6/Skf_1
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/Skf_1.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}


textures/rrtex6/Lgo_1
{
	
	
	{
		map $lightmap
		rgbGen identity
	}

	{ 
		map textures/rrtex6/Lgo_1.tga
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{	
        	map textures/rrtex6/Lgo_2.tga
		blendfunc gl_one gl_one	
		rgbgen wave inversesawtooth 0 1 0 0.2	
	}

	}

        

textures/rrtex6/Glc
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/Glc.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/rrtex6/Glb
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/Glb.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}


textures/rrtex6/mrb_1
	{
	q3map_surfacelight 50
	q3map_lightimage textures/rrtex6/mrb_2.tga
	qer_editorimage textures/rrtex6/mrb_1.tga
	
	{
		map textures/rrtex6/mrb_1.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}


	{
		map textures/rrtex6/mrb_2.tga
		blendfunc gl_one gl_one
		rgbgen wave sin 0 1 0 .5
		tcmod scale  1 .05
		tcmod scroll 0 1
	}
	
}

textures/rrtex6/ctb
{
     qer_editorimage textures/rrtex6/ctb.tga
     cull none
	nopicmip
     surfaceparm alphashadow
     surfaceparm trans	
     surfaceparm nomarks 
	surfaceparm playerclip       
	q3map_surfacelight 500  
        {
		map textures/rrtex6/ctb.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/rrtex6/ede
{
        qer_editorimage textures/rrtex6/ede.tga
    	surfaceparm trans
	surfaceparm alphashadow
	cull none
        nopicmip
	{
		map textures/rrtex6/ede.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
	

textures/rrtex6/bdg_1
{

        {
		map textures/rrtex6/fir_1.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/bdg_1.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/rrtex6/crtbx
{

        {
		map textures/rrtex6/fir_1.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/crtbx.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/rrtex6/brde
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/brde.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/rrtex6/erbf
{

        {
		map textures/rrtex6/fir_2.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/erbf.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}



textures/rrtex6/pvub
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/pvub.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/rrtex6/colvxic
{

        {
		map textures/rrtex6/fir_1.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/rrtex6/colvxic.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/rrtex6/tlp_1
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/rrtex6/tlp_1.tga
		tcGen environment
                tcMod turb 0 0.25 0 0.5
                tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}

textures/rrtex6/breg_1
{
	
	
	{
		map $lightmap
		rgbGen identity
	}

	{ 
		map textures/rrtex6/breg_1.tga
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{	
        	map textures/rrtex6/breg_2.tga
		blendfunc gl_one gl_one	
		rgbgen wave inversesawtooth 0 1 0 1	
	}

	}

//***********************************
//Chronic Street Pole Light
//***********************************

textures/chronic_lights/light_lightpole
{
	qer_editorimage textures/chronic_lights/light_lightpole.tga
	surfaceparm nomarks
	//q3map_surfacelight 5000
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_lights/light_lightpole.tga
		blendFunc GL_DST_COLOR GL_ZERO
		alphaGen lightingSpecular
		rgbGen identity
	}
	{
		map textures/chronic_lights/light_lightpole.tga
		blendFunc add
	}
}

//***********************************
//Chronic White Light Dim
//***********************************

textures/chronic_lights/gell_whitedim
{
	qer_trans .5
	qer_editorimage textures/chronic_lights/gell_white.tga
	q3map_lightimage textures/chronic_lights/gell_white.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm trans
	q3map_surfacelight 50

	{
	map textures/chronic_sfx/clear.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//***************************
//Chronic Metal Girder for Ceiling
//***************************

textures/chronic_metal/metal_girder
{
	q3map_lightimage textures/chronic_metal/metal_girder.tga
	//qer_trans .5
	//surfaceparm alphashadow
	surfaceparm trans
	surfaceparm metalsteps	
	cull none
	{
		map textures/chronic_metal/metal_girder.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//***************************
//Chronic Metal Great for fire escape
//***************************

textures/chronic_metal/metal_fireescape
{
	q3map_lightimage textures/chronic_metal/metal_fireescape.tga
	qer_trans .5
	//surfaceparm alphashadow
	surfaceparm trans
	surfaceparm metalsteps	
	cull none
	{
		map textures/chronic_metal/metal_fireescape.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//******************************************************
//Chronic Metal Barrel 2sided   -meat	
//******************************************************

textures/chronic_metal/metal_barrelside
{
	qer_editorimage textures/chronic_metal/metal_barrelside.tga
	cull none
	{
		map textures/chronic_metal/metal_barrelside.tga
		blendFunc GL_ONE GL_ZERO
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//**********************************
// Chronic Dr.Dre lowlow
//**********************************


models/mapobjects/lowlow/lowlow_steering
{
	cull disable
	//surfaceparm alphashadow
	{
		map models/mapobjects/lowlow/lowlow_steering.tga
		alphaFunc GE128
		depthWrite
	}
}

models/mapobjects/lowlow/lowlow_windsheild
{
	surfaceparm trans	
	surfaceparm nomarks	
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	nomipmaps
	{
		map models/mapobjects/lowlow/lowlow_windsheild.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcGen environment
	}
}

//**********************************
// Chronic Burnt Cop Car
//**********************************

models/mapobjects/copcar/copcar_body
{
	cull disable
	surfaceparm alphashadow
	{
		map models/mapobjects/copcar/copcar_body.tga
	}
}

models/mapobjects/copcar/copcar_windsheild
{
	surfaceparm trans	
	surfaceparm nomarks	
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	nomipmaps
	{
		map models/mapobjects/copcar/copcar_windsheild.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcGen environment
	}
}

//**********************************
// Q3 Spotlamp -created by Id software
//**********************************

models/mapobjects/spotlight/sl_light
{
	cull disable
	//q3map_surfacelight 200
	{
		map models/mapobjects/spotlight/sl_light.tga
		rgbGen identity
	}

}

models/mapobjects/spotlight/sl_body
{
	cull disable
	surfaceparm alphashadow
	{
		map models/mapobjects/spotlight/sl_body.tga
		alphaFunc GE128
		depthWrite
	}
}

models/mapobjects/spotlight/sl_beem
{
	surfaceparm trans	
	surfaceparm nomarks	
	surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
	nomipmaps
	{
		map models/mapobjects/spotlight/sl_beem.tga
		blendFunc GL_ONE GL_ONE
	}    
}


// **********************************
// Chronic Fire for barrels  -meat
// **********************************

textures/chronic_sfx/sfx_fire
{
	qer_editorimage textures/chronic_sfx/sfx_fire01.tga
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm trans
	cull none
	//q3map_surfacelight 7500
	
	{
		animMap 10 textures/chronic_sfx/sfx_fire01.tga textures/chronic_sfx/sfx_fire02.tga textures/chronic_sfx/sfx_fire03.tga textures/chronic_sfx/sfx_fire04.tga textures/chronic_sfx/sfx_fire05.tga textures/chronic_sfx/sfx_fire06.tga textures/chronic_sfx/sfx_fire07.tga textures/chronic_sfx/sfx_fire08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10
		
	}	
	{
		animMap 10 textures/chronic_sfx/sfx_fire01.tga textures/chronic_sfx/sfx_fire02.tga textures/chronic_sfx/sfx_fire03.tga textures/chronic_sfx/sfx_fire04.tga textures/chronic_sfx/sfx_fire05.tga textures/chronic_sfx/sfx_fire06.tga textures/chronic_sfx/sfx_fire07.tga textures/chronic_sfx/sfx_fire08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
	{
		map textures/chronic_sfx/sfx_flameball.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .6 .2 0 .6	
	}
}


// **********************************
// Chronic reflective glass two sided  -meat
// **********************************

textures/chronic_sfx/sfx_glass_2sided
{
	qer_editorimage textures/meat_tags/tag_glass.tga
	qer_trans 0.500000
	surfaceparm nolightmap
	surfaceparm weaponclip
	surfaceparm playerclip
	surfaceparm trans
	cull disable
	{
		map textures/chronic_sfx/glass_reflection.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcGen environment
	}
}


//******************************************************
//Chronic Sky   -meat	
//******************************************************

textures/chronic_sfx/chronic_nightsky
{
	qer_editorimage textures/chronic_sfx/nightsky_up.tga

	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap

	q3map_surfacelight 10
	q3map_sun .6 .6 .6 30 35 78

	skyparms env/nightsky - -
}

//***********************************
//Chronic Red fullbright texture   -meat
//***********************************

textures/chronic_sfx/neonred_blink
{
	qer_editorimage textures/chronic_sfx/neon_red.tga
	q3map_lightimage textures/chronic_sfx/neon_red.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	q3map_surfacelight 200

	{
	map textures/chronic_sfx/neon_red.tga
	rgbGen identity
	}	
	{
	map $lightmap
	rgbGen identity
	blendfunc gl_dst_color gl_zero
	}
	{
	map textures/chronic_sfx/neon_red.tga
	blendFunc blend
	rgbgen wave square 1.0 .5 0 1
	}
}

//***********************************
//Chronic Lighted Windows -meat
//***********************************

textures/chronic_windows/window_buildingsmall_02
{
	qer_editorimage chronic_windows/window_buildingsmall_02.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingsmall_02.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingsmall_02_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Lighted Windows  -meat
//***********************************

textures/chronic_windows/window_buildingbig_01
{
	qer_editorimage chronic_windows/window_buildingbig_01.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingbig_01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingbig_01_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Lighted Windows  -meat
//***********************************

textures/chronic_windows/window_buildingsmall_03
{
	qer_editorimage chronic_windows/window_buildingsmall_03.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingsmall_03.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingsmall_03_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Lighted Windows  -meat
//***********************************

textures/chronic_windows/window_buildingside_03
{
	qer_editorimage chronic_windows/window_buildingside_03.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingside_03.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingside_03_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Lighted Windows  -meat
//***********************************

textures/chronic_windows/window_buildingside_06
{
	qer_editorimage chronic_windows/window_buildingside_06.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingside_06.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingside_06_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Lighted Windows  -meat
//***********************************

textures/chronic_windows/window_buildingside_07
{
	qer_editorimage chronic_windows/window_buildingside_07.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingside_07.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_windows/window_buildingside_07_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


//***********************************
//Chronic Telephone Booth Sign -meat
//***********************************

textures/chronic_signs/sign_telephone
{
	qer_editorimage textures/chronic_signs/sign_telephone.tga
	surfaceparm nomarks

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_signs/sign_telephone.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_signs/sign_telephone.tga
		blendfunc GL_ONE GL_ONE
	}
}


//***************************
//Chronic Cloth Banner for club
//***************************

textures/chronic_signs/sign_banner
{
	q3map_lightimage textures/chronic_signs/sign_banner.tga
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm metalsteps	
	cull none
	{
		map textures/chronic_signs/sign_banner.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//***********************************
//Chronic Light Feature Sign -meat
//***********************************

textures/chronic_signs/sign_feature
{
	qer_editorimage textures/chronic_signs/sign_feature.tga
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/chronic_signs/sign_feature.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/chronic_signs/sign_feature_blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//******************************************************
//Chronic Dead End Sign   -meat	
//******************************************************

textures/chronic_signs/signs_deadend
{
	qer_editorimage textures/chronic_signs/signs_deadend.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans
	cull none
	{
		map textures/chronic_signs/signs_deadend.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//***********************************
//Chronic Crosswalk Lights Start on Don't Walk -meat
//***********************************

textures/chronic_signs/signs_dontwalk
{
	qer_editorimage textures/chronic_signs/signs_dontwalk.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		animmap .1 textures/chronic_signs/signs_dontwalk.tga textures/chronic_signs/signs_walk.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		animmap .1 textures/chronic_signs/signs_dontwalk.tga textures/chronic_signs/signs_walk.tga
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Crosswalk Lights Start on Walk -meat
//***********************************

textures/chronic_signs/signs_walk
{
	qer_editorimage textures/chronic_signs/signs_walk.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		animmap .1 textures/chronic_signs/signs_walk.tga textures/chronic_signs/signs_dontwalk.tga 
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		animmap .1 textures/chronic_signs/signs_walk.tga textures/chronic_signs/signs_dontwalk.tga 
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Street Signal Start on Red -meat
//***********************************

textures/chronic_signs/sign_streetlight_red
{
	qer_editorimage textures/chronic_signs/sign_streetlight_red.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		animmap .2 textures/chronic_signs/sign_streetlight_red.tga textures/chronic_signs/sign_streetlight_red.tga textures/chronic_signs/sign_streetlight_green.tga textures/chronic_signs/sign_streetlight_yellow.tga 
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		animmap .2 textures/chronic_signs/sign_streetlight_red.tga textures/chronic_signs/sign_streetlight_red.tga textures/chronic_signs/sign_streetlight_green.tga textures/chronic_signs/sign_streetlight_yellow.tga 
		blendfunc GL_ONE GL_ONE
	}
}

//***********************************
//Chronic Street Signal Start on Green -meat
//***********************************

textures/chronic_signs/sign_streetlight_green
{
	qer_editorimage textures/chronic_signs/sign_streetlight_green.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		animmap .2 textures/chronic_signs/sign_streetlight_green.tga textures/chronic_signs/sign_streetlight_yellow.tga textures/chronic_signs/sign_streetlight_red.tga textures/chronic_signs/sign_streetlight_red.tga 
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		animmap .2 textures/chronic_signs/sign_streetlight_green.tga textures/chronic_signs/sign_streetlight_yellow.tga textures/chronic_signs/sign_streetlight_red.tga textures/chronic_signs/sign_streetlight_red.tga 
		blendfunc GL_ONE GL_ONE
	}
}

textures/greenstar/saa
{
	qer_editorimage textures/greenstar/saa.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/aero - -
}

textures/greenstar_light/light
{
	deformVertexes autoSprite
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/greenstar_light/light.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/hate/shinfx
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun	1 1 1 90 220 50
	q3map_surfacelight 200
	qer_editorimage textures/hate/intelredclouds.tga

	skyparms - 512 -
	//cloudparms 512 full
	{
		map textures/hate/redsky.tga
		tcMod scale 3 2
		tcMod scroll 0.05 0.01
		depthWrite
	}
	{
		map textures/hate/intelredclouds.tga
		blendFunc GL_ONE GL_ONE
		tcMod scale 3 3
		tcMod scroll 0.2 0.12
	}
}


textures/hate/hate_hellfog
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm 	nodrop
	surfaceparm 	nolightmap
	q3map_globaltexture
	q3map_surfacelight 30
	q3map_lightsubdivide 96
	fogparms ( .5 .12 .1 ) 225

	
	
	{
		map textures/liquids/kc_fogcloud3.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}

	{
		map textures/liquids/kc_fogcloud3.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}

}

textures/hate/hate_whitefog
{
	qer_editorimage textures/sfx/xdensegreyfog.tga
	qer_nocarve
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	fogparms ( .6 .7 .8 ) 512
}

//***********************************
//Red fullbright texture
//***********************************

textures/meat_colors/red_fullbright
{
	//qer_trans .5
	qer_editorimage textures/meat_colors/gell_red.tga
	q3map_lightimage textures/meat_colors/gell_red.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	//surfaceparm nonsolid
	q3map_surfacelight 200

	{
	map textures/meat_colors/gell_red.tga
	blendFunc blend
	rgbgen wave sin 1.0 .5 0 1
	}
}

//***********************************
//Meat Light low intesity
//***********************************

textures/meat_lights/light_01_low
{
	qer_editorimage textures/meat_lights/light_01.tga
	surfaceparm nomarks
	q3map_surfacelight 500
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/meat_lights/light_01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		alphaGen lightingSpecular
		rgbGen identity
	}
	{
		map textures/meat_lights/light_01_blend.tga
		blendFunc add
	}
}

//***********************************
//Meat Light medium intesity
//***********************************

textures/meat_lights/light_01_mid
{
	qer_editorimage textures/meat_lights/light_01.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/meat_lights/light_01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		alphaGen lightingSpecular
		rgbGen identity
	}
	{
		map textures/meat_lights/light_01_blend.tga
		blendFunc add
	}
}

//***********************************
//Meat Light high intesity
//***********************************

textures/meat_lights/light_01_bright
{
	qer_editorimage textures/meat_lights/light_01.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/meat_lights/light_01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		alphaGen lightingSpecular
		rgbGen identity
	}
	{
		map textures/meat_lights/light_01_blend.tga
		blendFunc add
	}
}

textures/meat_lights/Surfacelight_mid
{
	qer_trans .5
	qer_editorimage textures/meat_lights/Gell_01.tga
	q3map_lightimage textures/meat_lights/Gell_01.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm detail
	q3map_surfacelight 50

	{
	map textures/meat_lights/clear.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/meat_lights/Surfacelight_red
{
	qer_trans .5
	qer_editorimage textures/meat_colors/gell_red.tga
	q3map_lightimage textures/meat_colors/gell_red.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm detail
	q3map_surfacelight 200

	{
	map textures/meat_colors/clear.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/meat_lights/Surfacelight_blue
{
	qer_trans .5
	qer_editorimage textures/meat_lights/Gell_03.tga
	q3map_lightimage textures/meat_lights/Gell_03.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm detail
	q3map_surfacelight 200

	{
	map textures/meat_lights/clear.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/meat_lights/Surfacelight_whitemid
{
	qer_trans .5
	qer_editorimage textures/meat_lights/Gell_04.tga
	q3map_lightimage textures/meat_lights/Gell_04.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm detail
	q3map_surfacelight 200

	{
	map textures/meat_lights/clear.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/meat_lights/Surfacelight_ltblue
{
	qer_trans .5
	qer_editorimage textures/meat_lights/Gell_05.tga
	q3map_lightimage textures/meat_lights/Gell_05.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm detail
	q3map_surfacelight 200

	{
	map textures/meat_lights/clear.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/meat_lights/trim_light_01
{
	q3map_lightimage textures/meat_lights/trim_light_01.tga
	surfaceparm nomarks
	q3map_surfacelight 800
	light 1
	{
		map textures/meat_lights/trim_light_01.tga
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}		
}


//***************************
//Target Shader For triggers
//***************************

textures/meat_objects/objects_target
{
	qer_editorimage textures/meat_objects/objects_target.tga

	{
		map textures/meat_objects/objects_target.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/meat_objects/objects_targetlight_01.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .1 2 .4 1	
	}
	{
		map textures/meat_objects/objects_targetlight_02.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .1 2 .2 1	
	}
	{
		map textures/meat_objects/objects_targetlight_03.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .1 2 .0 1	
	}
}

//***************************
//Transparent cyclone fence
//***************************

textures/meat_objects/objects_fence
{
	q3map_lightimage textures/meat_objects/objects_fence.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	nopicmip
	{
		map textures/meat_objects/objects_fence.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//***************************
//Transparent metal grate with round holes
//***************************

textures/meat_metal/metal_grateroundhole
{
	q3map_lightimage textures/meat_metal/metal_grateroundhole.tga
	qer_trans .5
	//surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_metal/metal_grateroundhole.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

//***************************
//Red Flashing Skull
//***************************

textures/meat_objects/objects_bigredskull
{
	qer_editorimage textures/meat_objects/objects_bigredskull.tga

	{
		map textures/meat_tile/tile_bloody.tga
		rgbGen identity
	}	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}	
	{
		clampmap textures/meat_objects/objects_bigredskull.tga
		blendfunc gl_one gl_one
		tcMod scale .32 .32
		rgbGen wave sin .1 .2 .0 1.5
	}
}

//***************************
//Red Rusty Girder
//***************************

textures/meat_metal/metal_girder
{
	q3map_lightimage textures/meat_metal/metal_girder.tga
	//qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_metal/metal_girder.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}


//***************************
//Rusty Grate rectangle holes
//***************************

textures/meat_metal/metal_rustygrate
{
	q3map_lightimage textures/meat_metal/metal_rustygrate.tga
	qer_trans .5
	//surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_metal/metal_rustygrate.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}





textures/meat_objects/metal_grate_01
{
	surfaceparm	metalsteps
	surfaceparm playerclip
	surfaceparm alphashadow
	surfaceparm	trans	
	cull none


	{
		map textures/meat_objects/metal_grate_01.tga
		tcMod scale 2 2
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/meat_objects/metal_grate_02
{
	surfaceparm	metalsteps
	surfaceparm	trans	
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/meat_objects/metal_grate_02.tga
		tcMod scale 2 2
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/meat_objects/metal_grate_04
{
	surfaceparm	metalsteps
	surfaceparm	trans	
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/meat_objects/metal_grate_04.tga
		tcMod scale 2 2
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaFunc GT0
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

//*********************************
//Hex Fan bouncpad
//*********************************

textures/meat_objects/object_jumpadfan
{
	qer_editorimage textures/meat_objects/object_jumpadfan.tga

	{
		map textures/meat_objects/object_jumpadfan.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	
	{
		map textures/meat_objects/object_jumpadfanlights.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 0 1	
	}

	{
		map textures/meat_objects/objects_fan.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcmod rotate 450
	}
}

//*********************************
//Small Square bouncpad
//*********************************

textures/meat_objects/objects_jumpadsmall
{
	qer_editorimage textures/meat_objects/objects_jumpadsmall.tga

	{
		map textures/meat_objects/objects_jumpadsmall.tga
		rgbGen identity
	}	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}	
	{
		map textures/meat_objects/objects_jumpadsmall_light.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 .25 1.5	
	}
	{
		map textures/meat_objects/objects_jumpadsmall_center.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 .25 .8
	}
}

//*********************************
//Hex Fan bouncpad withought a fan
//*********************************

textures/meat_objects/object_jumpadnofan
{
	qer_editorimage textures/meat_objects/object_jumpadnofan.tga

	{
		map textures/meat_objects/object_jumpadnofan.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/meat_objects/object_jumpadfanlights.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 0 1	
	}

}

//*********************************
//Brown scrolling Bouncepad
//*********************************

textures/meat_objects/object_jumpadtread
{
	qer_editorimage textures/meat_tags/temp_direction.tga

	{
		map textures/meat_objects/object_jumpadtread.tga
		rgbGen identity
		tcmod scroll 0 3
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}	
}

//*********************************
//Bouncepad Horizontal with bouncy yellow lights
//*********************************

textures/meat_objects/objects_bouncepadstraight
{
	qer_editorimage textures/meat_objects/objects_bouncepadstraight.tga

	{
		map textures/meat_objects/objects_bouncepadstraight.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		clampmap textures/meat_objects/objects_bouncepadstraight_light.tga
		blendfunc gl_one gl_one
				tcMod stretch sin .5 .4 .0 2.0
		rgbGen wave sin .5 .5 .0 2.0	
	}

}

//*********************************
//Bouncepad Round with bouncy yellow lights
//*********************************

textures/meat_objects/objects_bouncepadround
{
	qer_editorimage textures/meat_objects/objects_bouncepadround.tga

	{
		map textures/meat_objects/objects_bouncepadround.tga
		rgbGen identity
	}	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}	

	{
		clampmap textures/meat_objects/objects_bouncepadround_light.tga
		blendfunc gl_one gl_one
		tcMod stretch sin .5 .4 .0 2.0
		rgbGen wave sin .5 .5 .0 2.0
	}
}



textures/meat_objects/jumpad_02
{
	qer_editorimage textures/meat_objects/metal_tread_01a.tga

	{
		map textures/meat_objects/metal_tread_01a.tga
		rgbGen identity
		tcmod scroll 0 3
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}	
}







textures/meat_objects/objects_jumpadsmall
{
	qer_editorimage textures/meat_objects/objects_jumpadsmall.tga

	{
		map textures/meat_objects/objects_jumpadsmall.tga
		rgbGen identity
	}	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}	
	{
		map textures/meat_objects/objects_jumpadsmall_center.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 .25 1.5	
	}
	{
		map textures/meat_objects/objects_jumpadsmall_light.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 .25 .8
	}
}



textures/meat_objects/metal_plate_09
{
	qer_editorimage textures/meat_objects/metal_plate_09.tga

	{
		map textures/meat_objects/metal_plate_09.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	
	{
		map textures/meat_objects/metal_plate_09c.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 0 1	
	}

	{
		map textures/meat_objects/fan_01.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcmod rotate 450
	}
}

textures/meat_objects/object_jumpadnofan
{
	qer_editorimage textures/meat_objects/object_jumpadnofan.tga

	{
		map textures/meat_objects/object_jumpadnofan.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	
	{
		map textures/meat_objects/object_jumpadfanlights.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 0 1	
	}

}

textures/meat_tags/camera_portal
{
	portal
	surfaceparm nolightmap
	qer_editorimage textures/meat_tags/Tag_Portal.tga

	{
		map textures/meat_tags/mirror_01.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
	{
		map textures/meat_tags/mirror_01.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		alphagen portal 2048
		rgbGen identityLighting	
	}
}


textures/meat_tags/black_fog
{
	qer_editorimage textures/meat_tags/tag_fog.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm nodrop
	surfaceparm nolightmap
	q3map_globaltexture
	// q3map_surfacelight 10
	fogparms ( .0 .0 .0 ) 1000

	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}
	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}

textures/meat_tags/red_fog
{
	qer_editorimage textures/meat_tags/tag_fog.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm nodrop
	surfaceparm nolightmap
	q3map_globaltexture
	// q3map_surfacelight 10
	fogparms ( .9 .12 .1 ) 1000

	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}
	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}

textures/meat_tags/green_fog_lite
{
	qer_editorimage textures/meat_tags/tag_fog.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm nodrop
	surfaceparm nolightmap
	q3map_globaltexture
	// q3map_surfacelight 10
	fogparms ( .12 .9 .1 ) 1000

	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}
	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}

textures/meat_tags/red_fog_thick
{
	qer_editorimage textures/meat_tags/tag_fog.tga
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm nodrop
	surfaceparm nolightmap
	q3map_globaltexture
	// q3map_surfacelight 400
	fogparms ( .9 .12 .1 ) 1000

	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale -.05 -.05
		tcmod scroll .01 -.01
		rgbgen identity
	}
	{
		map textures/meat_liquids/fog_clouds.tga
		blendfunc gl_dst_color gl_zero
		tcmod scale .05 .05
		tcmod scroll .01 -.01
		rgbgen identity
	}
}


//************************
//Whitemeat Sky 
//************************

textures/meat_sky/whitemeat_sky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	qer_editorimage textures/meat_sky/sky_blue.tga
	q3map_surfacelight 40
	q3map_sun .9 .7 .5 1000 45 60
	skyparms - 256 -
	{
		map textures/meat_sky/sky_blue.tga
		tcMod scale 3 3
		tcMod scroll 0.02 0.02
		depthWrite
	}
	{
		map textures/meat_sky/sky_clouds.tga
		blendFunc GL_ONE GL_ONE
		tcMod scale 4 4
		tcMod scroll 0.03 0.03
	}
}

//************************
//Badmeat Sky stylized
//************************

textures/meat_stylized/badmeat_sky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	qer_editorimage textures/meat_stylized/stylized_sky_01.tga
	q3map_surfacelight 100
	q3map_sun .8 1 .7 1500 90 50
	skyparms - 512 -
	{
		map textures/meat_stylized/stylized_sky_01.tga
		tcMod scale 3 3
		tcMod scroll 0.02 0.02
		depthWrite
	}
	{
		map textures/meat_stylized/stylized_sky_01.tga
		blendFunc GL_ONE GL_ONE
		tcMod scale 4 4
		tcMod scroll 0.03 0.03
	}
}

//************************
//Redmeat Sky
//************************

textures/meat_sky/sky_red
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	qer_editorimage textures/meat_sky/sky_red.tga
	q3map_surfacelight 100
	q3map_sun .8 1 .7 1000 90 50
	skyparms - 256 -
	{
		map textures/meat_sky/sky_red.tga
		tcMod scale 3 3
		tcMod scroll 0.02 0.02
		depthWrite
	}
	{
		map textures/meat_sky/sky_clouds.tga
		blendFunc GL_ONE GL_ONE
		tcMod scale 4 4
		tcMod scroll 0.03 0.03
	}
}

textures/meat_sky/sky02
{
	qer_editorimage textures/meat_sky/sky_brown.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_surfacelight 120
	q3map_sun	1 1 1 80 30 60
	skyparms full - 128 -
	
	{
		map textures/meat_sky/sky_brown.tga
		tcMod scroll 0.001 0.002
		tcMod scale 10 10
		depthWrite
	}
	{
		map textures/meat_sky/sky_clouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -0.001 -0.002
		tcMod scale 15 15
	}
}

textures/meat_sky/bluesky_02
{
	qer_editorimage textures/meat_sky/sky_blue.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_surfacelight 20
	q3map_sun	1.0 0.9 0.8 200 45 60
	skyparms full - 128 -	
	{
		map textures/meat_sky/sky_blue.tga
		tcMod scroll 0.001 0.002
		tcMod scale 10 10
		depthWrite
	}
	{
		map textures/meat_sky/sky_clouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -0.001 -0.002
		tcMod scale 15 15
	}
}



textures/meat_sky/bluesky_02_nolight
{
	qer_editorimage textures/meat_sky/sky_blue.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	skyparms full - 64 -	
	{
		map textures/meat_sky/sky_blue.tga
		tcMod scroll 0.001 0.002
		tcMod scale 10 10
		depthWrite
	}
	{
		map textures/meat_sky/sky_clouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -0.001 -0.002
		tcMod scale 15 15
	}
}

textures/meat_sky/sky_blue_03
{
	qer_editorimage textures/meat_sky/sky_blue.tga
	surfaceparm noimpact
	//surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky
	q3map_surfacelight 20
	q3map_sun	.4 .2 .1 120 45 60
	skyparms full - 256 -	
	{
		map textures/meat_sky/sky_blue.tga
		tcMod scroll 0.01 0.02
		tcMod scale 1 1
		depthWrite
	}
	{
		map textures/meat_sky/sky_clouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -0.004 -0.006
		tcMod scale 2 2
	}
}


textures/meat_stylized/trans_circles_01
{
	q3map_lightimage textures/meat_stylized/trans_circles_01.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_stylized/trans_circles_01.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

textures/meat_stylized/trans_hex_01
{
	q3map_lightimage textures/meat_stylized/trans_hex_01.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_stylized/trans_hex_01.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

textures/meat_stylized/trans_girder_01
{
	q3map_lightimage textures/meat_stylized/trans_girder_01.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_stylized/trans_girder_01.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

textures/meat_stylized/trans_support_01
{
	q3map_lightimage textures/meat_stylized/trans_support_01.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_stylized/trans_support_01.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

textures/meat_stylized/trans_zshape
{
	q3map_lightimage textures/meat_stylized/trans_zshape.tga
	qer_trans .5
	surfaceparm alphashadow
	surfaceparm trans	
	cull none
	{
		map textures/meat_stylized/trans_zshape.tga
		blendFunc add
		//blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}		
}

textures/meat_stylized/pillowstyle_01
{
	q3map_lightimage textures/meat_stylized/pillowstyle_01.tga
	{
		map textures/meat_stylized/stylized_chrome_01.tga
            tcGen environment
		tcmod scale .5 .5
		rgbGen identity   
	}		
	{
		map textures/meat_stylized/pillowstyle_01.tga
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}	
} 

textures/meat_stylized/grid_01
{
	q3map_lightimage textures/meat_stylized/grid_01.tga
	qer_trans .3
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
	surfaceparm nomarks	
	cull none
	nopicmip
	{
		map textures/meat_stylized/grid_01.tga
		blendFunc GL_ONE GL_ONE
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map textures/meat_stylized/grid_02.tga
		blendFunc GL_ONE GL_ZERO
		tcMod scroll .1 .0
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/meat_stylized/roundy_01
{
	q3map_lightimage textures/meat_stylized/roundy_01.tga
	{
		map textures/meat_stylized/stylized_chrome_01.tga
            tcGen environment
		tcmod scale .5 .5
		rgbGen identity   
	}		
	{
		map textures/meat_stylized/roundy_01.tga
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}	
} 

textures/meat_stylized/tile_floor_01
{
	q3map_lightimage textures/meat_stylized/tile_floor_01.tga
	{
		map textures/meat_stylized/chrome_blue_01.tga
            tcGen environment
		tcmod scale .5 .5
		rgbGen identity   
	}		
	{
		map textures/meat_stylized/tile_floor_01.tga
		blendFunc blend
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}	
} 

textures/meat_stylized/square_lines_01
{
	q3map_lightimage textures/meat_stylized/square_lines_01.tga		
	{
		map textures/meat_stylized/square_lines_01.tga
		tcMod scroll 1 0
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
	}	
} 



// ************************************
// Support meat_tags Start Here
// ************************************

textures/meat_tags/Tag_caulk
{
	qer_trans 0.3
	qer_editorimage textures/meat_tags/Tag_caulk.tga
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nolightmap
}

textures/meat_tags/Tag_nodraw
{
	qer_trans .3
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nolightmap
}

textures/meat_tags/Tag_clip
{
	qer_trans 0.40
	qer_editorimage textures/meat_tags/Tag_clip.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm noimpact
}

textures/meat_tags/Tag_trigger
{
	qer_trans 0.3
	qer_editorimage textures/meat_tags/Tag_trigger.tga
	qer_nocarve
	surfaceparm nodraw
}

textures/meat_tags/Tag_origin
{
	qer_editorimage textures/meat_tags/Tag_origin.tga
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm origin
}







textures/meat_tags/Tag_areaportal
{
	qer_trans 0.30
	qer_editorimage textures/meat_tags/Tag_areaportal.tga
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm areaportal
}

textures/meat_tags/black_nothing
{
	qer_editorimage textures/meat_meat_tags/black_nothing.tga
	//surfaceparm nomarks
	//surfaceparm nolightmap
	//surfaceparm nodamage
}

textures/meat_tags/Tag_mirror
{
	qer_editorimage textures/meat_tags/Tag_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/meat_tags/Mirror_01.tga
		blendfunc GL_ZERO GL_ONE
		depthWrite
	}
}

textures/meat_tags/Tag_noimpact
{
	qer_trans .3
	qer_editorimage textures/meat_tags/Tag_noimpact.tga
	surfaceparm noimpact
}

textures/meat_tags/Tag_portal
{
	qer_editorimage textures/meat_tags/Tag_portal.tga
	surfaceparm nolightmap
	portal
	{
		map textures/meat_tags/Mirror_01.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite

	}
}

textures/meat_tags/Tag_null
{
	qer_trans .3
	qer_editorimage textures/meat_tags/Tag_null.tga
	qer_nocarve
	surfaceparm trans
	surfaceparm nodraw
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull front
}

textures/meat_tags/Tag_slick
{
	qer_trans 0.30
	qer_editorimage textures/meat_tags/Tag_slick.tga
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm slick
}

textures/meat_tags/Tag_hint
{
	qer_trans 0.40
	qer_editorimage textures/meat_tags/Tag_hint.tga
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm noimpact
}


// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

a10Shadow
{
	polygonOffset
	{
		map gfx/shadows/a10shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

b17gShadow
{
	polygonOffset
	{
		map gfx/shadows/b-17gShadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

b-2Shadow
{
	polygonOffset
	{
		map gfx/shadows/b-2shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

models/effects/banner_glow
{
	cull disable
	nopicmip
	{
		map models/effects/banner_glow.tga
		blendfunc blend
		rgbGen identity
		tcMod scroll 0 1
		alphaGen wave sin 0.5 0.2 0.5 0.2 
	}
}

models/effects/banner_outline
{
	cull disable
	nopicmip
	{
		map models/effects/banner_outline.tga
		blendfunc blend
		rgbGen identity
	}
}

models/effects/banner_skin
{
	nopicmip
	{
		map models/effects/banner_loop.tga
		rgbGen identity
		tcMod scroll 0.5 0
	}
	{
		map models/effects/banner_skin.tga
		rgbGen wave sin 0.7 0.2 0.5 0.5 
		alphaFunc GE128
	}
}


textures/base_support/cable_trans
{
	
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/base_support/cable_trans.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

bf-109gShadow
{
	polygonOffset
	{
		map gfx/shadows/bf-109gshadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

textures/horizon/birdofprey
{
	qer_editorimage textures/horizon/birdofprey.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 75
	surfaceparm sky
	q3map_sun 0.924 0.948 1.000 75 220 60
	skyparms env/horizon/birdofprey512 - -
}

bulletExplosion
{
	cull disable
	{
		map models/weaphits/bulletscroll.tga
		blendfunc add
		tcMod scroll -2.4 0
	}
}


// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

camelShadow
{
	polygonOffset
	{
		map gfx/shadows/camelshadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

textures/cardigan_skies/plainblack
{
	qer_editorimage textures/skies/blacksky.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_sun 1 1 1 120 80 80
	{
		map gfx/colors/black.tga
	}
}

textures/cardigan_skies/glass1
{
	qer_editorimage textures/base_wall/shiny3.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/effects/tinfx2.tga
		blendfunc add
		rgbGen const ( 0.564706 0.564706 0.564706 )
		tcMod scale 1.5 1.5
		tcGen environment 
	}
	{
		map textures/sfx/mirror.tga
		blendfunc add
		rgbGen const ( 0.243137 0.243137 0.243137 )
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/cardigan_skies/nebula1_purple_stars
{
	qer_editorimage textures/cardigan_skies1/sparse_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0.03 0.03
		tcMod scale 2 2
	}
	{
		map textures/cardigan_skies1/sparse_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.05 0.06
	}
}

textures/cardigan_skies/vx_nebula1_purple
{
	qer_editorimage textures/cardigan_skies1/sparse_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/sparse_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.05 0.06
	}
}

textures/cardigan_skies/vx_pervert
{
	qer_editorimage textures/cardigan_skies1/perv.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/perv.tga
		blendfunc filter
		tcMod scroll 0.01 0.06
	}
}


textures/cardigan_skies/nebula1_purple_lightning
{
	qer_editorimage textures/cardigan_skies1/sparse_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur2.tga
		blendfunc add
		rgbGen wave noise 0 1 0 10 
		tcMod scale 0.32 0.32
		tcMod rotate -20
	}
	{
		map textures/cardigan_skies1/sparse_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.05 0.06
	}
}


textures/cardigan_skies/nebula1_orange_stars
{
	qer_editorimage textures/cardigan_skies1/sparse_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0.04 0.01
		tcMod scale 3 3
	}
	{
		map textures/cardigan_skies1/sparse_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.06 0.02
	}
}

textures/cardigan_skies/vx_nebula1_orange
{
	qer_editorimage textures/cardigan_skies1/sparse_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/sparse_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.06 0.02
	}
}


textures/cardigan_skies/nebula1_orange_lightning
{
	qer_editorimage textures/cardigan_skies1/sparse_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur2.tga
		blendfunc add
		rgbGen wave noise 0 1 0 10 
		tcMod scale 0.32 0.32
		tcMod rotate 20
	}
	{
		map textures/cardigan_skies1/sparse_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.06 0.02
	}
}

textures/cardigan_skies/nebula1_green_stars
{
	qer_editorimage textures/cardigan_skies1/sparse_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen identity
		tcMod scroll -0.03 0.01
		tcMod scale 3 3
	}
	{
		map textures/cardigan_skies1/sparse_green_nebula.tga
		blendfunc filter
		tcMod scroll -0.05 0.02
	}
}

textures/cardigan_skies/vx_nebula1_green
{
	qer_editorimage textures/cardigan_skies1/sparse_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_surfacelight 150
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/sparse_green_nebula.tga
		blendfunc filter
		tcMod scroll -0.05 0.02
	}
}

textures/cardigan_skies/nebula1_green_lightning
{
	qer_editorimage textures/cardigan_skies1/sparse_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur2.tga
		blendfunc add
		rgbGen wave noise 0 1 0 10 
		tcMod scale 0.32 0.32
		tcMod rotate -20
	}
	{
		map textures/cardigan_skies1/sparse_green_nebula.tga
		blendfunc filter
		tcMod scroll -0.05 0.02
	}
}

textures/cardigan_skies/nebula1_blue_stars
{
	qer_editorimage textures/cardigan_skies1/sparse_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen identity
		tcMod scroll -0.05 0
		tcMod scale 3 3
	}
	{
		map textures/cardigan_skies1/sparse_blue_nebula.tga
		blendfunc filter
		tcMod scroll -0.08 0
	}
}

textures/cardigan_skies/vx_nebula1_blue
{
	qer_editorimage textures/cardigan_skies1/sparse_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/sparse_blue_nebula.tga
		blendfunc filter
		tcMod scroll -0.08 0
	}
}



textures/cardigan_skies/nebula1_blue_lightning
{
	qer_editorimage textures/cardigan_skies1/sparse_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur2.tga
		blendfunc add
		rgbGen wave noise 0 1 0 10 
		tcMod scale 0.32 0.32
		tcMod rotate 20
	}
	{
		map textures/cardigan_skies1/sparse_blue_nebula.tga
		blendfunc filter
		tcMod scroll -0.08 0
	}
}

textures/cardigan_skies/nebula1_blue_colourshift
{
	qer_editorimage textures/cardigan_skies1/sparse_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradclouds2.tga
		blendfunc add
		rgbGen const ( 1 0 0 )
		tcMod scale 0.32 0.32
		tcMod rotate 20
	}
	{
		map textures/cardigan_skies1/sparse_blue_nebula.tga
		blendfunc filter
		tcMod scroll -0.08 0
	}
}

textures/cardigan_skies/nebula1_orange_colourshift
{
	qer_editorimage textures/cardigan_skies1/sparse_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradcloudsdark.tga
		blendfunc add
		rgbGen const ( 0.94902 0.282353 0 )
		tcMod scale 0.32 0.32
		tcMod rotate 12
	}
	{
		map textures/cardigan_skies1/sparse_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.06 0.02
	}
}

textures/cardigan_skies/nebula1_purple_colourshift
{
	qer_editorimage textures/cardigan_skies1/sparse_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradcloudsdark.tga
		blendfunc add
		rgbGen const ( 0 0 0.756863 )
		tcMod scale 0.32 0.32
		tcMod rotate 12
	}
	{
		map textures/cardigan_skies1/sparse_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.05 0.06
	}
}

textures/cardigan_skies/nebula2_green_stars
{
	qer_editorimage textures/cardigan_skies1/dense_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen wave noise 0.7 0.3 0 20 
		tcMod scroll 0.01 0.02
		tcMod scale 2 2
	}
	{
		map textures/cardigan_skies1/dense_green_nebula.tga
		blendfunc filter
		tcMod scroll 0.05 0.06
	}
}

textures/cardigan_skies/vx_nebula2_green
{
	qer_editorimage textures/cardigan_skies1/dense_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/dense_green_nebula.tga
		blendfunc filter
		tcMod scroll 0.05 0.06
	}
}

textures/cardigan_skies/nebula2_orange_stars
{
	qer_editorimage textures/cardigan_skies1/dense_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen wave noise 0.7 0.3 0 20 
		tcMod scroll 0.02 0
		tcMod scale 2 2
	}
	{
		map textures/cardigan_skies1/dense_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.08 0
	}
}

textures/cardigan_skies/vx_nebula2_orange
{
	qer_editorimage textures/cardigan_skies1/dense_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/dense_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.08 0
	}
}

textures/cardigan_skies/nebula2_purple_stars
{
	qer_editorimage textures/cardigan_skies1/dense_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen wave noise 0.7 0.3 0 20 
		tcMod scroll 0.02 0.01
		tcMod scale 3 3
	}
	{
		map textures/cardigan_skies1/dense_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.08 0.06
	}
}

textures/cardigan_skies/vx_nebula2_purple
{
	qer_editorimage textures/cardigan_skies1/dense_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/dense_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.08 0.06
	}
}

textures/cardigan_skies/nebula2_blue_stars
{
	qer_editorimage textures/cardigan_skies1/dense_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/starfield2.tga
		blendfunc add
		rgbGen wave noise 0.7 0.3 0 20 
		tcMod scroll 0.01 0.02
		tcMod scale 3 3
	}
	{
		map textures/cardigan_skies1/dense_blue_nebula.tga
		blendfunc filter
		tcMod scroll 0.07 0.09
	}
}

textures/cardigan_skies/vx_nebula2_blue
{
	qer_editorimage textures/cardigan_skies1/dense_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.8 1.0 1 180 180 90
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/dense_blue_nebula.tga
		blendfunc filter
		tcMod scroll 0.07 0.09
	}
}

textures/cardigan_skies/nebula2_blue_lightning
{
	qer_editorimage textures/cardigan_skies1/dense_blue_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur3.tga
		blendfunc add
		rgbGen wave noise 0 1 0 5 
		tcMod scale 0.32 0.32
		tcMod rotate -20
	}
	{
		map textures/cardigan_skies1/dense_blue_nebula.tga
		blendfunc filter
		tcMod scroll 0.02 0.03
	}
}

textures/cardigan_skies/nebula2_purple_lightning
{
	qer_editorimage textures/cardigan_skies1/dense_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur3.tga
		blendfunc add
		rgbGen wave noise 0 1 0 10 
		tcMod scale 0.32 0.32
		tcMod rotate -20
	}
	{
		map textures/cardigan_skies1/dense_purple_nebula.tga
		blendfunc filter
		tcMod scroll -0.03 0.05
	}
}

textures/cardigan_skies/nebula2_orange_lightning
{
	qer_editorimage textures/cardigan_skies1/dense_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur3.tga
		blendfunc add
		rgbGen wave noise 0 1 0 8 
		tcMod scale 0.32 0.32
		tcMod rotate -20
	}
	{
		map textures/cardigan_skies1/dense_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.02 0.06
	}
}

textures/cardigan_skies/nebula2_green_lightning
{
	qer_editorimage textures/cardigan_skies1/dense_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradlightningblur3.tga
		blendfunc add
		rgbGen wave noise 0 1 0 4 
		tcMod scale 0.32 0.32
		tcMod rotate 4
	}
	{
		map textures/cardigan_skies1/dense_green_nebula.tga
		blendfunc filter
		tcMod scroll 0.02 0.02
	}
}

textures/cardigan_skies/nebula2_green_colourshift
{
	qer_editorimage textures/cardigan_skies1/dense_green_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradcloudsdark.tga
		blendfunc add
		rgbGen const ( 0 0.647059 0.756863 )
		tcMod scale 0.32 0.32
		tcMod rotate 12
	}
	{
		map textures/cardigan_skies1/dense_green_nebula.tga
		blendfunc filter
		tcMod scroll 0.02 0.02
	}
}

textures/cardigan_skies/nebula2_orange_colourshift
{
	qer_editorimage textures/cardigan_skies1/dense_orange_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.960784 0.843137 0.552941 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradcloudsdark.tga
		blendfunc add
		rgbGen const ( 0.984314 0.933333 0 )
		tcMod scale 0.32 0.32
		tcMod rotate 12
	}
	{
		map textures/cardigan_skies1/dense_orange_nebula.tga
		blendfunc filter
		tcMod scroll 0.02 0.02
	}
}

textures/cardigan_skies/nebula2_purple_colourshift
{
	qer_editorimage textures/cardigan_skies1/dense_purple_nebula.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/circlegradcloudsdark.tga
		blendfunc add
		rgbGen const ( 0 0 0.368627 )
		tcMod scale 0.32 0.32
		tcMod rotate 5
	}
	{
		map textures/cardigan_skies1/dense_purple_nebula.tga
		blendfunc filter
		tcMod scroll 0.02 0.02
	}
}

textures/cardigan_skies/clouds1_green
{
	qer_editorimage textures/cardigan_skies1/cloudmask5.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask5.tga
		blendfunc filter
		rgbGen const ( 0.494118 0.941177 0 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds2_green
{
	qer_editorimage textures/cardigan_skies1/cloudmask6.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.654902 0.988235 0.705882 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask6.tga
		blendfunc filter
		rgbGen const ( 0.494118 0.941177 0 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds1_blue
{
	qer_editorimage textures/cardigan_skies1/cloudmask5.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask5.tga
		blendfunc filter
		rgbGen const ( 0 0 1 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds2_blue
{
	qer_editorimage textures/cardigan_skies1/cloudmask6.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.682353 0.807843 1 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask6.tga
		blendfunc filter
		rgbGen const ( 0 0 1 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds1_purple
{
	qer_editorimage textures/cardigan_skies1/cloudmask5.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask5.tga
		blendfunc filter
		rgbGen const ( 0.87451 0 0.87451 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds2_purple
{
	qer_editorimage textures/cardigan_skies1/cloudmask6.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.968628 0.803922 0.984314 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask6.tga
		blendfunc filter
		rgbGen const ( 0.87451 0 0.87451 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds1_red
{
	qer_editorimage textures/cardigan_skies1/cloudmask5.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.972549 0.768628 0.647059 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask5.tga
		blendfunc filter
		rgbGen const ( 1 0 0 )
		tcMod scroll 0.02 -0.03
	}
}

textures/cardigan_skies/clouds2_red
{
	qer_editorimage textures/cardigan_skies1/cloudmask6.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_sun 0.929412 0.737255 0.454902 110 180 80
	skyParms env/cardigan/purewhitej 1200 -
	{
		map textures/cardigan_skies1/cloudmask6.tga
		blendfunc filter
		rgbGen const ( 1 0 0 )
		tcMod scroll 0.02 -0.03
	}
}


textures/common/nolightmap
{
	surfaceparm nolightmap
}

textures/common/nodrawnonsolid
{
	surfaceparm	nonsolid
	surfaceparm	nodraw
}

textures/common/invisible
{
	surfaceparm nolightmap			
        {
                map textures/common/invisible.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

textures/common/teleporter
{
	surfaceparm nolightmap
	surfaceparm noimpact
	q3map_lightimage textures/sfx/powerupshit.tga	
	q3map_surfacelight 800
	{
		map textures/sfx/powerupshit.tga
		tcGen environment
//		tcMod scale 5 5
		tcMod turb 0 0.015 0 0.3
	}
}

textures/common/nodrop
{
	qer_nocarve
	qer_trans	0.5
	surfaceparm 	trans
	surfaceparm	nonsolid
	surfaceparm	nomarks
	surfaceparm     nodrop
	surfaceparm 	nolightmap
	surfaceparm 	nodraw
	cull		disable
}

textures/common/weapclip
{
	qer_trans 0.40
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nodraw
}

textures/common/clip
{
	qer_trans 0.40
	surfaceparm 	nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
        //surfaceparm 	nolightmap //proto_addition 11/08/99
	surfaceparm playerclip
	surfaceparm noimpact
}

textures/common/full_clip
{
	qer_trans 0.40
	surfaceparm nodraw
	surfaceparm playerclip
}


textures/common/missileclip
{
	qer_trans 0.40
	surfaceparm nodamage
	surfaceparm nomarks
	surfaceparm nodraw
	//surfaceparm nonsolid
	surfaceparm playerclip
}

//*****************************************
//**   I've reduced the transparency on most editor-only brushes here.
//**   If the transparent textures are still too pale for
//**   things like clip, hint, trigger, etc.,
//**   Please make an editorimage to suit your needs.
//******************************************

textures/common/cushion
{
	qer_nocarve
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nodamage
	surfaceparm trans
}

textures/common/hint
{
qer_nocarve
qer_trans 0.30
surfaceparm nodraw
surfaceparm nonsolid
surfaceparm structural
surfaceparm trans
surfaceparm noimpact
}

textures/common/skip
{
qer_nocarve
qer_trans 0.40
surfaceparm nodraw
surfaceparm nonsolid
surfaceparm structural
surfaceparm trans
}

textures/common/slick
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm slick
}

textures/common/origin
{
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm origin
}

textures/common/noimpact
{
	surfaceparm noimpact
}

textures/common/areaportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm areaportal
}

//bot specific cluster portal
textures/common/clusterportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm detail
	surfaceparm clusterportal
}

//bot specific "do not enter" brush
textures/common/donotenter
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm detail
	surfaceparm donotenter
}

textures/common/trigger
{
	qer_trans 0.50
	qer_nocarve
	surfaceparm nodraw
}

textures/common/caulk
{
	surfaceparm nodraw
	surfaceparm nomarks
        surfaceparm nolightmap
}

textures/common/nodraw
{
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm nomarks
}

textures/common/mirror1
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
  
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
       
        

}

textures/common/mirror2
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/sfx/mirror.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}
textures/common/energypad
{
	qer_editorimage textures/common/bluegoal.tga
	surfaceparm nolightmap
	cull twosided
	{
		map textures/common/bluegoal.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		tcGen environment
		tcMod turb 0 0.25 0 0.05
	}
}

textures/common/portal
{
	qer_editorimage textures/common/qer_portal.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
//		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
//		blendFunc GL_ONE GL_SRC_ALPHA
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite

	}
}

textures/common/timportal
{
	qer_editorimage textures/common/qer_portal.tga
	portal
	surfaceparm nolightmap
	{
		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
		blendFunc GL_ONE GL_SRC_ALPHA
		depthWrite
	}
}

textures/sfx/portal_sfx
{

	//	*************************************************
	//	*      	Portal Inside Effect 			*
	//	*      	April 29				*	
	//	*	Please Comment Changes			*
	//	*************************************************

	portal
	surfaceparm nolightmap
	deformVertexes wave 100 sin 0 2 0 .5


	{
		map textures/sfx/portal_sfx3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	//	This blend function is not working on RagePro drivers Mac only
	//	when it is used on top of portals
		depthWrite
	}


	{
		map textures/sfx/portal_sfx1.tga
		blendfunc gl_dst_color gl_zero
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}

	{
		map textures/sfx/portalfog.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		alphagen portal 256
		rgbGen identityLighting	
		tcmod turb sin 0 .5 0 1
		tcmod rotate .1 .1
		tcmod scroll .01 .03
	}
}
textures/sfx/portal2_sfx
{

	//	*************************************************
	//	*      	Portal Inside Effect 			*
	//	*      	April 29				*	
	//	*	Please Comment Changes			*
	//	*************************************************

	portal
	surfaceparm nolightmap
	deformVertexes wave 100 sin 0 2 0 .5


	{
		map textures/sfx/portal_sfx3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	//	This blend function is not working on RagePro drivers Mac only
	//	when it is used on top of portals
		depthWrite
	}


	{
		map textures/sfx/portal_sfx1.tga
		blendfunc gl_dst_color gl_zero
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}

	{
		map textures/sfx/portalfog.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		//alphagen portal 128
		rgbGen identityLighting	
		tcmod turb sin 0 .5 0 1
		tcmod rotate .1 .1
		tcmod scroll .01 .03
	}
}

sprites/foe
{
	nomipmaps
	nopicmip
	{
		map sprites/foe2.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

dr1Shadow
{
	polygonOffset
	{
		map gfx/shadows/dr1shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

models/effects/blue_cone
{
	{
		map models/effects/Blue_cone.tga
		blendfunc add
		rgbGen identityLighting
		tcMod turb 0 0.005 0 8
	}
}

models/effects/inner_cone
{
	{
		map models/effects/inner_cone.tga
		blendfunc add
		rgbGen identityLighting
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 0.04
	}
}

models/effects/muzzleflash_md
{
	{
		map models/effects/muzzleflash_md.tga
		blendfunc add
		rgbGen identity
	}
}

models/effects/muzzleflash_md2
{
	{
		map models/effects/muzzleflash_md2.tga
		blendfunc add
		rgbGen identity
	}
}

models/effects/outer_cone
{
	{
		map models/effects/outer_cone.tga
		blendfunc add
		rgbGen lightingDiffuse 
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 2
	}
}

models/effects/outer_cone2
{
	{
		map models/effects/outer_cone.tga
		blendfunc add
		rgbGen wave sin 0.8 0 0 1 
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 2
	}
}

models/effects/outer_cone3
{
	{
		map models/effects/outer_cone.tga
		blendfunc add
		rgbGen wave sin 0.6 0 0 1 
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 2
	}
}

models/effects/outer_cone4
{
	{
		map models/effects/outer_cone.tga
		blendfunc add
		rgbGen wave sin 0.4 0 0 1 
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 2
	}
}

models/effects/outer_cone5
{
	{
		map models/effects/outer_cone.tga
		blendfunc add
		rgbGen wave sin 0.2 0 0 1 
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 2
	}
}

models/effects/outer_cone6
{
	{
		map models/effects/outer_cone.tga
		blendfunc add
		rgbGen wave sin 0.1 0 0 1 
		tcMod turb 0 0.0075 0 8
		tcMod scroll 0 2
	}
}

models/effects/tracer_blue
{
	{
		map models/effects/tracer_blue.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/tracer_green
{
	{
		map models/effects/tracer_green.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/tracer_orange
{
	{
		map models/effects/tracer_orange.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/tracer_purple
{
	{
		map models/effects/tracer_purple.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/tracer_red
{
	{
		map models/effects/tracer_red.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/tracer_white
{
	{
		map models/effects/tracer_white.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/tracer_yellow
{
	{
		map models/effects/tracer_yellow.tga
		blendfunc add
		rgbGen identityLighting
	}
}

models/effects/turbulence
{
	{
		map models/effects/turbulence.tga
		blendfunc add
		rgbGen identity
		tcMod turb 0 0.005 0 12
	}
}

models/effects/flare
{
	deformVertexes autosprite
	{
		map models/effects/star.tga
		blendfunc add
		rgbGen wave sin 0.9 0.1 1 9 
		tcMod turb 0 0.005 0 2
		tcMod rotate 9
	}
}

models/effects/burningman
{
    surfaceparm nonsolid
    surfaceparm trans
    cull none
    deformVertexes wave 30 sin 0 10 0 .2
    nopicmip
    {
        map models/effects/burningman.tga
        blendFunc GL_ONE GL_ZERO
        alphaFunc GE128
        depthWrite
        rgbGen identity
	tcMod rotate 9
    }
    {
        map $lightmap
        rgbGen identity
        blendFunc GL_DST_COLOR GL_ZERO
        depthFunc equal
    }
}


//**********************************************************************
//									
//	Endless Ocean Skybox Shader					
//	by Cannon (edited from Sock's shader)					
//									
//**********************************************************************
// q3map_sun <red> <green> <blue> <intensity> <degrees> <elevation>
// color will be normalized, so it doesn't matter what range you use
// intensity falls off with angle but not distance 100 is a fairly bright sun
// degree of 0 = from the east, 90 = north, etc.  altitude of 0 = sunrise/set, 90 = noon

textures/endless/endless_skybox
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 100
	surfaceparm sky
	q3map_sun 227 237 254 100 35 50
	skyparms textures/endless/endless - -
}


// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

f-15Shadow
{
	polygonOffset
	{
		map gfx/shadows/f-15shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

f-16Shadow
{
	polygonOffset
	{
		map gfx/shadows/f-16shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

f-18Shadow
{
	polygonOffset
	{
		map gfx/shadows/f-18shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

f-22Shadow
{
	polygonOffset
	{
		map gfx/shadows/f-22shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

f-5Shadow
{
	polygonOffset
	{
		map gfx/shadows/f-5shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// *************************************************
// *
// * The Field
// * 
// *************************************************

textures/terrain/q3map_terrain
{
q3map_terrain
q3map_lightmapsampleoffset 4.0
q3map_splotchfix 
q3map_lightmapaxis z
q3map_tcGen ivector ( 512 0 0 ) ( 0 512 0 )
q3map_nonplanar
q3map_shadeangle 225
q3map_nolightmap
}

textures/field/terrain_0
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/field/terrain1.jpg

{
	map textures/field/terrain1.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/field/terrain_1
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/field/terrain1.jpg

{
	map textures/field/terrain2.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/field/terrain_2
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/field/terrain1.jpg

{
	map textures/field/terrain3.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/field/terrain_0to1
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/field/terrain1.jpg

{
	map textures/field/terrain1.jpg
	rgbGen identity
}
{
	map textures/field/terrain2.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/field/terrain_0to2
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/field/terrain1.jpg

{
	map textures/field/terrain1.jpg
	rgbGen identity
}
{
	map textures/field/terrain3.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/field/terrain_1to2
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/field/terrain1.jpg

{
	map textures/field/terrain2.jpg
	rgbGen identity
}
{
	map textures/field/terrain3.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/field/barbedwire
{
		
	surfaceparm trans	
	surfaceparm alphashadow
    	surfaceparm nomarks	
	cull none
        nopicmip
	q3map_surfacelight 1000

	{
		map textures/field/field_wire.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/field/barbedwire2
{
		
	surfaceparm trans	
	surfaceparm alphashadow
    	surfaceparm nomarks	
	cull none
        nopicmip
	q3map_surfacelight 1000

	{
		map textures/field/field_wire_flip.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/field/barbedwire3
{
		
	surfaceparm trans	
	surfaceparm alphashadow
    	surfaceparm nomarks	
	cull none
        nopicmip
	q3map_surfacelight 1000

	{
		map textures/field/field_wire_straight.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

flarePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/flarepuff.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

fw190a8Shadow
{
	polygonOffset
	{
		map gfx/shadows/fw190a8shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

bulletExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bullet1.tga  models/weaphits/bullet2.tga  models/weaphits/bullet3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bullet2.tga  models/weaphits/bullet3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}
console
{
	nopicmip
	nomipmaps
    
        {
		map gfx/misc/console01.tga
                blendFunc GL_ONE GL_ZERO
                tcMod scroll .02  0
                tcmod scale 2 1
	}
        {
                map gfx/misc/console02.tga
                blendFunc add
                tcMod turb 0 .1 0 .1
                tcMod scale 2 1
                tcmod scroll 0.2  .1
	} 

}
// blinked on top of lagometer when connection is interrupted
disconnected
{
	nopicmip
	{
		map gfx/2d/net.tga
	}
}

flareShader
{
	cull none
	{
		map gfx/misc/flare.jpg
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}

gfx/2d/bigchars
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/bigchars.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}

gfx/2d/crosshair
{
	nopicmip
	{
		map gfx/2d/crosshair.tga          
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA                
        rgbGen identity
	}
}

gfx/2d/crosshairb
{
	nopicmip
	{
		map gfx/2d/crosshairb.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairc
{
	nopicmip
	{
		map gfx/2d/crosshairc.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaird
{
	nopicmip
	{
		map gfx/2d/crosshaird.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaire
{
	nopicmip
	{
		map gfx/2d/crosshaire.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairf
{
	nopicmip
	{
		map gfx/2d/crosshairf.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairg
{
	nopicmip
	{
		map gfx/2d/crosshairg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairh
{
	nopicmip
	{
		map gfx/2d/crosshairh.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairi
{
	nopicmip
	{
		map gfx/2d/crosshairi.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

}
gfx/2d/crosshairj
{
	nopicmip
	{
		map gfx/2d/crosshairj.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}
gfx/2d/crosshairk
{
	nopicmip
	{
		map gfx/2d/crosshairk.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/numbers/zero_32b
{
	nopicmip
	{
		map gfx/2d/numbers/zero_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/one_32b
{
	nopicmip
	{
		map gfx/2d/numbers/one_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/two_32b
{
	nopicmip
	{
		map gfx/2d/numbers/two_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/three_32b
{
	nopicmip
	{
		map gfx/2d/numbers/three_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/four_32b
{
	nopicmip
	{
		map gfx/2d/numbers/four_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/five_32b
{
	nopicmip
	{
		map gfx/2d/numbers/five_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/six_32b
{
	nopicmip
	{
		map gfx/2d/numbers/six_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/seven_32b
{
	nopicmip
	{
		map gfx/2d/numbers/seven_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/eight_32b
{
	nopicmip
	{
		map gfx/2d/numbers/eight_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/nine_32b
{
	nopicmip
	{
		map gfx/2d/numbers/nine_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/minus_32b
{
	nopicmip
	{
		map gfx/2d/numbers/minus_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/select
{
	nopicmip
	{
		map gfx/2d/select.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
		rgbgen vertex
	}
}
gfx/damage/bullet_mrk
{
	polygonOffset
	{
		map gfx/damage/bullet_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/burn_med_mrk
{
	polygonOffset
	{
		map gfx/damage/burn_med_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
grenadeExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/glboom/glboom_1.tga  models/weaphits/glboom/glboom_2.tga models/weaphits/glboom/glboom_3.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/glboom/glboom_2.tga  models/weaphits/glboom/glboom_3.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}
icons/icona_machinegun
{
	nopicmip
	{
		map icons/icona_machinegun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_railgun
{
	nopicmip
	{
		map icons/icona_railgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_rocket
{
	nopicmip
	{
		map icons/icona_rocket.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_shotgun
{
	nopicmip
	{
		map icons/icona_shotgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identitylighting
	}
}
icons/iconh_green
{
	nopicmip
	{
		map icons/iconh_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_yellow
{
	nopicmip
	{
		map icons/iconh_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_red
{
	nopicmip
	{
		map icons/iconh_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// the background for the netgraph
lagometer
{
	nopicmip
	{
		map gfx/2d/lag.tga
	}
}

medal_assist
{
	nopicmip
	{
		clampmap menu/medals/medal_assist.tga
		blendFunc blend
	}
}

medal_defend
{
	nopicmip
	{
		clampmap menu/medals/medal_defend.tga
		blendFunc blend
	}
}

medal_capture
{
	nopicmip
	{
		clampmap menu/medals/medal_capture.tga
		blendFunc blend
	}
}

medal_impressive
{
	nopicmip
	{
		clampmap menu/medals/medal_impressive.tga
		blendFunc blend
	}
}

medal_excellent
{
	nopicmip
	{
		clampmap menu/medals/medal_excellent.tga
		blendFunc blend
	}
}
railCore
{
	sort nearest
	cull none
	{
		map gfx/misc/railcorethin_mono.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
		tcMod scroll -1 0
	}
}

rocketExplosion
{
	cull disable
	{
		animmap 8 models/weaphits/rlboom/rlboom_1.tga  models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

smokePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuffRagePro
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuffragepro.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
sprites/balloon3
{
	{
		map sprites/balloon4.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
sun
{
	cull none
	{
		map gfx/misc/sun.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}
white
{
	{
		map *white
		blendfunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}

// Tree-mapmodels (c) GrimReaper 
// thanks to Fatmanfat for help with the shader

models/mapobjects/GR_trees/tree
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/tree2
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree2.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/tree3
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree3.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/tree4
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree4.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/nadel
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/nadel.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/nadelsnow
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/nadelsnow.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/nadelsnowr
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/nadelsnowr.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/nadelsnowb
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/nadelsnowb.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/nadelsnowg
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/nadelsnowg.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/kerzeblau
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/kerzeblau.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/kerzerot
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/kerzerot.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/tree5
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree5.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/GR_trees/tree6
{
	cull none
	nopicmip

	{
		map models/mapobjects/GR_trees/tree6.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

jas-39Shadow
{
	polygonOffset
	{
		map gfx/shadows/jas-39shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

//**********************************************************************//
//									//
//	Mars.shader for Q3Radiant					//
//	by Sock - 1st August 2000					//
//									//
//**********************************************************************//
// q3map_sun <red> <green> <blue> <intensity> <degrees> <elevation>
// color will be normalized, so it doesn't matter what range you use
// intensity falls off with angle but not distance 100 is a fairly bright sun
// degree of 0 = from the east, 90 = north, etc.  altitude of 0 = sunrise/set, 90 = noon

textures/mars/mars_skybox
{
	qer_editorimage textures/mars/mars_view.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 75
	surfaceparm sky
	q3map_sun 4 3 3 150 135 50
	skyparms env/mars/mars - -
}


//   shader file for mfq34 map by Abbo	  \\
//   feel free to copy as you wish :) 	  \\

// q3map_sun <red> <green> <blue> <intensity> <degrees> <elevation>
// color will be normalized, so it doesn't matter what range you use
// intensity falls off with angle but not distance 100 is a fairly bright sun
// degree of 0 = from the east, 90 = north, etc.  altitude of 0 = sunrise/set, 90 = noon

textures/mfq34/skyblue
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	qer_editorimage textures/mfq34/bluesky.tga
	q3map_sun 0.9 0.9 1 512 315 75
	q3map_surfacelight 250
	skyparms - 512 -
	{
		map textures/mfq34/bluesky.tga
		tcMod scroll 0.05 0.05
		tcMod scale 1 1
		depthWrite
	}
}

textures/mfq34/haze
//experimental blue-white haze
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( .6 .6 .6 ) 4096
}

textures/mfq34/waterhaze
//blue underwater 'fog'
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( .3 .3 1 ) 2048
}

textures/effects/runwaylights1
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/effects/runwaylights2
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0.25 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/effects/runwaylights3
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0.5 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/effects/runwaylights4
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0.75 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/mfq34/atollsky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 75
	surfaceparm sky
	q3map_sun 1.00 0.949 0.977 100 200 45
	skyparms env/emerald - -
}

textures/mfq34/seawater
//	*********************************************************
//	*      Medium clear ripple water. Created November 6	*
//	*********************************************************
//	swiped by abbo from file liquids.shader
		
	{
		qer_editorimage textures/mfq34/watr1.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		surfaceparm nomarks

		cull disable
		//tesssize 64
		deformVertexes wave 64 sin .5 .5 0 .5	
				
	
	
		{
			map textures/mfq34/watr1.tga
			blendfunc GL_ONE GL_SRC_COLOR	
		}
	
		{
			map textures/mfq34/watr2.tga
			blendfunc GL_DST_COLOR GL_ONE
			//tcMod turb .1 .1 0 .01
			tcMod scale 0.1 0.1
			tcMod scroll .02 .02
		}		
	
	//END
}

textures/mfq34/seanowater
//	*********************************************************
//	*      Medium clear ripple nonwater. Created November 6	*
//	*********************************************************
//	swiped by abbo from file liquids.shader
		
	{
		qer_editorimage textures/mfq34/watr1.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		//surfaceparm fog
		//fogparms ( 0 .5 .8 ) 2048

		cull disable
		//tesssize 64
		//deformVertexes wave 64 sin .5 .5 0 .5	
				
	
	
		{
			map textures/mfq34/watr1.tga
			blendfunc GL_ONE GL_SRC_COLOR	
		}
	
		{
			map textures/mfq34/watr2.tga
			blendfunc GL_DST_COLOR GL_ONE
			//tcMod turb .1 .1 0 .01
			tcMod scale 0.1 0.1
			tcMod scroll .02 .02
		}		
	
	//END
}

textures/mfq34/waterfog
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( 0 .5 .8 ) 2048
}

// *************************************************
// *
// * MFQ34 terrain shader
// *
// *************************************************


textures/mfq34/mfq34ter_0
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr0.jpg
		rgbGen vertex
		//tcmod scale 0.1 0.1
	}
}

textures/mfq34/mfq34ter_1
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr1.jpg
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/mfq34/mfq34ter_2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr2.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
	}
}

textures/mfq34/mfq34ter_3
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
	}
}

textures/mfq34/mfq34ter_4
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr4.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
	}
}

textures/mfq34/mfq34ter_0to1
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr0.jpg
		rgbGen vertex
		alphaGen vertex
		//tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr1.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_0to2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr0.jpg
		rgbGen vertex
		alphaGen vertex
		//tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr2.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_0to3
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr0.jpg
		rgbGen vertex
		alphaGen vertex
		//tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr3.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_0to4
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr0.jpg
		rgbGen vertex
		alphaGen vertex
		//tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr4.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


textures/mfq34/mfq34ter_1to2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr2.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_1to3
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_1to4
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr4.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_2to3
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr2.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_2to4
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr2.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr4.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq34/mfq34ter_3to4
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq34/terr3.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq34/terr4.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// q3map_sun <red> <green> <blue> <intensity> <degrees> <elevation>
// color will be normalized, so it doesn't matter what range you use
// intensity falls off with angle but not distance 100 is a fairly bright sun
// degree of 0 = from the east, 90 = north, etc.  altitude of 0 = sunrise/set, 90 = noon

textures/mfq3canyon/desert_sky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 75
	surfaceparm sky
	q3map_sun 1 0.9 0.9 100 200 80
	skyparms env/desert - -
}

textures/mfq3canyon/clear_ripple3

//	*********************************************************
//	*      Medium clear ripple water. Created September 9	*
//	*********************************************************
//	swiped by abbo from file liquids.shader
		
	{
		qer_editorimage textures/liquids/pool3d_3c.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
	
		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	
		
		{ 
			map textures/liquids/pool3d_5c.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	

//	END
	}

//   shader file for mfq31 map by Abbo	  \\
//   feel free to copy as you wish :) 	  \\

textures/common/caulk
{
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nolightmap
}

textures/common/clip
{
	qer_trans 0.40
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
        //surfaceparm nolightmap //proto_addition 11/08/99
	surfaceparm playerclip
	surfaceparm noimpact
}

textures/mfq31/cloudspacer
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( 1 1 1 ) 9999999999999999
}

textures/mfq31/haze
//experimental blue-white haze
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( .8 .8 1 ) 3000
}


textures/mfq31/skyblue
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	qer_editorimage textures/mfq31/bluesky.tga
	q3map_sun 1 1 1 512 30 60
	q3map_surfacelight 250
	skyparms - 512 -
	{
		map textures/mfq31/bluesky.tga
		tcMod scroll 0.05 0.05
		tcMod scale 1 1
		depthWrite
	}
}

textures/mfq31/skyboxtest
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 50
	surfaceparm sky
	q3map_sun 0.6 0.6 0.6 100 120 60
	skyparms env/seadusk - -
}

textures/mfq31/cloud01_a
{
	cull disable
	surfaceparm nonsolid
	{
		map textures/skies/cloud01_b.tga
		blendfunc blend
		rgbGen identity
		tcMod scroll 0.05 0.025
		alphaGen wave sin 1 0.25 0 0.25 
	}
}

textures/mfq31/cloud01_b
{
	surfaceparm nonsolid
	cull none
	{
		map textures/skies/cloud01_b.tga
		rgbGen identity
		tcMod scroll 0.01 0.015
		tcMod scale 1 1
	}
}

textures/mfq31/dust1
{
	qer_editorimage textures/sfx/hellfog.tga
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( .85 .45 .075 ) 3000
}

textures/mfq31/cloudinvisible
{
	surfaceparm nolightmap
	surfaceparm nonsolid
        {
                map textures/common/invisible.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

textures/effects/runwaylights1
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/effects/runwaylights2
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0.25 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/effects/runwaylights3
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0.5 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/effects/runwaylights4
{
	{
		map $whiteimage 
		rgbGen const ( 1 0 0 )
	}
	{
		map $whiteimage 
		blendfunc blend
		rgbGen identity
		alphaGen wave sin 0 1 0.75 1 
	}
	{
		map $lightmap 
		rgbGen identity
	}
}

textures/mfq31/desert_sky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 75
	surfaceparm sky
	q3map_sun 1.00 0.949 0.977 100 200 45
	skyparms env/desert - -
}

// *************************************************
// *
// * MFQ31 terrain shader
// *
// *************************************************


textures/mfq31/mfq31ter2_0
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq31/terr1.jpg
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/mfq31/mfq31ter2_1
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq31/terr2.jpg
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/mfq31/mfq31ter2_2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq31/terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
	}
}

textures/mfq31/mfq31ter2_0to1
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq31/terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq31/terr2.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq31/mfq31ter2_0to2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq31/terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq31/terr3.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/mfq31/mfq31ter2_1to2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/mfq31/terr2.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/mfq31/terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// *************************************************
// *
// *  Groundwar Terrain shader
// *
// *************************************************

textures/horizon/birdofprey
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 75
	surfaceparm sky
	q3map_sun 1 0.9 0.9 100 200 80
	skyparms env/horizon/birdofprey512 - -
}


textures/groundwar/groundwar_0
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/groundwar/terrain1.tga
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/groundwar/groundwar_1
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/groundwar/terrain2.tga
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/groundwar/groundwar_2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/groundwar/terrain3.tga
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}


textures/groundwar/groundwar_0to1
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/groundwar/terrain1.tga
		rgbGen vertex
		tcmod scale 0.1 0.1
		alphaGen vertex
	}
	{
		map textures/groundwar/terrain2.tga
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/groundwar/groundwar_0to2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/groundwar/terrain1.tga
		rgbGen vertex
		tcmod scale 0.1 0.1
		alphaGen vertex
	}
	{
		map textures/groundwar/terrain3.tga
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/groundwar/groundwar_1to2
{
	surfaceparm nolightmap
	q3map_novertexshadows
	q3map_forcesunlight
	{
		map textures/groundwar/terrain2.tga
		rgbGen vertex
		tcmod scale 0.1 0.1
		alphaGen vertex
	}
	{
		map textures/groundwar/terrain3.tga
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


textures/mfq3textures/back_wall
{
	qer_editorimage textures/MFQ3Textures/back_wall.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/back_wall.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/chimney
{
	qer_editorimage textures/mfq3textures/chimney.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/chimney.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/fence
{
	qer_editorimage textures/mfq3textures/fence.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/fence.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/front_wall
{
	qer_editorimage textures/mfq3textures/front_wall.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/front_wall.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/grass
{
	qer_editorimage textures/mfq3textures/grass.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/grass.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/grass2
{
	qer_editorimage textures/mfq3textures/grass2.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/grass2.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/roof
{
	qer_editorimage textures/mfq3textures/roof.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/roof.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/mfq3textures/side_wall
{
	qer_editorimage textures/mfq3textures/side_wall.tga
	surfaceparm nodamage
	surfaceparm nosteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/MFQ3Textures/side_wall.tga
		blendfunc filter
		rgbGen identity
	}
}


// *************************************************
// *
// * Orientation terrain shader
// * Edited from Abbo's Mfq31 Shader
// *************************************************


textures/orientation/orientation_0
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/orientation/or_terr1.jpg
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/orientation/orientation_1
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/orientation/or_terr2.jpg
		rgbGen vertex
		tcmod scale 0.1 0.1
	}
}

textures/orientation/orientation_2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/orientation/or_terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
	}
}

textures/orientation/orientation_0to1
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/orientation/or_terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/orientation/or_terr2.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/orientation/orientation_0to2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/orientation/or_terr1.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/orientation/or_terr3.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/orientation/orientation_1to2
{
	surfaceparm nolightmap
	q3map_forcesunlight
	{
		map textures/orientation/or_terr2.jpg
		rgbGen vertex
		alphaGen vertex
		tcmod scale 0.1 0.1
	}
	{
		map textures/orientation/or_terr3.jpg
		tcmod scale 0.1 0.1
		rgbGen vertex
		alphaGen vertex
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//model effects shader
//last edited by Detoeni, 9/10/2005

models/weapons/mf_crate_silk
{
	cull twosided
	{
		map models/weapons/mf_crate.tga
		depthWrite
		rgbGen lightingdiffuse
	}
}
models/weapons/mf_crate_rope
{
	cull twosided
	{
		map models/weapons/mf_crate.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}
models/weapons/mf_crate
{
	{
		map models/weapons/mf_crate.tga
		rgbGen lightingdiffuse
	}
}

models/powerups/pickups/fuel_item
{
	qer_editorimage textures/mf_effect/tint_green.tga
	{
		map textures/mf_effect/tint_green.tga
		tcGen environment
		tcmod rotate 33
		tcmod scroll 1 1
	}
}
models/powerups/pickups/fuel_sphere
{
	qer_editorimage textures/mf_effect/tint_green2.tga
	{
		map textures/mf_effect/tint_green2.tga
		tcGen environment
		tcmod rotate 13
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/pickups/health_item
{
	qer_editorimage textures/mf_effect/tint_gold.tga
	{
		map textures/mf_effect/tint_gold.tga
		tcGen environment
		tcmod rotate 33
		tcmod scroll 1 1
	}
}
models/powerups/pickups/health_sphere
{
	qer_editorimage textures/mf_effect/tint_gold2.tga
	{
		map textures/mf_effect/tint_gold2.tga
		tcGen environment
		tcmod rotate 13
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/pickups/ammo_item
{
	qer_editorimage textures/mf_effect/tint_purp.tga
	{
		map textures/mf_effect/tint_purp.tga
		tcGen environment
		tcmod rotate 33
		tcmod scroll 1 1
	}
}
models/powerups/pickups/ammo_sphere
{
	qer_editorimage textures/mf_effect/tint_purp2.tga
	{
		map textures/mf_effect/tint_purp2.tga
		tcGen environment
		tcmod rotate 13
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/pickups/ammo_glass_item
{
	qer_editorimage textures/mf_effect/tint_purp.tga
	cull none
	{
		map textures/mf_effect/tint_purp.tga
		blendFunc blend    
		tcGen environment      
		alphagen const 0.60  
	}
}
models/powerups/pickups/frame_item
{
	qer_editorimage textures/mf_effect/tint_gray2.tga
	{
			map textures/mf_effect/tint_sharp.tga
	         	rgbGen lightingdiffuse
	         	tcGen environment
	}
	{
	         	map textures/mf_effect/tint_gray2.tga
	         	blendFunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
	         	rgbGen lightingdiffuse

	}
}
////////////////////////uh-1////////////////////////////////////
models/vehicles/helos/uh-1/mrotor_blur
{
     cull disable
	qer_editorimage models/vehicles/helos/uh-1/mrotor_blur.tga
        {
        	map models/vehicles/helos/uh-1/mrotor_blur.tga
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			alphaFunc GT0
			rgbGen vertex
			tcMod rotate -3600

        }
}
models/vehicles/helos/uh-1/trotor_blur
{
     cull disable
	qer_editorimage models/vehicles/helos/uh-1/trotor_blur.tga
        {
        	map models/vehicles/helos/uh-1/trotor_blur.tga
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			alphaFunc GT0
			rgbGen vertex
			tcMod rotate -3600
        }
}

//////////////////////////////hind/////////////////////////////
models/vehicles/helos/hind/24_hind
{
	qer_editorimage models/vehicles/helos/hind/24_hind.tga
	{
		map models/vehicles/helos/hind/24_hind.tga
		rgbGen lightingdiffuse
	}
}
models/vehicles/helos/hind/24_hind_nocull
{
	qer_editorimage models/vehicles/helos/hind/24_hind.tga
	cull disable
	{
		map models/vehicles/helos/hind/24_hind.tga
		rgbGen lightingdiffuse
	}
}
models/vehicles/helos/hind/35_hind
{
	qer_editorimage models/vehicles/helos/hind/35_hind.tga
	{
		map models/vehicles/helos/hind/35_hind.tga
		rgbGen lightingdiffuse
	}
}
models/vehicles/helos/hind/35_hind_nocull
{
	qer_editorimage models/vehicles/helos/hind/35_hind.tga
	cull disable
	{
		map models/vehicles/helos/hind/35_hind.tga
		rgbGen lightingdiffuse
	}
}
models/vehicles/helos/hind/hind_glass
{
	qer_editorimage textures/mf_effect/tint_sharp.tga
	{
		map textures/mf_effect/tint_sharp.tga
		blendFunc blend    
		tcGen environment    
		rgbgen const ( 0.4 0.4 0.4 )   
		alphagen const 0.40  
	}
}
models/vehicles/helos/hind/mrotor_blur
{
     cull disable
	qer_editorimage models/vehicles/helos/hind/mrotor_blur.tga
        {
        	map models/vehicles/helos/hind/mrotor_blur.tga
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			alphaFunc GT0
			rgbGen vertex
			tcMod rotate 3600

        }
}
models/vehicles/helos/hind/trotor_blur
{
     cull disable
	qer_editorimage models/vehicles/helos/hind/trotor_blur.tga
        {
        	map models/vehicles/helos/hind/trotor_blur.tga
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			alphaFunc GT0
			rgbGen vertex
			tcMod rotate 1600
        }
}
///////////////////////fav////////////////////////////////////
models/vehicles/ground/fav/fav
{
	qer_editorimage models/vehicles/ground/fav/fav.tga
	{
		map models/vehicles/ground/fav/fav.tga
		rgbGen lightingdiffuse
	}
}
models/vehicles/ground/fav/fav_gn
{
	qer_editorimage models/vehicles/ground/fav/fav_gn.tga
	{
		map models/vehicles/ground/fav/fav_gn.tga
		rgbGen lightingdiffuse
	}
}

missilePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/missilepuff.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

models/powerups/ammo/machammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/machammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo2
{
	{
		map models/powerups/ammo/machammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/railammo1
{
       {
	        map textures/effects/envmaprail.tga
                tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/railammo2
{
	{
		map models/powerups/ammo/railammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/rockammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/rockammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo2
{
	{
		map models/powerups/ammo/rockammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/shotammo
{
       {
	        map textures/effects/tinfx2c.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/shotammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo2
{
	{
		map models/powerups/ammo/shotammo2.tga
		rgbGen identity
	}

}
models/powerups/health/green
{
	
	{
		map textures/effects/envmaprail.tga
		tcGen environment
		
	}
}
models/powerups/health/green_sphere
{
	{
		map textures/effects/tinfx2b.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/red
{	
	
	{
		map textures/effects/envmapgold.tga
                tcGen environment
		blendfunc GL_ONE GL_ZERO
		
	}
        {
		map textures/sfx/kenelectric.tga
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc GL_ONE GL_ONE
		
	}
}

models/powerups/health/red_sphere
{
	{
		map textures/effects/envmapgold2.tga
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/yellow
{
	
	{
		map textures/effects/envmapyel.tga
                tcGen environment
	}
        
}
models/powerups/health/yellow_sphere
{
	{
		map textures/effects/tinfx2b.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}

models/powerups/holdable/teleport_base
{
	{
		map textures/effects/envmap.tga
		tcgen environment
	}
	
}

models/powerups/holdable/teleport_sphere
{
	{
		map textures/effects/envmapdim.tga
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}
	
}

// need to check these ctf things carefully
models/flags/r_flag2
{
      
	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none
        
        {
		map models/flags/r_flag2.tga
		 rgbGen identity
	}
        {
		map models/flags/red_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                
                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flags/r_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}

models/flags/b_flag2
{
      
	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none
        
        {
		map models/flags/b_flag2.tga
		 rgbGen identity
	}
        {
		map models/flags/blue_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flags/b_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
}

models/flags/pole
{
	  
        {
             map models/flags/skull.tga
		tcGen environment
		rgbGen lightingDiffuse	
                
        }


}

models/flags/skull
{
	  
        {
             map models/flags/skull.tga
		//tcGen environment
		rgbGen lightingDiffuse	
                
        }

}

models/flags/flagbits
{
               cull none
	      // deformVertexes wave 100 sin 0 5 0 .7
	 {
                map models/flags/flagbits.tga
                //blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen lightingDiffuse
                depthWrite
        }


}

quakeRocketExplosion
{
	cull disable
	{
		animmap 8 models/weaphits/qrlboom/rlboom_1.tga  models/weaphits/qrlboom/rlboom_2.tga models/weaphits/qrlboom/rlboom_3.tga models/weaphits/qrlboom/rlboom_4.tga models/weaphits/qrlboom/rlboom_5.tga models/weaphits/qrlboom/rlboom_6.tga models/weaphits/qrlboom/rlboom_7.tga models/weaphits/qrlboom/rlboom_8.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/qrlboom/rlboom_2.tga models/weaphits/qrlboom/rlboom_3.tga models/weaphits/qrlboom/rlboom_4.tga models/weaphits/qrlboom/rlboom_5.tga models/weaphits/qrlboom/rlboom_6.tga models/weaphits/qrlboom/rlboom_7.tga models/weaphits/qrlboom/rlboom_8.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

//Shader file for Norway MFQ3 MAP
//written by Cannon
//oh dear, writing a terrain shader with 6 textures sucks. :-/


//q3map terrain stuff 

textures/common/q3map_terrain
{
	q3map_terrain

	qer_editorimage textures/common/terrain.tga
	surfaceparm dust
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nolightmap
}



//regular terrain shaders

textures/norway/terrain_0
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain1.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_1
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain2.jpg

{
	map textures/norway/terrain2.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_2
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain3.jpg

{
	map textures/norway/terrain3.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_3
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain4.jpg

{
	map textures/norway/terrain4.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_4
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain5.jpg

{
	map textures/norway/terrain5.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_5
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain6.jpg

{
	map textures/norway/terrain6.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_4to5
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain5.jpg
	rgbGen identity
}
{
	map textures/norway/terrain6.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_0to1
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain1.jpg
	rgbGen identity
}
{
	map textures/norway/terrain2.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_0to2
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain1.jpg
	rgbGen identity
}
{
	map textures/norway/terrain3.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}
textures/norway/terrain_0to3
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain1.jpg
	rgbGen identity
}
{
	map textures/norway/terrain4.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_0to4
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain1.jpg
	rgbGen identity
}
{
	map textures/norway/terrain5.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_0to5
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain1.jpg
	rgbGen identity
}
{
	map textures/norway/terrain6.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}



textures/norway/terrain_1to2
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain2.jpg
	rgbGen identity
}
{
	map textures/norway/terrain3.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_1to3
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain2.jpg
	rgbGen identity
}
{
	map textures/norway/terrain4.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_1to4
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain2.jpg
	rgbGen identity
}
{
	map textures/norway/terrain5.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_1to5
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain2.jpg
	rgbGen identity
}
{
	map textures/norway/terrain6.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_2to3
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain3.jpg
	rgbGen identity
}
{
	map textures/norway/terrain4.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_2to4
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain3.jpg
	rgbGen identity
}
{
	map textures/norway/terrain5.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_2to5
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain3.jpg
	rgbGen identity
}
{
	map textures/norway/terrain6.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_3to4
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain4.jpg
	rgbGen identity
}
{
	map textures/norway/terrain5.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_3to5
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain3.jpg
	rgbGen identity
}
{
	map textures/norway/terrain6.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/norway/terrain_4to5
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/norway/terrain1.jpg

{
	map textures/norway/terrain5.jpg
	rgbGen identity
}
{
	map textures/norway/terrain6.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}




//fog
//this is the shader for fog; the number at the end of the line with fogparms
//is the distance you can see through it


textures/norway/fog
{
surfaceparm nolightmap
surfaceparm nonsolid
surfaceparm trans
surfaceparm fog
q3map_surfacelight 0
q3map_globaltexture
fogparms ( 0.5 0.5 0.5 ) 5120
}



//foghull stuff
//this is self-explanatory


textures/norway/foghull
{
   surfaceparm nolightmap
   surfaceparm nonsolid
   surfaceparm trans
   surfaceparm sky
   skyparms textures/norway/foghull - -
}

textures/norway/skybox
{
surfaceparm noimpact
surfaceparm sky
skyparms textures/norway/skybox - -
}

//water

textures/norway/water
//modified abbo's mfq34 shader
{
	qer_editorimage textures/norway/water1.jpg
	//qer_trans .1
	q3map_globaltexture
	//surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm fog
	
	cull disable
	deformVertexes wave 64 sin .5 .5 0 0	
				
	
	
	{
		map textures/norway/water1.jpg
		blendfunc GL_ONE GL_SRC_COLOR	
		//alphagen const .5
		//rgbGen identity
		//blendFunc GL_src_alpha GL_ONE_minus_src_alpha
		//^ makes water have l33t tropical color...doesnt fit this map though :(
	}
	
		{
		map textures/norway/water2.jpg
		blendfunc GL_DST_COLOR GL_ONE
		tcMod scale 0.1 0.1
		tcMod scroll .02 .02
		}
}






nukePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/nukepuff.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

// Shockwave
models/weaphits/nuke_shockwave01
{
	surfaceparm trans
	cull disable
	nomipmaps
	{
		clampmap models/weaphits/nuke_shockwave01.tga
		blendfunc add
		rgbGen entity
		tcMod rotate 20
	}
	{
		clampmap models/weaphits/nuke_shockwave02.tga
		blendfunc add
		rgbGen entity
		tcMod rotate -20
	}
}

models/weaphits/nuke_shockwave02
{
	surfaceparm trans
	cull disable
	{
		map models/weaphits/nuke_shockwave02.tga
		blendfunc add
		rgbGen entity
		tcMod scroll 1 0
	}
}

// Nuke body
models/weaphits/nuke_sphere01
{
	cull disable
	q3map_sun 0 0 0 1000 0 0
	{
		clampmap models/weaphits/nuke_sphere01.tga
		rgbGen identity
		// blendfunc add
                // blendfunc gl_one_minus_src_alpha gl_src_color
		// blendfunc filter
		blendfunc blend
		tcGen environment 
	}
}

models/weaphits/nuke_sphereB01
{
	cull disable
	deformVertexes autosprite
	q3map_sun 0 0 0 1000 0 0
	{
		clampmap models/weaphits/nuke_sphereB01.tga
		blendfunc add
		rgbGen identity
		tcMod rotate 133
	}
	{
		clampmap models/weaphits/nuke_sphereB02.tga
		blendfunc add
		rgbGen identity
		tcMod rotate -113
	}
}

models/weaphits/nuke_sphereC01
{
	cull disable
	// deformVertexes autosprite
	q3map_sun 0 0 0 1000 0 0
	{
		clampmap models/weaphits/nuke_sphereC01.tga
		blendfunc add
		rgbGen identity
		tcMod rotate 133
	}
	{
		clampmap models/weaphits/nuke_sphereC02.tga
		blendfunc add
		rgbGen identity
		tcMod rotate -113
	}
}

nukecloud0
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud0.jpg
	}
}
	
nukecloud1
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud1.jpg
	}
}
	
nukecloud2
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud2.jpg
	}
}
	
nukecloud3
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud3.jpg
	}
}
	
nukecloud4
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud4.jpg
	}
}
	
nukecloud5
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud5.jpg
	}
}
	
nukecloud6
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud6.jpg
	}
}
	
nukecloud7
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud7.jpg
	}
}
	
nukecloud8
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud8.jpg
	}
}
	
nukecloud9
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud9.jpg
	}
}
	
nukecloud10
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud10.jpg
	}
}
	
nukecloud11
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud11.jpg
	}
}
	
nukecloud12
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud12.jpg
	}
}
	
nukecloud13
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud13.jpg
	}
}
	
nukecloud14
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud14.jpg
	}
}
	
nukecloud15
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud15.jpg
	}
}
	
nukecloud16
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud16.jpg
	}
}
	
nukecloud17
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud17.jpg
	}
}
	
nukecloud18
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud18.jpg
	}
}
	
nukecloud19
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud19.jpg
	}
}
	
nukecloud20
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud20.jpg
	}
}
	
nukecloud21
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud21.jpg
	}
}
	
nukecloud22
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud22.jpg
	}
}
	
nukecloud23
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud23.jpg
	}
}
	
nukecloud24
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud24.jpg
	}
}
	
nukecloud25
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud25.jpg
	}
}
	
nukecloud26
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud26.jpg
	}
}
	
nukecloud27
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud27.jpg
	}
}
	
nukecloud28
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud28.jpg
	}
}
	
nukecloud29
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud29.jpg
	}
}
	
nukecloud30
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud30.jpg
	}
}
	
nukecloud31
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud31.jpg
	}
}
	
nukecloud32
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud32.jpg
	}
}
	
nukecloud33
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud33.jpg
	}
}
	
nukecloud34
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud34.jpg
	}
}
	
nukecloud35
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud35.jpg
	}
}
	
nukecloud36
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud36.jpg
	}
}
	
nukecloud37
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud37.jpg
	}
}
	
nukecloud38
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud38.jpg
	}
}
	
nukecloud39
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud39.jpg
	}
}
	
nukecloud40
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud40.jpg
	}
}
	
nukecloud41
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud41.jpg
	}
}
	
nukecloud42
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud42.jpg
	}
}
	
nukecloud43
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud43.jpg
	}
}
	
nukecloud44
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud44.jpg
	}
}
	
nukecloud45
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud45.jpg
	}
}
	
nukecloud46
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud46.jpg
	}
}
	
nukecloud47
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud47.jpg
	}
}
	
nukecloud48
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud48.jpg
	}
}
	
nukecloud49
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud49.jpg
	}
}
	
nukecloud50
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud50.jpg
	}
}
	
nukecloud51
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud51.jpg
	}
}
	
nukecloud52
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud52.jpg
	}
}
	
nukecloud53
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud53.jpg
	}
}
	
nukecloud54
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud54.jpg
	}
}
	
nukecloud55
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud55.jpg
	}
}
	
nukecloud56
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud56.jpg
	}
}
	
nukecloud57
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud57.jpg
	}
}
	
nukecloud58
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud58.jpg
	}
}
	
nukecloud59
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud59.jpg
	}
}
	
nukecloud60
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud60.jpg
	}
}
	
nukecloud61
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud61.jpg
	}
}
	
nukecloud62
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud62.jpg
	}
}
	
nukecloud63
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud63.jpg
	}
}
	
nukecloud64
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud64.jpg
	}
}
	
nukecloud65
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud65.jpg
	}
}
	
nukecloud66
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud66.jpg
	}
}
	
nukecloud67
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud67.jpg
	}
}
	
nukecloud68
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud68.jpg
	}
}
	
nukecloud69
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud69.jpg
	}
}
	
nukecloud70
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud70.jpg
	}
}
	
nukecloud71
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud71.jpg
	}
}
	
nukecloud72
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud72.jpg
	}
}
	
nukecloud73
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud73.jpg
	}
}
	
nukecloud74
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud74.jpg
	}
}
	
nukecloud75
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud75.jpg
	}
}
	
nukecloud76
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud76.jpg
	}
}
	
nukecloud77
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud77.jpg
	}
}
	
nukecloud78
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud78.jpg
	}
}
	
nukecloud79
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud79.jpg
	}
}
	
nukecloud80
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud80.jpg
	}
}
	
nukecloud81
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud81.jpg
	}
}
	
nukecloud82
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud82.jpg
	}
}
	
nukecloud83
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud83.jpg
	}
}
	
nukecloud84
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud84.jpg
	}
}
	
nukecloud85
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud85.jpg
	}
}
	
nukecloud86
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud86.jpg
	}
}
	
nukecloud87
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud87.jpg
	}
}
	
nukecloud88
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud88.jpg
	}
}
	
nukecloud89
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud89.jpg
	}
}
	
nukecloud90
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud90.jpg
	}
}
	
nukecloud91
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud91.jpg
	}
}
	
nukecloud92
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud92.jpg
	}
}
	
nukecloud93
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud93.jpg
	}
}
	
nukecloud94
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud94.jpg
	}
}
	
nukecloud95
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud95.jpg
	}
}
	
nukecloud96
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud96.jpg
	}
}
	
nukecloud97
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud97.jpg
	}
}
	
nukecloud98
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud98.jpg
	}
}
	
nukecloud99
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud99.jpg
	}
}
	
nukecloud100
{
	cull disable
	{
		map models/weaphits/nukecloud/nukecloud100.jpg
	}
}
	

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

p-51dShadow
{
	polygonOffset
	{
		map gfx/shadows/p-51dshadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

planeShadow
{
	polygonOffset
	{
		map gfx/shadows/planeShadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

groundVehicleShadow
{
	polygonOffset
	{
		map gfx/shadows/groundVehicleShadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// These are the default 1-per-catagory alpha shadows used when cg_shadows is 1 (a cg_shadows values 2/3 uses stencil-buffered shadows)
//
// To specify a custom shader for a vehicle, create a shader called <modelname>Shadow in a .shader text file and place the file into the
// mfq3/scripts directory.  Copy the body of the shaders below and just change the 'map' parameter to point to the correct TGA for
// the vehicle's shadow.
//
// The <alpha shadow> property of the vehicle config in bg_vehicledata.c determines whether the default shadows are used for a vehicle
// when its custom shader can't be found.

spitfire_mk5bShadow
{
	polygonOffset
	{
		map gfx/shadows/spitfire_mk5bshadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

//Mfq3_map_subpen Shader File
//Written by Cannon
//August-September 2003
////////////////////////////////////////////////////////////////////


textures/subpen/water
//modified abbo's mfq34 shader
{
	qer_editorimage textures/subpen/water1.jpg
	//qer_trans .1
	q3map_globaltexture
	//surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	surfaceparm nomarks

	cull disable
	deformVertexes wave 64 sin .5 .5 0 0	
				
	
	
	{
		map textures/subpen/water1.jpg
		blendfunc GL_ONE GL_SRC_COLOR	
	}
	
		{
		map textures/subpen/water2.jpg
		blendfunc GL_DST_COLOR GL_ONE
		tcMod scale 0.1 0.1
		tcMod scroll .02 .02
		}
}

textures/terrain/q3map_terrain
{
q3map_terrain
q3map_lightmapsampleoffset 4.0
q3map_splotchfix 
q3map_lightmapaxis z
q3map_tcGen ivector ( 512 0 0 ) ( 0 512 0 )
q3map_nonplanar
q3map_shadeangle 225
q3map_nolightmap
}

textures/subpen/terrain_0
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/subpen/terrain1.jpg

{
	map textures/subpen/terrain1.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/subpen/terrain_1
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/subpen/terrain1.jpg

{
	map textures/subpen/terrain2.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/subpen/terrain_2
{
	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/subpen/terrain1.jpg

{
	map textures/subpen/terrain3.jpg
	rgbGen identity
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/subpen/terrain_0to1
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/subpen/terrain1.jpg

{
	map textures/subpen/terrain1.jpg
	rgbGen identity
}
{
	map textures/subpen/terrain2.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/subpen/terrain_0to2
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/subpen/terrain1.jpg

{
	map textures/subpen/terrain1.jpg
	rgbGen identity
}
{
	map textures/subpen/terrain3.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

textures/subpen/terrain_1to2
{

	q3map_baseshader textures/terrain/q3map_terrain
	q3map_lightimage textures/subpen/terrain1.jpg

{
	map textures/subpen/terrain2.jpg
	rgbGen identity
}
{
	map textures/subpen/terrain3.jpg
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	rgbGen identity
	alphaGen vertex
}
{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	tcGen lightmap
	rgbGen identity
}
}

models/tex_shared/bars
{
	{
		map models/tex_shared/bars.tga
		rgbGen lightingDiffuse 
		alphaFunc GE128
	}
}

models/tex_shared/exhaust_noz
{
	{
		map models/tex_shared/exhaust_noz.tga
		rgbGen wave sin 0.9 0.1 0 1 
		tcMod rotate 90
	}
}

models/tex_shared/tank_treds_t
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
	}
}

models/tex_shared/tank_treds_t_1
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 0.2 0
	}
}

models/tex_shared/tank_treds_t_1b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -0.2 0
	}
}

models/tex_shared/tank_treds_t_2
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 0.4 0
	}
}

models/tex_shared/tank_treds_t_2b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -0.4 0
	}
}

models/tex_shared/tank_treds_t_3
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 0.6 0
	}
}

models/tex_shared/tank_treds_t_3b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -0.6 0
	}
}

models/tex_shared/tank_treds_t_4
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 0.8 0
	}
}

models/tex_shared/tank_treds_t_4b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -0.8 0
	}
}

models/tex_shared/tank_treds_t_5
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 1 0
	}
}

models/tex_shared/tank_treds_t_5b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -1 0
	}
}

models/tex_shared/tank_treds_t_6
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 1.2 0
	}
}

models/tex_shared/tank_treds_t_6b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -1.2 0
	}
}

models/tex_shared/tank_treds_t_7
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 1.4 0
	}
}

models/tex_shared/tank_treds_t_7b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -1.4 0
	}
}

models/tex_shared/tank_treds_t_8
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 1.6 0
	}
}

models/tex_shared/tank_treds_t_8b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -1.6 0
	}
}

models/tex_shared/tank_treds_t_9
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 1.8 0
	}
}

models/tex_shared/tank_treds_t_9b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -1.8 0
	}
}

models/tex_shared/tank_treds_t_10
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll 2 0
	}
}

models/tex_shared/tank_treds_t_10b
{
	{
		map models/tex_shared/tank_treds_t.tga
		rgbGen lightingDiffuse 
		tcMod scroll -2 0
	}
}

models/tex_shared/tank_wheel1_t
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
	}
}

models/tex_shared/tank_wheel1_t_1
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 10
	}
}

models/tex_shared/tank_wheel1_t_1b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -10
	}
}

models/tex_shared/tank_wheel1_t_2
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 20
	}
}

models/tex_shared/tank_wheel1_t_2b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -20
	}
}

models/tex_shared/tank_wheel1_t_3
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 30
	}
}

models/tex_shared/tank_wheel1_t_3b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -30
	}
}

models/tex_shared/tank_wheel1_t_4
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 40
	}
}

models/tex_shared/tank_wheel1_t_4b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -40
	}
}

models/tex_shared/tank_wheel1_t_5
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 50
	}
}

models/tex_shared/tank_wheel1_t_5b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -50
	}
}

models/tex_shared/tank_wheel1_t_6
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 60
	}
}

models/tex_shared/tank_wheel1_t_6b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -60
	}
}

models/tex_shared/tank_wheel1_t_7
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 70
	}
}

models/tex_shared/tank_wheel1_t_7b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -70
	}
}

models/tex_shared/tank_wheel1_t_8
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 80
	}
}

models/tex_shared/tank_wheel1_t_8b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -80
	}
}

models/tex_shared/tank_wheel1_t_9
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 90
	}
}

models/tex_shared/tank_wheel1_t_9b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -90
	}
}

models/tex_shared/tank_wheel1_t_10
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 100
	}
}

models/tex_shared/tank_wheel1_t_10b
{
	{
		map models/tex_shared/tank_wheel1_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -100
	}
}

models/tex_shared/tank_wheel2_t
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
	}
}

models/tex_shared/tank_wheel2_t_1
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 10
	}
}

models/tex_shared/tank_wheel2_t_1b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -10
	}
}

models/tex_shared/tank_wheel2_t_2
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 20
	}
}

models/tex_shared/tank_wheel2_t_2b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -20
	}
}

models/tex_shared/tank_wheel2_t_3
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 30
	}
}

models/tex_shared/tank_wheel2_t_3b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -30
	}
}

models/tex_shared/tank_wheel2_t_4
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 40
	}
}

models/tex_shared/tank_wheel2_t_4b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -40
	}
}

models/tex_shared/tank_wheel2_t_5
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 50
	}
}

models/tex_shared/tank_wheel2_t_5b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -50
	}
}

models/tex_shared/tank_wheel2_t_6
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 60
	}
}

models/tex_shared/tank_wheel2_t_6b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -60
	}
}

models/tex_shared/tank_wheel2_t_7
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 70
	}
}

models/tex_shared/tank_wheel2_t_7b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -70
	}
}

models/tex_shared/tank_wheel2_t_8
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 80
	}
}

models/tex_shared/tank_wheel2_t_8b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -80
	}
}

models/tex_shared/tank_wheel2_t_9
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 90
	}
}

models/tex_shared/tank_wheel2_t_9b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -90
	}
}

models/tex_shared/tank_wheel2_t_10
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 100
	}
}

models/tex_shared/tank_wheel2_t_10b
{
	{
		map models/tex_shared/tank_wheel2_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -100
	}
}

models/tex_shared/tank_wheel3_t
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
	}
}

models/tex_shared/tank_wheel3_t_1
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 10
	}
}

models/tex_shared/tank_wheel3_t_1b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -10
	}
}

models/tex_shared/tank_wheel3_t_2
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 20
	}
}

models/tex_shared/tank_wheel3_t_2b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -20
	}
}

models/tex_shared/tank_wheel3_t_3
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 30
	}
}

models/tex_shared/tank_wheel3_t_3b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -30
	}
}

models/tex_shared/tank_wheel3_t_4
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 40
	}
}

models/tex_shared/tank_wheel3_t_4b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -40
	}
}

models/tex_shared/tank_wheel3_t_5
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 50
	}
}

models/tex_shared/tank_wheel3_t_5b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -50
	}
}

models/tex_shared/tank_wheel3_t_6
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 60
	}
}

models/tex_shared/tank_wheel3_t_6b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -60
	}
}

models/tex_shared/tank_wheel3_t_7
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 70
	}
}

models/tex_shared/tank_wheel3_t_7b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -70
	}
}

models/tex_shared/tank_wheel3_t_8
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 80
	}
}

models/tex_shared/tank_wheel3_t_8b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -80
	}
}

models/tex_shared/tank_wheel3_t_9
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 90
	}
}

models/tex_shared/tank_wheel3_t_9b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -90
	}
}

models/tex_shared/tank_wheel3_t_10
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate 100
	}
}

models/tex_shared/tank_wheel3_t_10b
{
	{
		map models/tex_shared/tank_wheel3_t.tga
		rgbGen lightingDiffuse 
		tcMod rotate -100
	}
}

models/tex_shared/intake1
{
	{
		map models/tex_shared/intake1.tga
		rgbGen lightingDiffuse 
		tcMod rotate 1080
	}
}

models/tex_shared/powerup_blue
{
	{
		map models/tex_shared/powerup_blue.tga
		blendfunc add
		rgbGen lightingDiffuse 
		tcGen environment 
	}
}

models/tex_shared/powerup_gray
{
	{
		map models/tex_shared/powerup_gray.tga
		blendfunc add
		rgbGen lightingDiffuse 
		tcGen environment 
	}
}

models/tex_shared/powerup_green
{
	{
		map models/tex_shared/powerup_green.tga
		blendfunc add
		rgbGen lightingDiffuse 
		tcGen environment 
	}
}

models/tex_shared/powerup_white
{
	{
		map models/tex_shared/powerup_white.tga
		blendfunc add
		rgbGen lightingDiffuse 
		tcGen environment 
	}
}

models/tex_shared/stealthglass
{
	cull none
	{
		map models/tex_shared/stealthglass.tga
		blendfunc add
		rgbGen lightingDiffuse 
	}
}

models/tex_shared/lights
{
	{
		map models/tex_shared/lights.tga
		rgbGen identityLighting
	}
}

models/tex_shared/decal_shield1
{
	{
		map models/tex_shared/decal_shield1.tga
		rgbGen lightingDiffuse 
		alphaFunc GE128
	}
}

models/tex_shared/decal_starstripe
{
	{
		map models/tex_shared/decal_starstripe.tga
		rgbGen lightingDiffuse 
		alphaFunc GE128
	}
}

models/tex_shared/decal_text
{
	{
		map models/tex_shared/decal_text.tga
		rgbGen lightingDiffuse 
		alphaFunc GE128
	}
}

models/tex_shared/vdu
{
	{
		map models/tex_shared/vdu.tga
		rgbGen identityLighting
	}
}

models/tex_shared/hud
{
	{
		map models/tex_shared/hud.tga
		blendfunc add
		rgbGen identityLighting
	}
}


models/vehicles/planes/b-2/skin
{
	cull disable
	{
		map models/vehicles/planes/b-2/skin.tga
		rgbGen lightingDiffuse 
	}
}


// trail half ball
models/weapons/rocket_fire
{
	{
		map models/weapons/rocket_fire.tga
		blendfunc add
		rgbGen identity
	}
}

// whole ball
models/weapons/rocket_fire2
{
	{
		map models/weapons/rocket_fire2.tga
		blendfunc add
		rgbGen identity
	}
}

// fading exhaust
models/weapons/rocket_ball0
{
	{
		map models/weapons/rocket_ball.tga
		blendfunc add
		rgbGen lightingDiffuse
		tcMod scroll 0 -1
	}
}

models/weapons/rocket_ball1
{
	{
		map models/weapons/rocket_ball.tga
		blendfunc add
		rgbGen wave sin 0.7 0 0 1 
		tcMod scroll 0 -1
	}
}

models/weapons/rocket_ball2
{
	{
		map models/weapons/rocket_ball.tga
		blendfunc add
		rgbGen wave sin 0.4 0 0 1 
		tcMod scroll 0 -1
	}
}

models/weapons/rocket_ball3
{
	{
		map models/weapons/rocket_ball.tga
		blendfunc add
		rgbGen wave sin 0.1 0 0 1 
		tcMod scroll 0 -1
	}
}

// trail half ball faded orange
models/weapons/rocket_fume
{
	{
		map models/weapons/rocket_fume.tga
		blendfunc add
		rgbGen wave square 0.8 0.2 0 12 
	}
}

models/weapons/crate
{
	cull disable
	{
		map models/weapons/crate.tga
	}
}

models/weapons/m4a1
{
	cull disable
	{
		map models/weapons/m4a1.tga
		alphaFunc GE128
	}
}


//**********************************
//   		aaaapictures  
//**********************************
//      



//	Blue, bright glass.  Light swirl pattern to it.

textures/aaaapictures/blueglass
{
	surfaceparm trans
	surfaceparm slick
	cull none
	qer_trans 0.5

	{
		map textures/aaaapictures/blueglass.tga
		tcGen environment
		tcMod turb 0 0.01 0 0.01	        
		tcmod scroll .0 .0
		blendfunc GL_ONE GL_ONE
                }
}

textures/aaaapictures/pelican
{
	surfaceparm trans
	cull none
	qer_trans 0.5

	{
		map textures/aaaapictures/pelican.tga
		//tcgen environment
		//blendFunc GL_ONE GL_ONE
		//rgbGen identity
                }
}

textures/aaaapictures/sunfru
{
	surfaceparm trans
	cull none
	qer_trans 0.5

	{
		map textures/aaaapictures/sunfru.tga
		//tcgen environment
		//blendFunc GL_ONE GL_ONE
		//rgbGen identity
                }
}

textures/aaaapictures/sunsnow
{
	surfaceparm trans
	cull none
	qer_trans 0.5

	{
		map textures/aaaapictures/sunsnow.tga
		//tcgen environment
		//blendFunc GL_ONE GL_ONE
		//rgbGen identity
                }
}

// 	Plain glass.

textures/aaaapictures/plainglass
{
	surfaceparm nolightmap
	surfaceparm trans 
	cull none 
	qer_trans 0.5
                {
		map textures/aaaapictures/plainglass.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
                }
}

textures/aaaapictures/screen
{
	//q3map_lightimage textures/aaaapictures/screen3.tga
	q3map_surfacelight 100
	qer_editorimage textures/aaaapictures/screen1.tga

	{
		animMap .05 textures/aaaapictures/screen1.tga textures/aaaapictures/screen2.tga textures/aaaapictures/screen3.tga textures/aaaapictures/screen4.tga textures/aaaapictures/screen5.tga textures/aaaapictures/screen6.tga textures/aaaapictures/screen7.tga textures/aaaapictures/screen8.tga 
		
		rgbGen identity
	}
	{
		map textures/base_wall/comp3text.tga
		blendfunc add
		rgbGen identity
		tcmod scroll 0 1
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map $lightmap
		tcgen environment
		tcmod scale .5 .5
		rgbGen wave sin .25 0 0 0
		blendfunc add
	}       
}

textures/aaaapictures/creamseal
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256 
//	q3map_sun	0.266383 0.274632 0.358662 120 60 85
	q3map_lightimage textures/aaaapictures/lightcolor.jpg 
	q3map_surfacelight 150
	
	{
		map textures/aaaapictures/creamseal.jpg
		rgbGen identity
		
	}
}

textures/aaaapictures/gold 
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/aaaapictures/gold.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/aaaapictures/goldfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/aaaapictures/gold.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}       

textures/aaaapictures/sails
{
     deformVertexes wave 30 sin 0 3 0 .2
     deformVertexes wave 100 sin 0 3 0 .7
     surfaceparm noimpact
     surfaceparm nonsolid
     cull none
        
        { 
               map textures/aaaapictures/sails.jpg
        }
}

textures/aaaapictures/cloads 
{
	q3map_lightimage gfx/colors/black.tga
	qer_editorimage textures/aaaapictures/skyneu.tga
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap
	skyparms - 256 -
//	q3map_sun 0.615686 0.807843 1.000000 200 180 24 300
	q3map_surfacelight 75

{
		map textures/aaaapictures/clouds1.tga

		tcMod scale 3 2
		tcMod scroll 0.025 0.025
		depthWrite
	}
	{
		map textures/aaaapictures/clouds2.tga

		blendFunc GL_ONE GL_ONE
		tcMod scale 3 3
		tcMod scroll 0.015 0.015
	}


}

textures/aaaapictures/leaf
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/aaaapictures/leaf.tga
		tcMod scale 1 1
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/aaaapictures/earthmap
{
	surfaceparm structural
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_surfacelight 65
	
	{
		map textures/aaaapictures/earthmap.jpg
		rgbGen identity
		
	}
}

textures/aaaapictures/starts
{
	surfaceparm structural
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_surfacelight 65
	
	{
		map textures/aaaapictures/starts.jpg
		rgbGen identity
		
	}
}

textures/aaaapictures/zuescd
{
	surfaceparm structural
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_surfacelight 65
	
	{
		map textures/aaaapictures/zuescd.jpg
		rgbGen identity
		
	}
}

textures/aaaapictures/mleaf01
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/aaaapictures/mleaf01.tga
		tcMod scale 1 1
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}


textures/castle/marb096
{
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/castle/marb096.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/castle/envmap2.tga    
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/castle/marb096.tga
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}    

textures/aaaapictures/hrcube1
{
	
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/aaaapictures/hrcube1.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaFunc GE128
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/aaaapictures/hrcube1.tga
		alphaFunc GE128
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}       

textures/aaaapictures/hrcube2
{
	
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/aaaapictures/hrcube2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaFunc GE128
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/aaaapictures/hrcube2.tga
		alphaFunc GE128
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}       

textures/aaaapictures/hrcube3
{
	
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/aaaapictures/hrcube3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaFunc GE128
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/aaaapictures/hrcube3.tga
		alphaFunc GE128
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}       

textures/castle/ik_crystal_base
{
	surfaceparm nomarks
	surfaceparm nodamage
	surfaceparm nolightmap
	surfaceparm trans
	qer_editorimage textures/castle/marb074.tga
	qer_trans .5
	//q3map_surfacelight 50
	q3map_lightimage textures/castle/marb074.tga

	{
		map textures/castle/marb074.tga
		blendfunc GL_ONE GL_ONE
		//rgbGen wave noise .5 .3 0 20	
		tcMod scale .5 .5
		tcMod scroll .05 .1
	}
  {
		map textures/castle/ik_crystal_env.tga
    tcgen environment
		blendFunc GL_DST_COLOR GL_ONE
		rgbGen identity
	}

}

textures/castle/try1h
{
     deformVertexes wave 30 sin 0 3 0 .7
     deformVertexes wave 100 sin 0 3 0 .1
     surfaceparm noimpact
     cull none
        
        { 
               map textures/castle/try1h.jpg
        }
}

textures/castle/sclouds1
{
	q3map_lightimage gfx/colors/black.tga
	//qer_editorimage textures/aaaapictures/skyneu.tga
	surfaceparm sky
	surfaceparm noimpact
	surfaceparm nolightmap
	skyparms - 256 -
//	q3map_sun 0.615686 0.807843 1.000000 200 180 24 300
	q3map_surfacelight 5

{
		map textures/castle/sclouds1.tga

		tcMod scale 3 2
		tcMod scroll 0.025 0.025
		depthWrite
	}
	{
		map textures/castle/sclouds2.tga

		blendFunc GL_ONE GL_ONE
		tcMod scale 3 3
		tcMod scroll 0.015 0.015
	}


}

textures/castle/star1
{
	qer_editorimage textures/castle/stars.tga
	surfaceparm nodlight
	surfaceparm noimpact 
	surfaceparm sky
	// first pass
	{
		map textures/castle/star2.tga
		//      tcmod scroll <sSpeed><tSpeed>
		tcmod scroll 1 0
		
	}	
	// second pass
	{
		map textures/castle/star1.tga
		//      tcmod scroll <sSpeed><tSpeed>
		tcmod scroll 0.5 0
		blendfunc add
	}	
	// third pass
	{
		map textures/castle/star3.tga
		//      tcmod scroll <sSpeed><tSpeed>
		tcmod scroll 0.25 0
		blendfunc add
	}	
}

textures/castle/red1
{
	
	q3map_surfacelight 5
	
	{
		animMap 2 textures/castle/red1.tga textures/castle/red2.tga 
		
		
	}
	
}

//bright gibs
models/gibs/gibs
{
	{
		map models/gibs/gibs.tga
		rgbGen lightingDiffuse
		alphaFunc GE128

	}
	
}


models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/plasma/f_plasma.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


//bright gibs
models/gibs/gibs
{
	{
		map models/gibs/gibs.tga
		rgbGen lightingDiffuse
		alphaFunc GE128

	}
	
}


models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/plasma/f_plasma.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


//bright gibs
models/gibs/gibs
{
	{
		map models/gibs/gibs.tga
		rgbGen lightingDiffuse
		alphaFunc GE128

	}
	
}


models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/plasma/f_plasma.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


//bright gibs
models/gibs/gibs
{
	{
		map models/gibs/gibs.tga
		rgbGen lightingDiffuse
		alphaFunc GE128

	}
	
}


models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/plasma/f_plasma.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


//bright gibs
models/gibs/gibs
{
	{
		map models/gibs/gibs.tga
		rgbGen lightingDiffuse
		alphaFunc GE128

	}
	
}


models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/plasma/f_plasma.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


//bright gibs
models/gibs/gibs
{
	{
		map models/gibs/gibs.tga
		rgbGen lightingDiffuse
		alphaFunc GE128

	}
	
}


models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 15 models/weapons2/plasma/f_plasma.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


textures/bh/metal_2
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_2.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_2x
{
	qer_editorimage textures/bh/metal_2.tga
	surfaceparm metalsteps
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_2.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_3
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_3.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_4
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_4.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_5
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_5.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_6
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_6.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_7
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_7.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_8_rocket
{
	qer_editorimage textures/bh/metal_8.tga
	surfaceparm metalsteps
	{
		map textures/bh/chrome_xg.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_8.tga
		blendfunc gl_one gl_src_color
		rgbGen identity
	}
}

textures/bh/mast_tilt1
{
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	{
		map $lightmap 
		tcGen lightmap 
	}
	{
		map textures/bh/mast_tilt1.tga
		rgbGen Vertex
		alphaGen lightingSpecular
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.05 0.05
		tcGen environment 
	}
}

textures/bh/mast_tilt1x
{
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	{
		map $lightmap 
		tcGen lightmap 
	}
	{
		map textures/bh/mast_tilt1x.tga
		rgbGen Vertex
		alphaGen lightingSpecular
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.05 0.05
		tcGen environment 
	}
}

textures/bh/wglass_1
{
	qer_editorimage textures/bh/wglass_1.tga
	surfaceparm metalsteps
	{
		map textures/bh/chrome_xg.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/bh/wglass_1.tga
		blendfunc gl_one_minus_dst_color gl_dst_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/chain_1
{
	surfaceparm alphashadow
	surfaceparm nonsolid
	cull disable
	{
		map textures/bh/chain_1.tga
		rgbGen identity
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackblackblack
{
	qer_editorimage textures/bh/blaaack.tga
	surfaceparm nodlight
	surfaceparm nodrop
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/bh/blaaack.tga
	}
}

textures/bh/wood_g1
{
	surfaceparm alphashadow
	surfaceparm nonsolid
	cull disable
	{
		map textures/bh/wood_g1.tga
		rgbGen identity
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

//textures/bh/qpirateflag
//{
//	surfaceparm alphashadow
//	surfaceparm noimpact
//	surfaceparm nomarks
//	surfaceparm nonsolid
//	surfaceparm trans
//	cull disable
//	deformVertexes wave 30 sin 0 3 0 0.2 
//	deformVertexes wave 100 sin 0 3 0 0.7 
//	tessSize 256
//	{
//		map textures/bh/qpirateflag.tga
//		rgbGen Vertex
//		depthWrite
//		alphaFunc GE128
//	}
//	{
//		map $lightmap 
//		blendfunc filter
//		rgbGen identity
//		tcGen lightmap 
//		depthFunc equal
//	}
//}
//textures/bh/qpirateflag
//{
//	surfaceparm alphashadow
//	surfaceparm noimpact
//	surfaceparm nomarks
//	surfaceparm nonsolid
//	sort banner
//	cull disable  
//	deformVertexes wave 30 sin 0 3 0 0.2 
//	deformVertexes wave 85 sin 0 0.5 0 0.65 
//	tessSize 256
//	{
//		map textures/bh/qpirateflag.tga
//		blendfunc blend
//		rgbGen Vertex
//		alphaFunc GE128
//	}
//}
textures/bh/qpirateflag
{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 30 sin 0 3 0 0.2 
	deformVertexes wave 100 sin 0 3 0 0.7 
	tessSize 64
	{
		map textures/bh/qpirateflag.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

//textures/bh/qpirateflag_2
//{
//	qer_editorimage textures/bh/qpirateflag.tga
//	surfaceparm alphashadow
//	surfaceparm nomarks
//	surfaceparm trans 
//	surfaceparm nonsolid
//	cull disable
//	deformVertexes wave 30 sin 0 3 0 0.2 
//	deformVertexes wave 100 sin 0 3 0 0.7 
//	tessSize 64
//	{
//		map textures/bh/qpirateflag.tga
//		rgbGen Vertex
//		depthWrite
//		alphaFunc GE128
//	}
//	{
//		map $lightmap 
//		blendfunc filter
//		rgbGen identity
//		tcGen lightmap 
//		depthFunc equal
//	}
//}
textures/bh/jetfire_1fx
{
	q3map_lightimage textures/bh/jetfire_1fx.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	q3map_surfacelight 150
	{
		clampmap textures/bh/jetfire_1fx.tga
		tcMod rotate 20
	}
	{
		clampmap textures/bh/jetfire_1fx.tga
		blendfunc add
		rgbGen wave noise 0.01 0.6 0 0.5 
		tcMod rotate -200
	}
}

textures/bh/jetfire_1
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite2
	q3map_surfacelight 500
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
	}
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
		rgbGen wave noise 0.02 0.6 0 0.8 
	}
}

textures/bh/jetfire_1x
{
	qer_editorimage textures/bh/jetfire_1.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	q3map_surfacelight 250
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
	}
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
		rgbGen wave noise 0.02 0.6 0 0.8 
	}
}

//
// Original skybox from Hipshot - Violentdays. Modified version by Martinus - Violentdays V2.
//
textures/bh/vdv2_sky
{
	qer_editorimage textures/bh/blaaack.tga
	q3map_lightimage env/vdv2_bk.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm sky
	q3map_surfacelight 95
	q3map_sun 1 1 0.85098 75 305 25
	skyParms env/vdv2 128 -
}

textures/bh/pipe_1
{
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/pipe_1.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/spark
{
	q3map_lightimage textures/bh/spark.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	qer_trans 0.5
	q3map_surfacelight 150
	{
		clampmap textures/bh/spark.tga
		blendfunc add
	}
}

textures/bh/whiteeee
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	q3map_surfacelight 150
	{
		map textures/bh/whiteeee.tga
		blendfunc add
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/jummpad_effect_1
{
	qer_editorimage textures/bh/j_compass1.tga
	q3map_lightimage textures/bh/j_compass1.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	q3map_surfacelight 500
	{
		map textures/bh/j_compass1.tga
		blendfunc add
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/j_compass2.tga
		blendfunc add
		rgbGen wave triangle 0 1 0 0.5 
	}
}

textures/bh/jummpad_effect_2
{
	qer_editorimage textures/bh/j_effect1.tga
	q3map_lightimage textures/bh/j_effect1.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	q3map_surfacelight 200
	{
		map textures/bh/j_effect1.tga
		blendfunc add
		tcMod scroll -0.5 0
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/teleport_effect
{
	qer_editorimage textures/bh/compa2.tga
	q3map_lightimage textures/bh/compa2.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	deformVertexes autosprite
	q3map_surfacelight 300
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/compa2.tga
		blendfunc add
		tcMod rotate 8
	}
	{
		map textures/bh/compa2.tga
		blendfunc add
		tcMod rotate -8
	}
}

textures/bh/jummpad_effect_2x
{
	qer_editorimage textures/bh/j_effect1.tga
	q3map_lightimage textures/bh/j_effect1.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	q3map_surfacelight 200
	{
		map textures/bh/j_effect1.tga
		blendfunc add
		tcMod scroll -0.5 0
	}
	{
		map textures/bh/j_effect1.tga
		blendfunc add
		tcMod scroll -0.75 0
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/bh_glass
{
	qer_editorimage textures/bh/chrome_xg.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_1
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_1.tga
	surfaceparm nonsolid
	{
		map textures/bh/chrome_xg.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_2
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_1.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_1.tga
		rgbGen identity
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_3
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_2.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_2.tga
		rgbGen identity
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_4
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_3.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_3.tga
		rgbGen identity
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_5
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_4.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_4.tga
		rgbGen identity
		tcMod scroll 4 4
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/color_green
{
	qer_editorimage textures/bh/color_green.tga
	q3map_lightimage textures/bh/color_green.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 500
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/color_green.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/color_yellow
{
	qer_editorimage textures/bh/color_yellow.tga
	q3map_lightimage textures/bh/color_yellow.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 500
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/color_yellow.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/color_white
{
	qer_editorimage textures/bh/color_white.tga
	q3map_lightimage textures/bh/color_white.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 500
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/color_white.tga
		blendfunc filter
		rgbGen identity
	}
}


textures/obs3dm7/cloudtop
{
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
//	q3map_lightsubdivide 256
	surfaceparm sky
	q3map_surfacelight 145
	q3map_sun 1 1 1 200 100 30
	skyparms env/cloudtop 720 -
}

textures/obs3dm7/cloudtop2
{
	surfaceparm nolightmap
	surfaceparm noimpact
	surfaceparm nomarks
//	q3map_lightsubdivide 256
	surfaceparm sky
	q3map_surfacelight 45
//	q3map_sun 1 1 1 200 100 30
	skyparms env/cloudtop2 720 -
}

textures/obs3dm7/jpcone
{
	qer_editorimage textures/obs3dm7/blk1.tga
	surfaceparm nolightmap
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm trans
	deformVertexes move 0 0 4 sin 0 1 0 0.25
	{
		map textures/obs3dm7/jfx_dust.tga
		alphaGen vertex
		tcMod scale 2 0.125
		tcMod scroll 0 0.7
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/obs3dm7/ceil1_38_
{
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/obs3dm7/ceil1_38_.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/obs3dm7/ceil1_38blnd.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/obs3dm7/ra-dec
{
	qer_editorimage textures/obs3dm7/ra-dec.tga
	surfaceparm trans
	surfaceparm nomarks
	q3map_surfacelight 100
	polygonoffset
	nopicmip
	cull none

	{
		map textures/obs3dm7/ra-dec.tga
		blendFunc add
		rgbGen wave sin .5 .45 0 .6
	}
}

textures/obs3dm7/ya-dec
{
	qer_editorimage textures/obs3dm7/ya-dec.tga
	surfaceparm trans
	surfaceparm nomarks
	q3map_surfacelight 100
	polygonoffset
	nopicmip
	cull none

	{
		map textures/obs3dm7/ya-dec.tga
		blendFunc add
		rgbGen wave sin .5 .45 0 .6
	}
}

textures/obs3dm7/mh-dec
{
	qer_editorimage textures/obs3dm7/mh-dec.tga
	surfaceparm trans
	surfaceparm nomarks
	q3map_surfacelight 100
	polygonoffset
	nopicmip
	cull none

	{
		map textures/obs3dm7/mh-dec.tga
		blendFunc add
		rgbGen wave sin .5 .45 0 .6
	}
}

// plants_soc texture for Q3 by Sims ============================
// Website : http://www.simonoc.com/
textures/plants_soc/vine06
{
	qer_editorimage textures/plants_soc/vine06.tga
	q3map_lightimage textures/plants_soc/vine06.tga
	qer_trans 1
	qer_alphafunc greater 0.5	
	surfaceparm alphashadow
	q3map_vertexScale 2
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	surfaceparm nolightmap	
	cull none
	deformVertexes wave 25 sin 0 2 0 0.1 
	{
		map textures/plants_soc/vine06.tga
		alphaFunc GE128
		rgbGen vertex
		depthWrite
	}	
}

//GLASS BY FKD ==============================================
textures/phdm5/glass
{
        qer_editorimage textures/phdm5/glass.tga
        qer_trans 0.50
        surfaceparm nolightmap
	surfaceparm nodlight
        surfaceparm trans
        {
                map textures/phdm5/glass.tga
                blendfunc filter
		rgbGen identity
        }
        {
                map textures/phdm5/glass_env.tga
                blendfunc add
                rgbGen identity
                tcGen environment
        }
}

//BY SST13
textures/phdm5/glass_break_c
{
	qer_editorimage textures/phdm5/glass_break_c.tga
	qer_trans 0.9
	surfaceparm nolightmap
	surfaceparm nodlight
	surfaceparm trans
	sort additive
	{
		map textures/phdm5/glass_break_c.tga
		blendfunc filter
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map textures/phdm5/glass_env.tga
		blendfunc add
		rgbGen identity
		tcGen environment
		depthFunc equal
	}
}

textures/common/nolightmap
{
	surfaceparm nolightmap
}

textures/common/nodrawnonsolid
{
	surfaceparm	nonsolid
	surfaceparm	nodraw
}

textures/common/invisible
{
	surfaceparm nolightmap			
        {
                map textures/common/invisible.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

textures/common/teleporter
{
	surfaceparm nolightmap
	surfaceparm noimpact
	q3map_lightimage textures/sfx/powerupshit.tga	
	q3map_surfacelight 800
	{
		map textures/sfx/powerupshit.tga
		tcGen environment
//		tcMod scale 5 5
		tcMod turb 0 0.015 0 0.3
	}
}

textures/common/nodrop
{
	qer_nocarve
	qer_trans	0.5
	surfaceparm 	trans
	surfaceparm	nonsolid
	surfaceparm	nomarks
	surfaceparm     nodrop
	surfaceparm 	nolightmap
	surfaceparm 	nodraw
	cull		disable
}

textures/common/weapclip
{
	qer_trans 0.40
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nodraw
}

textures/common/clip
{
	qer_trans 0.40
	surfaceparm 	nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
        //surfaceparm 	nolightmap //proto_addition 11/08/99
	surfaceparm playerclip
	surfaceparm noimpact
}

textures/common/full_clip
{
	qer_trans 0.40
	surfaceparm nodraw
	surfaceparm playerclip
}


textures/common/missileclip
{
	qer_trans 0.40
	surfaceparm nodamage
	surfaceparm nomarks
	surfaceparm nodraw
	//surfaceparm nonsolid
	surfaceparm playerclip
}

//*****************************************
//**   I've reduced the transparency on most editor-only brushes here.
//**   If the transparent textures are still too pale for
//**   things like clip, hint, trigger, etc.,
//**   Please make an editorimage to suit your needs.
//******************************************

textures/common/cushion
{
	qer_nocarve
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nodamage
	surfaceparm trans
}

textures/common/hint
{
qer_nocarve
qer_trans 0.30
surfaceparm nodraw
surfaceparm nonsolid
surfaceparm structural
surfaceparm trans
surfaceparm noimpact
}

textures/common/skip
{
qer_nocarve
qer_trans 0.40
surfaceparm nodraw
surfaceparm nonsolid
surfaceparm structural
surfaceparm trans
}

textures/common/slick
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm slick
}

textures/common/origin
{
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm origin
}

textures/common/noimpact
{
	surfaceparm noimpact
}

textures/common/areaportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm areaportal
}

//bot specific cluster portal
textures/common/clusterportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm detail
	surfaceparm clusterportal
}

//bot specific "do not enter" brush
textures/common/donotenter
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm detail
	surfaceparm donotenter
}

textures/common/trigger
{
	qer_trans 0.50
	qer_nocarve
	surfaceparm nodraw
}

textures/common/caulk
{
	surfaceparm nodraw
	surfaceparm nomarks
        surfaceparm nolightmap
}

textures/common/nodraw
{
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm nomarks
}

textures/common/mirror1
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
  
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
       
        

}

textures/common/mirror2
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/sfx/mirror.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}
textures/common/energypad
{
	qer_editorimage textures/common/bluegoal.tga
	surfaceparm nolightmap
	cull twosided
	{
		map textures/common/bluegoal.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		tcGen environment
		tcMod turb 0 0.25 0 0.05
	}
}

textures/common/portal
{
	qer_editorimage textures/common/qer_portal.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
//		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
//		blendFunc GL_ONE GL_SRC_ALPHA
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite

	}
}

textures/common/timportal
{
	qer_editorimage textures/common/qer_portal.tga
	portal
	surfaceparm nolightmap
	{
		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
		blendFunc GL_ONE GL_SRC_ALPHA
		depthWrite
	}
}

textures/sfx/portal_sfx
{

	//	*************************************************
	//	*      	Portal Inside Effect 			*
	//	*      	April 29				*	
	//	*	Please Comment Changes			*
	//	*************************************************

	portal
	surfaceparm nolightmap
	deformVertexes wave 100 sin 0 2 0 .5


	{
		map textures/sfx/portal_sfx3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	//	This blend function is not working on RagePro drivers Mac only
	//	when it is used on top of portals
		depthWrite
	}


	{
		map textures/sfx/portal_sfx1.tga
		blendfunc gl_dst_color gl_zero
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}

	{
		map textures/sfx/portalfog.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		alphagen portal 256
		rgbGen identityLighting	
		tcmod turb sin 0 .5 0 1
		tcmod rotate .1 .1
		tcmod scroll .01 .03
	}
}
textures/sfx/portal2_sfx
{

	//	*************************************************
	//	*      	Portal Inside Effect 			*
	//	*      	April 29				*	
	//	*	Please Comment Changes			*
	//	*************************************************

	portal
	surfaceparm nolightmap
	deformVertexes wave 100 sin 0 2 0 .5


	{
		map textures/sfx/portal_sfx3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	//	This blend function is not working on RagePro drivers Mac only
	//	when it is used on top of portals
		depthWrite
	}


	{
		map textures/sfx/portal_sfx1.tga
		blendfunc gl_dst_color gl_zero
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}

	{
		map textures/sfx/portalfog.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		//alphagen portal 128
		rgbGen identityLighting	
		tcmod turb sin 0 .5 0 1
		tcmod rotate .1 .1
		tcmod scroll .01 .03
	}
}

bulletExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bullet1.tga  models/weaphits/bullet2.tga  models/weaphits/bullet3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bullet2.tga  models/weaphits/bullet3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}
console
{
	nopicmip
	nomipmaps
    
        {
		map gfx/misc/console01.tga
                blendFunc GL_ONE GL_ZERO
                tcMod scroll .02  0
                tcmod scale 2 1
	}
        {
                map gfx/misc/console02.tga
                blendFunc add
                tcMod turb 0 .1 0 .1
                tcMod scale 2 1
                tcmod scroll 0.2  .1
	} 

}
// blinked on top of lagometer when connection is interrupted
disconnected
{
	nopicmip
	{
		map gfx/2d/net.tga
	}
}

flareShader
{
	cull none
	{
		map gfx/misc/flare.jpg
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}

gfx/2d/bigchars
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/bigchars.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}

gfx/2d/crosshair
{
	nopicmip
	{
		map gfx/2d/crosshair.tga          
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA                
        rgbGen identity
	}
}

gfx/2d/crosshairb
{
	nopicmip
	{
		map gfx/2d/crosshairb.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairc
{
	nopicmip
	{
		map gfx/2d/crosshairc.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaird
{
	nopicmip
	{
		map gfx/2d/crosshaird.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaire
{
	nopicmip
	{
		map gfx/2d/crosshaire.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairf
{
	nopicmip
	{
		map gfx/2d/crosshairf.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairg
{
	nopicmip
	{
		map gfx/2d/crosshairg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairh
{
	nopicmip
	{
		map gfx/2d/crosshairh.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairi
{
	nopicmip
	{
		map gfx/2d/crosshairi.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

}
gfx/2d/crosshairj
{
	nopicmip
	{
		map gfx/2d/crosshairj.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}
gfx/2d/crosshairk
{
	nopicmip
	{
		map gfx/2d/crosshairk.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/numbers/zero_32b
{
	nopicmip
	{
		map gfx/2d/numbers/zero_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/one_32b
{
	nopicmip
	{
		map gfx/2d/numbers/one_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/two_32b
{
	nopicmip
	{
		map gfx/2d/numbers/two_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/three_32b
{
	nopicmip
	{
		map gfx/2d/numbers/three_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/four_32b
{
	nopicmip
	{
		map gfx/2d/numbers/four_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/five_32b
{
	nopicmip
	{
		map gfx/2d/numbers/five_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/six_32b
{
	nopicmip
	{
		map gfx/2d/numbers/six_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/seven_32b
{
	nopicmip
	{
		map gfx/2d/numbers/seven_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/eight_32b
{
	nopicmip
	{
		map gfx/2d/numbers/eight_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/nine_32b
{
	nopicmip
	{
		map gfx/2d/numbers/nine_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/minus_32b
{
	nopicmip
	{
		map gfx/2d/numbers/minus_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/select
{
	nopicmip
	{
		map gfx/2d/select.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
		rgbgen vertex
	}
}
gfx/damage/bullet_mrk
{
	polygonOffset
	{
		map gfx/damage/bullet_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/burn_med_mrk
{
	polygonOffset
	{
		map gfx/damage/burn_med_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
grenadeExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/glboom/glboom_1.tga  models/weaphits/glboom/glboom_2.tga models/weaphits/glboom/glboom_3.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/glboom/glboom_2.tga  models/weaphits/glboom/glboom_3.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}
icons/icona_machinegun
{
	nopicmip
	{
		map icons/icona_machinegun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_railgun
{
	nopicmip
	{
		map icons/icona_railgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_rocket
{
	nopicmip
	{
		map icons/icona_rocket.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_shotgun
{
	nopicmip
	{
		map icons/icona_shotgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identitylighting
	}
}
icons/iconh_green
{
	nopicmip
	{
		map icons/iconh_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_yellow
{
	nopicmip
	{
		map icons/iconh_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_red
{
	nopicmip
	{
		map icons/iconh_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// the background for the netgraph
lagometer
{
	nopicmip
	{
		map gfx/2d/lag.tga
	}
}

medal_assist
{
	nopicmip
	{
		clampmap menu/medals/medal_assist.tga
		blendFunc blend
	}
}

medal_defend
{
	nopicmip
	{
		clampmap menu/medals/medal_defend.tga
		blendFunc blend
	}
}

medal_capture
{
	nopicmip
	{
		clampmap menu/medals/medal_capture.tga
		blendFunc blend
	}
}

medal_impressive
{
	nopicmip
	{
		clampmap menu/medals/medal_impressive.tga
		blendFunc blend
	}
}

medal_excellent
{
	nopicmip
	{
		clampmap menu/medals/medal_excellent.tga
		blendFunc blend
	}
}
railCore
{
	sort nearest
	cull none
	{
		map gfx/misc/railcorethin_mono.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
		tcMod scroll -1 0
	}
}

rocketExplosion
{
	cull disable
	{
		animmap 8 models/weaphits/rlboom/rlboom_1.tga  models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

smokePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuffRagePro
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuffragepro.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
sprites/balloon3
{
	{
		map sprites/balloon4.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
sun
{
	cull none
	{
		map gfx/misc/sun.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}
white
{
	{
		map *white
		blendfunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}

textures/acefx/midsizecorona
{
deformVertexes autoSprite
surfaceparm trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
	{
	clampmap textures/acefx/midsizecorona.tga
	blendFunc GL_ONE GL_ONE
	}
}

textures/acefx/bigcorona
{
deformVertexes autoSprite
surfaceparm trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
	{
	clampmap textures/acefx/bigcorona.tga
	tcMod rotate 5
	blendFunc GL_ONE GL_ONE
	}
}

textures/acefx/doublecorona
{
deformVertexes autoSprite
surfaceparm trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
	{
	clampmap textures/acefx/bigcorona.tga
	tcMod rotate 5
	blendFunc GL_ONE GL_ONE
	}
	{
	clampmap textures/acefx/bigcorona.tga
	tcMod rotate -8
	blendFunc GL_ONE GL_ONE
	}
}

textures/acefx/ghostcorona1
{
deformVertexes autoSprite
surfaceparm trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
	{
	clampmap textures/acefx/ghostcorona1.tga
	blendFunc GL_ONE GL_ONE
	}
}

textures/acefx/ghostcorona2
{
deformVertexes autoSprite
surfaceparm trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
	{
	clampmap textures/acefx/ghostcorona2.tga
	blendFunc GL_ONE GL_ONE
	}
}

textures/acefx/ghostcorona3
{
deformVertexes autoSprite
surfaceparm trans
surfaceparm nomarks
surfaceparm nolightmap
cull none
	{
	clampmap textures/acefx/ghostcorona3.tga
	blendFunc GL_ONE GL_ONE
	}
}

textures/acefx/fog_black
{
qer_editorimage textures/acefx/fog_black.tga
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( 0 0 0 ) 1300
}

textures/acefx/fog_orange
{
qer_editorimage textures/acefx/fog_orange.tga
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( 0.8 0.4 0.1 ) 600
}

textures/acefx/fog_white
{
qer_editorimage textures/acefx/fog_black.tga
surfaceparm	trans
surfaceparm	nonsolid
surfaceparm	fog
surfaceparm	nolightmap

fogparms ( 0.85 0.85 0.85 ) 1300
}

textures/acefx/lavacrystal
{
surfaceparm trans
surfaceparm nomarks
q3map_surfacelight 600
	{
		map textures/acefx/lavacrystal.tga
		tcmod scroll 0.02 -0.02
		tcGen environment
		blendfunc blend
	}
	{
		map textures/acefx/lavacrystal.tga
		tcmod scroll -0.01 -0.01
		tcGen environment
		blendfunc blend
	}
}

textures/acefx/blackfade
{
surfaceparm trans
surfaceparm	nonsolid
surfaceparm nomarks
surfaceparm	nolightmap
	{
		map textures/acefx/blackfade.tga
		rgbGen identity
		blendfunc blend
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/acefx/blackfade2
{
surfaceparm trans
surfaceparm	nonsolid
surfaceparm nomarks
surfaceparm	nolightmap
	{
		map textures/acefx/blackfade2.tga
		rgbGen identity
		blendfunc blend
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/acefx/blackfloor
{
surfaceparm nomarks
surfaceparm	nolightmap
surfaceparm noimpact
surfaceparm nosteps
	{
		map textures/acefx/blackfloor.tga
	}
}

textures/acefx/elder_superportal

{
surfaceparm trans
surfaceparm noimpact
surfaceparm nolightmap
qer_editorimage textures/skies/redclouds2.tga
	{
	map textures/skies/redclouds.tga
	tcMod scroll 0.15 0.1
	}
	{
	map textures/skies/redclouds2.tga
	blendfunc add
	tcMod scroll 0.35 0.25
	}
}

textures/acefx/firecircle
{
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm noimpact
	cull none
	q3map_surfacelight 300
	qer_editorimage textures/acefx/firecircle1.tga
	{
		animMap 10 textures/acefx/firecircle1.tga textures/acefx/firecircle2.tga textures/acefx/firecircle3.tga textures/acefx/firecircle4.tga textures/acefx/firecircle5.tga textures/acefx/firecircle6.tga textures/acefx/firecircle7.tga textures/acefx/firecircle8.tga
		tcMod scroll 0.1 0.2
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10	
	}	
	{
		animMap 10 textures/acefx/firecircle2.tga textures/acefx/firecircle3.tga textures/acefx/firecircle4.tga textures/acefx/firecircle5.tga textures/acefx/firecircle6.tga textures/acefx/firecircle7.tga textures/acefx/firecircle8.tga textures/acefx/firecircle1.tga
		tcMod scroll 0.1 0.2
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
}

textures/acefx/firecirclefast
{
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm noimpact
	cull none
	q3map_surfacelight 300
	qer_editorimage textures/acefx/firecircle1.tga
	{
		animMap 10 textures/acefx/firecircle1.tga textures/acefx/firecircle2.tga textures/acefx/firecircle3.tga textures/acefx/firecircle4.tga textures/acefx/firecircle5.tga textures/acefx/firecircle6.tga textures/acefx/firecircle7.tga textures/acefx/firecircle8.tga
		tcMod scroll 0.1 0.4
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10	
	}	
	{
		animMap 10 textures/acefx/firecircle2.tga textures/acefx/firecircle3.tga textures/acefx/firecircle4.tga textures/acefx/firecircle5.tga textures/acefx/firecircle6.tga textures/acefx/firecircle7.tga textures/acefx/firecircle8.tga textures/acefx/firecircle1.tga
		tcMod scroll 0.1 0.4
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
}

textures/acefx/rock_levitate
{
surfaceparm nomarks
deformVertexes move 0 0 4  sin 0 5 0 0.1
qer_editorimage textures/ghost/rock1_1.tga
	{
	map textures/ghost/rock1_1.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/acefx/rock_levitate2
{
surfaceparm nomarks
deformVertexes move 0 0 3  sin 0 5 0 0.2
qer_editorimage textures/ghost/rock1_1.tga
	{
	map textures/ghost/rock1_1.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/acefx/rock_levitate3
{
surfaceparm nomarks
deformVertexes move 0 0 1  sin 0 5 0 0.3
qer_editorimage textures/ghost/rock1_1.tga
	{
	map textures/ghost/rock1_1.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/acefx/superportal
{
portal
surfaceparm nolightmap
//surfaceparm trans
	{
	map textures/acefx/portalcorona.tga
	blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	depthWrite
	}
	{
	map textures/acefx/superportal.tga
	blendfunc gl_src_alpha gl_one_minus_src_alpha
	alphagen portal 1408
	rgbGen identityLighting	
	tcmod rotate .1
	tcmod scroll .01 .03
	}
}

textures/acefx/superp_ring
{
surfaceparm nolightmap
surfaceparm trans
surfaceparm noimpact
surfaceparm nomarks
	{
	map textures/acefx/superp_ring.tga
	rgbGen identity
	blendfunc blend
	}
}

textures/acefx/flowing
{
	surfaceparm trans
	cull none
	qer_editorimage textures/acefx/flowing1.tga
	{
		animMap 30 textures/acefx/flowing1.tga textures/acefx/flowing2.tga textures/acefx/flowing3.tga textures/acefx/flowing4.tga textures/acefx/flowing5.tga textures/acefx/flowing6.tga textures/acefx/flowing7.tga
		blendFunc blend
		rgbGen vertex
	}	
	{
		animMap 30 textures/acefx/flowing2.tga textures/acefx/flowing3.tga textures/acefx/flowing4.tga textures/acefx/flowing5.tga textures/acefx/flowing6.tga textures/acefx/flowing7.tga textures/acefx/flowing1.tga
		blendFunc blend
		rgbGen vertex
	}	
}

textures/acefx/smoke_symbol
{	
	{
	map menu/art/smoke.tga
	tcmod scroll 0 0.1
	}
	{
	map textures/acefx/smoke_symbol.tga
	blendFunc blend
	}
}

textures/aircrash/gridholes
{
surfaceparm trans
cull none
	{
	map textures/aircrash/gridholes.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/aircrash/handle
{
surfaceparm trans
cull none
	{
	map textures/aircrash/handle.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/aircrash/instruments
{
	{
	map textures/aircrash/instruments.tga
	rgbGen identity
	}
	{
	map textures/aircrash/inst1.tga
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen wave sin 0 1 0 8
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/aircrash/instruments2
{
	{
	map textures/aircrash/instruments2.tga
	rgbGen identity
	}
	{
	map textures/aircrash/inst2.tga
	blendFunc GL_SRC_ALPHA GL_ONE
	rgbGen wave sin 0 1 0 8
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/aircrash/mgreen_nosolid
{
surfaceparm nonsolid
qer_editorimage textures/aircrash/metalgreen.tga
	{
	map textures/aircrash/metalgreen.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/aircrash/bubble_nosolid
{
surfaceparm nonsolid
qer_editorimage textures/aircrash/bubble.tga
	{
	map textures/aircrash/bubble.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

//
// this file contains shaders attached models
//

models/players/starman/head
{
	{
        	map models/players/starman/head.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/players/starman/legs
{
	{
		map models/players/starman/legs.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}

models/players/dark/dark_head
{
	{
		map models/players/dark/dark_head.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
	{
		map models/players/dark/dark_eyes.tga
		blendFunc blend
	} 
}

models/players/dark/dark_torso
{
	{
        	map models/players/dark/dark_torso.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/npc/hulk/hulk_head
{
	{
		map models/npc/hulk/hulk_head.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}

models/npc/bat/body
{
	{
        	map models/npc/bat/body.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/npc/pilot/pilot_glasses
{
	{
		map textures/glass/glasses.tga
		tcGen environment
	} 
	{
        	map models/npc/pilot/pilot_head.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/npc/soldier1/soldier1_goggle
{
	{
		map textures/glass/glasses.tga
		tcGen environment
	} 
	{
        	map models/npc/soldier1/soldier1_goggle.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/npc/man3/torso
{
	{
		map models/npc/man3/torso.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}

models/npc/sealord/arm_sealord
{
	{
        	map models/npc/sealord/arm_sealord.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/npc/sealord/head_sealord
{
	{
        	map models/npc/sealord/head_sealord.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/npc/sealord/lower_sealord
{
	{
        	map models/npc/sealord/lower_sealord.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

textures/ghost/lightsign
{
q3map_surfacelight 50
	{
	map textures/glass/hangarglass.tga
	tcGen environment
	blendFunc GL_ONE GL_ONE
	rgbGen identity
	}
	{
	map textures/ghost/lightsign.tga
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc filter
	}  
}   

textures/ghost/checkertrans
{
surfaceparm trans	
	{
	map textures/ghost/checkertrans.tga
	blendFunc blend
	rgbGen identityLighting
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/lightrock_trans
{
qer_editorimage textures/ghost/lightrock.tga
surfaceparm trans
	{
	map textures/ghost/lightrock.tga
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/lightwindow_trans
{
qer_editorimage textures/ghost/lightwindow.tga
surfaceparm trans
	{
	map textures/ghost/lightwindow.tga
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/lighthouse_trans
{
qer_editorimage textures/ghost/lighthouse.tga
surfaceparm trans
	{
	map textures/ghost/lighthouse.tga
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/lighthead
{
cull none
surfaceparm trans
	{
		map textures/glass/lightglass.tga
		tcgen environment
		blendFunc blend
	}
	{
		map textures/ghost/lighthead.tga
		rgbGen identity
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ghost/bars
{
surfaceparm alphashadow
surfaceparm nonsolid
cull none
	{
		map textures/ghost/bars.tga
		rgbGen identity
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ghost/lighthead2
{
surfaceparm alphashadow
	{
		map textures/ghost/lighthead2.tga
		rgbGen identity
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ghost/lightwindow
{
q3map_surfacelight 150
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/ghost/lightwindow.tga
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/sandgray3
{
q3map_surfacelight 150
	{
	map textures/ghost/lavasmall.tga
	tcmod scroll 0.01 0.01
	rgbGen identity
	}
	{
	map textures/ghost/sandgray3.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/ghostwood
{
	{
	map textures/organic/lung2.tga
	tcmod scroll 0.03 0.03
	rgbGen wave sin 0 5 0.75 0.1
	}
	{
	map textures/ghost/ghostwood.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/woodburnt
{
q3map_surfacelight 150
	{
	map textures/ghost/lavasmall.tga
	tcmod scroll 0.01 0.01
	rgbGen identity
	}
	{
	map textures/ghost/woodburnt.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/lightrock1_1
{
	{
	map textures/water/greenwater.tga
	tcmod scroll 0.00 -0.05 
	rgbGen identity
	}
	{
	map textures/ghost/lightrock1_1.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/cement1_1
{
	{
	map textures/water/greenwater.tga
	tcmod scroll 0.01 0.01
	rgbGen identity
	}
	{
	map textures/ghost/cement1_1.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/rope_move
{
qer_editorimage textures/ghost/rope.tga
	{
	map textures/ghost/rope.tga
	tcmod scroll 0.00 -0.2
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/rope_move2
{
qer_editorimage textures/ghost/rope.tga
	{
	map textures/ghost/rope.tga
	tcmod scroll 0.00 0.2
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/wire2
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
cull none
	{
		map textures/ghost/wire2.tga
		rgbGen identity
		alphaFunc GE128
		depthWrite
	}
	{
		map textures/ghost/wire3.tga
		blendfunc GL_ONE GL_ONE
		depthFunc equal
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ghost/wire
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
cull none
	{
		map textures/ghost/wire.tga
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ghost/darkmetal
{
surfaceparm metalsteps
	{
	map textures/ghost/darkmetal.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/metaltoxic
{
surfaceparm metalsteps
	{
	map textures/ghost/metaltoxic.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/metaltoxic2
{
surfaceparm metalsteps
	{
	map textures/ghost/metaltoxic2.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/purplemetal
{
surfaceparm metalsteps
	{
	map textures/ghost/purplemetal.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/purplewalk
{
surfaceparm metalsteps
	{
	map textures/ghost/purplewalk.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ghost/tube
{
cull none
surfaceparm playerclip
	{
		map textures/ghost/tube.tga
		rgbGen identity
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/ghost/shinymetal
{
	{
	map textures/ghost/shinymetal.tga
	rgbGen identity
	}
	{
	map textures/hangars/vent_shine.tga
	tcgen environment
	blendfunc blend
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/glass/airglass_sl
{
      surfaceparm trans	
	//cull none
	qer_trans 	0.5
     
      {
	map textures/glass/airglass.tga
	tcgen base
	tcmod scroll -0.04 0
	blendFunc blend
	rgbGen identityLighting
	}
      {
	map $lightmap
	blendFunc GL_ONE GL_ONE
	}
	{
	map textures/glass/cloudglass.tga
	tcmod scroll -0.06 5
	blendFunc add
	rgbGen wave sin 0 1 0.5 0.0145	//change last number to affect duration before and after
	}						//smaller lasts more time
}

textures/glass/airglass_nfwb
{
      surfaceparm trans	
	//cull none
	qer_trans 	0.5
     
      {
	map textures/glass/airglass.tga
	tcgen base
	tcmod scroll -0.04 0
	blendFunc blend
	rgbGen identityLighting
	}
      {
	map $lightmap
	blendFunc GL_ONE GL_ONE
	}
	{
	map textures/glass/cloudglass.tga
	tcmod scroll -5 3
	blendFunc add
	rgbGen wave sin 0 1 0.5 0.0145	//change last number to affect duration before and after
	}						//smaller lasts more time
}

textures/glass/airglass_nf
{
      surfaceparm trans	
	//cull none
	qer_trans 	0.5
     
      {
	map textures/glass/airglass.tga
	tcgen base
	tcmod scroll -0.04 0
	blendFunc blend
	rgbGen identityLighting
	}
      {
	map $lightmap
	blendFunc GL_ONE GL_ONE
	}
	{
	map textures/glass/cloudglass.tga
	tcmod scroll -5 3
	blendFunc add
	rgbGen wave sin 0 1 0.5 0.0145	//change last number to affect duration before and after
	}						//smaller lasts more time			
}


textures/glass/cityglass
{
	surfaceparm trans	
	//cull none
	qer_trans 	0.5
     
	{
	map textures/glass/cityglass.tga
	tcgen environment
	blendFunc GL_ONE GL_ONE
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc filter
	}          
}

textures/glass/hangarglass
{
	surfaceparm trans	
	//cull none
	qer_trans 	0.5
     
	{
	map textures/glass/hangarglass.tga
	tcgen environment
	blendFunc GL_ONE GL_ONE
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc filter
	}          
}

textures/glass/win_nosee
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/glass/windust.tga
	blendfunc blend
	}
	{
	map textures/glass/win_nosee.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/glass/win_nosee2
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/glass/windust2.tga
	blendfunc blend
	}
	{
	map textures/glass/win_nosee2.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/glass/win_nosee3
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/glass/windust3.tga
	blendfunc blend
	}
	{
	map textures/glass/win_nosee3.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/glass/win_nosee4
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/glass/win_nosee4.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/glass/win_see
{
surfaceparm trans	
qer_editorimage	textures/glass/win_nosee.tga
	{
	map textures/glass/transglass.tga
	tcGen environment
	blendFunc blend
	rgbGen identity
	}
	{
	map textures/glass/win_nosee.tga
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/glass/lightglass
{
      surfaceparm trans	
	qer_trans 	0.8
      {
	map textures/glass/lightglass.tga
	tcgen environment
	blendFunc blend
	//rgbGen identityLighting
	}
      {
	map $lightmap
	blendFunc add
	}
}

textures/glass/brokenglass
{
surfaceparm trans
surfaceparm noimpact
surfaceparm nonsolid
cull none
	{
	map textures/glass/brokenglass.tga
	blendFunc blend
	}

}

textures/glass/window_thin
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/glass/window_thin.tga
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/glass/transglass
{
surfaceparm trans
qer_trans 	0.5
	{
	map textures/glass/transglass.tga
	tcGen environment
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/glass/dirtyglass
{
surfaceparm trans	
	{
	map textures/glass/dirtyglass.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/glass/grainy_glass
{
	surfaceparm trans	
	qer_trans 	0.8
	{
	map textures/glass/grainy_glass.tga
	blendFunc blend
	//rgbGen identity
	}
	{
	map $lightmap
	//rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/glass/simplewindow
{
qer_editorimage textures/ghost/lightwindow.tga
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/ghost/lightwindow.tga
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}



textures/hangars/structure
{
surfaceparm trans
surfaceparm playerclip
cull none
	{
	map textures/hangars/structure.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/structure2
{
surfaceparm trans
surfaceparm playerclip
cull none
	{
	map textures/hangars/structure2.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/zinchole
{
surfaceparm alphashadow
surfaceparm playerclip
	{
	map textures/hangars/zinchole.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/zincholebig
{
surfaceparm alphashadow
surfaceparm playerclip
	{
	map textures/hangars/zincholebig.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence1
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
cull none
	{
	map textures/hangars/fence1.tga
	blendFunc GL_DST_COLOR GL_ZERO
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map textures/hangars/fence1blend.tga
	blendfunc GL_ONE GL_ONE
	alphaFunc GE128
	depthWrite
	}
}

textures/hangars/e_instrument
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hangars/e_instrument.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hangars/e_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave square 0 1 0 8
	}
}

textures/hangars/woodstep
{
surfaceparm alphashadow
surfaceparm playerclip
cull none
	{
	map textures/hangars/woodstep.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/glider7
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/hangars/glider7.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/glider8
{
	{
	map textures/glass/lightglass.tga
	tcGen environment
	}
	{
	map textures/hangars/glider8.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/fan1
{
cull none
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
	{
	clampmap textures/hangars/fan1.tga
	alphaFunc GE128
	tcMod rotate 500
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fan1_shadow
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
	{
	clampmap textures/hangars/fan1_shadow.tga
	blendFunc blend
	tcMod rotate 500
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/rug1_3
{
	{
	map textures/organic/lung2.tga
	rgbGen wave sin 0.65 0.25 0.75 0.3
	tcMod turb .2 .025 .1 .2
	tcmod scroll 0.01 0.01
	}
	{
	map textures/hangars/rug1_3.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/vent_metal
{
	{
	map textures/hangars/vent_metal.tga
	rgbGen identity
	}
	{
	map textures/hangars/vent_shine.tga
	tcgen environment
	blendfunc blend
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/vent_cull
{
cull none
qer_editorimage textures/hangars/vent_metal.tga
	{
	map textures/hangars/vent_metal.tga
	rgbGen identity
	}
	{
	map textures/hangars/vent_shine.tga
	tcgen environment
	blendfunc blend
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/diploma
{
	{
	map textures/hangars/diploma.tga
	rgbGen identity
	}
	{
	map textures/hangars/vent_shine.tga
	tcgen environment
	blendfunc blend
	}
	{
	map textures/hangars/frame.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/laundry_tiles
{
surfaceparm trans	
	{
	map textures/hangars/laundry_tiles.tga
	blendFunc blend
	rgbGen identityLighting
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/web
{
surfaceparm trans
surfaceparm noimpact
surfaceparm nonsolid
cull none
	{
	map textures/hangars/web.tga
	blendFunc blend
	rgbGen identity
	}
}

textures/hangars/vent_fence
{
surfaceparm trans
surfaceparm nonsolid
cull none
	{
	map textures/hangars/vent_fence.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/vent_good
{
surfaceparm trans
surfaceparm nonsolid
cull none
	{
	map textures/hangars/vent_good.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence_brown
{
surfaceparm trans
surfaceparm playerclip
surfaceparm metalsteps
cull none
	{
	map textures/hangars/fence_brown.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence_brown2
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
surfaceparm metalsteps
cull none
	{
	map textures/hangars/fence_brown2.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence_floor
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
surfaceparm metalsteps
cull none
	{
	map textures/hangars/fence_floor.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence_floor2
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
surfaceparm metalsteps
cull none
	{
	map textures/hangars/fence_floor2.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence_floor3
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
surfaceparm metalsteps
cull none
	{
	map textures/hangars/fence_floor3.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/fence_floor4
{
surfaceparm trans
surfaceparm playerclip
surfaceparm nomarks
surfaceparm metalsteps
cull none
	{
	map textures/hangars/fence_floor4.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/machine1
{
	{
	map textures/hangars/machine2.tga
	tcMod rotate 60
	rgbGen identity
	}
	{
	map textures/hangars/machine1.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/machine4
{
surfaceparm nomarks
	{
	map textures/hangars/machine4.tga
	tcmod scroll -1.5 0
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/hangars/metalb_water
{
surfaceparm metalsteps
	{
	map textures/water/bluewater.tga
	tcmod scroll 0 -0.1
	}
	{
	map textures/hangars/metalb_water.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalblue
{
surfaceparm metalsteps
	{
	map textures/hangars/metalblue.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalborder
{
surfaceparm metalsteps
	{
	map textures/hangars/metalborder.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalentrance
{
surfaceparm metalsteps
	{
	map textures/hangars/metalentrance.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalsteps
{
surfaceparm metalsteps
	{
	map textures/hangars/metalsteps.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalwall
{
surfaceparm metalsteps
	{
	map textures/hangars/metalwall.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalwall_2
{
surfaceparm metalsteps
	{
	map textures/hangars/metalwall_2.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/metalwall_3
{
surfaceparm metalsteps
	{
	map textures/hangars/metalwall_3.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/redbar
{
surfaceparm metalsteps
	{
	map textures/hangars/redbar.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/redmetal
{
surfaceparm metalsteps
	{
	map textures/hangars/redmetal.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/glider5
{
surfaceparm metalsteps
	{
	map textures/hangars/glider5.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/hangars/construction
{
surfaceparm metalsteps
	{
	map textures/hangars/construction.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/lights/hangarlamp
{
	qer_editorimage textures/lights/hangarlamp.tga
	surfaceparm nomarks
	q3map_surfacelight 3000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lights/hangarlamp.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lights/hangarlampblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lights/hangarlamplow
{
	qer_editorimage textures/lights/hangarlamp.tga
	surfaceparm nomarks
	q3map_surfacelight 900
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lights/hangarlamp.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lights/hangarlampblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lights/airlamp
{
	qer_editorimage textures/lights/airlamp.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lights/airlamp.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lights/airlampblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lights/tinylamp
{
	qer_editorimage textures/lights/tinylamp.tga
	surfaceparm nomarks
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lights/tinylamp.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lights/tinylampblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lights/microlight
{
	qer_editorimage textures/lights/microlight.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lights/microlight.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lights/microlightblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lights/redlight
{
	qer_editorimage textures/lights/redlight.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lights/redlight.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lights/redlightblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

//
// this file contains shaders attached models
//

models/mapobjects/airengine
{
	{
		map textures/glass/cityglass.tga
		tcmod scroll 0.02 0
		tcGen environment
	}
	{
		map models/mapobjects/airengine.tga
		blendfunc blend
		rgbGen vertex 
	}
}

models/mapobjects/airengine2
{
	{
		map models/mapobjects/airengine.tga
		rgbGen vertex 
	}
}

models/mapobjects/electroengine
{
	{
		map textures/glass/cityglass.tga
		tcGen environment
		rgbGen vertex 
	}
}

models/mapobjects/bulbfront
{
surfaceparm trans
	{
		map models/mapobjects/bulbfront.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/bulbfront2
{
surfaceparm trans
	{
		map models/mapobjects/bulbfront2.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/blueglass
{
surfaceparm trans
	{
		map models/mapobjects/blueglass.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/meat/eldereyes
{
surfaceparm trans
	{
		map textures/glass/lightglass.tga
		tcmod scroll 0.2 -0.5
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
	{
		map models/mapobjects/meat/eldereyes.tga
		blendfunc blend
		rgbGen vertex
	}
}

models/mapobjects/meat/elderevil
{

	{
		map models/mapobjects/meat/elderevil.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/meat/elderhorns
{

	{
		map models/mapobjects/meat/elderhorns.tga
		rgbGen vertex
	}
}

models/mapobjects/redbulbfront
{
surfaceparm trans
	{
		map models/mapobjects/redbulbfront.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/bulbinside
{
surfaceparm nolightmap
surfaceparm trans
q3map_surfacelight 10000
cull none
	{
		map models/mapobjects/bulbinside.tga
		blendfunc blend
	}
}


models/mapobjects/crane
{
	{
		map models/mapobjects/crane.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/vehicles/bearcat_shield
{
surfaceparm trans
cull none
	{
		map textures/glass/hangarglass.tga
		tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
	{
		map models/mapobjects/vehicles/bearcat_shield.tga
		blendFunc blend
		rgbGen vertex 
	}
}

models/mapobjects/vehicles/shield2
{
deformVertexes move 0 0 .6  sin 0 10 0 0.3
cull none
	{
		map textures/glass/transglass.tga
		tcgen environment
		blendFunc add
	}
	{
		map models/mapobjects/vehicles/bearcat_shield.tga
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

models/mapobjects/vehicles/bearcat_body2
{
deformVertexes move 0 0 .6  sin 0 10 0 0.3
	{
		map models/mapobjects/vehicles/bearcat_body.tga
		rgbGen lightingdiffuse
	}
}

models/mapobjects/vehicles/bearcat_wings2
{
deformVertexes move 0 0 .6  sin 0 10 0 0.3
	{
		map models/mapobjects/vehicles/bearcat_wings.tga
		rgbGen lightingdiffuse
	}
}

models/mapobjects/vehicles/pilotsmall
{
deformVertexes move 0 0 .6  sin 0 10 0 0.3
	{
		map models/mapobjects/vehicles/pilotsmall.tga
		rgbGen lightingdiffuse
	}
}

models/mapobjects/vehicles/bearcat_fan
{
surfaceparm alphashadow
cull none
	{
		map models/mapobjects/vehicles/bearcat_fan.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/vehicles/fan_on
{
deformVertexes move 0 0 .6  sin 0 10 0 0.3
cull none
	{
		map models/mapobjects/vehicles/fan_on.tga
		blendFunc blend
		rgbGen wave square 0 1 0 16
	}
}

models/mapobjects/vehicles/f_bearcat
{
deformVertexes move 0 0 .6  sin 0 10 0 0.3
sort additive
cull disable
	{
		map models/mapobjects/vehicles/f_bearcat.tga
		blendfunc add
		rgbGen wave square 0 1 0 14
	}
}

models/mapobjects/vehicles/b29_fan
{
surfaceparm alphashadow
cull none
	{
		map models/mapobjects/vehicles/b29_fan.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/vehicles/truckfront
{
cull none
	{
		map models/mapobjects/vehicles/truckfront.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/outlampblend
{
surfaceparm nolightmap
	{
		map models/mapobjects/outlamp.tga
		blendFunc add
	}
}

models/mapobjects/lampbeam
{
surfaceparm trans	
surfaceparm nomarks	
surfaceparm nonsolid
surfaceparm nolightmap
cull none
	{
		map models/mapobjects/lampbeam.tga
		tcMod Scroll .2 0
		blendFunc add
	}
}

models/mapobjects/lampbeam2
{
surfaceparm trans	
surfaceparm nomarks	
surfaceparm nonsolid
surfaceparm nolightmap
cull none
	{
		map models/mapobjects/lampbeam2.tga
		tcMod Scroll .1 0
		blendFunc add
	}
}

models/mapobjects/cavecaliz
{
surfaceparm alphashadow
cull none
	{
		map models/mapobjects/cavecaliz.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/vehicles/ht_body
{
cull none
	{
		map models/mapobjects/vehicles/ht_body.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/vehicles/ht_wheels
{
cull none
	{
		map models/mapobjects/vehicles/ht_wheels.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/vehicles/ht_launcher
{
cull none
	{
		map models/mapobjects/vehicles/ht_launcher.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/stadiumlamp
{
	{
		map models/mapobjects/stadiumlamp.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/stadiumblend
{
surfaceparm trans
	{
		map models/mapobjects/stadiumlamp.tga
		blendFunc add
	}
}

models/mapobjects/spotbulb
{
surfaceparm nolightmap
	{
		map models/mapobjects/spotbulb.tga
		blendFunc add
	}
}

models/mapobjects/sl_arc
{
surfaceparm trans
cull none
	{
		map models/mapobjects/sl_arc.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/sl_end
{
surfaceparm trans
	{
		map models/mapobjects/sl_end.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/campfire
{
	{
		map models/mapobjects/campfire.tga
		rgbGen vertex
	}
	{
		map models/mapobjects/campfireglow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0.5 0.08
	}
}

models/mapobjects/oldlamp
{
	{
		map textures/glass/lightglass.tga
		tcgen environment
		blendFunc blend
	}
	{
		map models/mapobjects/oldlamp.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/burner
{
surfaceparm trans
	{
		map models/mapobjects/burner.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/lampbflame
{
surfaceparm nolightmap
surfaceparm trans
q3map_surfacelight 100000
	{
		map models/mapobjects/lampbflame.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}

models/mapobjects/worklamp
{
surfaceparm trans
	{
		map models/mapobjects/worklamp.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/copper
{
	{
		map models/mapobjects/copper.tga
		tcGen environment
		tcmod scroll 0.1 0
		rgbGen vertex
	}
}

models/mapobjects/copper2
{
	{
		map models/mapobjects/copper.tga
		tcGen environment
		rgbGen vertex
	}
}

models/mapobjects/copper3
{
cull none
	{
		map models/mapobjects/copper.tga
		tcGen environment
		rgbGen vertex
	}
}

textures/acefx/smallflame
{
surfaceparm nomarks
surfaceparm nolightmap
q3map_surfacelight 40000
	{
		animMap 10 textures/acefx/smallflame1.tga textures/acefx/smallflame2.tga textures/acefx/smallflame3.tga textures/acefx/smallflame4.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10	
	}	
	{
		animMap 10 textures/acefx/smallflame2.tga textures/acefx/smallflame3.tga textures/acefx/smallflame4.tga textures/acefx/smallflame1.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
}

textures/acefx/tflame
{
qer_editorimage textures/acefx/tflame1.tga
surfaceparm nomarks
surfaceparm nolightmap
surfaceparm trans
surfaceparm nonsolid
surfaceparm noimpact
cull none
	{
		animMap 10 textures/acefx/tflame1.tga textures/acefx/tflame2.tga textures/acefx/tflame3.tga textures/acefx/tflame4.tga textures/acefx/tflame5.tga textures/acefx/tflame6.tga textures/acefx/tflame7.tga textures/acefx/tflame8.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10	
	}	
	{
		animMap 10 textures/acefx/tflame2.tga textures/acefx/tflame3.tga textures/acefx/tflame4.tga textures/acefx/tflame5.tga textures/acefx/tflame6.tga textures/acefx/tflame7.tga textures/acefx/tflame8.tga textures/acefx/tflame1.tga 		
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
}

models/mapobjects/meat/meathead
{
	{
		map models/mapobjects/meat/meathead.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/scalemodel
{
surfaceparm trans
	{
		map models/mapobjects/scalemodel.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/fluorbulb
{
surfaceparm nolightmap
surfaceparm trans
q3map_surfacelight 10000
	{
		map models/mapobjects/fluorbulb.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}

models/mapobjects/fluorbulb2
{
surfaceparm nolightmap
surfaceparm trans
q3map_surfacelight 3000
	{
		map models/mapobjects/fluorbulb.tga
//		blendFunc blend
//		rgbGen vertex
	}
}

models/mapobjects/hugeglass
{
surfaceparm trans
q3map_surfacelight 10000
	{
		map textures/glass/lightglass.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
	{
		map models/mapobjects/hugeglass.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/hugebulb
{
cull none
	{
		map models/mapobjects/hugebulb.tga
		rgbGen vertex 
	}
}

models/mapobjects/toolbox
{
	{
		map models/mapobjects/toolbox.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/floorlamp
{
surfaceparm alphashadow
	{
		map models/mapobjects/floorlamp.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/lampscreen
{
cull none
	{
		map models/mapobjects/lampscreen.tga
		blendFunc blend
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/meat/oldman_legs
{
	{
		map models/mapobjects/meat/oldman_legs.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

textures/acefx/candleflame
{
surfaceparm nomarks
surfaceparm nolightmap
q3map_surfacelight 6000
	{
		animMap 10 textures/acefx/candleflame1.tga textures/acefx/candleflame2.tga textures/acefx/candleflame3.tga textures/acefx/candleflame4.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10	
	}	
	{
		animMap 10 textures/acefx/candleflame2.tga textures/acefx/candleflame3.tga textures/acefx/candleflame4.tga textures/acefx/candleflame1.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
}

models/mapobjects/bluelamp
{
cull none
	{
		map models/mapobjects/bluelamp.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ONE
	}
}

models/mapobjects/clothes
{
surfaceparm trans
	{
		map models/mapobjects/clothes.tga
	}
}

models/mapobjects/basket
{
surfaceparm alphashadow
cull none
	{
		map models/mapobjects/basket.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/valve
{
cull none
	{
		map models/mapobjects/valve.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/lampbars2
{
surfaceparm trans
cull none
	{
		map models/mapobjects/lampbars2.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/workbulb2
{
surfaceparm trans
q3map_surfacelight 12000
	{
		map models/mapobjects/workbulb2.tga
	}
}

models/mapobjects/workbulb2_off
{
surfaceparm trans
	{
		map models/mapobjects/workbulb2.tga
		rgbGen vertex
	}
}

models/mapobjects/worklamp2
{
surfaceparm trans
	{
		map models/mapobjects/worklamp2.tga
		rgbGen vertex
	}
}

models/mapobjects/meat/head_lung
{
surfaceparm trans
	{
		map textures/water/slime.tga
		tcmod scroll 0 0.08
		blendFunc add
	}
	{
		map models/mapobjects/meat/head_lung.tga
		rgbGen vertex 
		blendfunc blend
		depthWrite
	}
}

models/mapobjects/meat/head_lung2
{
surfaceparm trans
	{
		map textures/water/slime.tga
		tcmod scroll -0.04 0
		blendFunc add
	}
	{
		map models/mapobjects/meat/head_lung.tga
		rgbGen vertex 
		blendfunc blend
	}
}

models/mapobjects/meat/floating_head
{
surfaceparm trans
deformVertexes move 0 0 .3  sin 0 5 0 0.2
	{
		map models/mapobjects/meat/floating_head.tga
		rgbGen lightingdiffuse
	}
}

models/mapobjects/typewriter
{
	{
		map models/mapobjects/typewriter.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}
}

models/mapobjects/candle
{
	{
		map models/mapobjects/candle.tga
	}
}

models/mapobjects/redlamp
{
	q3map_surfacelight 5000
	{
		map models/mapobjects/redlamp.tga
		rgbGen vertex
	}
	{
		map models/mapobjects/redlampblend.tga
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/redlamp_b
{
	q3map_surfacelight 3000
	{
		map models/mapobjects/redlamp.tga
		rgbGen vertex
	}
	{
		map models/mapobjects/redlampblend2.tga
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/lightpost_bulb
{
	q3map_surfacelight 5000
	{
		map models/mapobjects/lightpost_bulb.tga
		blendfunc GL_ONE GL_ONE
	}
}

models/mapobjects/meat/bloodsplat
{
	{
		clampmap models/mapobjects/meat/bloodsplat.tga
		blendFunc blend
		depthWrite
		rgbGen lightingdiffuse
	}
}

models/mapobjects/meat/dl_body
{
	{
       	map models/mapobjects/meat/dl_body.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}      
}

models/mapobjects/meat/dl_body2
{
	{
       	map models/mapobjects/meat/dl_body.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/mapobjects/meat/dl_head
{
	{
        	map models/mapobjects/meat/dl_head.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}      
}

models/mapobjects/meat/dl_dead
{
	{
        	map models/mapobjects/meat/dl_dead.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}      
}

models/mapobjects/meat/dl_vomit
{
	{
        	map models/mapobjects/meat/dl_vomit.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}      
}

models/mapobjects/darkplane
{
surfaceparm trans
surfaceparm	nolightmap
	{
		map models/mapobjects/darkplane.tga
		rgbGen identity
		blendfunc blend
		rgbGen lightingdiffuse
	}
}

models/mapobjects/meat/whale
{
deformVertexes move 0 0 .6  sin 0 5 0 0.2
	{
		map models/mapobjects/meat/whale.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
	}
}

models/mapobjects/meat/rib_corpse
{
	{
        	map models/mapobjects/meat/rib_corpse.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}      
}

models/mapobjects/tree1
{
	{
        	map models/mapobjects/tree1.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}      
}

models/mapobjects/branches
{
surfaceparm trans
	{
        	map models/mapobjects/branches.tga
		rgbGen vertex
	}      
}

models/mapobjects/branches2
{
cull none
surfaceparm trans
	{
        	map models/mapobjects/branches.tga
		alphaFunc GE128
		depthWrite
		rgbGen vertex
	}      
}

models/mapobjects/vehicles/tractorbody
{
	{
		map textures/glass/tractorglass.tga
		tcGen environment
	}
	{
		map models/mapobjects/vehicles/tractorbody.tga
		blendFunc blend
		rgbGen vertex
	}
}

models/mapobjects/key
{
	{
		map models/weapons2/mg42/bullet.tga
		tcGen environment
		rgbGen lightingdiffuse
	}
}

models/mapobjects/weed
{
cull none
surfaceparm trans
	{
		map models/mapobjects/weed.tga
		blendFunc blend
		rgbGen vertex 
	}
}

models/mapobjects/leaves
{
cull none
surfaceparm trans
	{
		map models/mapobjects/leaves.tga
		alphaFunc GE128
		rgbGen vertex 
	}
}

models/mapobjects/cavelamp
{
surfaceparm trans
	{
		map textures/caves/lava.tga
		tcmod scroll 0.02 0.02
		rgbGen identity
	}
	{
		map textures/caves/lava.tga
		blendFunc add
		rgbGen identity
	}
	{
		map models/mapobjects/cavelamp.tga
		blendFunc blend
		rgbGen vertex
	}
}

models/mapobjects/portalflash1
{
sort additive
cull disable
	{
		map models/mapobjects/portalflash1.tga
		tcMod scroll 1 0
		blendfunc add
	}
	{
		map models/mapobjects/portalflash1.tga
		tcMod scroll -0.5 0
		blendfunc add
	}
}

models/mapobjects/portalflash2
{
cull disable
	{
		map models/mapobjects/portalflash3.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll 2.2 1.3
		rgbGen wave inversesawtooth -.3 1.3 0 1.3 
	}
	{    
		map models/mapobjects/portalflash2.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -1 .5
		rgbGen wave inversesawtooth -.2 1.2 0 .5
	}
}

models/mapobjects/newspaper
{
cull none
	{
		map models/mapobjects/newspaper.tga
		rgbGen lightingdiffuse
	}
}

models/mapobjects/meat/symbol2
{
sort additive
	{
		map models/mapobjects/meat/symbol2.tga
		blendfunc blend
		rgbGen wave square -.3 1.3 0 15
	}
}

textures/caves/lava
{
	qer_editorimage textures/caves/lava.tga
	surfaceparm nomarks
	q3map_surfacelight 200
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/caves/lava.tga
		blendFunc add
		rgbGen identity
	}
}

textures/caves/lava_nolight
{
	qer_editorimage textures/caves/lava.tga
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/caves/lava.tga
		tcmod scroll 0.01 0.01
		blendFunc add
		rgbGen identity
	}
}

textures/organic/lung
{
surfaceparm nomarks
	{
	map textures/organic/lung2.tga
	tcmod scroll 0 -0.08
	}
	{
	map textures/organic/lung.tga
	blendFunc blend
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/organic/lung_move
{
surfaceparm nomarks
deformVertexes wave 100 sin 2 3 0 0.4
qer_editorimage	textures/organic/lung.tga
	{
	map textures/organic/lung.tga
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/rust_cull
{
cull none
qer_editorimage textures/shipwreck/rust.tga
	{
	map textures/shipwreck/rust.tga
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/shipwreck/redgrasseye
{
q3map_surfacelight 150
	{
	map textures/shipwreck/redgrasseye.tga
	rgbGen wave sin 0.65 0.25 0.75 0.3
	}
	{
	map textures/shipwreck/redgrasseye.tga
	blendFunc blend
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/blacksteps
{
surfaceparm metalsteps
	{
	map textures/shipwreck/blacksteps.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/bloodsteps
{
surfaceparm metalsteps
	{
	map textures/shipwreck/bloodsteps.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/bluetube
{
surfaceparm metalsteps
	{
	map textures/shipwreck/bluetube.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/bluetubedown
{
surfaceparm metalsteps
	{
	map textures/shipwreck/bluetubedown.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/bluetubeup
{
surfaceparm metalsteps
	{
	map textures/shipwreck/bluetubeup.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/bordermetalwhite
{
surfaceparm metalsteps
	{
	map textures/shipwreck/bordermetalwhite.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/darkfloor
{
surfaceparm metalsteps
	{
	map textures/shipwreck/darkfloor.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/darkfloorblood
{
surfaceparm metalsteps
	{
	map textures/shipwreck/darkfloorblood.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/hulldown
{
surfaceparm metalsteps
	{
	map textures/shipwreck/hulldown.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/hullup
{
surfaceparm metalsteps
	{
	map textures/shipwreck/hullup.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalflatgray
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalflatgray.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalflatgray2
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalflatgray2.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalgray
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalgray.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalgray2
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalgray2.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalflatrust
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalflatrust.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalwhite
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalwhite.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalwhiteblood
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalwhiteblood.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/metalwhiteceiling
{
surfaceparm metalsteps
	{
	map textures/shipwreck/metalwhiteceiling.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/shipwreck/rust
{
surfaceparm metalsteps
	{
	map textures/shipwreck/rust.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}


textures/skies/airclouds

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_surfacelight 20
	q3map_sun .6 .6 .7 55 300 45
	skyparms - 256 -

	{
	map textures/skies/redclouds.tga
	tcMod scale 3 2
	tcMod scroll 0.15 0.15
	depthWrite
	}
	{
	map textures/skies/grayclouds.tga
	blendFunc GL_ONE GL_ONE
	tcMod scale 3 3
	tcMod scroll 0.05 0.05
	}
}

textures/skies/elder_blacksky

{
	{
		map textures/acefx/blackfloor.tga
	}
}

textures/skies/hangars

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .9 .8 1.0 43 330 75
	q3map_surfacelight 18
	skyparms env/night - -
}

textures/skies/hangars2

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .9 .8 1.0 37 33 70
	q3map_surfacelight 15
	skyparms env/night - -
}

textures/skies/ghosttown

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .8 .8 1.0 52 180 25
	q3map_surfacelight 25
	skyparms env/night2 - -
}

textures/skies/ghosttown2

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .8 .8 1.0 52 180 40
	q3map_surfacelight 25
	skyparms env/night2 - -
}

textures/skies/boat

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .8 .8 1.0 52 220 45
	q3map_surfacelight 22
	skyparms - 512 -

	{
	map textures/skies/stars.tga
	tcMod scale 5 5
	tcMod scroll 0 -0.002
	depthWrite
	}
	{
	map textures/skies/bigblueclouds.tga
	blendFunc GL_ONE GL_ONE
	tcMod scale 3 3
	tcMod scroll 0 -0.02
	}
}

textures/skies/evilmountains
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_sun .6 .6 .7 160 80 70
	q3map_surfacelight 70
	skyparms env/mountains - -
	qer_editorimage textures/skies/evilmountains.tga
}

textures/skies/city

{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
	q3map_surfacelight 20
	q3map_sun .6 .6 .7 35 330 60
	skyparms - 512 -

	{
	map textures/skies/blackclouds.tga
	tcMod scale 5 5
	tcMod scroll 0.01 0.01
	depthWrite
	}
	{
	map textures/skies/grayclouds.tga
	blendFunc GL_ONE GL_ONE
	tcMod scale 5 5
	tcMod scroll 0.02 0.02
	}
}

textures/water/bloodpool	
	{
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nomarks
		cull disable
		deformVertexes wave 64 sin .25 .25 0 .5
		qer_editorimage textures/water/bloodpool1.tga
		qer_trans .3
		{ 
			map textures/water/bloodpool1.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 .01
		}
		{ 
			map textures/water/bloodpool2.tga
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .025
		}
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	}

textures/water/waterblue	
	{
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nomarks
		cull disable
		deformVertexes wave 64 sin .25 .25 0 .5	
		qer_editorimage textures/water/waterblue1.tga
		qer_trans .3
		{ 
			map textures/water/waterblue1.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 .01
		}
		{ 
			map textures/water/waterblue2.tga
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .025
		}
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	}

textures/water/sea
	{
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nomarks
		surfaceparm fog
		fogparms ( 0 0 0 ) 450
		//surfaceparm nolightmap
		//cull disable
		//deformVertexes wave 64 sin .25 .25 0 .5
		qer_editorimage textures/water/bloodpool1.tga
		qer_trans .3
	}

textures/water/seasurface	
	{
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm nomarks
		cull disable
		deformVertexes wave 128 sin 0 24 0 .1
		qer_editorimage textures/water/sea1.tga
		qer_trans .3
		{ 
			map textures/water/sea1.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 -.1
		}
		{ 
			map textures/water/sea2.tga
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .08
		}
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	}

textures/water/greenripple
{
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	qer_editorimage textures/water/greenripple1.tga
	{
		animMap 10 textures/water/greenripple1.tga textures/water/greenripple2.tga textures/water/greenripple3.tga textures/water/greenripple4.tga textures/water/greenripple5.tga textures/water/greenripple6.tga textures/water/greenripple7.tga textures/water/greenripple8.tga textures/water/greenripple9.tga 
		blendFunc blend
		rgbgen lightingDiffuse
	}	
	{
		animMap 10 textures/water/greenripple4.tga textures/water/greenripple5.tga textures/water/greenripple6.tga textures/water/greenripple7.tga textures/water/greenripple8.tga textures/water/greenripple9.tga textures/water/greenripple1.tga textures/water/greenripple2.tga textures/water/greenripple3.tga 
		blendFunc blend
		rgbGen lightingDiffuse
	}
	//{
	//	map $lightmap
	//	rgbGen identity
	//	blendFunc GL_DST_COLOR GL_ZERO
	//}
}

//
// this file contains shaders attached models
//

models/weapons2/mg42/mg42_hud
{
	{
		map models/weapons2/mg42/mg42_hud.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

models/weapons2/mg42/mg42_full
{
	{
		map models/weapons2/mg42/mg42_full.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

models/weapons2/mg42/mg42_bullet
{
	{
		map models/weapons2/mg42/bullet.tga
		tcGen environment
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/mg42/mg42_bullet.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/gun/gun
{
	{
		map models/weapons2/gun/gunmetal.tga
		tcGen environment
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/gun/gun.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/trishotgun/shells
{
	{
		map models/weapons2/mg42/bullet.tga
		tcGen environment
		rgbGen lightingDiffuse
	}
	{
		map models/weapons2/trishotgun/shells.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/weapons2/gun/f_gun
{
	sort additive
	cull disable
	{
		map models/weapons2/gun/f_gun.tga
		blendfunc add
	}
}

models/weapons2/trishotgun/f_trishotgun
{
	sort additive
	cull disable
	{
		map models/weapons2/trishotgun/f_trishotgun.tga
		blendfunc add
	}
}

models/weapons2/mg42/f_mg42
{
	sort additive
	cull disable
	{
		map models/weapons2/mg42/f_mg42.tga
		blendfunc add
	}
}

menu/art/smoke
{
	{
	map menu/art/smoke.tga
	tcmod scroll 0 0.1
	rgbgen identity
	}
	{
	map menu/art/blood.tga
	blendFunc blend
	rgbGen wave sin 0.65 0.25 0.75 0.3
	}
}


textures/city/b29_hole
{
surfaceparm alphashadow
surfaceparm nonsolid
surfaceparm noimpact
	{
	map textures/city/b29_hole.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/city/b29_split
{
surfaceparm alphashadow
cull none
	{
	map textures/city/b29_split.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/city/air_hole
{
surfaceparm alphashadow
surfaceparm nonsolid
surfaceparm noimpact
	{
	map textures/city/air_hole.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/city/b29_piece1
{
surfaceparm trans
cull none
	{
	map textures/city/b29_piece1.tga
	alphaFunc GE128
	depthWrite
	rgbGen vertex
	}
}

textures/city/b29_piece2
{
surfaceparm trans
cull none
	{
	map textures/city/b29_piece2.tga
	alphaFunc GE128
	depthWrite
	rgbGen vertex
	}
}

textures/city/b29_piece3
{
surfaceparm trans
cull none
	{
	map textures/city/b29_piece3.tga
	alphaFunc GE128
	depthWrite
	rgbGen vertex
	}
}

textures/city/barbwire
{
surfaceparm trans
cull none
	{
	map textures/city/barbwire.tga
	rgbGen identity
	alphaFunc GE128
	depthWrite
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/city/oldtube_cull
{
surfaceparm metalsteps
cull none
qer_editorimage textures/hangars/oldtube.tga
	{
	map textures/hangars/oldtube.tga
	rgbGen identity
	}
	{
	map $lightmap
	rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/city/cable_trans
{
surfaceparm trans
qer_editorimage textures/aircrash/baseblack.tga
	{
	map textures/aircrash/baseblack.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/city/bblack_nosolid
{
surfaceparm nonsolid
qer_editorimage textures/aircrash/baseblack.tga
	{
	map textures/aircrash/baseblack.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/city/door_nosolid
{
surfaceparm nonsolid
qer_editorimage textures/city/door_hotel.tga
	{
	map textures/city/door_hotel.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/city/glass_nosolid
{
	surfaceparm nonsolid
	surfaceparm trans	
	qer_trans 	0.8
	qer_editorimage textures/glass/grainy_glass.tga
	{
	map textures/glass/grainy_glass.tga
	blendFunc blend
	//rgbGen identity
	}
	{
	map $lightmap
	//rgbGen identity
	blendFunc GL_DST_COLOR GL_ZERO
	depthFunc equal
	}
}

textures/city/wood_nosolid
{
surfaceparm nonsolid
qer_editorimage textures/ghost/normalwood.tga
	{
	map textures/ghost/normalwood.tga
	rgbGen identity
	}
	{
	map $lightmap
	blendFunc GL_DST_COLOR GL_ZERO
	}
}

//
// this file contains shaders attached models
//

models/powerups/health/medkit
{
	{
		map models/powerups/health/medkit.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/mg42_handle
{
	{
		map models/powerups/ammo/mg42_ammo.tga
		alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/mg42_ammo
{
	{
		map models/weapons2/gun/gunmetal.tga
		tcGen environment
		rgbGen lightingDiffuse
	}
	{
		map models/powerups/ammo/mg42_ammo.tga
		blendFunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/bullet_box
{
	{
		map models/powerups/ammo/bullet_box.tga
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/shellbox
{
	{
		map models/powerups/ammo/shellbox.tga
		rgbGen lightingDiffuse
	}
}

models/weaphits/ankshot
{
deformVertexes autoSprite
cull none
	{
		animMap 10 models/weaphits/ankshot1.tga models/weaphits/ankshot2.tga models/weaphits/ankshot3.tga models/weaphits/ankshot4.tga models/weaphits/ankshot5.tga models/weaphits/ankshot6.tga models/weaphits/ankshot7.tga models/weaphits/ankshot8.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10	
	}	
	{
		animMap 10 models/weaphits/ankshot8.tga models/weaphits/ankshot1.tga models/weaphits/ankshot2.tga models/weaphits/ankshot3.tga models/weaphits/ankshot4.tga models/weaphits/ankshot5.tga models/weaphits/ankshot6.tga models/weaphits/ankshot7.tga 
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}	
}

models/weaphits/batshot
{
	deformVertexes autoSprite
	cull none
        {
                clampmap models/weaphits/batshot.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 300
                rgbGen identity
        }
        {
                clampmap models/weaphits/batshot.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 200
                rgbGen identity
        }
}

models/weaphits/batshot_tail
{
	cull none
	nomipmaps
        {
                map models/weaphits/batshot_tail.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll 2 0
                rgbGen identity
        }
        {
                map models/weaphits/batshot_tail.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll 3 0
                rgbGen identity
        }
}

models/weaphits/seashot1
{
	deformVertexes autoSprite
	cull none
        {
                clampmap models/weaphits/seashot1.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 900
                rgbGen identity
        }
}

models/weaphits/seashot2
{
	deformVertexes autoSprite
	cull none
        {
                clampmap models/weaphits/seashot2.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 900
                rgbGen identity
        }
}

// GFX.SHADER
// 
// this file contains shaders that are used by the programmers to
// generate special effects not attached to specific geometry.  This
// also has 2D shaders such as fonts, etc.
//

// the REGION shader is generated by the map editor on temporary
// brushes around a selected area for testing parts of maps
textures/REGION
{
	surfaceparm nolightmap
}

// the background for the netgraph
lagometer
{
	nopicmip
	{
		map gfx/2d/lag.tga
	}
}

// blinked on top of lagometer when connection is interrupted
disconnected
{
	nopicmip
	{
		map gfx/2d/net.tga
	}
}

white
{
	{
		map *white
		blendfunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}

console
{
	nopicmip
	nomipmaps
    
        {
		map gfx/misc/console01.tga
                blendFunc GL_ONE GL_ZERO
                tcMod scroll .02  0
                tcmod scale 2 1
	}
        {
                map gfx/misc/console02.tga
                //map textures/sfx/firegorre3.tga
                blendFunc add
                tcMod turb 0 .1 0 .1
                tcMod scale 2 1
                tcmod scroll 0.2  .1
	} 

}

menuback
{
	nopicmip
	nomipmaps
        //{
        //        map textures/sfx/logo512.tga
        //}

        //{
        //        map textures/sfx/specular.tga
         //       //blendfunc add
        //        tcMod turb 0 .8 0 .2
        //        tcmod scroll -.1  -.2
	//} 
         {
                map menu/art/loading.tga
                // blendFunc blend
//                rgbgen identity
        }
        //{
	//	map textures/sfx/proto_zzzdrk.tga
        //        blendFunc add
        //        tcMod turb 0 .1 0 .9
        //         tcmod scale .2 .2
        //         tcMod scroll .02  0.7
        //         rgbgen identity
	//} 
        
}
menubacknologo
{
	nopicmip
	nomipmaps
       
        {
               map gfx/colors/black.tga
	       //map textures/sfx/proto_zzzdrk.tga
               // tcMod turb 0 .1 0 .9
               // tcmod scale .2 .2
               // tcMod scroll .02  0.7
	} 
        
}

menubackRagePro	// blends turn to shit on rage pro, so skip it
{
	nopicmip
	nomipmaps
        {
                map menu/art/loading.tga
        }
        
}


levelShotDetail
// used to break up the blur on levelshots
{
	nopicmip
	{
		map textures/sfx/detail.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbgen identity
	}
}

//
// special effects as seen on players
//
powerups/battleSuit
{
	deformVertexes wave 100 sin 1 0 0 0
	{
		map textures/effects/envmapgold2.tga
                //map textures/sfx/specular.tga
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc GL_ONE GL_ONE
	}
}
powerups/battleWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/envmapgold2.tga
                //map textures/sfx/specular.tga
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc GL_ONE GL_ONE
	}
}

powerups/invisibility
{
	{
		map textures/effects/invismap.tga
                //map textures/sfx/specular.tga
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.15 0 0.25
		tcGen environment
	}
}
powerups/quad
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/quadWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/regen
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/regenmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}


//=========================

//
// holdable item icons
//
icons/teleporter
{
	nopicmip
	{
		map icons/teleporter.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/medkit
{
	nopicmip
	{
		map icons/medkit.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// powerup icons
//
icons/envirosuit
{
	nopicmip
	{
		map icons/envirosuit.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/quad
{
	nopicmip
	{
		map icons/quad.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/haste
{
	nopicmip
	{
		map icons/haste.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/invis
{
	nopicmip
	{
		map icons/invis.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/regen
{
	nopicmip
	{
		map icons/regen.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/flight
{
	nopicmip
	{
		map icons/flight.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


// reward medals used in the game floating over client's heads
medal_impressive
{
	nopicmip
	{
		clampmap menu/medals/medal_impressive.tga
		blendFunc blend
	}
}

medal_excellent
{
	nopicmip
	{
		clampmap menu/medals/medal_excellent.tga
		blendFunc blend
	}
}

medal_gauntlet
{
	nopicmip
	{
		clampmap menu/medals/medal_gauntlet.tga
		blendFunc blend
	}
}


//
// weapon icons
//
icons/iconw_gauntlet
{
	nopicmip
	{
		map icons/iconw_gauntlet.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/iconw_machinegun
{
	nopicmip
	{
		map icons/iconw_machinegun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/iconw_rocket
{
	nopicmip
	{
		map icons/iconw_rocket.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_shotgun
{
	nopicmip
	{
		map icons/iconw_shotgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identitylighting
	}
}

icons/iconw_grenade
{
	nopicmip
	{
		map icons/iconw_grenade.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_lightning
{
	nopicmip
	{
		map icons/iconw_lightning.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_plasma
{
	nopicmip
	{
		map icons/iconw_plasma.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_railgun
{
	nopicmip
	{
		map icons/iconw_railgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_bfg
{
	nopicmip
	{
		map icons/iconw_bfg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_grapple
{
	nopicmip
	{
		map icons/iconw_grapple.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// ammo icons
//
icons/icona_machinegun
{
	nopicmip
	{
		map icons/icona_machinegun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_rocket
{
	nopicmip
	{
		map icons/icona_rocket.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_shotgun
{
	nopicmip
	{
		map icons/icona_shotgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identitylighting
	}
}

icons/icona_grenade
{
	nopicmip
	{
		map icons/icona_grenade.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_lightning
{
	nopicmip
	{
		map icons/icona_lightning.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_plasma
{
	nopicmip
	{
		map icons/icona_plasma.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_railgun
{
	nopicmip
	{
		map icons/icona_railgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_bfg
{
	nopicmip
	{
		map icons/icona_bfg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


//
// armor icons
//
icons/iconr_shard
{
	nopicmip
	{
		map icons/iconr_shard.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconr_yellow
{
	nopicmip
	{
		map icons/iconr_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconr_red
{
	nopicmip
	{
		map icons/iconr_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// health icons
//
icons/iconh_green
{
	nopicmip
	{
		map icons/iconh_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_yellow
{
	nopicmip
	{
		map icons/iconh_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_red
{
	nopicmip
	{
		map icons/iconh_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
        //{
	//	clampmap icons/iconh_red2.tga
	//	blendFunc blend
        //        tcMod stretch sin .04 1 0 1
	//}
}

icons/iconh_mega
{
	nopicmip
	{
		map icons/iconh_mega.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// CTF icons
//
icons/iconf_red
{
	nopicmip
	{
		map icons/iconf_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconf_blu
{
	nopicmip
	{
		map icons/iconf_blu.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


//===================================================

gfx/2d/menuinfo
{
	nopicmip
	{
		map gfx/2d/menuinfo.tga
	}
}

gfx/2d/menuinfo2
{
	nopicmip
	{
		map gfx/2d/menuinfo2.tga
	}
}

gfx/2d/quit
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/quit.tga
	}
}

gfx/2d/cursor
{
    nopicmip
	nomipmaps
    {
        map gfx/2d/cursor.tga
    }
}

//==========================================================================


sprites/balloon3
{
	{
		map sprites/balloon4.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// this is an example of a crossfaded animation cycle
textures/animationTest
{
	qer_editorimage	textures/liquids/bloodwater1.tga
	{
		animMap 0.5 textures/liquids/bloodwater1.tga textures/liquids/pool.tga textures/liquids/slime7.tga
	}	
	{
		animMap 0.5 textures/liquids/pool.tga textures/liquids/slime7.tga textures/liquids/bloodwater1.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen	wave sawtooth 0 1 0 0.5
	}	
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

teleportEffect
{
	cull none
	{
		map gfx/misc/teleportEffect2.tga
                blendFunc GL_ONE GL_ONE
		rgbGen entity
		tcMod scale 1 4
		tcMod scroll 0 2
	}
}

// markShadow is the very cheap blurry blob underneat the player
markShadow
{
	polygonOffset
	{
		map gfx/damage/shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// projectionShadow is used for cheap squashed model shadows
projectionShadow
{
	polygonOffset
	deformVertexes projectionShadow
	{
		map			*white
		blendFunc GL_ONE GL_ZERO
		rgbGen wave square 0 0 0 0				// just solid black
	}	
}


// wake is the mark on water surfaces for paddling players
wake
{
	{
		clampmap sprites/splash.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                tcmod rotate 250
                tcMod stretch sin .9 0.1 0 0.7
		rgbGen wave sin .7 .3 .25 .5
	}	
        {
		clampmap sprites/splash.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                tcmod rotate -230
                tcMod stretch sin .9 0.05 0 0.9
		rgbGen wave sin .7 .3 .25 .4
	}	
}


// viewBloodBlend gives the blended directional cue when you get hit
viewBloodBlend
{
	sort	nearest
	{
		//map models/weaphits/blood201.tga
                map gfx/damage/blood_screen.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identityLighting
		alphaGen vertex
	}
}

waterBubble
{
	sort	underwater
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map sprites/bubble.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

hasteSmokePuff			// drops behind player's feet when speeded
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //blendfunc GL_ONE GL_ONE
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuffRagePro
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuffragepro.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

shotgunSmokePuff
{
	cull none
	{
		map gfx/misc/smokepuff2b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen entity		
		rgbGen entity
	}
}

flareShader
{
	cull none
	{
		map gfx/misc/flare.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}
sun
{
	cull none
	{
		map gfx/misc/sun.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}
railDisc
{
	sort nearest
	cull none
        deformVertexes wave 100 sin 0 .5 0 2.4
	{
		clampmap gfx/misc/raildisc_mono2.tga 
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                 tcMod rotate -30
	}
}

railCore
{
	sort nearest
	cull none
	{
		map gfx/misc/railcorethin_mono.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
		tcMod scroll -1 0
	}
}

lightningBolt
{
	cull none
	{
		map gfx/misc/lightning3.tga
		blendFunc GL_ONE GL_ONE
//                rgbgen wave sin 1 5.1 0 7.1
                rgbgen wave sin 1 0.5 0 7.1
                 tcmod scale  2 1
		tcMod scroll -5 0
	}
    {
		map gfx/misc/lightning3.tga
		blendFunc GL_ONE GL_ONE
//                rgbgen wave sin 1 8.3 0 8.1
                rgbgen wave sin 1 0.8 0 8.1
                tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}

// shader used on the occasional machinegun bullet tracers
gfx/misc/tracer
{
	cull none
	{
		map	gfx/misc/tracer2.tga
		blendFunc GL_ONE GL_ONE
	}
}

//
// wall marks
// use blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR so that
// their "contribution" can be damped down in fog volumes
// with distance
bloodMark
{
	nopicmip			// make sure a border remains
	polygonOffset
	{
		clampmap gfx/damage/blood_stain.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identityLighting
		alphaGen vertex
	}
}

bloodTrail
{
        
	nopicmip			// make sure a border remains
	entityMergable		// allow all the sprites to be merged together
	{
		//clampmap gfx/misc/blood.tga
                clampmap gfx/damage/blood_spurt.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

gfx/damage/bullet_mrk
{
	polygonOffset
	{
		map gfx/damage/bullet_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/burn_med_mrk
{
	polygonOffset
	{
		map gfx/damage/burn_med_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/hole_lg_mrk
{
	polygonOffset
	{
		map gfx/damage/hole_lg_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/plasma_mrk
{
	polygonOffset
	{
		map gfx/damage/plasma_mrk.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
		alphaGen vertex
	}
}


//===============================================================

// scoreboard header tabs

scoreboardName
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/name.tga
		blendfunc blend
	}
}

scoreboardScore
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/score.tga
		blendfunc blend
	}
}

scoreboardTime
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/time.tga
		blendfunc blend
	}
}

scoreboardPing
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/ping.tga
		blendfunc blend
	}
}

//===============================================================

gfx/2d/crosshair
{
	nopicmip
	{
		map gfx/2d/crosshair.tga          
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA                
        rgbGen identity
	}
}

gfx/2d/crosshairb
{
	nopicmip
	{
		map gfx/2d/crosshairb.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairc
{
	nopicmip
	{
		map gfx/2d/crosshairc.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaird
{
	nopicmip
	{
		map gfx/2d/crosshaird.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaire
{
	nopicmip
	{
		map gfx/2d/crosshaire.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairf
{
	nopicmip
	{
		map gfx/2d/crosshairf.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairg
{
	nopicmip
	{
		map gfx/2d/crosshairg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairh
{
	nopicmip
	{
		map gfx/2d/crosshairh.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairi
{
	nopicmip
	{
		map gfx/2d/crosshairi.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

}
gfx/2d/crosshairj
{
	nopicmip
	{
		map gfx/2d/crosshairj.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}
gfx/2d/crosshairk
{
	nopicmip
	{
		map gfx/2d/crosshairk.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}




gfx/2d/bigchars
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/bigchars.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/select
{
	nopicmip
	{
		map gfx/2d/select.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
		rgbgen vertex
	}
}


gfx/2d/assault1d
{
	nopicmip
	{
		map gfx/2d/assault1d.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/armor1h
{
	nopicmip
	{
		map gfx/2d/armor1h.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/health
{
	nopicmip
	{
		map gfx/2d/health.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/blank
{
	nopicmip
	{
		map gfx/2d/blank.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/numbers/zero_32b
{
	nopicmip
	{
		map gfx/2d/numbers/zero_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/one_32b
{
	nopicmip
	{
		map gfx/2d/numbers/one_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/two_32b
{
	nopicmip
	{
		map gfx/2d/numbers/two_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/three_32b
{
	nopicmip
	{
		map gfx/2d/numbers/three_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/four_32b
{
	nopicmip
	{
		map gfx/2d/numbers/four_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/five_32b
{
	nopicmip
	{
		map gfx/2d/numbers/five_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/six_32b
{
	nopicmip
	{
		map gfx/2d/numbers/six_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/seven_32b
{
	nopicmip
	{
		map gfx/2d/numbers/seven_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/eight_32b
{
	nopicmip
	{
		map gfx/2d/numbers/eight_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/nine_32b
{
	nopicmip
	{
		map gfx/2d/numbers/nine_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/minus_32b
{
	nopicmip
	{
		map gfx/2d/numbers/minus_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}


//
// weapon hits
// All of these will be put on entities with a shaderTime offset, so they
// can be expected to start at time 0 for each separate explosion
//
// Many of these are use smoothly morphed animating textures by pairing
// sawtooth and iverse sawtooth rgbGens
plasmaExplosion
{
	cull disable
	{
		clampmap models/weaphits/plasmaboom.tga
		blendfunc add
                tcMod stretch triangle .6 0.1 0 8
                tcmod rotate 999
                rgbGen wave inversesawtooth 0 1 0 1.5
	}
}

railExplosion
{
	cull disable
        {
		animmap 5 models/weaphits/ring02_1.tga  models/weaphits/ring02_2.tga  models/weaphits/ring02_3.tga models/weaphits/ring02_4.tga gfx/colors/black.tga
		alphaGen wave inversesawtooth 0 1 0 5
		blendfunc blend
	}
	{
		animmap 5 models/weaphits/ring02_2.tga  models/weaphits/ring02_3.tga models/weaphits/ring02_4.tga gfx/colors/black.tga gfx/colors/black.tga
		alphaGen wave sawtooth 0 1 0 5
		blendfunc blend
	}
}

lightningExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/ring02_1.tga  models/weaphits/ring02_3.tga  models/weaphits/ring02_3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/ring02_2.tga  models/weaphits/ring02_3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bulletExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bullet1.tga  models/weaphits/bullet2.tga  models/weaphits/bullet3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bullet2.tga  models/weaphits/bullet3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

rocketExplosion
{
	cull disable
	{
		animmap 8 models/weaphits/rlboom/rlboom_1.tga  models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

grenadeExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/glboom/glboom_1.tga  models/weaphits/glboom/glboom_2.tga models/weaphits/glboom/glboom_3.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/glboom/glboom_2.tga  models/weaphits/glboom/glboom_3.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bfgExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bfgboom/bfgboom_1.tga  models/weaphits/bfgboom/bfgboom_2.tga models/weaphits/bfgboom/bfgboom_3.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bfgboom/bfgboom_2.tga models/weaphits/bfgboom/bfgboom_3.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		animmap 5 models/weaphits/blood201.tga models/weaphits/blood202.tga models/weaphits/blood203.tga models/weaphits/blood204.tga models/weaphits/blood205.tga
		blendfunc blend
	}
}




// Edited by ZerTerO
//
// High Quality Quake

models/weapons2/railgun/railgun1
{
	{
		map	models/weapons2/railgun/railgun1.tga
		rgbGen lightingDiffuse				
	}
	{
		animmap 3.5 models/weapons2/railgun/glow1.tga models/weapons2/railgun/glow2.tga models/weapons2/railgun/glow3.tga models/weapons2/railgun/glow4.tga models/weapons2/railgun/glow5.tga models/weapons2/railgun/glow6.tga models/weapons2/railgun/glow7.tga
		rgbGen wave inversesawtooth 0 1 0 3.5
		blendfunc GL_ONE GL_ONE
	}
	{
		animmap 3.5 models/weapons2/railgun/glow2.tga models/weapons2/railgun/glow3.tga models/weapons2/railgun/glow4.tga models/weapons2/railgun/glow5.tga models/weapons2/railgun/glow6.tga models/weapons2/railgun/glow7.tga models/weapons2/railgun/glow1.tga
		rgbGen wave sawtooth 0 1 0 3.5
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/railgun/railgun4
{
	{
		map models/weapons2/railgun/railgun4.tga
		tcMod scroll 0 0
		rgbGen entity	// identity
	}

}

models/weapons2/lightning/f_lightning
{
	sort additive
	cull disable
	{
		animmap 10 models/weapons2/lightning/f_lightning.jpg models/weapons2/lightning/xf_lightning.jpg
		blendfunc add
	}
}


//Candy's shaders
models/players/crash/candy
{
	{
		map models/players/crash/candy.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/candy_t
{
	{
		map models/players/crash/candy_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/candy_f
{
	{
		map models/players/crash/candy_f.tga
		rgbGen identity
		tcGen environment 
	}
}

//Mint's shaders
models/players/crash/mint
{
	{
		map models/players/crash/mint.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/mint_t
{
	{
		map models/players/crash/mint_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/mint_f
{
	{
		map models/players/crash/mint_f.tga
		rgbGen identity
		tcGen environment 
	}
}

//Cocoa's shaders
models/players/crash/cocoa
{
	{
		map models/players/crash/cocoa.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/cocoa_t
{
	{
		map models/players/crash/cocoa_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/cocoa_f
{
	{
		map models/players/crash/cocoa_f.tga
		rgbGen identity
		tcGen environment 
	}
}


//Crisis' shaders
models/players/doom/crisis
{
	{
		map models/players/doom/dxf_glow.tga
		blendfunc gl_dst_alpha gl_dst_alpha
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/doom/crisis2.tga
		blendfunc gl_dst_color gl_one_minus_src_alpha
		rgbGen identity
	}
}

models/players/doom/crisis_f
{
	{
		map models/players/doom/xfd_vis.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/xfd_rfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/doom/gcamo_f
{
	{
		map models/players/doom/xfd_vis.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/xfd_fx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}


//Bitterman's Shaders
models/players/bitterman/xfkv
{
	{
		map models/players/bitterman/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/bitterman/h_xfkv
{
	{
		map models/players/bitterman/h_xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Crash's Shaders
models/players/crash/xfkv
{
	{
		map models/players/crash/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/xfkv_t
{
	{
		map models/players/crash/xfkv_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/xfkv_f
{
	{
		map models/players/xkvshine/shine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc add
		rgbGen identity
		tcMod rotate 16
		tcGen environment 
	}
}

//Doom's Shaders
models/players/doom/xfkv
{
	{
		map models/players/doom/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/doom/xfkv_f
{
	{
		map models/players/xkvshine/shine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0.5 0.5
		tcMod rotate 1
		tcGen environment 
	}
}

//Grunt's Shaders
models/players/grunt/xfkv
{
	{
		map models/players/grunt/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/grunt/xfkv_h
{
	{
		map models/players/grunt/xfkv_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Major's Shaders
models/players/major/xfkv
{
	{
		map models/players/major/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/major/xfkv_h
{
	{
		map models/players/major/xfkv_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Sarge's Shaders
models/players/sarge/xfkv
{
	{
		map models/players/sarge/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}


//m10r shades
models/players/bones/m10r
{
	cull disable
	{
		map models/players/bones/m10r.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//xgk shades
models/players/uriel/xgk
{
	cull disable
	{
		map models/players/uriel/xgk.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/uriel/ucodes.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/uriel/xgk_h
{
	{
		map models/players/uriel/xgk_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/uriel/ucodes.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Zap's Shades
models/players/orbb/zap_h
{
	{
		map models/players/orbb/zap_h.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

models/players/orbb/zap
{
	{
		map models/players/orbb/zap.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

//Fluid's Skin Shaders
models/players/keel/fluid
{
	{
		map models/players/keel/xslime.tga
		rgbGen identity
		tcMod scroll 0.075 0.075
		tcMod turb 0 0 0 0
		tcMod scale 10 10
	}
	{
		map models/players/keel/fluid.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/keel/fluid_h
{
	{
		map models/players/keel/xslime.tga
		rgbGen identity
		tcMod scroll 0.05 0.05
		tcMod turb 0 0.1 0 0.1
		tcMod scale 1 1
	}
	{
		map models/players/keel/fluid_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Yeah!
models/players/binary/bin
{
	{
		map models/players/binary/nos.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0 0.05
		tcMod turb 0 0 0 0.1
		tcMod scale 1 1
		depthWrite
	}
	{
		map models/players/binary/bin.tga
		blendfunc gl_one gl_one_minus_src_color
		rgbGen identity
		tcMod scale 1 1
		tcMod scroll 0 -0.5
		depthWrite
	}
}

//Taste the rainbow.
models/players/binary/error
{
	{
		map models/players/binary/error.tga
		rgbGen identity
		tcMod scale 0.025 0.025
		tcMod scroll 0 2
		depthWrite
	}
}

//xrobotx's neck shader
models/players/xrobotx/invisi
{
	cull disable
	{
		map models/players/xrobotx/invisi.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Xyril's Robot Shades (experiment)
models/players/xrobotx/xrobotx
{
	{
		map models/players/xrobotx/wir.tga
		rgbGen identity
		tcMod scroll 0.05 0
		tcMod turb 0 0 0 0
		tcMod scale 3 3
	}
	{
		map models/players/xrobotx/xrobotx.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/xrobotx_he
{
	{
		map models/players/xrobotx/wir.tga
		rgbGen identity
		tcMod scroll 0.05 0
		tcMod turb 0 0 0 0
		tcMod scale 3 3
	}
	{
		map models/players/xrobotx/xrobotx_he.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/xrobotx_f
{
	{
		map models/players/xrobotx/wir.tga
		rgbGen identity
		tcMod scroll 0.2 0
		tcMod turb 0 0 0 0
		tcMod scale 0.1 0.07
	}
	{
		map models/players/xrobotx/xrobotx_f.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//le feline's shaders
models/players/mynx/lfeline_s
{
	{
		map models/players/mynx/lf_beam.tga
		rgbGen identity
		tcMod scale 1 0.5
		tcMod scroll 0 -1
	}
	{
		map models/players/mynx/lfeline_s.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
}

//robert's shaders
models/players/lucy/robert_h
{
	{
		map models/players/lucy/rainbows.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcMod scroll 0 0.5
		tcGen environment 
	}
	{
		map models/players/lucy/robert_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/lucy/robert
{
	{
		map models/players/lucy/rainbows.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcMod scroll 0 0.5
		tcGen environment 
	}
	{
		map models/players/lucy/robert.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Alpha's shaders
models/players/major/alpha
{
	{
		map models/players/major/alphalight.tga
		tcGen environment 
	}
	{
		map models/players/major/alpha.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
}

//Vector's Shaders
models/players/doom/vector
{
	{
		map models/players/doom/vector.tga
		rgbGen identity
	}
	{
		map models/players/doom/vwhite.tga
		blendfunc filter
		tcGen environment 
	}
}

//Raxar's Shades
models/players/xaero/raxar
{
	{
		map models/players/xaero/gshine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xaero/raxar.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xaero/raxar_h
{
	{
		map models/players/xaero/gshine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xaero/raxar_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xaero/raxar_a
{
	{
		map models/players/xaero/gshine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xaero/raxar_a.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Sunburn's Shaders
models/players/tankjr/sunburn
{
	{
		map models/players/tankjr/sblight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/tankjr/sunburn.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
}

//Sakura's Shaders
models/players/slash/sakura
{
	{
		map models/players/slash/sakura.tga
		rgbGen identity
	}
	{
		map models/players/slash/sshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		tcGen environment 
	}
	{
		map models/players/slash/swhite.tga
		blendfunc filter
		tcGen environment 
	}
}

models/players/slash/sakura_h
{
	{
		map models/players/slash/sakura_h.tga
		rgbGen identity
	}
	{
		map models/players/slash/sshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		tcGen environment 
	}
	{
		map models/players/slash/swhite.tga
		blendfunc filter
		tcGen environment 
	}
}

models/players/slash/sakuraskate
{
	cull disable
	{
		map models/players/slash/sakuraskate.tga
		tcMod turb 0 0.07 0 0.07
		alphaFunc GE128
	}
}

//Private's Shaders
models/players/razor/xprivate
{
	{
		map models/players/razor/xprivate.tga
		rgbGen identity
	}
	{
		map models/players/razor/pshade.tga
		blendfunc filter
		tcGen environment 
	}
	{
		map models/players/razor/pbin.tga
		blendfunc gl_one_minus_dst_alpha gl_dst_alpha
		tcMod scroll 0.05 0
		tcMod scale 5 5
	}
}

models/players/razor/xprivate_h
{
	{
		map models/players/razor/xprivate_h.tga
		rgbGen identity
	}
	{
		map models/players/razor/pshade.tga
		blendfunc filter
		tcGen environment 
	}
	{
		map models/players/razor/pshine.tga
		blendfunc gl_one_minus_dst_alpha gl_dst_alpha
		rgbGen identity
	}
}

models/players/razor/p_gog
{
	{
		map models/players/razor/p_gog.tga
		rgbGen identityLighting
	}
	{
		map models/players/razor/pshine.tga
		blendfunc gl_one_minus_dst_alpha gl_dst_alpha
		tcMod scroll 2 1
	}
}

//Fracture's Shaders
models/players/visor/fracture
{
	{
		animmap 8 models/players/visor/sfxfract01.tga models/players/visor/sfxfract02.tga models/players/visor/sfxfract03.tga models/players/visor/sfxfract04.tga models/players/visor/sfxfract05.tga models/players/visor/sfxfract06.tga models/players/visor/sfxfract07.tga models/players/visor/sfxfract08.tga 
		rgbGen identity
		tcMod scale 0.64 0.64
		tcMod scroll 3 0.25
		alphaFunc GE128
	}
	{
		animmap 30 models/players/visor/fractureb01.tga models/players/visor/fractureb02.tga models/players/visor/fractureb04.tga models/players/visor/fractureb03.tga models/players/visor/fractureb05.tga models/players/visor/fractureb01.tga models/players/visor/fractureb02.tga models/players/visor/fractureb05.tga 
		blendfunc add
		rgbGen identity
		alphaFunc GE128
	}
}

//Grelis' Shaders
models/players/sorlag/grelis
{
	{
		animmap 3 models/players/sorlag/grelis.tga models/players/sorlag/grelis_02.tga models/players/sorlag/grelis_03.tga models/players/sorlag/grelis_04.tga models/players/sorlag/grelis_05.tga 
		rgbGen lightingDiffuse
	}
	{
		map models/players/sorlag/gshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identityLighting
		tcGen environment 
	}
}

models/players/sorlag/grelis_t
{
	{
		animmap 3 models/players/sorlag/grelis_t.tga models/players/sorlag/grelis_t02.tga models/players/sorlag/grelis_t03.tga models/players/sorlag/grelis_t04.tga models/players/sorlag/grelis_t05.tga 
		rgbGen lightingDiffuse
	}
	{
		map models/players/sorlag/gshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Noob's Shaders
models/players/ranger/noob
{
	{
		map models/players/ranger/noob.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/ranger/nshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/ranger/noob_h
{
	{
		map models/players/ranger/noob_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/ranger/nhshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen wave sin 0 1 0 0.5 
		tcMod rotate 180
	}
}

//Black Hombre's Shaders
models/players/biker/bhombre
{
	{
		map models/players/biker/bhombre.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/biker/sweats.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/biker/bhombre_h
{
	{
		map models/players/biker/bhombre_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/biker/sweats.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Spectre's Shaders
models/players/bitterman/spectre
{
	{
		map models/players/bitterman/spectre.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/bitterman/swir.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcMod scroll 1 1
		tcGen environment 
	}
}

models/players/bitterman/h_spectre
{
	{
		map models/players/bitterman/h_spectre.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/bitterman/swir.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcMod scroll 1 1
		tcGen environment 
	}
}

//4n4rki's Shaders
models/players/anarki/4n4rk1
{
	{
		map models/players/anarki/4n4rk1.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g1.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

models/players/anarki/4n4rk1_b
{
	{
		map models/players/anarki/4n4rk1_b.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g4.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

models/players/anarki/4n4rk1_g
{
	{
		map models/players/anarki/4n4rk1_g.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g3.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

models/players/anarki/4n4rk1_h
{
	{
		map models/players/anarki/4n4rk1_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g2.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

//Darkmatter's Shaders
models/players/sarge/dmat
{
	{
		map models/players/sarge/dmatshine.tga
		rgbGen lightingDiffuse
		tcMod scroll 0.08 0
		tcGen environment 
	}
	{
		map models/players/sarge/sdmat.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map models/players/sarge/dmat.tga
		blendfunc blend
		rgbGen identityLighting
	}
}

//Deimos' Shaders
models/players/doom/deimos
{
	{
		map models/players/doom/deimos.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/deimosfx.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcMod scroll 0 0.25
		tcGen environment 
	}
}

models/players/doom/deimos_f
{
	{
		map models/players/doom/deimos_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/deimos_fx.tga
		rgbGen lightingDiffuse
		tcMod scroll 0.16 0.16
		tcMod scale 1 1
		tcGen environment 
	}
}

//Fragbait's Shader
models/players/crash/fragbait_f
{
	{
		map models/players/crash/fragbait_f.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Kristis's Shader
models/players/crash/kristi_f
{
	{
		map models/players/crash/kristi_f.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Hilda's Shader
models/players/crash/hilda_f
{
	{
		map models/players/crash/hilda_f.tga
		rgbGen identity
		tcGen environment 
	}
}

//Warlord's Shaders
models/players/xrobotx/default
{
	{
		map models/players/xrobotx/w_shine.tga
		rgbGen lightingDiffuse
		tcMod scroll 1 1
		tcGen environment 
	}
	{
		map models/players/xrobotx/default.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/default_f
{
	{
		map models/players/xrobotx/f_shine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/xrobotx/default_f.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/default_he
{
	{
		map models/players/xrobotx/w_shine.tga
		rgbGen lightingDiffuse
		tcMod scroll 1 1
		tcGen environment 
	}
	{
		map models/players/xrobotx/default_he.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Ghost's Shaders
models/players/klesk/ghost
{
	{
		map models/players/klesk/ghost.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/klesk/ghost_ffx.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen wave sin 1 1 0 0.25 
		tcMod scale 2 2
		tcMod scroll 3 2
	}
}

models/players/klesk/ghost_h
{
	{
		map models/players/klesk/ghost_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/klesk/ghost_fx.tga
		blendfunc add
		rgbGen wave sin 1 1 0 0.25 
	}
}

//Manuel's Shaders
models/players/ranger/manuel_h
{
	{
		map models/players/ranger/mshine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/ranger/manuel_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Janus' Shades
models/players/orbb/janus_h
{
	{
		map models/players/orbb/janus_h.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

models/players/orbb/janus
{
	{
		map models/players/orbb/janus.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

//Jamie's Shaders
models/players/mynx/jamie_s
{
	{
		map models/players/mynx/jamie_s.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/mynx/jamie_shine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Nunny's Shaders
models/players/mynx/nun_s
{
	{
		map models/players/mynx/nun_s.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/mynx/nun_shine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Honei's shades
models/players/bones/honei
{
	cull disable
	{
		map models/players/bones/honei.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//Laverne's shades
models/players/bones/laverne
{
	cull disable
	{
		map models/players/bones/laverne.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//Jed's shaders
models/players/razor/jed
{
	{
		map models/players/razor/jedlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/razor/jed.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/razor/jed_h
{
	{
		map models/players/razor/jedlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/razor/jed_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/razor/jed_g
{
	{
		map models/players/razor/jg_shine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Endo's shaders
models/players/xaero/endo_a
{
	cull disable
	{
		map models/players/xaero/endo_a.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//Wrecker's shaders
models/players/bitterman/wrecker
{
	{
		map models/players/bitterman/wreckerlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/bitterman/wrecker.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/bitterman/wrecker_h
{
	{
		map models/players/bitterman/wreckerlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/bitterman/wrecker_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Quota's Shaders
models/players/hunter/quota
{
	{
		map models/players/hunter/quotalight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/hunter/quota.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/hunter/quota_h
{
	{
		map models/players/hunter/quotalight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/hunter/quota_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Elia's Shaders
models/players/major/elia
{
	{
		map models/players/major/elialight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/major/elia.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/major/elia_h
{
	{
		map models/players/major/elialight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/major/elia_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Larsus' Shaders
models/players/visor/larsus
{
	{
		map models/players/visor/larsuslight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/visor/larsus.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//XrobotX's competition's Shaders
models/players/xrobotx/competition
{
	{
		map models/players/xrobotx/f_shine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xrobotx/competition.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/competition_he
{
	{
		map models/players/xrobotx/f_shine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xrobotx/competition_he.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/competition_f
{
	{
		map models/players/xrobotx/competition_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xrobotx/c_shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/xrobotx/red_f
{
	{
		map models/players/xrobotx/teamed_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xrobotx/r_shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/xrobotx/blue_f
{
	{
		map models/players/xrobotx/teamed_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xrobotx/b_shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Qruills' Shaders
models/players/sorlag/qruill
{
	{
		map models/players/sorlag/qruilllight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/sorlag/qruill.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Zombi's Shaders
models/players/ztroop/zombi_h
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi07
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi07.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi05
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi05.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi04
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi04.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi03
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi03.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi02
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi02.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi01
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi01.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi_f
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi_f.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//0Val's Shaders
models/players/tankjr/0val
{
	{
		map models/players/tankjr/0val_s.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/tankjr/0val.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}


textures/xfflatmap/xff_light3200
{
	q3map_lightimage textures/xfflatmap/xff_light_on.jpg
	qer_editorimage textures/xfflatmap/xff_light_on.jpg
	q3map_surfacelight 3200
	surfaceparm nolightmap
	{
		map textures/xfflatmap/xff_light_on.jpg // was $lightmap
	}
}

// Commander Keen

textures/bckeen/bonuscktu
{
    
        {
                map textures/bckeen/bonuscktu.tga
                alphaFunc GE128
		rgbGen identity
        }
}

//Shader Script that made all team-based model skins "glow"

//First stop, Anarki's
models/players/anarki/blue
{
	{
		map models/players/anarki/blue.tga
		rgbGen identity
	}
}

models/players/anarki/blue_g
{
	{
		map models/players/anarki/blue_g.tga
		rgbGen identity
	}
}

models/players/anarki/red
{
	{
		map models/players/anarki/red.tga
		rgbGen identity
	}
}

models/players/anarki/red_g
{
	{
		map models/players/anarki/red_g.tga
		rgbGen identity
	}
}

models/players/anarki/red_h
{
	{
		map models/players/anarki/red_h.tga
		rgbGen identity
	}
}

//Biker's
models/players/biker/blue
{
	{
		map models/players/biker/blue.tga
		rgbGen identity
	}
}

models/players/biker/blue_h
{
	{
		map models/players/biker/blue_h.tga
		rgbGen identity
	}
}

models/players/biker/red
{
	{
		map models/players/biker/red.tga
		rgbGen identity
	}
}

models/players/biker/red_h
{
	{
		map models/players/biker/red_h.tga
		rgbGen identity
	}
}

//Bitterman's
models/players/bitterman/blue
{
	{
		map models/players/bitterman/blue.tga
		rgbGen identity
	}
}

models/players/bitterman/h_blue
{
	{
		map models/players/bitterman/h_blue.tga
		rgbGen identity
	}
}

models/players/bitterman/red
{
	{
		map models/players/bitterman/red.tga
		rgbGen identity
	}
}

models/players/bitterman/h_red
{
	{
		map models/players/bitterman/h_red.tga
		rgbGen identity
	}
}

//Bones'
models/players/bones/blue
{
	{
		map models/players/bones/blue.tga
		alphaFunc GE128
		depthWrite
	rgbGen identity
	}
}

models/players/bones/red
{
	{
		map models/players/bones/red.tga
		alphaFunc GE128
		depthWrite
	rgbGen identity
	}
}

//Crash's
models/players/crash/blue
{
	{
		map models/players/crash/blue.tga
		rgbGen identity
	}
}

models/players/crash/blue_t
{
	{
		map models/players/crash/blue_t.tga
		rgbGen identity
	}
}


models/players/crash/red
{
	{
		map models/players/crash/red.tga
		rgbGen identity
	}
}

models/players/crash/red_t
{
	{
		map models/players/crash/red_t.tga
		rgbGen identity
	}
}

//Doom's
models/players/doom/blue
{
	{
		map models/players/doom/blue.tga
		rgbGen identity
	}
}

models/players/doom/red
{
	{
		map models/players/doom/red.tga
		rgbGen identity
	}
}

//Grunt's
models/players/grunt/blue
{
	{
		map models/players/grunt/blue.tga
		rgbGen identity
	}
}

models/players/grunt/blue_h
{
	{
		map models/players/grunt/blue_h.tga
		rgbGen identity
	}
}

models/players/grunt/red
{
	{
		map models/players/grunt/red.tga
		rgbGen identity
	}
}

models/players/grunt/red_h
{
	{
		map models/players/grunt/red_h.tga
		rgbGen identity
	}
}

//Hunter's
models/players/hunter/blue
{
	{
		map models/players/hunter/blue.tga
		rgbGen identity
	}
}

models/players/hunter/blue_h
{
	{
		map models/players/hunter/blue_h.tga
		rgbGen identity
	}
}

models/players/hunter/red
{
	{
		map models/players/hunter/red.tga
		rgbGen identity
	}
}

models/players/hunter/red_h
{
	{
		map models/players/hunter/red_h.tga
		rgbGen identity
	}
}

//Keel's
models/players/keel/blue
{
	{
		map models/players/keel/blue.tga
		rgbGen identity
	}
}

models/players/keel/blue_h
{
	{
		map models/players/keel/blue_h.tga
		rgbGen identity
	}
}

models/players/keel/red
{
	{
		map models/players/keel/red.tga
		rgbGen identity
	}
}

models/players/keel/red_h
{
	{
		map models/players/keel/red_h.tga
		rgbGen identity
	}
}

//Lucy's
models/players/lucy/blue
{
	{
		map models/players/lucy/blue.tga
		rgbGen identity
	}
}

models/players/lucy/blue_h
{
	{
		map models/players/lucy/blue_h.tga
		rgbGen identity
	}
}

models/players/lucy/red
{
	{
		map models/players/lucy/red.tga
		rgbGen identity
	}
}

models/players/lucy/red_h
{
	{
		map models/players/lucy/red_h.tga
		rgbGen identity
	}
}

//Major's
models/players/major/blue
{
	{
		map models/players/major/blue.tga
		rgbGen identity
	}
}

models/players/major/blue_h
{
	{
		map models/players/major/blue_h.tga
		rgbGen identity
	}
}

models/players/major/red
{
	{
		map models/players/major/red.tga
		rgbGen identity
	}
}

models/players/major/red_h
{
	{
		map models/players/major/red_h.tga
		rgbGen identity
	}
}

//Mynx's
models/players/mynx/blue_h
{
	{
		map models/players/mynx/blue_s.tga
		rgbGen identity
	}
}

models/players/mynx/blue_s
{
	{
		map models/players/mynx/blue_s.tga
		rgbGen identity
	}
}

models/players/mynx/red_s
{
	{
		map models/players/mynx/red_s.tga
		rgbGen identity
	}
}

models/players/mynx/red_h
{
	{
		map models/players/mynx/red_h.tga
		rgbGen identity
	}
}

//Ranger's
models/players/ranger/blue
{
	{
		map models/players/ranger/blue.tga
		rgbGen identity
	}
}

models/players/ranger/red
{
	{
		map models/players/ranger/red.tga
		rgbGen identity
	}
}

models/players/ranger/red_h
{
	{
		map models/players/ranger/red_h.tga
		rgbGen identity
	}
}

//Razor's
models/players/razor/blue
{
	{
		map models/players/razor/blue.tga
		rgbGen identity
	}
}

models/players/razor/red
{
	{
		map models/players/razor/red.tga
		rgbGen identity
	}
}

models/players/razor/h_blue
{
	{
		map models/players/razor/h_blue.tga
		rgbGen identity
	}
}

models/players/razor/h_red
{
	{
		map models/players/razor/h_red.tga
		rgbGen identity
	}
}

//Sarge's
models/players/sarge/blue
{
	{
		map models/players/sarge/blue.tga
		rgbGen identity
	}
}

models/players/sarge/red
{
	{
		map models/players/sarge/red.tga
		rgbGen identity
	}
}

//Slash's
models/players/slash/blue
{
	{
		map models/players/slash/blue.tga
		rgbGen identity
	}
}

models/players/slash/blue_h
{
	{
		map models/players/slash/blue_h.tga
		rgbGen identity
	}
}

models/players/slash/red
{
	{
		map models/players/slash/red.tga
		rgbGen identity
	}
}

models/players/slash/red_h
{
	{
		map models/players/slash/red_h.tga
		rgbGen identity
	}
}

//Tankjr's
models/players/tankjr/blue
{
	{
		map models/players/tankjr/blue.tga
		rgbGen identity
	}
}

models/players/tankjr/red
{
	{
		map models/players/tankjr/red.tga
		rgbGen identity
	}
}

//Visor's
models/players/visor/blue
{
	{
		map models/players/visor/blue.tga
		rgbGen identity
	}
}

models/players/visor/red
{
	{
		map models/players/visor/red.tga
		rgbGen identity
	}
}

//Xaero's
models/players/xaero/blue
{
	{
		map models/players/xaero/blue.tga
		rgbGen identity
	}
}

models/players/xaero/blue_h
{
	{
		map models/players/xaero/blue_h.tga
		rgbGen identity
	}
}

models/players/xaero/red
{
	{
		map models/players/xaero/red.tga
		rgbGen identity
	}
}

models/players/xaero/red_h
{
	{
		map models/players/xaero/red_h.tga
		rgbGen identity
	}
}

textures/x8b/cloudv01
{
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes move 32 32 32 sin 0 1 0 0.5 
	deformVertexes autosprite
	{
		map textures/x8b/cloudv01.tga
		rgbGen identity
		alphaFunc LT128
	}
}

textures/x8b/cloudv02
{
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes move 32 32 32 sin 0 1 0 0.32 
	deformVertexes autosprite
	{
		map textures/x8b/cloudv02.tga
		rgbGen identity
		alphaFunc LT128
	}
}

textures/x8b/cloudv03
{
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes move 32 32 32 sin 0 1 0 0.25 
	deformVertexes autosprite
	{
		map textures/x8b/cloudv03.tga
		rgbGen identity
		alphaFunc LT128
	}
}

textures/x8b/cloudflr01
{
	surfaceparm nomarks
	surfaceparm nosteps
	surfaceparm trans
	cull disable
	{
		map textures/x8b/cloudflr01.tga
		alphaFunc GE128
	}
}

textures/x8b/cloudflr02
{
	surfaceparm nomarks
	surfaceparm nosteps
	surfaceparm trans
	cull disable
	{
		map textures/x8b/cloudflr02.tga
		alphaFunc GE128
	}
}

textures/x8b/cloudflr03
{
	surfaceparm nomarks
	surfaceparm nosteps
	surfaceparm trans
	cull disable
	{
		map textures/x8b/cloudflr03.tga
		alphaFunc GE128
	}
}

textures/x8b/cloudflr04
{
	surfaceparm nomarks
	surfaceparm nosteps
	surfaceparm trans
	cull disable
	{
		map textures/x8b/cloudflr04.tga
		alphaFunc GE128
	}
}

textures/x8b/cloudflr05
{
	surfaceparm nomarks
	surfaceparm nosteps
	surfaceparm trans
	cull disable
	{
		map textures/x8b/cloudflr05.tga
		alphaFunc GE128
	}
}

textures/x8b/hearts01
{
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		animmap 3 textures/x8b/hearts01.tga textures/x8b/hearts02.tga 
		rgbGen identity
		alphaFunc GE128
	}
}

textures/x8b/heartbig
{
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		map textures/x8b/heartbig.tga
		rgbGen identity
		alphaFunc GE128
	}
}

textures/x8b/sun
{
	surfaceparm nonsolid
	surfaceparm trans
	deformVertexes autosprite
	{
		map textures/x8b/sun.tga
		rgbGen identity
		alphaFunc GE128
	}
}

textures/x8b/flwr01
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/flwr01.tga
		alphaFunc GE128
	}
}

textures/x8b/flwr02
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/flwr02.tga
		alphaFunc GE128
	}
}

textures/x8b/flwr03
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/flwr03.tga
		alphaFunc GE128
	}
}

textures/x8b/flwr04
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/flwr04.tga
		alphaFunc GE128
	}
}

textures/x8b/flwr05
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/flwr05.tga
		alphaFunc GE128
	}
}

textures/x8b/flaglettes
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/flaglettes.tga
		alphaFunc GE128
	}
}

textures/x8b/clothesline01
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/clothesline01.tga
		alphaFunc GE128
	}
}

textures/x8b/clothesline02
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/clothesline02.tga
		alphaFunc GE128
	}
}

textures/x8b/clothesline03
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/x8b/clothesline03.tga
		alphaFunc GE128
	}
}

textures/x8b/flwrs01
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		map textures/x8b/flwrs01.tga
		alphaFunc GE128
	}
}

textures/x8b/flwrs02
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		map textures/x8b/flwrs02.tga
		alphaFunc GE128
	}
}

textures/x8b/flwrs03
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	{
		map textures/x8b/flwrs03.tga
		alphaFunc GE128
	}
}

textures/x8b/puddle
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/x8b/puddle.tga
		blendfunc blend
		rgbGen identity
	}
}

textures/x8b/doorhl
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/doorhl.tga
		alphaFunc GE128
	}
}

textures/x8b/wallhl
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/wallhl.tga
		alphaFunc GE128
	}
}

textures/x8b/adbrd01
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/adbrd01.tga
		alphaFunc GE128
	}
}

textures/x8b/adbrd02
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/adbrd02.tga
		alphaFunc GE128
	}
}

textures/x8b/adbrd03
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/adbrd03.tga
		alphaFunc GE128
	}
}

textures/x8b/adbrd04
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/adbrd04.tga
		alphaFunc GE128
	}
}

textures/x8b/adbrd05
{
	surfaceparm nomarks
	surfaceparm playerclip
	cull disable
	{
		map textures/x8b/adbrd05.tga
		alphaFunc GE128
	}
}

textures/x8b/skyblue
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	{
		map textures/x8b/skyblue.tga
		rgbGen identity
	}
}

textures/x8b/noonblue
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	{
		map textures/x8b/noonblue.tga
		rgbGen identity
	}
}

textures/x8b/white
{
	surfaceparm noimpact
	surfaceparm nomarks
	{
		map textures/x8b/white.tga
		rgbGen identity
	}
}

textures/x8b/water01
{
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm water
	{
		animmap 1 textures/x8b/water01.tga textures/x8b/water02.tga 
		tcMod turb 0 0.16 0 0.16
	}
}

textures/x8b/title
{
	{
		map textures/x8b/title.tga
		blendfunc blend
	}
}

textures/x8b/exef
{
	surfaceparm nodlight
	surfaceparm nonsolid
	cull disable
	deformVertexes autosprite2
	{
		map textures/x8b/exef.tga
		blendfunc blend
	}
}


//Candy's shaders
models/players/crash/candy
{
	{
		map models/players/crash/candy.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/candy_t
{
	{
		map models/players/crash/candy_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/candy_f
{
	{
		map models/players/crash/candy_f.tga
		rgbGen identity
		tcGen environment 
	}
}

//Mint's shaders
models/players/crash/mint
{
	{
		map models/players/crash/mint.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/mint_t
{
	{
		map models/players/crash/mint_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/mint_f
{
	{
		map models/players/crash/mint_f.tga
		rgbGen identity
		tcGen environment 
	}
}

//Cocoa's shaders
models/players/crash/cocoa
{
	{
		map models/players/crash/cocoa.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/cocoa_t
{
	{
		map models/players/crash/cocoa_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/crash/candy_s.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/cocoa_f
{
	{
		map models/players/crash/cocoa_f.tga
		rgbGen identity
		tcGen environment 
	}
}


//Crisis' shaders
models/players/doom/crisis
{
	{
		map models/players/doom/dxf_glow.tga
		blendfunc gl_dst_alpha gl_dst_alpha
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/doom/crisis2.tga
		blendfunc gl_dst_color gl_one_minus_src_alpha
		rgbGen identity
	}
}

models/players/doom/crisis_f
{
	{
		map models/players/doom/xfd_vis.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/xfd_rfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/doom/gcamo_f
{
	{
		map models/players/doom/xfd_vis.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/xfd_fx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}


textures/dxfts/dxft_wall
{
	{
		map textures/dxfts/dxft_wall.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/dxfts/dxft_floor
{
	{
		map textures/dxfts/dxft_floor.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/dxfts/dxft_ceiling
{
	{
		map textures/dxfts/dxft_ceiling.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/dxfts/dxft_red
{
	{
		map textures/dxfts/dxft_red.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/dxfts/dxft_green
{
	{
		map textures/dxfts/dxft_green.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/dxfts/dxft_blue
{
	{
		map textures/dxfts/dxft_blue.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/dxfts/dxft_yellow
{
	{
		map textures/dxfts/dxft_yellow.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/dxfts/xfctinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}


//Bitterman's Shaders
models/players/bitterman/xfkv
{
	{
		map models/players/bitterman/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/bitterman/h_xfkv
{
	{
		map models/players/bitterman/h_xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Crash's Shaders
models/players/crash/xfkv
{
	{
		map models/players/crash/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/xfkv_t
{
	{
		map models/players/crash/xfkv_t.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/crash/xfkv_f
{
	{
		map models/players/xkvshine/shine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc add
		rgbGen identity
		tcMod rotate 16
		tcGen environment 
	}
}

//Doom's Shaders
models/players/doom/xfkv
{
	{
		map models/players/doom/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/doom/xfkv_f
{
	{
		map models/players/xkvshine/shine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0.5 0.5
		tcMod rotate 1
		tcGen environment 
	}
}

//Grunt's Shaders
models/players/grunt/xfkv
{
	{
		map models/players/grunt/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/grunt/xfkv_h
{
	{
		map models/players/grunt/xfkv_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Major's Shaders
models/players/major/xfkv
{
	{
		map models/players/major/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/major/xfkv_h
{
	{
		map models/players/major/xfkv_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Sarge's Shaders
models/players/sarge/xfkv
{
	{
		map models/players/sarge/xfkv.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xkvshine/shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}


textures/xfkvtex/xfkvdirt
{
	{
		map textures/xfkvtex/xfkvdirt.jpg
		rgbGen identity
		tcGen environment
	}
}

textures/xfkvtex/xfkvconc
{
	{
		map textures/xfkvtex/xfkvconc.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xfkvtex/xfkvtinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/xfkvtex/xfkvdesigned
{
	{
		map textures/xfkvtex/xfkvdesigned.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xfkvtex/xfkvtinfx.tga
		blendfunc gl_dst_alpha gl_dst_alpha
		rgbGen identity
		tcGen environment 
	}
}

textures/xfkvtex/xfkvdiam01
{
	{
		map textures/xfkvtex/xfkvdiam01.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xfkvtex/xfkvtinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/xfkvtex/xfkvdiam02
{
	{
		map textures/xfkvtex/xfkvdiam02.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xfkvtex/xfkvtinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/xfkvtex/xfkvfloordia
{
	{
		map textures/xfkvtex/xfkvfloordia.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xfkvtex/xfkvtinfx.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

textures/xfkvtex/xfkvrough
{
	{
		map textures/xfkvtex/xfkvrough.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xfkvtex/xfkvtinfx.tga
		blendfunc gl_dst_alpha gl_dst_alpha
		rgbGen identity
		tcGen environment 
	}
}


//m10r shades
models/players/bones/m10r
{
	cull disable
	{
		map models/players/bones/m10r.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//xgk shades
models/players/uriel/xgk
{
	cull disable
	{
		map models/players/uriel/xgk.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/uriel/ucodes.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/uriel/xgk_h
{
	{
		map models/players/uriel/xgk_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/uriel/ucodes.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Zap's Shades
models/players/orbb/zap_h
{
	{
		map models/players/orbb/zap_h.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

models/players/orbb/zap
{
	{
		map models/players/orbb/zap.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

//Fluid's Skin Shaders
models/players/keel/fluid
{
	{
		map models/players/keel/xslime.tga
		rgbGen identity
		tcMod scroll 0.075 0.075
		tcMod turb 0 0 0 0
		tcMod scale 10 10
	}
	{
		map models/players/keel/fluid.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/keel/fluid_h
{
	{
		map models/players/keel/xslime.tga
		rgbGen identity
		tcMod scroll 0.05 0.05
		tcMod turb 0 0.1 0 0.1
		tcMod scale 1 1
	}
	{
		map models/players/keel/fluid_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Yeah!
models/players/binary/bin
{
	{
		map models/players/binary/nos.tga
		blendfunc add
		rgbGen identity
		tcMod scroll 0 0.05
		tcMod turb 0 0 0 0.1
		tcMod scale 1 1
		depthWrite
	}
	{
		map models/players/binary/bin.tga
		blendfunc gl_one gl_one_minus_src_color
		rgbGen identity
		tcMod scale 1 1
		tcMod scroll 0 -0.5
		depthWrite
	}
}

//Taste the rainbow.
models/players/binary/error
{
	{
		map models/players/binary/error.tga
		rgbGen identity
		tcMod scale 0.025 0.025
		tcMod scroll 0 2
		depthWrite
	}
}

//xrobotx's neck shader
models/players/xrobotx/invisi
{
	cull disable
	{
		map models/players/xrobotx/invisi.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Xyril's Robot Shades (experiment)
models/players/xrobotx/xrobotx
{
	{
		map models/players/xrobotx/wir.tga
		rgbGen identity
		tcMod scroll 0.05 0
		tcMod turb 0 0 0 0
		tcMod scale 3 3
	}
	{
		map models/players/xrobotx/xrobotx.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/xrobotx_he
{
	{
		map models/players/xrobotx/wir.tga
		rgbGen identity
		tcMod scroll 0.05 0
		tcMod turb 0 0 0 0
		tcMod scale 3 3
	}
	{
		map models/players/xrobotx/xrobotx_he.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/xrobotx_f
{
	{
		map models/players/xrobotx/wir.tga
		rgbGen identity
		tcMod scroll 0.2 0
		tcMod turb 0 0 0 0
		tcMod scale 0.1 0.07
	}
	{
		map models/players/xrobotx/xrobotx_f.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//le feline's shaders
models/players/mynx/lfeline_s
{
	{
		map models/players/mynx/lf_beam.tga
		rgbGen identity
		tcMod scale 1 0.5
		tcMod scroll 0 -1
	}
	{
		map models/players/mynx/lfeline_s.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
}

//robert's shaders
models/players/lucy/robert_h
{
	{
		map models/players/lucy/rainbows.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcMod scroll 0 0.5
		tcGen environment 
	}
	{
		map models/players/lucy/robert_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/lucy/robert
{
	{
		map models/players/lucy/rainbows.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcMod scroll 0 0.5
		tcGen environment 
	}
	{
		map models/players/lucy/robert.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Alpha's shaders
models/players/major/alpha
{
	{
		map models/players/major/alphalight.tga
		tcGen environment 
	}
	{
		map models/players/major/alpha.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
}

//Vector's Shaders
models/players/doom/vector
{
	{
		map models/players/doom/vector.tga
		rgbGen identity
	}
	{
		map models/players/doom/vwhite.tga
		blendfunc filter
		tcGen environment 
	}
}

//Raxar's Shades
models/players/xaero/raxar
{
	{
		map models/players/xaero/gshine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xaero/raxar.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xaero/raxar_h
{
	{
		map models/players/xaero/gshine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xaero/raxar_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/players/xaero/raxar_a
{
	{
		map models/players/xaero/gshine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xaero/raxar_a.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Sunburn's Shaders
models/players/tankjr/sunburn
{
	{
		map models/players/tankjr/sblight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/tankjr/sunburn.tga
		blendfunc gl_one gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
}

//Sakura's Shaders
models/players/slash/sakura
{
	{
		map models/players/slash/sakura.tga
		rgbGen identity
	}
	{
		map models/players/slash/sshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		tcGen environment 
	}
	{
		map models/players/slash/swhite.tga
		blendfunc filter
		tcGen environment 
	}
}

models/players/slash/sakura_h
{
	{
		map models/players/slash/sakura_h.tga
		rgbGen identity
	}
	{
		map models/players/slash/sshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		tcGen environment 
	}
	{
		map models/players/slash/swhite.tga
		blendfunc filter
		tcGen environment 
	}
}

models/players/slash/sakuraskate
{
	cull disable
	{
		map models/players/slash/sakuraskate.tga
		tcMod turb 0 0.07 0 0.07
		alphaFunc GE128
	}
}

//Private's Shaders
models/players/razor/xprivate
{
	{
		map models/players/razor/xprivate.tga
		rgbGen identity
	}
	{
		map models/players/razor/pshade.tga
		blendfunc filter
		tcGen environment 
	}
	{
		map models/players/razor/pbin.tga
		blendfunc gl_one_minus_dst_alpha gl_dst_alpha
		tcMod scroll 0.05 0
		tcMod scale 5 5
	}
}

models/players/razor/xprivate_h
{
	{
		map models/players/razor/xprivate_h.tga
		rgbGen identity
	}
	{
		map models/players/razor/pshade.tga
		blendfunc filter
		tcGen environment 
	}
	{
		map models/players/razor/pshine.tga
		blendfunc gl_one_minus_dst_alpha gl_dst_alpha
		rgbGen identity
	}
}

models/players/razor/p_gog
{
	{
		map models/players/razor/p_gog.tga
		rgbGen identityLighting
	}
	{
		map models/players/razor/pshine.tga
		blendfunc gl_one_minus_dst_alpha gl_dst_alpha
		tcMod scroll 2 1
	}
}

//Fracture's Shaders
models/players/visor/fracture
{
	{
		animmap 8 models/players/visor/sfxfract01.tga models/players/visor/sfxfract02.tga models/players/visor/sfxfract03.tga models/players/visor/sfxfract04.tga models/players/visor/sfxfract05.tga models/players/visor/sfxfract06.tga models/players/visor/sfxfract07.tga models/players/visor/sfxfract08.tga 
		rgbGen identity
		tcMod scale 0.64 0.64
		tcMod scroll 3 0.25
		alphaFunc GE128
	}
	{
		animmap 30 models/players/visor/fractureb01.tga models/players/visor/fractureb02.tga models/players/visor/fractureb04.tga models/players/visor/fractureb03.tga models/players/visor/fractureb05.tga models/players/visor/fractureb01.tga models/players/visor/fractureb02.tga models/players/visor/fractureb05.tga 
		blendfunc add
		rgbGen identity
		alphaFunc GE128
	}
}

//Grelis' Shaders
models/players/sorlag/grelis
{
	{
		animmap 3 models/players/sorlag/grelis.tga models/players/sorlag/grelis_02.tga models/players/sorlag/grelis_03.tga models/players/sorlag/grelis_04.tga models/players/sorlag/grelis_05.tga 
		rgbGen lightingDiffuse
	}
	{
		map models/players/sorlag/gshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identityLighting
		tcGen environment 
	}
}

models/players/sorlag/grelis_t
{
	{
		animmap 3 models/players/sorlag/grelis_t.tga models/players/sorlag/grelis_t02.tga models/players/sorlag/grelis_t03.tga models/players/sorlag/grelis_t04.tga models/players/sorlag/grelis_t05.tga 
		rgbGen lightingDiffuse
	}
	{
		map models/players/sorlag/gshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Noob's Shaders
models/players/ranger/noob
{
	{
		map models/players/ranger/noob.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/ranger/nshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/ranger/noob_h
{
	{
		map models/players/ranger/noob_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/ranger/nhshine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen wave sin 0 1 0 0.5 
		tcMod rotate 180
	}
}

//Black Hombre's Shaders
models/players/biker/bhombre
{
	{
		map models/players/biker/bhombre.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/biker/sweats.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

models/players/biker/bhombre_h
{
	{
		map models/players/biker/bhombre_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/biker/sweats.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Spectre's Shaders
models/players/bitterman/spectre
{
	{
		map models/players/bitterman/spectre.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/bitterman/swir.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcMod scroll 1 1
		tcGen environment 
	}
}

models/players/bitterman/h_spectre
{
	{
		map models/players/bitterman/h_spectre.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/bitterman/swir.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcMod scroll 1 1
		tcGen environment 
	}
}

//4n4rki's Shaders
models/players/anarki/4n4rk1
{
	{
		map models/players/anarki/4n4rk1.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g1.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

models/players/anarki/4n4rk1_b
{
	{
		map models/players/anarki/4n4rk1_b.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g4.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

models/players/anarki/4n4rk1_g
{
	{
		map models/players/anarki/4n4rk1_g.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g3.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

models/players/anarki/4n4rk1_h
{
	{
		map models/players/anarki/4n4rk1_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/anarki/4n4rk1_s.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/anarki/4n4rk1_g2.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.25 
	}
}

//Darkmatter's Shaders
models/players/sarge/dmat
{
	{
		map models/players/sarge/dmatshine.tga
		rgbGen lightingDiffuse
		tcMod scroll 0.08 0
		tcGen environment 
	}
	{
		map models/players/sarge/sdmat.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
	{
		map models/players/sarge/dmat.tga
		blendfunc blend
		rgbGen identityLighting
	}
}

//Deimos' Shaders
models/players/doom/deimos
{
	{
		map models/players/doom/deimos.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/deimosfx.tga
		blendfunc gl_dst_color gl_one
		rgbGen lightingDiffuse
		tcMod scroll 0 0.25
		tcGen environment 
	}
}

models/players/doom/deimos_f
{
	{
		map models/players/doom/deimos_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/doom/deimos_fx.tga
		rgbGen lightingDiffuse
		tcMod scroll 0.16 0.16
		tcMod scale 1 1
		tcGen environment 
	}
}

//Fragbait's Shader
models/players/crash/fragbait_f
{
	{
		map models/players/crash/fragbait_f.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Kristis's Shader
models/players/crash/kristi_f
{
	{
		map models/players/crash/kristi_f.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Hilda's Shader
models/players/crash/hilda_f
{
	{
		map models/players/crash/hilda_f.tga
		rgbGen identity
		tcGen environment 
	}
}

//Warlord's Shaders
models/players/xrobotx/default
{
	{
		map models/players/xrobotx/w_shine.tga
		rgbGen lightingDiffuse
		tcMod scroll 1 1
		tcGen environment 
	}
	{
		map models/players/xrobotx/default.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/default_f
{
	{
		map models/players/xrobotx/f_shine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/xrobotx/default_f.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/default_he
{
	{
		map models/players/xrobotx/w_shine.tga
		rgbGen lightingDiffuse
		tcMod scroll 1 1
		tcGen environment 
	}
	{
		map models/players/xrobotx/default_he.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Ghost's Shaders
models/players/klesk/ghost
{
	{
		map models/players/klesk/ghost.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/klesk/ghost_ffx.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen wave sin 1 1 0 0.25 
		tcMod scale 2 2
		tcMod scroll 3 2
	}
}

models/players/klesk/ghost_h
{
	{
		map models/players/klesk/ghost_h.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/klesk/ghost_fx.tga
		blendfunc add
		rgbGen wave sin 1 1 0 0.25 
	}
}

//Manuel's Shaders
models/players/ranger/manuel_h
{
	{
		map models/players/ranger/mshine.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/ranger/manuel_h.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

//Janus' Shades
models/players/orbb/janus_h
{
	{
		map models/players/orbb/janus_h.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

models/players/orbb/janus
{
	{
		map models/players/orbb/janus.tga
		rgbGen lightingDiffuse
		depthWrite
	}
	{
		map models/players/orbb/zap_hs.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen lightingDiffuse
		tcMod scroll -0.2 0.2
		tcGen environment 
	}
}

//Jamie's Shaders
models/players/mynx/jamie_s
{
	{
		map models/players/mynx/jamie_s.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/mynx/jamie_shine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Nunny's Shaders
models/players/mynx/nun_s
{
	{
		map models/players/mynx/nun_s.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/mynx/nun_shine.tga
		blendfunc gl_one_minus_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Honei's shades
models/players/bones/honei
{
	cull disable
	{
		map models/players/bones/honei.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//Laverne's shades
models/players/bones/laverne
{
	cull disable
	{
		map models/players/bones/laverne.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//Jed's shaders
models/players/razor/jed
{
	{
		map models/players/razor/jedlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/razor/jed.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/razor/jed_h
{
	{
		map models/players/razor/jedlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/razor/jed_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/razor/jed_g
{
	{
		map models/players/razor/jg_shine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
}

//Endo's shaders
models/players/xaero/endo_a
{
	cull disable
	{
		map models/players/xaero/endo_a.tga
		rgbGen lightingDiffuse
		depthWrite
		alphaFunc GE128
	}
}

//Wrecker's shaders
models/players/bitterman/wrecker
{
	{
		map models/players/bitterman/wreckerlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/bitterman/wrecker.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/bitterman/wrecker_h
{
	{
		map models/players/bitterman/wreckerlight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/bitterman/wrecker_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Quota's Shaders
models/players/hunter/quota
{
	{
		map models/players/hunter/quotalight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/hunter/quota.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/hunter/quota_h
{
	{
		map models/players/hunter/quotalight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/hunter/quota_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Elia's Shaders
models/players/major/elia
{
	{
		map models/players/major/elialight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/major/elia.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/major/elia_h
{
	{
		map models/players/major/elialight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/major/elia_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Larsus' Shaders
models/players/visor/larsus
{
	{
		map models/players/visor/larsuslight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/visor/larsus.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//XrobotX's competition's Shaders
models/players/xrobotx/competition
{
	{
		map models/players/xrobotx/f_shine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xrobotx/competition.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/competition_he
{
	{
		map models/players/xrobotx/f_shine.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/xrobotx/competition_he.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/xrobotx/competition_f
{
	{
		map models/players/xrobotx/competition_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xrobotx/c_shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/xrobotx/red_f
{
	{
		map models/players/xrobotx/teamed_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xrobotx/r_shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

models/players/xrobotx/blue_f
{
	{
		map models/players/xrobotx/teamed_f.tga
		rgbGen lightingDiffuse
	}
	{
		map models/players/xrobotx/b_shine.tga
		blendfunc gl_dst_alpha gl_one
		rgbGen identity
		tcGen environment 
	}
}

//Qruills' Shaders
models/players/sorlag/qruill
{
	{
		map models/players/sorlag/qruilllight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/sorlag/qruill.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//Zombi's Shaders
models/players/ztroop/zombi_h
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi_h.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi07
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi07.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi05
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi05.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi04
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi04.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi03
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi03.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi02
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi02.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi01
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen lightingDiffuse
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi01.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

models/players/ztroop/zombi_f
{
	{
		map models/players/ztroop/zombilight.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/ztroop/zombi_f.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}

//0Val's Shaders
models/players/tankjr/0val
{
	{
		map models/players/tankjr/0val_s.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map models/players/tankjr/0val.tga
		blendfunc gl_one gl_src_alpha
		rgbGen lightingDiffuse
	}
}


textures/xruins/xruin01
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin01.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin02
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin02.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin03
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin03.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin04
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin04.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin05
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin05.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin06
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin06.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin07
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin07.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin08
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin08.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin09
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin09.tga
		alphaFunc GE128
	}
}

textures/xruins/xruin10
{
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xruins/xruin10.tga
		alphaFunc GE128
	}
}


textures/xtoon_shaded/xtbrick
{
	{
		map textures/xtoon_shaded/xtbrick.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xtoon_shaded/xtsbrick.tga
		blendfunc blend
		rgbGen identity
	}
}

textures/xtoon_shaded/xtgrass
{
	{
		map textures/xtoon_shaded/xtgrass.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xtoon_shaded/xtsgrass.tga
		blendfunc blend
		rgbGen identity
	}
}

textures/xtoon_shaded/xtpave
{
	{
		map textures/xtoon_shaded/xtpave.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xtoon_shaded/xtspave.tga
		blendfunc blend
		rgbGen identity
	}
}

textures/xtoon_shaded/xtsand
{
	{
		map textures/xtoon_shaded/xtsand.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xtoon_shaded/xtssand.tga
		blendfunc blend
		rgbGen identity
	}
}

textures/xtoon_shaded/xtwood
{
	{
		map textures/xtoon_shaded/xtwood.tga
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
	{
		map textures/xtoon_shaded/xtswood.tga
		blendfunc blend
		rgbGen identity
	}
}

textures/xtoon_shaded/xtpave2
{
	qer_editorimage textures/xtoon_shaded/xtpave.tga
	{
		map textures/xtoon_shaded/ssnow.tga
		tcMod scroll 0.05 0.05
		tcGen environment 
	}
	{
		map textures/xtoon_shaded/xtpave.tga
		blendfunc filter
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
}

textures/xtoon_shaded/xtsand2
{
	qer_editorimage textures/xtoon_shaded/xtsand.tga
	{
		map textures/xtoon_shaded/ssnow.tga
		tcMod scroll 0.05 0.05
		tcGen environment 
	}
	{
		map textures/xtoon_shaded/xtsand.tga
		blendfunc filter
	}
	{
		map $lightmap 
		blendfunc filter
		tcGen lightmap 
	}
}

textures/xtoon_shaded/xtskynight
{
	{
		map textures/xtoon_shaded/xtskynight.tga
		rgbGen identity
	}
}

textures/xtoon_shaded/xtskynight2
{
	{
		map textures/xtoon_shaded/xtskynight2.tga
		rgbGen identity
	}
}

textures/xtoon_shaded/xtshadr
{
	surfaceparm nomarks
	{
		map textures/xtoon_shaded/xtshadr.tga
	}
}

textures/xtoon_shaded/xtshadw
{
	surfaceparm nomarks
	{
		map textures/xtoon_shaded/xtshadw.tga
	}
}


textures/xyhack_textures/gridnb0g
{
	surfaceparm nomarks
	cull disable
	{
		map textures/xyhack_textures/codes01.tga
		tcMod scale 1 0.25
		tcMod scroll 0 0.01
		alphaFunc GE128
	}
	{
		map textures/xyhack_textures/gridgreen.tga
		alphaFunc GE128
	}
}

textures/xyhack_textures/gridnb0y
{
	{
		map textures/xyhack_textures/hurtcode.tga
		tcMod scroll 0.05 0.01
	}
	{
		map textures/xyhack_textures/gridyellow.tga
		alphaFunc GE128
	}
}

textures/xyhack_textures/gridnb0b
{
	surfaceparm trans
	surfaceparm water
	{
		map textures/xyhack_textures/gridblue.tga
		blendfunc add
		tcMod turb 0 0.5 0 0.3
		alphaFunc GE128
	}
}

textures/xyhack_textures/gridnb0r
{
	surfaceparm nomarks
	{
		map textures/xyhack_textures/gridred.tga
		tcMod scroll 0 0.5
		alphaFunc GE128
	}
}

textures/xyhack_textures/sky_grid
{
	surfaceparm playerclip
	surfaceparm monsterclip
	q3map_surfacelight 1000
	{
		map textures/xyhack_textures/sky_grid.tga
	}
}

textures/xyhack_textures/codesmove01
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/codesmove01.tga
		blendfunc add
		tcMod scale 1 0.25
		tcMod scroll 0 0.05
		alphaFunc GE128
	}
}

textures/xyhack_textures/codesmove03
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/codesmove03.tga
		blendfunc add
		tcMod scale 1 0.25
		tcMod scroll 0 0.05
		alphaFunc GE128
	}
}

textures/xyhack_textures/codesmove02
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/codesmove01.tga
		blendfunc add
		tcMod scale 1 0.25
		tcMod scroll 0 -0.05
		alphaFunc GE128
	}
}

textures/xyhack_textures/hacked
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/hacked.tga
		blendfunc add
		tcMod scroll 0.5 0
		alphaFunc GE128
	}
}

textures/xyhack_textures/xydis
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/xydis.tga
		blendfunc add
		tcMod scroll 0.25 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/binhor01
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/binhor01.tga
		blendfunc add
		tcMod scale 1 1
		tcMod scroll 0.25 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/binhor02
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/binhor02.tga
		blendfunc add
		tcMod scale 1 1
		tcMod scroll 0.25 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/binver01
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/binver01.tga
		blendfunc add
		tcMod scale 1 1
		tcMod scroll 0 0.25
		alphaFunc GT0
	}
}

textures/xyhack_textures/binver02
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/binver02.tga
		blendfunc add
		tcMod scale 1 1
		tcMod scroll 0 0.25
		alphaFunc GT0
	}
}

textures/xyhack_textures/codeh01
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/codeh01.tga
		blendfunc add
		tcMod scale 1 1
		tcMod scroll 0.25 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/codeh02
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/codeh02.tga
		blendfunc add
		tcMod scale 1 1
		tcMod scroll 0.25 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/hallcmds
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/hallcmds.tga
		blendfunc add
		alphaFunc GT0
	}
}

textures/xyhack_textures/hurtcode
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/hurtcode.tga
		blendfunc add
		tcMod scroll 0.05 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/scode
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/scode.tga
		blendfunc add
		tcMod scroll 0.01 0
		alphaFunc GT0
	}
}

textures/xyhack_textures/warningcode
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/warningcode.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.3 
		alphaFunc GT0
	}
}

textures/xyhack_textures/xcsitem
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/xcsitem.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.3 
		alphaFunc GT0
	}
}

textures/xyhack_textures/xcsweap
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xyhack_textures/xcsweap.tga
		blendfunc add
		rgbGen wave sin 0 1 0 0.3 
		alphaFunc GT0
	}
}


textures/xytex_lots/xaneffingbird
{
	surfaceparm flesh
	surfaceparm nodamage
	surfaceparm nomarks
	surfaceparm trans
	{
		map textures/xytex_lots/xaneffingbird.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xbushlight
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xytex_lots/xbushlight.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xbushmed
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xytex_lots/xbushmed.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xbushsmall
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xytex_lots/xbushsmall.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xcactus
{
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm trans
	{
		map textures/xytex_lots/xcactus.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xcactussmall
{
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm trans
	cull disable
	{
		map textures/xytex_lots/xcactussmall.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xchainfence
{
	surfaceparm nomarks
	surfaceparm playerclip
	surfaceparm trans
	cull disable
	{
		map textures/xytex_lots/xchainfence.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xcocosun
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xytex_lots/xcocosun.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xgrassline
{
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	{
		map textures/xytex_lots/xgrassline.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xinvisi
{
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm playerclip
	surfaceparm trans
	{
		map textures/xytex_lots/xinvisi.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xlesphinx
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xytex_lots/xlesphinx.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xpyramid
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xytex_lots/xpyramid.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xclearsky
{
	surfaceparm trans
	{
		map textures/xytex_lots/xclearsky.tga
	}
}

textures/xytex_lots/xclearskytop
{
	surfaceparm trans
	{
		map textures/xytex_lots/xclearskytop.tga
	}
}

textures/xytex_lots/xinvisinonsolid
{
	surfaceparm nonsolid
	surfaceparm trans
	{
		map textures/xytex_lots/xinvisi.tga
		alphaFunc GE128
	}
}


textures/x_commons/xskybox_sky
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 1000
	q3map_sun 1 1 1 0 160 66
	skyParms - 128 -
}

textures/x_commons/xskybox_sky500
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 500
	q3map_sun 1 1 1 0 160 66
	skyParms - 128 -
}

textures/x_commons/xskybox_sky250
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 250
	q3map_sun 1 1 1 0 160 66
	skyParms - 128 -
}

textures/x_commons/xskybox_sky50
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 50
	q3map_sun 1 1 1 0 160 66
	skyParms - 128 -
}

textures/x_commons/xskybox_sky100
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 100
	q3map_sun 1 1 1 0 160 66
	skyParms - 128 -
}

textures/xytex_lots/xinvisi
{
	surfaceparm nonsolid
	surfaceparm playerclip
	surfaceparm trans
	surfaceparm botclip
	{
		map textures/xytex_lots/xinvisi.tga
		alphaFunc GE128
	}
}

textures/xytex_lots/xbotnoway
{
	surfaceparm donotenter
}

textures/xytex_lots/xbotarea
{
	surfaceparm clusterportal
}

textures/xytex_lots/xslippery
{
	surfaceparm slick
}

textures/xytex_lots/xblock
{
	surfaceparm playerclip
}

textures/xytex_lots/xnodrop
{
	surfaceparm nodrop
}


menubacknologo
{
	nomipmaps
	{
		map gfx/q3amenbg/xfbackmenubg2.tga
		rgbGen identity
	}
}

menuback
{
	nomipmaps
	{
		map gfx/q3amenbg/xfbackmenubg1.tga
		rgbGen identity
	}
}

console
{
	nomipmaps
	{
		map gfx/q3amenbg/xfbackmenubg3.tga
	}
}

textures/pjw3dm6/t4_rock
{
 	qer_editorimage textures/pjw3dm6/rock.tga
	q3map_nonplanar
	q3map_shadeangle 89
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pjw3dm6/rock.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		tcMod scale 1.2 1.2
	}
	{
		map textures/pjw3dm6/rock_1.tga
		blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
		tcMod scale 0.7 0.7
	}
}

//slick version of metal-1
textures/pjw3dm6/metal-1_slick
{
	qer_editorimage textures/pjw3dm6/metal-1.tga
	surfaceparm slick
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pjw3dm6/metal-1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//modified id shader
textures/pjw3dm6/t4_slime
{
	qer_editorimage textures/liquids/slime7.tga
	q3map_lightimage textures/liquids/slime7.tga
	q3map_globaltexture
	qer_trans .5
	surfaceparm noimpact
	surfaceparm slime
	surfaceparm nolightmap
	surfaceparm trans		
	q3map_surfacelight 500
	q3map_lightsubdivide 32
	cull disable
	{
		map textures/liquids/slime7c.tga
		tcMod turb .3 .2 1 .05
		tcMod scroll .01 .01
	}
	{
		map textures/liquids/slime7.tga
		blendfunc GL_ONE GL_ONE
		tcMod turb .2 .1 1 .05
		tcMod scale .5 .5
		tcMod scroll .01 .01
	}
	{
		map textures/liquids/bubbles.tga
		blendfunc GL_ZERO GL_SRC_COLOR
		tcMod turb .2 .1 .1 .2
		tcMod scale .05 .05
		tcMod scroll .001 .001
	}		
}

//modified shaderlab shader--thanks ydnar!
textures/pjw3dm6/toxic_sky
{
    qer_editorimage textures/pjw3dm6/toxic.tga
   
    q3map_sunExt 1 1 1 105 -126 19 3 16
    q3map_lightmapFilterRadius 0 64
    q3map_skyLight 100 3
   
    nopicmip
   
    surfaceparm sky
    surfaceparm noimpact
    surfaceparm nolightmap
   
    skyparms textures/pjw3dm6/black 480 -
   
    {
        map textures/pjw3dm6/clouds_2.tga
        tcMod scale 3 3
        tcMod scroll 0.01 0.0175
        rgbGen identityLighting
    }
    {
        clampMap textures/pjw3dm6/toxic.tga
        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_COLOR
        tcMod transform 0.75 0 0 0.75 -0.678 -0.678
        tcMod stretch sin 1 0.1 0 .04
        rgbGen identityLighting
    }
}

//vertexremap shader
textures/pjw3dm6/vx_toxic_sky
{
    qer_editorimage textures/pjw3dm6/toxic.tga
   
    q3map_sunExt 1 1 1 105 -126 19 3 16
    q3map_lightmapFilterRadius 0 64
    q3map_skyLight 100 3
   
    nopicmip
   
    surfaceparm sky
    surfaceparm noimpact
    surfaceparm nolightmap
   
    skyparms textures/pjw3dm6/black 480 -
}

//thanks ydnar!
textures/pjw3dm6/dm6water
 {
	qer_editorimage textures/pjw3dm6/water.tga
	qer_trans 0.5
	
	q3map_lightSubdivide 256
	q3map_surfacelight 10
	
	surfaceparm water
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	
	cull none
	{  
		map textures/pjw3dm6/water.tga  
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR  
		tcGen vector ( 0.004 0 0 ) ( 0 0.004 0 )  
		tcMod scroll -0.005 -0.015  
	}  
	{  
		map textures/pjw3dm6/water.tga  
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR  
		tcGen vector ( 0.006 0 0 ) ( 0 0.006 0 )  
		tcMod scroll 0.0075 0.03  
	}  
	{  
		map $lightmap  
		blendFunc GL_DST_COLOR GL_ONE  
	}
}

textures/pjw3dm6/pjw3t4invisowater
{
	qer_editorimage textures/common/white.tga
	surfaceparm nodraw
	surfaceparm noimpact
	surfaceparm trans
	surfaceparm water
	qer_trans 0.4
}

//modified id shader
textures/pjw3dm6/pjw3t4plat
{
	qer_editorimage textures/base_support/x_support3.tga
	surfaceparm metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
	surfaceparm nonsolid	
	cull none
        nopicmip
	{
		map textures/base_support/x_support3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

//modified id shader
textures/pjw3dm6/blackness
{
	qer_editorimage textures/skies/blacksky.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	{
		map gfx/colors/black.tga
	}
}

//modified id shader
textures/pjw3dm6/pjwt4_proto_fence
{
	qer_editorimage textures/base_trim/proto_fence.tga
	surfaceparm trans
	surfaceparm nolightmap		
	cull disable
        nopicmip
	sort 10
	{
		map textures/base_trim/proto_fence.tga
		tcMod scale 3 3
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		//depthWrite
		rgbGen vertex
	}
}

//GothLamp/associated files courtesy of AtriaLenkki, HomePage: www.planetquake.com/q3empire
//Note: shaders for gothlamp have been corrected--(all "\" changed to "/"), and surfaceparm
//trans added; rgbGen const line added to reduce contrast when autosprite intersected wall,
//q3map_surfacelight also removed.

models/mapobjects/bfp/gothl_pjwt4/gothl_lampscreen
{
	surfaceparm trans
	{
		map models/mapobjects/bfp/gothl_pjwt4/gothl_lampscreen.tga
		//blendfunc gl_one_minus_dst_alpha gl_src_color
		blendfunc add

	}
}

models/mapobjects/bfp/gothl_pjwt4/gothl_bulp
{
	surfaceparm trans
	{
		map models/mapobjects/bfp/gothl_pjwt4/gothl_bulp.tga
		blendfunc add
	}
}

models/mapobjects/bfp/gothl_pjwt4/gothl_glow
{
	deformvertexes autosprite
	surfaceparm trans
	{
		map models/mapobjects/bfp/gothl_pjwt4/gothl_glow.tga
		rgbGen const ( 0.25 0.25 0.25 )
		blendfunc add
	}
}

//cloud layer courtesy of ydnar--thanks ydnar!
textures/pjw3dm6/brick_dirty_windowed
{
	// moving cloud reflection
	{  
		map textures/pjw3dm6/clouds_2.tga
		tcGen environment
		tcMod scroll 0.03 0.01
		tcMod scale 5 5  
		rgbGen identityLighting  
	}  
	// actual window texture w/alpha channel
	{
		map textures/pjw3dm6/brick_dirty_windowed.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//cloud layer courtesy of ydnar--thanks ydnar!
textures/pjw3dm6/brick_dirty_window_big_c
{
	qer_editorimage textures/pjw3dm6/brick_dirty_window_big.tga
	// moving cloud reflection
	{  
		map textures/pjw3dm6/clouds_2.tga
		tcGen environment
		tcMod scroll 0.03 0.01
		tcMod scale 5 5 
		rgbGen identityLighting  
	}  
	// actual window texture w/alpha channel
	{
		map textures/pjw3dm6/brick_dirty_window_big.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

//steam courtesy of The5thHorseman

textures/pjw3dm6/steam1
{
    qer_editorimage textures/pjw3dm6/steam_view.tga
    qer_trans 0.5
    qer_nocarve
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nonsolid
    surfaceparm pointlight
    deformVertexes wave 50 sin 0 3 0 .3
    deformVertexes move .3 .1 0  sin 0 .5 0 0.2
	{
		map textures/pjw3dm6/steam.tga
                tcmod scroll 0 0.3
		blendFunc blend
		rgbGen vertex
	}
}

textures/pjw3dm6/steam_slow
{
    qer_editorimage textures/pjw3dm6/steam_view.tga
    qer_trans 0.5
    qer_nocarve
    cull disable
    deformVertexes autoSprite2
    surfaceparm trans
    surfaceparm nomarks
    surfaceparm nonsolid
    surfaceparm pointlight
    deformVertexes wave 50 sin 0 3 0 .3
    deformVertexes move .3 .1 0  sin 0 .5 0 0.2
	{
		map textures/pjw3dm6/steam.tga
                tcmod scroll 0 0.03
		blendFunc blend
		rgbGen vertex
	}
}

textures/pjw3dm6/vines
{
	qer_editorimage textures/pjw3dm6/vines.tga
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	nopicmip

	{
		map textures/pjw3dm6/vines.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

// "guns" neon sign
// (c) 2004 randy reddig

textures/pjw3dm6/guns_sign_base
{
	q3map_lightImage textures/pjw3dm6/guns_sign_lights_1.tga
	q3map_surfaceLight 225
	
	// NOTE: do not use the following two lines
	// q3map_tcMod scale 0.25 0.25
	// q3map_cloneShader textures/pjw3dm6/guns_sign_frame_neon_broken
	
	{
		map $lightmap
		rgbGen identity
		tcGen lightmap
	}
	q3map_styleMarker
	{
		map textures/pjw3dm6/guns_sign_base.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/pjw3dm6/guns_sign_lights_3.tga
		rgbGen wave triangle 0.1 1 0 2
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/pjw3dm6/guns_sign_lights_2.tga
		rgbGen wave triangle 0.1 1 0.33 2
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/pjw3dm6/guns_sign_lights_1.tga
		rgbGen wave triangle 0.1 1 0.66 2
		blendFunc GL_ONE GL_ONE
	}
}


textures/pjw3dm6/guns_sign_frame_neon
{
	q3map_lightImage textures/pjw3dm6/guns_sign_neon.tga
	q3map_surfaceLight 400
	
	surfaceparm pointlight
	surfaceparm trans
	
	cull none
	
	{
		map textures/pjw3dm6/guns_sign_frame.tga
		rgbGen vertex
		alphaFunc GE128
		depthWrite
	}
	{
		map textures/pjw3dm6/guns_sign_neon.tga
		rgbGen identity
		blendFunc GL_ONE GL_ONE
	}
}


textures/pjw3dm6/guns_sign_frame_neon_broken
{
	q3map_lightImage textures/pjw3dm6/guns_sign_neon.tga
	q3map_surfaceLight 400
	//q3map_lightStyle 1
	
	// NOTE: do not use the following two lines
	// q3map_tcMod scale 0.25 0.25
	// q3map_offset 4
	
	surfaceparm pointlight
	surfaceparm trans
	
	cull none
	
	{
		map textures/pjw3dm6/guns_sign_frame.tga
		rgbGen vertex
		alphaFunc GE128
		depthWrite
	}
	{
		map textures/pjw3dm6/guns_sign_neon.tga
		rgbGen wave noise 0.5 1 0 5.37
		blendFunc GL_ONE GL_ONE
	}
}

//courtesy of ydnar
textures/pjw3dm6/skyfog  
{  
	qer_editorimage textures/sfx/fog_grey.tga
	cull none  
	surfaceparm nolightmap  
	surfaceparm nonsolid  
	surfaceparm trans  
	{  
		map $whiteimage  
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA  
		rgbGen const ( 0.73 0.74 0.75 )  
		alphaGen const 0.125  
	}  
}

textures/q3fig/clear_ripple1_pipe
	{
		qer_editorimage textures/liquids/pool3d_3.tga
		q3map_globaltexture
		cull disable
	
		{
			map textures/q3fig/blue.tga
		}
		
		{ 
			map textures/liquids/pool3d_5.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .9 .9
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .9 .9
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .9
			tcmod scroll .001 .025
		}

		{
			map textures/effects/tinfx2.tga
            tcgen environment
			blendFunc GL_ONE GL_ONE
			rgbGen identity
		}		

		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
}

textures/ql/telex
{
	qer_editorimage textures/ql/telex.tga
	surfaceparm nonsolid
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	nopicmip
	polygonOffset 
	sort 6
	{
		map textures/ql/telex.tga
		blendfunc add
	}
}

textures/shw/panel_01_01
{    
    surfaceparm	metalsteps	   
    {
		map textures/effects/tinfx.jpg
        tcGen environment
        blendfunc GL_ONE GL_ZERO
        rgbGen identity
	}
    {
		map textures/shw/panel_01_01.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_01_nofx
{    
	qer_editorimage textures/shw/panel_01_01.tga
    surfaceparm	metalsteps	  
	{
		map $lightmap
		rgbGen identity
	}	
    {
		map textures/shw/panel_01_01.tga
		blendfunc filter
	}
}

textures/shw/panel_01_02
{    
	surfaceparm	metalsteps	           
    {
		map textures/effects/tinfx.jpg
        tcGen environment
        blendfunc GL_ONE GL_ZERO
        rgbGen identity
	}
    {
		map textures/shw/panel_01_02.tga
        blendfunc blend
		rgbGen identity
	}
        {
		map $lightmap
                blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_02_nofx
{      
	qer_editorimage textures/shw/panel_01_02.tga
	surfaceparm	metalsteps	           
	{
		map $lightmap
		rgbGen identity
	}	
    {
		map textures/shw/panel_01_02.tga
		blendfunc filter
	}
}

textures/shw/panel_01_03
{    
    surfaceparm	metalsteps	      
    {
		map textures/effects/tinfx.tga
        tcGen environment
        blendfunc GL_ONE GL_ZERO
        rgbGen identity
	}
    {
		map textures/shw/panel_01_03.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_03_nofx
{      
	qer_editorimage textures/shw/panel_01_03.tga
    surfaceparm	metalsteps	      
	{
		map $lightmap
		rgbGen identity
	}	
    {
		map textures/shw/panel_01_03.tga
		blendfunc filter
	}
}

textures/shw/panel_01_03a
{    
	qer_editorimage textures/shw/panel_01_03.tga
	surfaceparm	metalsteps	   
    {
		map textures/base_wall/chrome_env2.tga
        tcGen environment
        rgbGen identity
		tcmod scale .25 .25
	}
    {
		map textures/shw/panel_01_03.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_04
{    
    surfaceparm	metalsteps	       
    {
		map textures/effects/tinfx.jpg
		tcGen environment
        blendfunc GL_ONE GL_ZERO
        rgbGen identity
	}
    {
		map textures/shw/panel_01_04.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_04_nofx
{      
	qer_editorimage textures/shw/panel_01_04.tga
    surfaceparm	metalsteps	       
	{
		map $lightmap
		rgbGen identity
	}	
    {
		map textures/shw/panel_01_04.tga
		blendfunc filter
	}
}

textures/shw/panel_01_04a
{    
	surfaceparm	metalsteps	  
	qer_editorimage textures/shw/panel_01_04.tga    
    {
		map textures/base_wall/chrome_env2.tga
        tcGen environment
        rgbGen identity
		tcmod scale .25 .25
	}
    {
		map textures/shw/panel_01_04.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_05
{    
    surfaceparm	metalsteps	   
    {
		map textures/effects/tinfx.jpg
        tcGen environment
        blendfunc GL_ONE GL_ZERO
        rgbGen identity
	}
    {
		map textures/shw/panel_01_05.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_05_nofx
{      
	qer_editorimage textures/shw/panel_01_05.tga
    surfaceparm	metalsteps	   
	{
		map $lightmap
		rgbGen identity
	}	
    {
		map textures/shw/panel_01_05.tga
		blendfunc filter
	}
}

textures/shw/panel_01_06
{    
    surfaceparm	metalsteps	          
    {
		map textures/effects/tinfx.jpg
        tcGen environment
        blendfunc GL_ONE GL_ZERO
        rgbGen identity
	}
    {
		map textures/shw/panel_01_06.tga
        blendfunc blend
		rgbGen identity
	}
    {
		map $lightmap
        blendfunc filter
		rgbGen identity
	}
}

textures/shw/panel_01_06_nofx
{      
	qer_editorimage textures/shw/panel_01_06.tga
    surfaceparm	metalsteps	          
	{
		map $lightmap
		rgbGen identity
	}	
    {
		map textures/shw/panel_01_06.tga
		blendfunc filter
	}
}

textures/shw/clang_floor2_1
{
	surfaceparm	metalsteps		
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/shw/clang_floor2_1.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/q3fig/bounce_largerblock3b3dim
{

	//q3map_surfacelight 2000
	surfaceparm nodamage
	q3map_lightimage textures/sfx/jumppadsmall.tga	
	q3map_surfacelight 400

	
	{
		map textures/q3fig/bounce_largerblock3b3dim.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	
	{
		map textures/sfx/bouncepad01b_layer1.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 0 1.5	
	}

	{
		clampmap textures/sfx/jumppadsmall.tga
		blendfunc gl_one gl_one
		tcMod stretch sin 1.2 .8 0 1.5
		rgbGen wave square .5 .5 .25 1.5
	}

	//	END
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/gibs/gibs	// gib model texture
{
	{
		map models/gibs/xfgibs.jpg
	}
}

bloodTrail
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

textures/bh/metal_2
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_2.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_2x
{
	qer_editorimage textures/bh/metal_2.tga
	surfaceparm metalsteps
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_2.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_3
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_3.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_4
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_4.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_5
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_5.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_6
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_6.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_7
{
	surfaceparm metalsteps
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_7.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/metal_8_rocket
{
	qer_editorimage textures/bh/metal_8.tga
	surfaceparm metalsteps
	{
		map textures/bh/chrome_xg.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/metal_8.tga
		blendfunc gl_one gl_src_color
		rgbGen identity
	}
}

textures/bh/mast_tilt1
{
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	{
		map $lightmap 
		tcGen lightmap 
	}
	{
		map textures/bh/mast_tilt1.tga
		rgbGen Vertex
		alphaGen lightingSpecular
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.05 0.05
		tcGen environment 
	}
}

textures/bh/mast_tilt1x
{
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	{
		map $lightmap 
		tcGen lightmap 
	}
	{
		map textures/bh/mast_tilt1x.tga
		rgbGen Vertex
		alphaGen lightingSpecular
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcMod scale 0.05 0.05
		tcGen environment 
	}
}

textures/bh/wglass_1
{
	qer_editorimage textures/bh/wglass_1.tga
	surfaceparm metalsteps
	{
		map textures/bh/chrome_xg.tga
		rgbGen identity
		tcMod scale 0.25 0.25
		tcGen environment 
	}
	{
		map textures/bh/wglass_1.tga
		blendfunc gl_one_minus_dst_color gl_dst_alpha
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/chain_1
{
	surfaceparm alphashadow
	surfaceparm nonsolid
	cull disable
	{
		map textures/bh/chain_1.tga
		rgbGen identity
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackblackblack
{
	qer_editorimage textures/bh/blaaack.tga
	surfaceparm nodlight
	surfaceparm nodrop
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/bh/blaaack.tga
	}
}

textures/bh/wood_g1
{
	surfaceparm alphashadow
	surfaceparm nonsolid
	cull disable
	{
		map textures/bh/wood_g1.tga
		rgbGen identity
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

//textures/bh/qpirateflag
//{
//	surfaceparm alphashadow
//	surfaceparm noimpact
//	surfaceparm nomarks
//	surfaceparm nonsolid
//	surfaceparm trans
//	cull disable
//	deformVertexes wave 30 sin 0 3 0 0.2 
//	deformVertexes wave 100 sin 0 3 0 0.7 
//	tessSize 256
//	{
//		map textures/bh/qpirateflag.tga
//		rgbGen Vertex
//		depthWrite
//		alphaFunc GE128
//	}
//	{
//		map $lightmap 
//		blendfunc filter
//		rgbGen identity
//		tcGen lightmap 
//		depthFunc equal
//	}
//}
//textures/bh/qpirateflag
//{
//	surfaceparm alphashadow
//	surfaceparm noimpact
//	surfaceparm nomarks
//	surfaceparm nonsolid
//	sort banner
//	cull disable  
//	deformVertexes wave 30 sin 0 3 0 0.2 
//	deformVertexes wave 85 sin 0 0.5 0 0.65 
//	tessSize 256
//	{
//		map textures/bh/qpirateflag.tga
//		blendfunc blend
//		rgbGen Vertex
//		alphaFunc GE128
//	}
//}
textures/bh/qpirateflag
{
	surfaceparm alphashadow
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes wave 30 sin 0 3 0 0.2 
	deformVertexes wave 100 sin 0 3 0 0.7 
	tessSize 64
	{
		map textures/bh/qpirateflag.tga
		rgbGen Vertex
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

//textures/bh/qpirateflag_2
//{
//	qer_editorimage textures/bh/qpirateflag.tga
//	surfaceparm alphashadow
//	surfaceparm nomarks
//	surfaceparm trans 
//	surfaceparm nonsolid
//	cull disable
//	deformVertexes wave 30 sin 0 3 0 0.2 
//	deformVertexes wave 100 sin 0 3 0 0.7 
//	tessSize 64
//	{
//		map textures/bh/qpirateflag.tga
//		rgbGen Vertex
//		depthWrite
//		alphaFunc GE128
//	}
//	{
//		map $lightmap 
//		blendfunc filter
//		rgbGen identity
//		tcGen lightmap 
//		depthFunc equal
//	}
//}
textures/bh/jetfire_1fx
{
	q3map_lightimage textures/bh/jetfire_1fx.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	q3map_surfacelight 150
	{
		clampmap textures/bh/jetfire_1fx.tga
		tcMod rotate 20
	}
	{
		clampmap textures/bh/jetfire_1fx.tga
		blendfunc add
		rgbGen wave noise 0.01 0.6 0 0.5 
		tcMod rotate -200
	}
}

textures/bh/jetfire_1
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	deformVertexes autosprite2
	q3map_surfacelight 500
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
	}
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
		rgbGen wave noise 0.02 0.6 0 0.8 
	}
}

textures/bh/jetfire_1x
{
	qer_editorimage textures/bh/jetfire_1.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	q3map_surfacelight 250
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
	}
	{
		map textures/bh/jetfire_1.tga
		blendfunc add
		rgbGen wave noise 0.02 0.6 0 0.8 
	}
}

//
// Original skybox from Hipshot - Violentdays. Modified version by Martinus - Violentdays V2.
//
textures/bh/vdv2_sky
{
	qer_editorimage textures/bh/blaaack.tga
	q3map_lightimage env/vdv2_bk.tga
	surfaceparm nodlight
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm sky
	q3map_surfacelight 95
	q3map_sun 1 1 0.85098 75 305 25
	skyParms env/vdv2 128 -
}

textures/bh/pipe_1
{
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/pipe_1.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/spark
{
	q3map_lightimage textures/bh/spark.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	cull disable
	deformVertexes autosprite
	qer_trans 0.5
	q3map_surfacelight 150
	{
		clampmap textures/bh/spark.tga
		blendfunc add
	}
}

textures/bh/whiteeee
{
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm trans
	q3map_surfacelight 150
	{
		map textures/bh/whiteeee.tga
		blendfunc add
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/jummpad_effect_1
{
	qer_editorimage textures/bh/j_compass1.tga
	q3map_lightimage textures/bh/j_compass1.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	q3map_surfacelight 500
	{
		map textures/bh/j_compass1.tga
		blendfunc add
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/j_compass2.tga
		blendfunc add
		rgbGen wave triangle 0 1 0 0.5 
	}
}

textures/bh/jummpad_effect_2
{
	qer_editorimage textures/bh/j_effect1.tga
	q3map_lightimage textures/bh/j_effect1.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	q3map_surfacelight 200
	{
		map textures/bh/j_effect1.tga
		blendfunc add
		tcMod scroll -0.5 0
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/teleport_effect
{
	qer_editorimage textures/bh/compa2.tga
	q3map_lightimage textures/bh/compa2.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	deformVertexes autosprite
	q3map_surfacelight 300
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/compa2.tga
		blendfunc add
		tcMod rotate 8
	}
	{
		map textures/bh/compa2.tga
		blendfunc add
		tcMod rotate -8
	}
}

textures/bh/jummpad_effect_2x
{
	qer_editorimage textures/bh/j_effect1.tga
	q3map_lightimage textures/bh/j_effect1.tga
	surfaceparm nodamage
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	cull disable
	q3map_surfacelight 200
	{
		map textures/bh/j_effect1.tga
		blendfunc add
		tcMod scroll -0.5 0
	}
	{
		map textures/bh/j_effect1.tga
		blendfunc add
		tcMod scroll -0.75 0
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/bh_glass
{
	qer_editorimage textures/bh/chrome_xg.tga
	surfaceparm trans
	cull disable
	qer_trans 0.5
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_1
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_1.tga
	surfaceparm nonsolid
	{
		map textures/bh/chrome_xg.tga
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_2
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_1.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_1.tga
		rgbGen identity
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_3
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_2.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_2.tga
		rgbGen identity
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_4
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_3.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_3.tga
		rgbGen identity
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/blackh_compscreen_5
{
	qer_editorimage textures/bh/bh_comp.tga
	q3map_lightimage textures/bh/compscr_4.tga
	surfaceparm nonsolid
	q3map_surfacelight 1200
	{
		map textures/bh/compscr_4.tga
		rgbGen identity
		tcMod scroll 4 4
	}
	{
		map textures/bh/chrome_xg.tga
		blendfunc add
		rgbGen identity
		tcGen environment 
	}
	{
		map textures/bh/bh_comp.tga
		blendfunc blend
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
}

textures/bh/color_green
{
	qer_editorimage textures/bh/color_green.tga
	q3map_lightimage textures/bh/color_green.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 500
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/color_green.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/color_yellow
{
	qer_editorimage textures/bh/color_yellow.tga
	q3map_lightimage textures/bh/color_yellow.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 500
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/color_yellow.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/bh/color_white
{
	qer_editorimage textures/bh/color_white.tga
	q3map_lightimage textures/bh/color_white.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 500
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/bh/color_white.tga
		blendfunc filter
		rgbGen identity
	}
}


textures/aquamarine/poissonvert
{
        qer_editorimage textures/aquamarine/poissonvert.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aquamarine/poissonvert.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aquamarine/poissonjaune
{
        qer_editorimage textures/aquamarine/poissonjaune.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aquamarine/poissonjaune.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aquamarine/poisson
{
        qer_editorimage textures/aquamarine/poisson.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aquamarine/poisson.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aquamarine/alguet1
{
        qer_editorimage textures/aquamarine/alguet1.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aquamarine/alguet1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aquamarine/alguet2
{
        qer_editorimage textures/aquamarine/alguet2.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aquamarine/alguet2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
models/aaa/aaa/aaa
{
        qer_editorimage models/aaa/aaa/aaa.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map models/aaa/aaa/aaa.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
models/aaa/aaa/aaa2
{
        qer_editorimage models/aaa/aaa/aaa2.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map models/aaa/aaa/aaa2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aquamarine/cl
{
	q3map_lightimage textures/aquamarine/cl_glow.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/aquamarine/cl_glow.tga
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}	

	{
		map textures/aquamarine/cl.tga
		blendFunc blend
		rgbGen identity
	}
        
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/aquamarine/clb.tga
		blendFunc add
		rgbGen identity
	}

	
}

textures/aquamarine/g1
{
	qer_editorimage textures/aquamarine/g1.tga
	qer_trans .1
	surfaceparm trans
	surfaceparm nolightmap

	{
		map textures/aquamarine/g1.tga
		tcGen environment
		tcMod turb 0 0.01 0 0.01
		tcmod scroll .0 .0
		tcmod scale 1 3
		blendfunc GL_one gl_one
	}
}

textures/aaa/gm
{
	qer_editorimage textures/aaa/gm.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/mountain - -
}

textures/aaa/gm2
{
	qer_editorimage textures/aaa/gm2.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/arrakisday - -
}
textures/aaa/floor
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/aaa/floor.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/aaa/solm.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}
textures/aaa/f4
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/aaa/f4.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/aaa/light
{
	deformVertexes autoSprite
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/aaa/light.tga
		blendFunc GL_ONE GL_ONE
	}
}
models/aaa/aaa/aaa
{
        qer_editorimage models/aaa/aaa/aaa.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map models/aaa/aaa/aaa.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
models/aaa/aaa/aaa2
{
        qer_editorimage models/aaa/aaa/aaa2.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map models/aaa/aaa/aaa2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}



textures/aaa/branche
{
        qer_editorimage textures/aaa/branche.tga
        surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/branche.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/brancheB
{
        qer_editorimage textures/aaa/brancheB.tga
        surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/brancheB.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/arbre1
{
        qer_editorimage textures/aaa/arbre1.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/goldmoon/arbre1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/arbre2
{
        qer_editorimage textures/aaa/arbre2.tga
        surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/arbre2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/arbre3
{
        qer_editorimage textures/aaa/arbre3.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/arbre3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/arbre4
{
        qer_editorimage textures/aaa/arbre4.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/arbre4.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/arbre5
{
        qer_editorimage textures/aaa/arbre5.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/arbre5.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/aaa/ag
{
        qer_editorimage textures/aaa/ag.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/ag.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/jonc
{
        qer_editorimage textures/aaa/jonc.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/jonc.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/lotus
{
        qer_editorimage textures/aaa/lotus.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/lotus.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/aaa/poisson
{
        qer_editorimage textures/aaa/poisson.tga
    	surfaceparm trans
	surfaceparm nolightmap
	surfaceparm noshadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/aaa/poisson.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/goldmoon/gm
{
	qer_editorimage textures/goldmoon/gm.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/hexagon - -
}
textures/goldmoon/surface
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/goldmoon/surface.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/goldmoon/diamond
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/goldmoon/diamond.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/goldmoon/f4
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/goldmoon/f4.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/goldmoon/launchpad_gold
{
	{
		map $lightmap
		rgbGen identity
	}
	{ 
		map textures/goldmoon/launchpad_gold.tga
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{	
		map textures/sfx/launchpad_dot.tga
		blendfunc gl_one gl_one	
		rgbgen wave inversesawtooth 0 1 0 1	
	}
	{ 
		animmap 4 textures/sfx/launchpad_arrow.tga textures/sfx/launchpad_arrow2.tga textures/sfx/launchpad_arrow2.tga textures/sfx/launchpad_arrow2.tga
		blendfunc gl_one gl_one
		tcmod scroll 0 2
	}

}
textures/goldmoon/arbre1
{
        qer_editorimage textures/goldmoon/arbre1.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/goldmoon/arbre1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/goldmoon/arbre2
{
        qer_editorimage textures/goldmoon/arbre2.tga
        surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/goldmoon/arbre2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/goldmoon/arbre3
{
        qer_editorimage textures/goldmoon/arbre3.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/goldmoon/arbre3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/goldmoon/arbre4
{
        qer_editorimage textures/goldmoon/arbre4.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/goldmoon/arbre4.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/goldmoon/arbre5
{
        qer_editorimage textures/goldmoon/arbre5.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/goldmoon/arbre5.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
models/goldmoon/gmp/gmp
{
        qer_editorimage models/goldmoon/gmp/gmp.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map models/goldmoon/gmp/gmp.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}





textures/goldmoon/floor
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/goldmoon/floor.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/goldmoon/solm.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}

textures/goldmoon_light/light
{
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/goldmoon_light/light.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/goldmoon_light/light2
{
	deformVertexes autoSprite	
        surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/goldmoon_light/light2.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/mmm/gm
{
	qer_editorimage textures/mmm/gm.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/miramarg - -
}
textures/mmm/f1
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/mmm/f1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/mmm/solm.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}

textures/meka/gm
{
	qer_editorimage textures/meka/gm.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 2000
	q3map_sun 4 3 3 65 290 75
	skyparms - 2000 -
	nopicmip
	skyparms env/meka - -
}

textures/ddd/saa
{
	qer_editorimage textures/ddd/saa.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/miramarc - -
}

models/players/major/myrianerobot
{
        qer_editorimage models/players/major/myrianerobot.tga
    	//surfaceparm trans
	surfaceparm alphashadow
   	//surfaceparm nonsolid
	//cull disable
        //nopicmip
	{
		map models/players/major/myrianerobot.tga
		blendFunc GL_ONE GL_ONE
		alphaFunc GE128
		//depthWrite
		//rgbGen identity
	}
        {
		
                map models/mapobjects/bitch/hologirl2.tga
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}   
}
models/players/major/myrianerobot_h
{
        qer_editorimage models/players/major/myrianerobot_h.tga
    	//surfaceparm trans
	surfaceparm alphashadow
   	//surfaceparm nonsolid
	//cull disable
        //nopicmip
	{
		map models/players/major/myrianerobot_h.tga
		blendFunc GL_ONE GL_ONE
		alphaFunc GE128
		//depthWrite
		//rgbGen identity
	}
        {
		
                map models/mapobjects/bitch/hologirl2.tga
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}   
}



textures/nnn/surface
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/nnn/surface.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/nnn/light
{
	deformVertexes autoSprite
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/nnn/light.tga
		blendFunc GL_ONE GL_ONE
	}
}


models/players/slash/niria_h
{
        {
                map models/players/slash/grey.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/niria_h.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/slash/blue_h
{
        {
                map models/players/slash/grey.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/blue_h.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/slash/red_h
{
        {
                map models/players/slash/grey.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/red_h.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/slash/niria_h-roller
{
        {
                map models/players/slash/grey.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/niria_h-roller.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}

///////////////////////////////////////////////////////////////////////////////////
/////////			Samuel De Cruz
///////////////////////////////////////////////////////////////////////////////////


textures/cubex/fern
{
	qer_editorimage textures/cubex/fern.tga
	q3map_vertexScale 1.5
	qer_alphafunc greater 0.5
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	{
		map textures/cubex/fern.tga
		rgbGen vertex
		depthWrite
		alphaFunc GE128		
	}	
}

textures/cubex/star
{
	deformVertexes autoSprite
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

	{
		clampmap textures/cubex/star.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/cubex/www
{
    surfaceparm nolightmap
    surfaceparm pointlight
    q3map_surfacelight 100
    {
        map textures/cubex/glass2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/cubex/www.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/cubex/www.tga
		blendfunc add
	}

}

///////////////////////////////////////////////////////////////////////////////////
/////////			Samuel De Cruz
///////////////////////////////////////////////////////////////////////////////////


textures/orichalciane/aa
{
	qer_editorimage textures/orichalciane/aa.jpg
	q3map_globaltexture
	surfaceparm trans
	surfaceparm nolightmap
	cull disable

	{
		map textures/orichalciane/aa.jpg
		rgbGen identity
		blendfunc gl_one gl_one
	}
}

textures/aap/plantea
{
	qer_editorimage textures/aap/plantea.tga
	q3map_vertexScale 1.5
	qer_alphafunc greater 0.5
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	{
		map textures/aap/plantea.tga
		rgbGen vertex
		depthWrite
		alphaFunc GE128		
	}	
}

textures/aap/planteb
{
	qer_editorimage textures/aap/planteb.tga
	q3map_vertexScale 1.5
	qer_alphafunc greater 0.5
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks
	cull none
	{
		map textures/aap/planteb.tga
		rgbGen vertex
		depthWrite
		alphaFunc GE128		
	}	
}

textures/cubex/dark
{
    surfaceparm nolightmap
    surfaceparm pointlight
    q3map_surfacelight 100
    {
        map textures/cubex/glass2.tga
        blendFunc GL_ONE GL_ZERO
        rgbGen identity
        tcGen environment
        tcMod scale 3 3
    }
    {
        map textures/cubex/dark.tga
        blendFunc GL_ONE GL_SRC_ALPHA
        rgbGen vertex
    }
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/cubex/dark.tga
		blendfunc add
	}

}

textures/obsidianne/skk
{
	qer_editorimage textures/obsidianne/skk.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/skk - -
}

textures/ccc/gm
{
	qer_editorimage textures/ccc/gm.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/miramarr - -
}

textures/robot/gm
{
	qer_editorimage textures/robot/gm.tga
	q3map_lightimage textures/sfx/portalfog.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightsubdivide 512
	q3map_sun 0.266383 0.274632 0.358662 150 90 80
	q3map_surfacelight 100
	skyparms env/cybortech512 - -
}
textures/robot/f4
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/robot/f4.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/robot/surface
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/robot/surface.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/robot/floor
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/robot/floor.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/robot/solm.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}
textures/robot/lia
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	//light1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/robot/lia.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/robot/lia.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/robot_sfx/w11c
{
	q3map_surfacelight 300
	q3map_lightimage textures/robot_trim/w11c_pulse1b.tga
	qer_editorimage textures/robot_trim/w11c.tga
	
	{
		map textures/robot_trim/w11c.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{
		map textures/robot_trim/w11c_light.tga
		blendfunc gl_one gl_one
		rgbgen wave sin 1 .1 0 5
	}


	{
		map textures/robot_trim/w11c_pulse1b.tga
		blendfunc gl_one gl_one
//		tcmod scale .01 1
		tcmod scale .035 1
//		tcmod scroll -0.5 0
		tcmod scroll -0.65 0


	}

	
}
textures/robot/ciaa8
{
        qer_editorimage textures/robot/ciaa8.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/robot/ciaa8.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/robot/ciaa1
{
        qer_editorimage textures/robot/ciaa1.tga
    	surfaceparm trans
	surfaceparm alphashadow
   	surfaceparm nonsolid
	cull none
        nopicmip
	{
		map textures/robot/ciaa1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/toxicmetal_light/proto_lighttoxicmetal
{
	q3map_lightimage textures/toxicmetal_light/proto_lighttoxicmetal.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/toxicmetal_light/proto_lighttoxicmetal.tga
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/toxicmetal_light/proto_lighttoxicmetal.tga
		blendFunc add
	}
	
}

textures/toxicmetal_support/x_toxic1
{
	qer_editorimage textures/toxicmetal_support/x_toxic1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/toxicmetal_support/x_toxic1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/toxicmetal_support/DOOM1
{
	qer_editorimage textures/toxicmetal_support/DOOM1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/toxicmetal_support/DOOM1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/toxicmetal_support/DOOM2
{
	qer_editorimage textures/toxicmetal_support/DOOM2.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/toxicmetal_support/DOOM2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/toxicmetal_support/T2
{
	qer_editorimage textures/toxicmetal_support/T2.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/toxicmetal_support/T2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/toxicmetal_support/T1
{
	qer_editorimage textures/toxicmetal_support/T1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	{
		map textures/toxicmetal_support/T1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}




// ************************************************************************
// ** Geit3dm7 Shader File						 **
// ** The Olden Domain by Geit (ouwegeit@goat.gamepoint.net)		 **
// ** (http://goat.gamepoint.net/)					 **
// **									 **
// ** All shaders not by Sock or Todd Gantzler are made by Geit.	 **
// ** Either alterations of existing textures/shaders or made from 	 **
// ** scratch.								 **
// **									 **
// ** Geit - http://goat.gamepoint.net/					 **
// ** Sock - http://www.planetquake.com/simland				 **
// ************************************************************************
//
// Shader Index:
// models/mapobjects/multiplant/palmfrond		- Todd Gantzler
// models/mapobjects/multiplant/pleaf1			- Todd Gantzler
// models/mapobjects/multiplant/pleaf2			- Todd Gantzler
// models/mapobjects/multiplant/pleaf3			- Todd Gantzler
// models/mapobjects/palm2/trunk			- Todd Gantzler
// textures/geit/geit3dm8_desert_dust			- Geit
// textures/geit/lighttrick_yellow_100			- Geit
// textures/geit/dustball_skybox			- Sock
// textures/geit/geit_tele1				- Geit
// textures/egyptsoc_sfx/lig_064-01y2-2k		- Sock
// textures/egyptsoc_sfx/lig_064-02b1-2k		- Sock
// textures/egyptsoc_sfx/lig_064-02y2-2k		- Sock
// textures/egyptsoc_sfx/lig_064-04b1-2k		- Sock
// textures/egyptsoc_sfx/lig_064-05y2-2k		- Sock
// textures/egyptsoc_sfx/lig_v192-01wa			- Sock
// textures/egyptsoc_sfx/lig_v192-01yb			- Sock
// textures/egyptsoc_sfx/s128-01wc			- Sock
// textures/egyptsoc_sfx/s128-01we			- Sock
// textures/egyptsoc_sfx/wmblue_floor1a			- Sock
// textures/egyptsoc_sfx/wmblue_floor1b			- Sock
// textures/geit/geit3dm8_silentsand			- Geit

textures/geit/geit3dm8_desert_dust
{
	qer_editorimage textures/sfx/hellfog.tga
	qer_trans 0.4
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
	fogparms ( .86 .60 .23 ) 1024
}

textures/geit/dustball_skybox
{
	qer_editorimage textures/dustball/dustball_view.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 200
	surfaceparm sky
	q3map_sun 1.0 0.82 0.733 140 320 60
	skyparms env/dustball/dustball - -
}

textures/geit/lighttrick_yellow_100
{
	qer_editorimage textures/geit/g_egypt_light_3.tga
	q3map_lightimage textures/geit/g_egypt_light_3.tga

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 75

	skyparms - - -
	light 1
}

textures/geit/geit_tele1
{
	qer_editorimage textures/geit/geit_tele1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	cull disable
	tessSize 128
	q3map_surfacelight 75
	{
		map textures/effects/envmap.tga
		rgbGen identity
		tcGen environment
	}
	{
		map textures/geit/geit_tele1.tga
		blendfunc blend
		rgbGen identity
		tcMod turb 0 0.3 0 0.2
	}
//	{
//		map textures/geit/geit_tele2.tga
//		tcGen environment
//              tcMod turb 0 0.25 0 0.5
//              tcmod scroll 1 1
//		blendfunc GL_ONE GL_ONE
//	}
	{
		map textures/effects/tinfx3.tga
		blendFunc GL_ONE GL_ONE
		tcGen environment
	}
}

textures/egyptsoc_sfx/lig_064-01y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01y.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01y.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-02b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02b.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02b.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-02y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02y.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02y.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-04b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04b.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04b.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-05y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05y.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05y.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_v192-01wa
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01wa.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01wa.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/egyptsoc_sfx/lig_v192-01w.blend.tga
		blendfunc add	
                rgbgen wave sin .5 .3 0 1
	}
}

textures/egyptsoc_sfx/lig_v192-01yb
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01yb.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01yb.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/egyptsoc_sfx/lig_v192-01y.blend.tga
		blendfunc add	
                rgbgen wave sin .5 .3 0 1
	}
}

textures/egyptsoc_sfx/s128-01wc
{
	qer_editorimage textures/egyptsoc_trim/s128-01c.tga
	q3map_lightimage textures/egyptsoc_sfx/s128-01b.blend.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/s128-01b.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/s128-01we
{
	qer_editorimage textures/egyptsoc_trim/s128-01e.tga
	q3map_lightimage textures/egyptsoc_sfx/s128-01g.blend.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01e.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/s128-01g.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/wmblue_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ab.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1b.blend.tga	
	q3map_surfacelight 100
	{
		map textures/ctf/blue_telep.tga
                tcmod rotate 180
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/ctf/blue_telep2.tga
		blendfunc ADD
                tcmod rotate 45
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/egyptsoc_floor/jumppad1ab.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
	{
		map textures/egyptsoc_floor/jumppad1b.blend.tga
		blendfunc ADD
		rgbgen wave sin .9 .1 0 5
	}
}

textures/egyptsoc_sfx/wmblue_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1bb.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1b.blend.tga	
	q3map_surfacelight 100
	{
		map textures/ctf/blue_telep.tga
                tcmod rotate 180
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/ctf/blue_telep2.tga
		blendfunc ADD
                tcmod rotate 45
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/egyptsoc_floor/jumppad1bb.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
	{
		map textures/egyptsoc_floor/jumppad1b.blend.tga
		blendfunc ADD
		rgbgen wave sin .9 .1 0 5
	}
}

models\mapobjects\multiplant\palmfrond
{	
    surfaceparm alphashadow
    cull none
    nopicmip
	{
		map models\mapobjects\multiplant\palmfrond.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models\mapobjects\multiplant\pleaf1
{	
    surfaceparm alphashadow
    cull none

	{
		map models\mapobjects\multiplant\pleaf1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models\mapobjects\multiplant\pleaf2
{	
    surfaceparm alphashadow
    cull none

	{
		map models\mapobjects\multiplant\pleaf2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models\mapobjects\multiplant\pleaf3
{	
    surfaceparm alphashadow
    cull none

	{
		map models\mapobjects\multiplant\pleaf3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

// Palm Trunk Texture
models\mapobjects\palm2\trunk
{	
	DeformVertexes autosprite2
    surfaceparm alphashadow
    cull none
    nopicmip
	{
		map models/mapobjects/palm2/trunk.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/geit/geit3dm8_silentsand
{
	qer_editorimage textures/egyptsoc_mat/sand1b.tga
	surfaceparm nosteps		
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_mat/sand1b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

// ************************************************************************
// ** Geit3dm7 Shader File						 **
// ** The Olden Domain by Geit (ouwegeit@goat.gamepoint.net)		 **
// ** (http://goat.gamepoint.net/)					 **
// **									 **
// ** All shaders not by Sock or Todd Gantzler are made by Geit.	 **
// ** Either alterations of existing textures/shaders or made from 	 **
// ** scratch.								 **
// **									 **
// ** Geit - http://goat.gamepoint.net/					 **
// ** Sock - http://www.planetquake.com/simland				 **
// ************************************************************************
//
// Shader Index:
// models/mapobjects/multiplant/palmfrond		- Todd Gantzler
// models/mapobjects/multiplant/pleaf1			- Todd Gantzler
// models/mapobjects/multiplant/pleaf2			- Todd Gantzler
// models/mapobjects/multiplant/pleaf3			- Todd Gantzler
// models/mapobjects/palm2/trunk			- Todd Gantzler
// textures/geit/geit3dm8_desert_dust			- Geit
// textures/geit/lighttrick_yellow_100			- Geit
// textures/geit/dustball_skybox			- Sock
// textures/geit/geit_tele1				- Geit
// textures/egyptsoc_sfx/lig_064-01y2-2k		- Sock
// textures/egyptsoc_sfx/lig_064-02b1-2k		- Sock
// textures/egyptsoc_sfx/lig_064-02y2-2k		- Sock
// textures/egyptsoc_sfx/lig_064-04b1-2k		- Sock
// textures/egyptsoc_sfx/lig_064-05y2-2k		- Sock
// textures/egyptsoc_sfx/lig_v192-01wa			- Sock
// textures/egyptsoc_sfx/lig_v192-01yb			- Sock
// textures/egyptsoc_sfx/s128-01wc			- Sock
// textures/egyptsoc_sfx/s128-01we			- Sock
// textures/egyptsoc_sfx/wmblue_floor1a			- Sock
// textures/egyptsoc_sfx/wmblue_floor1b			- Sock
// textures/geit/geit3dm8_silentsand			- Geit

textures/geit/geit3dm8_desert_dust
{
	qer_editorimage textures/sfx/hellfog.tga
	qer_trans 0.4
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
	fogparms ( .86 .60 .23 ) 1024
}

textures/geit/dustball_skybox
{
	qer_editorimage textures/dustball/dustball_view.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_globaltexture
	q3map_lightsubdivide 256
	q3map_surfacelight 200
	surfaceparm sky
	q3map_sun 1.0 0.82 0.733 140 320 60
	skyparms env/dustball/dustball - -
}

textures/geit/lighttrick_yellow_100
{
	qer_editorimage textures/geit/g_egypt_light_3.tga
	q3map_lightimage textures/geit/g_egypt_light_3.tga

	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 75

	skyparms - - -
	light 1
}

textures/geit/geit_tele1
{
	qer_editorimage textures/geit/geit_tele1.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	cull disable
	tessSize 128
	q3map_surfacelight 75
	{
		map textures/effects/envmap.tga
		rgbGen identity
		tcGen environment
	}
	{
		map textures/geit/geit_tele1.tga
		blendfunc blend
		rgbGen identity
		tcMod turb 0 0.3 0 0.2
	}
//	{
//		map textures/geit/geit_tele2.tga
//		tcGen environment
//              tcMod turb 0 0.25 0 0.5
//              tcmod scroll 1 1
//		blendfunc GL_ONE GL_ONE
//	}
	{
		map textures/effects/tinfx3.tga
		blendFunc GL_ONE GL_ONE
		tcGen environment
	}
}

textures/egyptsoc_sfx/lig_064-01y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-01y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-01y.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-01y.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-02b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02b.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02b.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-02y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-02y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-02y.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-02y.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-04b1-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-04b1.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-04b.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04b1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-04b.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_064-05y2-2k
{
	qer_editorimage textures/egyptsoc_sfx/lig_064-05y2.tga
	q3map_lightimage textures/egyptsoc_sfx/lig_064-05y.blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05y2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/lig_064-05y.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/lig_v192-01wa
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01wa.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01wa.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/egyptsoc_sfx/lig_v192-01w.blend.tga
		blendfunc add	
                rgbgen wave sin .5 .3 0 1
	}
}

textures/egyptsoc_sfx/lig_v192-01yb
{       
	qer_editorimage textures/egyptsoc_sfx/lig_v192-01yb.tga
	{
		map textures/egyptsoc_sfx/lig_v192-01yb.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}
	{
		map textures/egyptsoc_sfx/lig_v192-01y.blend.tga
		blendfunc add	
                rgbgen wave sin .5 .3 0 1
	}
}

textures/egyptsoc_sfx/s128-01wc
{
	qer_editorimage textures/egyptsoc_trim/s128-01c.tga
	q3map_lightimage textures/egyptsoc_sfx/s128-01b.blend.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/s128-01b.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/s128-01we
{
	qer_editorimage textures/egyptsoc_trim/s128-01e.tga
	q3map_lightimage textures/egyptsoc_sfx/s128-01g.blend.tga
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_trim/s128-01e.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/egyptsoc_sfx/s128-01g.blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .3 .1 0 0.5
	}
}

textures/egyptsoc_sfx/wmblue_floor1a
{
	qer_editorimage textures/egyptsoc_floor/jumppad1ab.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1b.blend.tga	
	q3map_surfacelight 100
	{
		map textures/ctf/blue_telep.tga
                tcmod rotate 180
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/ctf/blue_telep2.tga
		blendfunc ADD
                tcmod rotate 45
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/egyptsoc_floor/jumppad1ab.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
	{
		map textures/egyptsoc_floor/jumppad1b.blend.tga
		blendfunc ADD
		rgbgen wave sin .9 .1 0 5
	}
}

textures/egyptsoc_sfx/wmblue_floor1b
{
	qer_editorimage textures/egyptsoc_floor/jumppad1bb.tga
	q3map_lightimage textures/egyptsoc_floor/jumppad1b.blend.tga	
	q3map_surfacelight 100
	{
		map textures/ctf/blue_telep.tga
                tcmod rotate 180
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/ctf/blue_telep2.tga
		blendfunc ADD
                tcmod rotate 45
                tcMod stretch sin .8 0.1 0 .5
	}
	{
		map textures/egyptsoc_floor/jumppad1bb.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
	{
		map textures/egyptsoc_floor/jumppad1b.blend.tga
		blendfunc ADD
		rgbgen wave sin .9 .1 0 5
	}
}

models\mapobjects\multiplant\palmfrond
{	
    surfaceparm alphashadow
    cull none
    nopicmip
	{
		map models\mapobjects\multiplant\palmfrond.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models\mapobjects\multiplant\pleaf1
{	
    surfaceparm alphashadow
    cull none

	{
		map models\mapobjects\multiplant\pleaf1.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models\mapobjects\multiplant\pleaf2
{	
    surfaceparm alphashadow
    cull none

	{
		map models\mapobjects\multiplant\pleaf2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

models\mapobjects\multiplant\pleaf3
{	
    surfaceparm alphashadow
    cull none

	{
		map models\mapobjects\multiplant\pleaf3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

// Palm Trunk Texture
models\mapobjects\palm2\trunk
{	
	DeformVertexes autosprite2
    surfaceparm alphashadow
    cull none
    nopicmip
	{
		map models/mapobjects/palm2/trunk.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identityLighting
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/geit/geit3dm8_silentsand
{
	qer_editorimage textures/egyptsoc_mat/sand1b.tga
	surfaceparm nosteps		
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/egyptsoc_mat/sand1b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

models/powerups/ammo/crate
{
	{
		map textures/effects/env_crate.tga
		rgbGen identity
		tcMod rotate 350
		tcMod scroll 3 1
	}
	{
		map models/powerups/ammo/crate.tga
		blendfunc blend
		rgbGen lightingDiffuse
	}
}

models/powerups/ammo/ammocrate2
{
	{
		map models/powerups/ammo/crate2.tga
		rgbGen identity
	}
	
}

lightningBoltArc
{
	cull none
	{
		map gfx/misc/arclightning3.tga
		blendFunc GL_ONE GL_ONE
//                rgbgen wave sin 1 5.1 0 7.1
                rgbgen wave sin 1 0.5 0 7.1
                 tcmod scale  2 1
		tcMod scroll -5 0
	}
    {
		map gfx/misc/arclightning3.tga
		blendFunc GL_ONE GL_ONE
//                rgbgen wave sin 1 8.3 0 8.1
                rgbgen wave sin 1 0.8 0 8.1
                tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}

models/uber/ubershotgun
{
    cull disable
        {
	        map models/uber/ubershotgun.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

models/uber/ubergrenade
{
    cull disable
        {
	        map models/uber/ubergrenade.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

models/uber/uberrocket
{
    cull disable
        {
	        map models/uber/uberrocket.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

models/uber/uberrail
{
    cull disable
        {
	        map models/uber/uberrail.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

models/uber/uberlightning
{
    cull disable
        {
	        map models/uber/uberlightning.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

models/uber/uberplasma
{
    cull disable
        {
	        map models/uber/uberplasma.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

models/uber/uberbfg
{
    cull disable
        {
	        map models/uber/uberbfg.tga
		blendfunc Add
                tcmod Scroll 0.7 0
                rgbGen identity
        }
}

sprites/ionplasma1
{
	cull disable
	{
		clampmap sprites/ionplasma1.tga
		blendfunc GL_ONE GL_ONE
                tcMod rotate 931
	}
}

models/powerups/armor/newgreen
{      
        {
                map textures/sfx/specular.tga          
                tcGen environment
                rgbGen identity
	}  
        {
		map models/powerups/armor/newgreen.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
       
         
}

models/powerups/armor/energy_green
{

	{
		map models/powerups/armor/energy_green.tga 
		blendFunc GL_ONE GL_ONE
		tcMod scroll 7.4 1.3
	}

}

models/powerups/holdable/tuner_base
{
	{
		map textures/effects/envmap.tga
		tcgen environment
	}
	
}

models/powerups/holdable/tuner_sphere
{
	{
		map textures/effects/envmapdim.tga
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/holdable/tuner_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/tuner_fluid.tga
		tcMod scroll 0 2
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/holdable/capsule_base
{
	{
		map textures/effects/envmap.tga
		tcgen environment
	}
	
}

models/powerups/holdable/capsule_sphere
{
	{
		map textures/effects/envmapdim.tga
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/holdable/capsule_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/capsule_fluid.tga
		tcMod scroll 0 2
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/instant/conservation
{
	//{
	//	map textures/effects/envmaprail.tga
	//}
	{
		map textures/effects/envmaprail.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
powerups/conservationWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/envmaprail.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
models/powerups/instant/scavenger
{
	//{
	//	map textures/effects/envmapscvg.tga
	//}
	{
		map textures/effects/envmapscvg.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/rampage
{
	//{
	//	map textures/effects/envmapviolet.tga
	//}
	{
		map textures/effects/envmapviolet.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}

powerups/conservation
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/envmaprail.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

powerups/inverse
{
	sort 16
	{
		map textures/effects/envmap2.tga
		blendFunc filter
		tcGen environment
	}
}

icons/conservation
{
	nopicmip
	{
		map icons/conservation.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/scavenger
{
	nopicmip
	{
		map icons/scavenger.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/rampage
{
	nopicmip
	{
		map icons/rampage.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/receptacle
{
	nopicmip
	{
		map icons/receptacle.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/tuner
{
	nopicmip
	{
		map icons/tuner.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icon_pouch
{
	nopicmip
	{
		map icons/icon_pouch.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icon_pouch_double
{
	nopicmip
	{
		map icons/icon_pouch_double.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_crate
{
	nopicmip
	{
		map icons/icona_crate.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconr_green
{
	nopicmip
	{
		map icons/iconr_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

textures/common/bounceclip
{	
	qer_editorimage textures/common/bounceclip.tga
	surfaceparm nodraw
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm playerclip
	surfaceparm ladder
	qer_trans 0.4
}

textures/common/reverser
{
	surfaceparm flesh
	surfaceparm nodraw
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm monsterclip
	qer_trans 0.2
}

textures/trampoline/trampoline
{
	nopicmip
	qer_editorimage textures/base_trim/proto_fence.tga
	surfaceparm metalsteps
	surfaceparm trans
	{
		map textures/base_trim/proto_fence.tga
		blendfunc blend
		tcMod scale 0.01 0.01
		tcGen vector ( 1 1 1 ) ( 1 1 1 ) 
	}
	{
		map textures/base_trim/proto_fence.tga
		blendfunc blend
		tcMod scale 0.01 0.01
		tcGen vector ( -1 1 1 ) ( -1 1 1 ) 
	}
}

textures/wvwq3dm5/wvw_trainwall_ua_logo_fx
{
	qer_editorimage textures/ua_wvwq3dm5/wvw_trainwall2_ua.tga
	nopicmip
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/ua_wvwq3dm5/wvw_trainwall2_ua.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/uberarena/ua_logo
{
	qer_editorimage textures/uberarena/uberarena_logo_trans.tga
	surfaceparm nonsolid
	surfaceparm trans
	nopicmip
	{
		map textures/uberarena/uberarena_logo_trans.tga
		blendfunc blend
	}
}


// *************
// sky
// tig_sky1_detail.tga is modifyied from the S3/diamond maps 
// - all credit to dmm for it (www.diamondmm.com)
// 

textures/tig_out/tig_sky1

{
	qer_editorimage textures/tig_out/tig_sky1
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun 1 1 .77 80 315 70

	q3map_surfacelight 130
	skyparms - 384 -
	{
		map textures/tig_out/tig_sky1_fog.jpg
		tcMod scroll 0.03 0.05
		tcMod scale 2 2
		depthWrite
	}
	{
		map textures/tig_out/tig_sky1_detail.jpg
		blendfunc GL_ONE GL_ONE
		tcMod scroll 0.0025 0.003
		tcMod scale 3 2
	}
}


// ************
// water

textures/tig_out/tig_pool2
	{
		qer_editorimage textures/liquids/pool3d_4b2
		qer_trans .5

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		surfaceparm nomarks

		q3map_globaltexture

		cull disable
		tesssize 128
		deformVertexes wave 64 sin 0.25 0.25 0 .5
		{ 
			map textures/liquids/pool3d_6c2.tga
			blendFunc GL_DST_COLOR GL_ZERO
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 .001
			tcMod turb 0 .05 0 .05	
		}
		{
			map textures/liquids/pool3d_4b2.tga
			blendfunc add
			rgbgen identity
			tcmod scale .125 .125	
			tcmod scroll -.005 .015
		}
	}

textures/tig_out/tig_clangfloor
{
	qer_editorimage textures/base_floor/clang_floor2.tga
	surfaceparm	metalsteps
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/clang_floor2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/tig_out/tig_clangFloor3
{
	qer_editorimage textures/tig_out/tig_atech1Floor.tga
	surfaceparm	metalsteps
        {
		map textures/sfx/hologirl.tga
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/tig_out/tig_atech1Floor.tga
                blendfunc blend
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}

textures/tig_out/tig_weapclip_metal
{
	qer_trans 0.40
	surfaceparm metalsteps
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nodraw
}

textures/tig_out/tig_bounce
{
	qer_editorimage textures/sfx/bouncepad01_xarch.tga
	q3map_lightimage textures/sfx/portal_sfx1.tga
	q3map_surfacelight 300
	surfaceparm nodamage
	cull none
	{
		map textures/sfx/bouncepad01_xarch.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		clampmap textures/sfx/console01.tga
        	tcMod rotate 40
		blendFunc GL_ONE GL_ONE
	}
        {
		clampmap textures/sfx/console02.tga
        	tcMod rotate -300
		blendFunc GL_ONE GL_ONE
	}
}

textures/tig_out/tig_red_strgg
{
     	cull disable
     	surfaceparm alphashadow
     	surfaceparm trans	
     	surfaceparm nomarks
	tessSize 64
		
     	deformVertexes wave 30 sin 0 1 0 0.3

        {
                map textures/tig_out/tig_red_strgg.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}

}

textures/tig_out/tig_launch_green
{
	qer_editorimage textures/tig_out/tig_launch.tga
	{
		map $lightmap
		rgbGen identity
	}
	{ 
		map textures/tig_out/tig_launch.tga
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{	
		map textures/tig_out/tig_launch_sfx2.tga
		blendfunc gl_one gl_one	
		rgbgen wave inversesawtooth 0 1 0 1
	}
	{ 
		animmap 4 textures/tig_out/tig_launch_0.tga textures/sfx/launchpad_arrow2.tga textures/sfx/launchpad_arrow2.tga textures/sfx/launchpad_arrow2.tga
		blendfunc gl_one gl_one
		tcmod scroll 0 2
	}

}

//wvwq3dm5 shader file
//modified id lights
textures/wvwq3dm5/wvw_smll_pipes_ns
{
	qer_editorimage textures/wvwq3dm5/wvw_smll_pipes.tga
	surfaceparm nonsolid
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/wvwq3dm5/wvw_smll_pipes.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/wvwq3dm5/wvw5_baslt4_1_2k
{
	qer_editorimage textures/base_light/baslt4_1.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 2000
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_light/baslt4_1.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.tga
		blendfunc add
	}
}

textures/wvwq3dm5/wvw5_ceil1_38
{
	qer_editorimage textures/base_light/ceil1_38.tga
	q3map_lightimage textures/wvwq3dm5/wvw_mtl_support2.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 5000
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_light/ceil1_38.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc add
	}
}

textures/wvwq3dm5/wvw5_proto_light
{
	qer_editorimage textures/base_light/proto_light.tga
	q3map_lightimage textures/base_light/proto_lightmap.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 3000
	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/base_light/proto_light.tga
		blendfunc filter
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightmap.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 1 0.1 
	}
	{
		map textures/base_light/proto_light2.tga
		blendfunc add
		rgbGen wave triangle 1 5 1 3 
	}
	{
		map textures/base_light/proto_light2.tga
		blendfunc add
		rgbGen wave triangle 1 2 0 7 
		tcMod scale -1 -1
	}
}

textures/wvwq3dm5/wvw5_neon-blue
{
	qer_editorimage textures/wvwq3dm5/wvw_neon-blue.tga
	q3map_lightimage textures/wvwq3dm5/wvw_neon-blue.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	q3map_surfacelight 2000
	{
		map textures/wvwq3dm5/wvw_neon-blue.tga
		blendfunc add
		tcMod rotate 100
		tcMod scroll 1.5 -2
	}
}

textures/wvwq3dm5/wvw5_neon-orange
{
	qer_editorimage textures/wvwq3dm5/wvw_neon-orange.tga
	q3map_lightimage textures/wvwq3dm5/wvw_neon-orange.tga
	surfaceparm nolightmap
	surfaceparm nomarks
	surfaceparm nonsolid
	surfaceparm trans
	cull disable
	q3map_surfacelight 2000
	{
		map textures/wvwq3dm5/wvw_neon-orange.tga
		blendfunc add
		tcMod rotate 100
		tcMod scroll 1.5 -2
	}
}

textures/wvwq3dm5/wvw_trim_rivetmtlgrt2
{
	surfaceparm trans
	cull disable
	nopicmip
	{
		map textures/wvwq3dm5/wvw_trim_rivetmtlgrt2.tga
		rgbGen identity
		depthWrite
		alphaFunc GE128
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
		depthFunc equal
	}
}

textures/wvwq3dm5/wvw_grill01
{
	surfaceparm metalsteps
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm pointlight
	{
		map textures/wvwq3dm5/wvw_grill01.tga
		blendfunc blend
		rgbGen Vertex
		depthWrite
	}
}

textures/wvwq3dm5/wvw5_sky
{
	qer_editorimage textures/wvwq3dm5/env/wvw5_sky_up.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm nomarks
	q3map_surfacelight 600
	q3map_sun 0.0352941 0.360784 0.607843 150 315 50
	skyParms textures/wvwq3dm5/env/wvw5_sky 128 -
}

textures/wvwq3dm5/wvw_floor1_bounce
{
	qer_editorimage textures/wvwq3dm5/wvw_floor1_bounce.tga
	q3map_lightimage textures/wvwq3dm5/wvw_jumppadsmall.tga
	surfaceparm nodamage
	q3map_surfacelight 400
	{
		map textures/wvwq3dm5/wvw_floor1_bounce.tga
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/wvwq3dm5/wvw_bouncepad01b_layer1.tga
		blendfunc add
		rgbGen wave sin 0.5 0.5 0 1.5 
	}
	{
		clampmap textures/wvwq3dm5/wvw_jumppadsmall.tga
		blendfunc add
		rgbGen wave square 0.5 0.5 0.25 1.5 
		tcMod stretch sin 1.2 0.8 0 1.5 
	}
}

textures/wvwq3dm5/wvw_mercury
{
	qer_editorimage textures/wvwq3dm5/wvw_mercury.tga
	q3map_lightimage textures/wvwq3dm5/wvw_mercury.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 750
	{
		map textures/wvwq3dm5/wvw_mercury.tga
		blendfunc add
		tcMod rotate 10
		tcMod scroll 0.1 0.1
		tcMod turb 0.5 0.25 0 0.15
	}
}

textures/wvwq3dm5/wvw_mtl_support2
{
	{
		map textures/effects/tinfx.tga
		rgbGen Vertex
		tcGen environment 
	}
	{
		map textures/wvwq3dm5/wvw_mtl_support2.tga
		blendfunc blend
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc gl_dst_color gl_one_minus_dst_alpha
		rgbGen identity
		tcGen lightmap 
	}
}

textures/wvwq3dm5/wvw_trainwall2cpma
{
	qer_editorimage textures/wvwq3dm5/wvw_trainwall2cpma.tga	
	nopicmip

	{
		map $lightmap 
		rgbGen identity
		tcGen lightmap 
	}
	{
		map textures/wvwq3dm5/wvw_trainwall2cpma.tga
		blendfunc filter
		rgbGen identity
	}
}

textures/wvwq3dm5/wvw_trainwall_vertex
{

	{
		map textures/wvwq3dm5/wvw_trainwall_vertex.tga
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
		
} 

textures/wvwq3dm5/wvw_trainwall2_vertex
{

	{
		map textures/wvwq3dm5/wvw_trainwall2_vertex.tga
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
		
} 

textures/wvwq3dm5/wvw_drkcern2_vertex
{

	{
		map textures/wvwq3dm5/wvw_drkcern2_vertex.tga
		rgbGen identity
	}
	{
		map $lightmap 
		blendfunc filter
		rgbGen identity
	}
		
} 




	//*********************************\\
	// LUN3DM1- CORIOLIS STORM Shaders \\
	//  Feel free to modify and steal  \\
	//*********************************\\

textures/lundesert/x_support_nocull
{
	surfaceparm	metalsteps
	surfaceparm trans
	surfaceparm alphashadow
	surfaceparm playerclip
   	surfaceparm nonsolid
	surfaceparm nomarks
	nopicmip
	{
		map textures/base_support/x_support.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/lundesert/dust1
//Thin dust over the entire lower level
{
	qer_editorimage textures/sfx/hellfog.tga
//	fogonly
	surfaceparm nonsolid
	surfaceparm nolightmap
	surfaceparm trans
	surfaceparm fog
//	fogGen noise 0 1 0 0.25
	fogparms ( .85 .45 .075 ) 4800
}


textures/lundesert/lpjgrate
// The non-fuxx0red version!
{
	qer_editorimage textures/base_floor/pjgrate2.tga
	surfaceparm	metalsteps		
	surfaceparm nonsolid
	surfaceparm nomarks
	surfaceparm noimpact
	surfaceparm trans
	surfaceparm playerclip
//	surfaceparm nopicmip
	surfaceparm nomipmap
//	cull none
	{
		map textures/base_floor/pjgrate2.tga
//		tcMod scale 0.5 0.5
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

//The next four textures all used to have cull disabled, but it killed the framerate in that area with all the other alpha surfaces (like the girders and the big canvas).  This looks better anyway.

textures/lundesert/lclang_ow2
//clang_dark with a bigass rusty hole
{
	qer_editorimage textures/lundesert/lclang_ow.tga
	surfaceparm metalsteps
//	surfaceparm playerclip
//	surfaceparm alphashadow
//	surfaceparm trans
	{
		map textures/lundesert/lclang_ow.tga
//		blendFunc GL_ONE GL_ZERO
//		alphaFunc GT0
//		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
//		depthFunc equal
	}
}

textures/lundesert/lclang_ow_ns
//clang_dark with a bigass rusty hole that you can fall through
{
	qer_editorimage textures/lundesert/lclang_ow.tga
	surfaceparm metalsteps
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	{
		map textures/lundesert/lclang_ow.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GT0
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}


textures/lundesert/lconcrete_ow2
//concrete_dark with a bigass cracked hole
{
	qer_editorimage textures/lundesert/lconcrete_ow.tga
//	surfaceparm metalsteps
//	surfaceparm playerclip
//	surfaceparm alphashadow
//	surfaceparm trans
	{
		map textures/lundesert/lconcrete_ow.tga
//		blendFunc GL_ONE GL_ZERO
//		alphaFunc GT0
//		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
//		depthFunc equal
	}
}

textures/lundesert/lconcrete_ow_ns
//concrete_dark with a bigass cracked hole that you can fall through
{
	qer_editorimage textures/lundesert/lconcrete_ow.tga
//	surfaceparm metalsteps
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nonsolid
	{
		map textures/lundesert/lconcrete_ow.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GT0
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/lundesert/ceil1_38_1k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	// Square dirty white llight - Darkened by Lunaran
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lundesert/ceil1_38_2500
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	light 1
	// Square dirty white llight - Darkened by Lunaran
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lundesert/ceil1_38_5k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square dirty white llight - Darkened by Lunaran
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/lundesert/lborder12
//Non light emitting, and browner - Lunaran
{
	qer_editorimage textures/base_trim/border12b.tga
//	q3map_surfacelight 100	
	q3map_lightimage textures/base_trim/border12bfx.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/lundesert/lborder12fx.jpg
		blendfunc GL_ONE GL_ONE
	}
}

textures/lundesert/luncomp1
{
	{
		map textures/lundesert/sandfx.tga
		rgbGen identity
		tcGen environment
	}
//	{
//		map $lightmap
//		tcGen environment
//		blendFunc GL_ONE GL_ONE
//	}
	{
		map textures/base_wall/comp3c.tga
		tcMod scale .5 .5
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}

textures/lundesert/volulight
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nolightmap
	surfaceparm nonsolid
	q3map_surfacelight 500
	// For when blanketing pointlights just don't cut it
	// Note that I never actually used this
}

textures/lundesert/lightl_2k
{
	qer_editorimage textures/lundesert/llight5.tga
	q3map_lightimage textures/lundesert/llight5blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 2000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lundesert/llight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lundesert/llight5blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/lundesert/lightl_1500
{
	qer_editorimage textures/lundesert/llight5.tga
	q3map_lightimage textures/lundesert/llight5blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lundesert/llight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lundesert/llight5blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/lundesert/lightl_1k
{
	qer_editorimage textures/lundesert/llight5.tga
	q3map_lightimage textures/lundesert/llight5blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lundesert/llight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lundesert/llight5blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/lundesert/lightl_500
{
	qer_editorimage textures/lundesert/llight5.tga
	q3map_lightimage textures/lundesert/llight5blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lundesert/llight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lundesert/llight5blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/lundesert/lightl_2kflicker
{
	qer_editorimage textures/lundesert/llight5.tga
	q3map_lightimage textures/lundesert/llight5blend.tga
//	light 1
	surfaceparm nomarks
	q3map_surfacelight 1900
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/lundesert/llight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/lundesert/llight5blend.tga
		blendFunc GL_ONE GL_ONE
//		rgbGen wave noise -10 15 0 4
		rgbGen wave noise 6 8 0 4
	}
}

textures/lundesert/lungrill1shiny
{
	qer_editorimage textures/base_floor/proto_grill.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/proto_grill.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/effects/tinfx.tga
		tcGen environment
//		tcMod scale 0.166 0.166
		blendFunc GL_DST_COLOR GL_ONE
	}
}

//Sun parms:  red grn blu light degrees elevation
textures/lundesert/lundessky1
{
//	qer_editorimage textures/skies/intelredclouds.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun 3 2.5 2 100 315 70
	q3map_surfacelight  30 
	skyparms - 512 -
	{
		map textures/lundesert/lundessky1.tga
		tcMod scroll 0.035 .015
		depthWrite
	}
	{
		map textures/skies/dimclouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll 0.015 0.016
		tcMod scale 3 2
	}
//	{
//Failed attempt at making a typhoon whirling high overhead - kept crashing oddly, and it wouldn't line up straight anyhow.
//		clampMap textures/lundesert/coriolis.tga
	//	map textures/lundesert/coriolis.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//		tcMod scale 4 4
//		tcMod rotate 5
//	}
}

//I had originally used these other two skies to get a variety of good sun directions, but I found that q3map was only recognizing the first one.  I'm too lazy to put comment lines all over the damn place, so I'm just leaving these.
textures/lundesert/lundesert2
{
	qer_editorimage textures/skies/intelredclouds.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky
//Brighter that lundesert1 - used for small windows and the fan chute
	q3map_sun 3 2.5 2 300 0 90
	q3map_surfacelight  150 
	skyparms - 512 -
	{
		map textures/lundesert/lundessky1.tga
		tcMod scroll 0.035 .015
		depthWrite
	}
	{
		map textures/skies/dimclouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll 0.015 0.016
		tcMod scale 3 2
	}
}

textures/lundesert/lundesert3
{
	qer_editorimage textures/skies/intelredclouds.tga
	surfaceparm noimpact
	surfaceparm nomarks
	surfaceparm nolightmap
	surfaceparm sky

	q3map_sun 3 2.5 2 100 170 40
//	Reversed sun direction to get some good shadows going on the big flag. 
	q3map_surfacelight 20
	skyparms - 512 -
	{
		map textures/lundesert/lundessky1.tga
		tcMod scroll 0.035 .015
		depthWrite
	}
	{
		map textures/skies/dimclouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll 0.015 0.016
		tcMod scale 3 2
	}
}

textures/lundesert/lunmetsupport4
{
	qer_editorimage textures/gothic_trim/metalsupport4j.tga
//	surfaceparm nonsolid
	{
		map textures/effects/tinfx.tga
		tcGen environment
	}
	{
		map textures/lundesert/lunmetsupport4.tga
		rgbGen identity
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO //GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/lundesert/luncanvas1
{
	cull disable
	surfaceparm alphashadow
	surfaceparm trans	
	surfaceparm nomarks
	tessSize 64
	deformVertexes wave 30 sin 0 3 0 .2	
	deformVertexes wave 100 sin 0 3 0 .7
     	{
		map textures/lundesert/luncanvas1.tga
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/lundesert/ld_eagle
{
	cull disable
	surfaceparm trans
	surfaceparm noimpact
	surfaceparm nomarks
// This makes the bird take a more irregular path as the func_rotating goes around
	deformVertexes move 1 0 0.5 sin 0 48 0 0.042
//	deformVertexes wave 32 sin 0 8 0 0.3
     	{
		map textures/lundesert/ld_eagle.tga
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/lundesert/clanggrate2glow
{
//	q3map_surfacelight 50
//	q3map_lightimage textures/lundesert/cgrate2_lglow.tga
	qer_editorimage textures/base_floor/clanggrate2.tga
	{
		map textures/base_floor/clanggrate2.tga
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/lundesert/cgrate2_lglow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 0.333
	}
}

textures/lundesert/lungrill1glow
{
//	q3map_surfacelight 200
//	q3map_lightimage $white
	qer_editorimage textures/base_floor/proto_grill.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/proto_grill.tga
		blendFunc GL_DST_COLOR GL_ZERO
		alphaGen wave sin 0.5 0.5 0 0.333
		rgbGen identity
	}
	{
		map textures/lundesert/lun_grill1glow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 0.333
	}
}

textures/lundesert/scrub1
{
	cull disable
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm alphashadow
	{
		map textures/lundesert/scrub1.tga
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		depthFunc equal
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
}

textures/lundesert/scrub2
{
	cull disable
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm alphashadow
	{
		map textures/lundesert/scrub2.tga
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		depthFunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/lundesert/scrub3
{
	cull disable
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm alphashadow
	{
		map textures/lundesert/scrub3.tga
		alphaFunc GE128
		depthWrite
	}
	{
		map $lightmap
		depthFunc equal
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

//Not used: doesn't rotate around the right point
textures/lundesert/lunslowfan
{
	surfaceparm trans	
	surfaceparm nomarks	
	cull none
	nopicmip
	{
		clampmap textures/sfx/fan.tga
		tcMod rotate 64
		tcMod scale 0.25 0.25
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/lundesert/grass1
{
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm noimpact
	cull disable
	{
		map textures/lundesert/grass1.tga
		rgbGen vertex
		alphaFunc GE128
		blendFunc GL_ONE GL_ZERO
//		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//KHAOOOHS AND CON-FUS-ION SHADER FILE BY VONDUR

//SKY OVER LOST DIMENSION OF BEEBH
textures/khaooohs/khs_skybox
{
	surfaceparm noimpact
	surfaceparm nolightmap
	surfaceparm sky
        q3map_lightimage textures/skies/stars.tga
	q3map_surfacelight 300
//      skyparms env/space1 512 -                 //skybox disabled because of bug that appears *sometimes*, but looks cool with that, you can try
	skyparms - 512 -			  //mark this if you'll use skybox
        {
		map textures/skies/topclouds.tga
//		blendfunc GL_ONE GL_ONE           //unmark this if you'll use skybox
		tcMod scroll 0.015 0.016
		tcMod scale 3 3
	}
        {
		map textures/skies/topclouds.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -0.01 -0.012
		tcMod scale 5 5
	}
}

//HIDDEN TREASURES OF GOOBHAABH

textures/khaooohs/egg
{
	qer_editorimage textures/khaooohs/egg_qer.tga
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .3 .2
        surfaceparm nomarks
        cull none
        {
		map textures/khaooohs/egg.tga
		rgbGen identity
	}
        {
		map textures/effects/blueflagmap.tga
                tcGen environment
                tcmod scale .5 .8
                tcmod scroll .1 3

                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map textures/khaooohs/egg.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {

        	map textures/sfx/shadow.tga
                tcGen environment
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
}

//HEEKHAKA

models/mapobjects/spotlamp1/spotlamp
{
	qer_editorimage map models/mapobjects/spotlamp1/spotlamp.tga
        cull disable
        surfaceparm alphashadow
        {
                map models/mapobjects/spotlamp/spotlamp.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}

models/mapobjects/spotlamp1/beam
{
	qer_editorimage map models/mapobjects/spotlamp1/beam.tga
        surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map models/mapobjects/spotlamp/beam.tga
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        //{
	//	map models/mapobjects/spotlamp/beam.tga
         //       tcMod Scroll -.3 0
         //       blendFunc GL_ONE GL_ONE
        //}
     
}

models/mapobjects/spotlamp1/beam_red
{
	surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map textures/sfx/beam_red.tga
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        //{
	//	map textures/sfx/beam_red.tga
         //       tcMod Scroll -.3 0
         //       blendFunc GL_ONE GL_ONE
        //}
     
}

models/mapobjects/spotlamp1/beam_blue
{
        surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map models/mapobjects/spotlamp1/beam_blue.tga
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        //{
	//	map models/mapobjects/spotlamp1/beam_blue.tga
         //       tcMod Scroll -.3 0
         //       blendFunc GL_ONE GL_ONE
        //}
     
}

models/mapobjects/spotlamp1/spotlamp_l
{
	qer_editorimage map models/mapobjects/spotlamp1.tga
        cull disable
        q3map_surfacelight	200

        {
                map models/mapobjects/spotlamp/spotlamp_l.tga
		rgbGen identity
        }


}

models/mapobjects/spotlamp1/spotlamp_lred
{
	qer_editorimage map textures/base_light/light1red.tga
      	cull disable
      	q3map_surfacelight	200

        {
                map textures/base_light/light1red.tga
		rgbGen identity
        }


}

models/mapobjects/spotlamp1/spotlamp_lblue
{
	qer_editorimage map textures/base_light/light1blue.tga
      	cull disable
      	q3map_surfacelight	200

        {
                map textures/base_light/light1blue.tga
		rgbGen identity
        }


}


textures/sky1/sky
{
	qer_editorimage textures/sky1/sky.tga
                  surfaceparm noimpact
	surfaceparm nolightmap
                  surfaceparm nomarks 
                  q3map_backsplash 0 0 
                  q3map_lightsubdivide 512 
                  surfaceparm sky
                  q3map_surfacelight 400
	q3map_sun 1 1 .98 100 160 60 
	

        skyparms env/roman/sky - -
}

levelshots/venecia_ctf
{
	nopicmip
	surfaceparm nolightmap
	{
		animmap 0.25 levelshots/venecia_ctf_1.tga levelshots/venecia_ctf_2.tga levelshots/venecia_ctf_3.tga 
		rgbGen wave sawtooth 0 1 0 .25
	}
	{
		map textures/base_wall/comp3textd.tga
		blendfunc add
		tcmod scroll 5 .25
		rgbGen wave inversesawtooth 0 1 0 .25
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
}

levelshots/venecia_dm
{
	nopicmip
	surfaceparm nolightmap
	{
		animmap 0.25 levelshots/venecia_dm_1.tga levelshots/venecia_dm_2.tga levelshots/venecia_dm_3.tga levelshots/venecia_dm_4.tga levelshots/venecia_dm_5.tga levelshots/venecia_dm_6.tga
		rgbGen wave sawtooth 0 1 0 .25
	}
	{
		map textures/base_wall/comp3textd.tga
		blendfunc add
		tcmod scroll 5 .25
		rgbGen wave inversesawtooth 0 1 0 .25
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		map gfx/damage/xf_hit.tga
		blendfunc blend
	}
}

models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		animmap 20 models/weapons2/machinegun/f_machinegun.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


models/weapons2/plasma/f_plasma
{
	sort additive
	cull disable
	{
		animmap 14 models/weapons2/plasma/xf_plasma01.jpg gfx/nweapfire/f_fireblank.jpg models/weapons2/plasma/xf_plasma02.jpg gfx/nweapfire/f_fireblank.jpg
		blendfunc add
	}
}


//Plasma projectile behind gib effect fix	-XF
sprites/plasma1
{
	sort additive
	cull disable
	{
		clampmap sprites/plasmaa.tga
		blendfunc GL_ONE GL_ONE
                tcMod rotate 931
	}
}

//XF's New Weapon Things' Shaders

//Various sprite brass effects - XF
xfmgB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap sprites/xfbrasses/xfmgbrass.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcmod rotate 270
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfsgB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap sprites/xfbrasses/xfsgbrass.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcmod rotate 270
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfglB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap sprites/xfbrasses/xfglbrass.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcmod rotate 270
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfrlB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap sprites/xfbrasses/xfrlbrass.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		tcmod rotate 270
		rgbGen		vertex
		alphaGen	vertex
	}
}

//Various new weapon hit sprite effects

// shaders for bullet hit sprites (MG/SG)
xfbullsmoke1
{
	cull none
	sort additive
	{
		map sprites/xfbullsmoke/xfbsf-0013.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke2
{
	cull none
	sort additive
	{
		map sprites/xfbullsmoke/xfbs-0001.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke3
{
	cull none
	sort additive
	{
		map sprites/xfbullsmoke/xfbs-0002.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke4
{
	cull none
	sort additive
	{
		map sprites/xfbullsmoke/xfbs-0003.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA	//changed for brighter spark sprite. -XF
	}
}
xfbullsmoke5
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0004.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke6
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0005.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke7
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0006.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke8
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0007.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke9
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0008.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke10
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0009.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke11
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0010.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke12
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0011.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke13
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0012.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke14
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0013.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke15
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0014.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke16
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0015.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke17
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0016.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke18
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0017.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke19
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0018.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
xfbullsmoke20
{
	cull none
	{
		map sprites/xfbullsmoke/xfbs-0019.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
// shaders for general hit sprites (RG/RL/GL)
xfhitsmoke1
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0000.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke2
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0001.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke3
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0002.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke4
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0003.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke5
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0004.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke6
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0005.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke7
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0006.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke8
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0007.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke9
{
	cull none
	sort additive
	{
		map sprites/xfhitsmoke/xfhsr-0008.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke10
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0009.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke11
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0010.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke12
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0011.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke13
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0012.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke14
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0013.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke15
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0014.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke16
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0015.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke17
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0016.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke18
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0017.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke19
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0018.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke20
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0019.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke21
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0020.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke22
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0021.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xfhitsmoke23
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0022.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}

// shaders for explosive hit sprites (GL/RL)
explodexfex1
{
	cull none
	sort additive
	{
		map sprites/explodexfex/xfex-0000.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex2
{
	cull none
	{
		map sprites/explodexfex/xfex-0001.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex3
{
	cull none
	{
		map sprites/explodexfex/xfex-0002.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex4
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0005.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex5
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0004.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex6
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0005.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex7
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0006.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex8
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0007.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex9
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0008.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex10
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0009.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex11
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0010.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex12
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0011.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex13
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0012.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex14
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0013.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex15
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0014.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex16
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0015.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex17
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0016.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex18
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0017.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex19
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0018.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex20
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0019.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex21
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0020.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex22
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0021.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodexfex23
{
	cull none
	{
		map sprites/xfhitsmoke/xfhs-0022.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}

// shaders for lightning hit sprite (LG)
xflighthit1
{
	cull none
	sort additive
	{
		map sprites/xflighthit/xflh-00000.jpg
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
xflighthit2
{
	cull none
	{
		map sprites/xflighthit/xflh-00004.jpg
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}

//shaders for "blaster" hit sprites (GL)
explodeplsm1
{
	cull none
	sort additive
	{
		map sprites/explodeplsm/fs2-0000.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm2
{
	cull none
	{
		map sprites/explodeplsm/fs2-0001.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm3
{
	cull none
	{
		map sprites/explodeplsm/fs2-0005.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm4
{
	cull none
	{
		map sprites/explodeplsm/fs2-0010.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm5
{
	cull none
	{
		map sprites/explodeplsm/fs2-0015.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm6
{
	cull none
	{
		map sprites/explodeplsm/fs2-0018.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm7
{
	cull none
	{
		map sprites/explodeplsm/fs2-0020.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm8
{
	cull none
	{
		map sprites/explodeplsm/fs2-0022.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm9
{
	cull none
	{
		map sprites/explodeplsm/fs2-0008.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm10
{
	cull none
	{
		map sprites/explodeplsm/fs2-0009.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm11
{
	cull none
	{
		map sprites/explodeplsm/fs2-0010.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm12
{
	cull none
	{
		map sprites/explodeplsm/fs2-0011.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm13
{
	cull none
	{
		map sprites/explodeplsm/fs2-0012.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm14
{
	cull none
	{
		map sprites/explodeplsm/fs2-0013.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm15
{
	cull none
	{
		map sprites/explodeplsm/fs2-0014.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm16
{
	cull none
	{
		map sprites/explodeplsm/fs2-0015.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm17
{
	cull none
	{
		map sprites/explodeplsm/fs2-0016.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm18
{
	cull none
	{
		map sprites/explodeplsm/fs2-0017.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm19
{
	cull none
	{
		map sprites/explodeplsm/fs2-0018.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm20
{
	cull none
	{
		map sprites/explodeplsm/fs2-0019.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm21
{
	cull none
	{
		map sprites/explodeplsm/fs2-0020.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm22
{
	cull none
	{
		map sprites/explodeplsm/fs2-0021.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsm23
{
	cull none
	{
		map sprites/explodeplsm/fs2-0022.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}

//shaders for plasma hit sprites (PG/BFG)
explodeplsn1
{
	cull none
	sort additive
	{
		map sprites/explodeplsm2/fs2-0000.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn2
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0001.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn3
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0005.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn4
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0010.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn5
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0015.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn6
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0018.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn7
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0020.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn8
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0022.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn9
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0008.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn10
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0009.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn11
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0010.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn12
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0011.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn13
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0012.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn14
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0013.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn15
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0014.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn16
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0015.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn17
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0016.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn18
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0017.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn19
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0018.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn20
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0019.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn21
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0020.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn22
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0021.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}
explodeplsn23
{
	cull none
	{
		map sprites/explodeplsm2/fs2-0022.tga
		blendFunc GL_ONE GL_ONE_MINUS_SRC_COLOR
	}
}

//Splat effects shaders
//--------------------------------------
//Hit Splat effects sprite
//--------------------------------------
xfhitsplat1
{
	//sort opaque
	nopicmip
	//entityMergable
	{
		map sprites/xfhitsplat/xfhsplt.tga
		blendFunc blend
	}
}
//--------------------------------------
//Splat effects sprites
//--------------------------------------
xfbigsplat1
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00001.tga
		blendfunc blend
	}
}

xfbigsplat2
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00002.tga
		blendfunc blend
	}
}

xfbigsplat3
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00003.tga
		blendfunc blend
	}
}

xfbigsplat4
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00004.tga
		blendfunc blend
	}
}
/*
xfbigsplat5
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00005.tga
		blendfunc blend
	}
}

xfbigsplat6
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00006.tga
		blendfunc blend
	}
}

xfbigsplat7
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00007.tga
		blendfunc blend
	}
}

xfbigsplat8
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00008.tga
		blendfunc blend
	}
}

xfbigsplat9
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00009.tga
		blendfunc blend
	}
}

xfbigsplat10
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00010.tga
		blendfunc blend
	}
}

xfbigsplat11
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00011.tga
		blendfunc blend
	}
}

xfbigsplat12
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00012.tga
		blendfunc blend
	}
}

xfbigsplat13
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00013.tga
		blendfunc blend
	}
}

xfbigsplat14
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00014.tga
		blendfunc blend
	}
}

xfbigsplat15
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00015.tga
		blendfunc blend
	}
}

xfbigsplat16
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00016.tga
		blendfunc blend
	}
}

xfbigsplat17
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00017.tga
		blendfunc blend
	}
}

xfbigsplat18
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00018.tga
		blendfunc blend
	}
}

xfbigsplat19
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00019.tga
		blendfunc blend
	}
}

xfbigsplat20
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00020.tga
		blendfunc blend
	}
}

xfbigsplat21
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00021.tga
		blendfunc blend
	}
}

xfbigsplat22
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00022.tga
		blendfunc blend
	}
}

xfbigsplat23
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00023.tga
		blendfunc blend
	}
}

xfbigsplat24
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00024.tga
		blendfunc blend
	}
}

xfbigsplat25
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00025.tga
		blendfunc blend
	}
}

xfbigsplat26
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00026.tga
		blendfunc blend
	}
}

xfbigsplat27
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00027.tga
		blendfunc blend
	}
}

xfbigsplat28
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00028.tga
		blendfunc blend
	}
}

xfbigsplat29
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00029.tga
		blendfunc blend
	}
}

xfbigsplat30
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00030.tga
		blendfunc blend
	}
}

xfbigsplat31
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00031.tga
		blendfunc blend
	}
}

xfbigsplat32
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00032.tga
		blendfunc blend
	}
}

xfbigsplat33
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00033.tga
		blendfunc blend
	}
}

xfbigsplat34
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00034.tga
		blendfunc blend
	}
}

xfbigsplat35
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00035.tga
		blendfunc blend
	}
}

xfbigsplat36
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfbsplt-00036.tga
		blendfunc blend
	}
}
*/
//--------------------------------------
//Splash effects shaders
//--------------------------------------
xfsplash1
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfsplsh-00001.tga
		blendfunc blend
	}
}

xfsplash2
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfsplsh-00002.tga
		blendfunc blend
	}
}

xfsplash3
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfsplsh-00003.tga
		blendfunc blend
	}
}

xfsplash4
{
	//sort opaque
	nopicmip
	{
		map sprites/xfgibsprite/xfsplsh-00004.tga
		blendfunc blend
	}
}

xfchunkB
{
        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chunklarge.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk01
{
    sort 13
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml01.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk02
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml02.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk03
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml03.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk04
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml04.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk05
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml05.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk06
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml06.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk07
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml07.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk08
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml08.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk09
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml09.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

xfchunk10
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_chksml10.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrail
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_spurt.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

bloodTrailXF
{
    sort 13        
	nopicmip
	entityMergable
	{
		
                clampmap gfx/damage/xf_splat.tga
		//alphaFunc GE128
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

//gauntlethider
models/weapons2/gauntlet/gauntlet1
{
	{
		map models/weapons2/gauntlet/gauntlet1.tga
		 alphaFunc GE128
	}
}

models/weapons2/gauntlet/gauntlet2
{
	{
		map models/weapons2/gauntlet/gauntlet2.tga
		 alphaFunc GE128
	}
}

//Here lies new script for menu backdrop. -CZ45
menuback
{
	nopicmip
	nomipmaps
         {
               map textures/xmenu/xq3cm01.tga
               rgbgen identity
        }        
}

//Here lies new script for menu backdrop. -CZ45
menubacknologo
{
	nopicmip
	nomipmaps
        {
		map textures/xmenu/xq3cm02.tga
		rgbgen identity
	}       
}

sprites/plasma2
{
	sort additive
	cull disable
	{
		clampmap sprites/plasmab.jpg
		blendfunc GL_ONE GL_ONE
                tcMod rotate 931
	}
}

models/weapons2/bfg/bfg_k
{
	{
		map models/weapons2/bfg/bfg.tga
		 alphaFunc GE128
	}
}

//gauntlethider
models/weapons2/bfg/bfg
{
	{
		map models/weapons2/bfg/bfg.tga
		 alphaFunc GE128
	}
}

models/weapons2/bfg/bfg_e
{
	{
		map models/weapons2/bfg/bfg.tga
		 alphaFunc GE128
	}
}

console
{
	nomipmaps
	{
		map textures/sfx/red.jpg
		blendfunc filter
		rgbGen identity
		tcMod scroll 0.00 0.00
		tcMod scale 1.5 1.5
	}
}

warning
{
	nomipmaps
	{
		map ui/assets/warning.tga
		blendfunc blend
		tcMod scale 8 8
	}
}

centerconsole
{
	nomipmaps
	{
		clampmap textures/sfx/console01.tga
		tcMod rotate 20
	}
	{
		clampmap textures/sfx/console02.tga
		blendfunc filter
		rgbGen wave sin 0.5 0 0 0 
		tcMod rotate -60
	}
}

menuback_a
{	
	nopicmip
	nomipmaps	

	{
		map ui/assets/menuback_a.tga
	}
	

	{
		map ui/assets/console02.tga
		blendfunc filter
		tcmod rotate -60
	}
}

menuback_e
{
	nopicmip
	nomipmaps
	{
		clampmap ui/assets/radial.tga
		blendfunc add
		tcmod rotate 100
	}
	{
		clampmap ui/assets/radial.tga
		blendfunc add
		tcmod rotate -100
	}
}

levelShotDetail
{
	nopicmip
	{
		map textures/sfx/detail2.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbgen identity
	}
}

models/powerups/instant/flight
{
	{
		map textures/effects/envmaproc.jpg
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}


models/powerups/ob2_1
{
        {
	        map models/powerups/overload_map.tga
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen identity
        }
}

models/powerups/ob2_2
{
        {
	        map models/powerups/overload_mapbw.tga
                blendFunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen entity
        }
}

models/powerups/ob2_3
{
        {
		map models/powerups/overload_lights.tga
		tcmod scroll 1 1
	        rgbGen entity
        }
}

models/powerups/ob2_4
{
 cull disable
	{
		map models/powerups/pop_bw.tga
		tcMod turb 0 0.1 0 0.1
                tcmod rotate 311
                tcmod scroll 1 1
		blendfunc Add
                rgbGen entity
	}
}


bulletExplosion
{
	cull disable
	{
		animmap 10 models/weaphits/bullet1.tga  models/weaphits/bullet2.tga  models/weaphits/bullet3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 10
		blendfunc add
	}
	{
		animmap 10 models/weaphits/bullet2.tga  models/weaphits/bullet3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 10
		blendfunc add
	}
}

ui/assets/3_cursor3
{
	nopicmip
	nomipmaps
	{
		animmap 9 ui/assets/3_cursor3.tga ui/assets/3_cursor3.tga ui/assets/3_cursor3.tga ui/assets/3_cursor3.tga ui/assets/3_cursor3.tga ui/assets/3_cursor3.tga ui/assets/3_cursor3.tga ui/assets/3_cursor4.tga
		blendfunc blend
	}
}

powerups/battleSuit_n
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures/effects/envmapgold2.tga
                //map textures/sfx/specular.tga
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc GL_ONE GL_ONE
	}
}
powerups/battleWeapon_n
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures/effects/envmapgold2.tga
                //map textures/sfx/specular.tga
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc GL_ONE GL_ONE
	}
}

powerups/invisibility
{
	{
		map textures/effects/invismap.tga
                //map textures/sfx/specular.tga
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.15 0 0.25
		tcGen environment
	}
}
powerups/quad_n
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/quadWeapon_n
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/regen_n
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures/effects/regenmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/hasteWeapon_n
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures/effects/hastemap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}


models/mapobjects/lamps/bot_flare
{

        deformVertexes autoSprite
        deformVertexes move 0 0 1   sin 0 5 0 0.1
        deformVertexes move 1 1 0   sin 0 9 0 0.05

        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none

        {
                clampmap sprites/null.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 20
        }


}


models/mapobjects/lamps/bot_flare2
{

        deformVertexes move 0 0 1   sin 0 5 0 0.1
        deformVertexes move 1 1 0   sin 0 9 0 0.05
        deformVertexes wave 50 sin 0 1 0 9

        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
    
        {
                map models/mapobjects/lamps/bot_flare2.tga
                blendFunc GL_ONE GL_ONE
                
        }


}


models/mapobjects/lamps/bot_lamp
{
        deformVertexes move 0 0 1   sin 0 5 0 0.1
        deformVertexes move 1 1 0   sin 0 9 0 0.05
    
        {
                map models/mapobjects/lamps/bot_lamp.tga
              //  rgbGen vertex
                
        }


}

models/mapobjects/lamps/bot_lamp2
{
        deformVertexes move 0 0 1   sin 0 5 0 0.1
        deformVertexes move 1 1 0   sin 0 9 0 0.05
    
        {
                map models/mapobjects/lamps/bot_lamp2.tga
                //rgbGen vertex
        }


}


models/mapobjects/lamps/bot_wing
{
/*
    deformVertexes move 0 0 3   sin 0 5 0 0.1
    deformVertexes move 2 2 0   sin 0 9 0 0.05
    deformVertexes wave 100   sin 0 .5 0 .5
*/
    deformVertexes move 0 0 1   sin 0 5 0 0.1
    deformVertexes move 1 1 0   sin 0 9 0 0.05
    deformVertexes wave 100   sin 0 .5 0 .5
    cull disable
    
        {
                map models/mapobjects/lamps/bot_wing.tga
                alphaFunc GE128
		depthWrite
		//rgbGen vertex
        }


}

models/powerups/health/red
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapred.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/health/yellow
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapyel.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/instant/flight
{
	{
		map textures\effects\envmapred.jpg
		blendfunc GL_ONE GL_ZERO
		tcGen environment
		rgbGen identity
	}
}

models/powerups/health/green
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\green_.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/instant/haste
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapligh.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/instant/invis
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapdim.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/instant/quad
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapblue.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/instant/regen
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapred.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

models/powerups/instant/enviro
{
	deformVertexes wave 100 sin 0.1 0 0 0
	{
		map textures\effects\envmapgold.jpg
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}

// neutral flag
models/flags/n_flag2
{
	deformVertexes wave 100 sin 4 3 0 0.3
	deformVertexes wave 30 sin 0 3 0 .8
	deformVertexes normal .3 .2
	cull none
	{
		map models/flags/n_flag2.tga
		rgbGen identity
	}
	{
		map models/flags/neutral_fx.tga
		tcGen environment
		//tcmod scale 9 3
		//tcmod scroll .1 .7

		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map models/flags/n_flag2.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map textures/sfx/shadow.tga
		tcGen environment 
		//blendFunc GL_ONE GL_ONE            
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

models/flags/n_flag
{
	cull disable
	deformVertexes wave 100 sin 0 3 0 .7
	{
		map models/flags/n_flag.tga
	}
}

models/powerups/shield/shield
{
 cull disable
	{
		map models/powerups/shield/shield.tga
		tcGen environment
	//	tcmod scale .5 .5
	//	tcMod turb 0 0.3 0 0.3
	//	tcmod rotate 333
		tcmod scroll 1 1
		blendfunc Add
	}
}


models/weaphits/kamiwave01
{
	
        surfaceparm trans	
	cull disable
        nomipmaps
	{
	        clampmap models/weaphits/kamiwave01.tga 
		blendFunc Add
                tcmod rotate 20
		rgbGen entity
	}
	{
	        clampmap models/weaphits/kamiwave01.tga 
		blendFunc Add
  		tcmod rotate -20
		rgbGen entity
	}
}
models/weaphits/kamiwave02
{
	
        surfaceparm trans	
	cull disable
	{
	        map models/weaphits/kamiwave02.tga 
		blendFunc Add
                tcmod scroll 1 0
		rgbGen entity
	}
}


models/powerups/kamitrail
{
	
        surfaceparm trans	
	cull disable
        nomipmaps
	{
	        map models/powerups/kamitrail.tga 
		blendFunc Add
		rgbGen identity
	}
}


models/powerups/kamikazi1
{
        {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		rgbGen identity
        }
}

models/powerups/kamikazi2
{
        {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc add
                rgbGen identity
        }
}

models/powerups/kamikazi_f
{
   	
        {
	        map models/powerups/kamikazi_f.tga
		blendfunc Add
                tcmod Scroll 0 1
                rgbGen identity
        }

}


models/weaphits/kamik01
{
  cull disable
       {
	        map models/weaphits/kamik01.tga
                tcGen environment
                blendfunc GL_ONE GL_ZERO
		//blendfunc   	blend
                //alphaGen	wave inversesawtooth 1 1 0 1
                rgbGen identity
       }
       {
                map models/weaphits/kamik02.tga
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate 66
                tcmod Scroll 1.3 .8
                
                rgbGen identity
        }
       {
                map models/weaphits/kamik02.tga
                tcGen environment
                blendFunc add
                tcmod scale .5 .5
                tcmod rotate -116
                tcmod Scroll -1 .3
                
                rgbGen identity
        }
}

models/weaphits/kam01
{
        cull disable  
        {
                map models/weaphits/kam01.tga
                blendFunc add
                tcmod Scroll 1.4 0
                rgbGen identity
        }
        {
                map models/weaphits/kam02.tga
                blendFunc add
                tcmod Scroll -1.9 0
                rgbGen identity
        }

}
models/weaphits/kam02
{
        cull disable  
        {
                map models/weaphits/kam01.tga
                blendFunc add
                tcmod Scroll -2 0
                rgbGen identity
        }
        {
                map models/weaphits/kam02.tga
                blendFunc add
                tcmod Scroll 1 0
                rgbGen identity
        }

}
models/weaphits/kam03
{
        cull disable  
        deformVertexes autoSprite
        {
                clampmap models/weaphits/kam03.tga
                blendFunc add
                tcmod rotate 133
                rgbGen identity
        }
        {
                clampmap models/weaphits/kam03.tga
                blendFunc add
                tcmod rotate -113
                rgbGen identity
        }

}
models/weaphits/kam04
{
        cull disable  
        deformVertexes autoSprite
        {
                clampmap models/weaphits/kam04.tga
                blendFunc add
                tcmod rotate 999
                rgbGen identity
        }


}

textures/base/q1met_redpad
{
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/q1met_redpad.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base/q1met_redpad.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base/bluegoal
{
	{
		map textures/base/bluegoal.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}
textures/base/redgoal
{
	{
		map textures/base/redgoal.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}


textures/base/comp_panel
{
	surfaceparm trans
	light 1
	q3map_surfacelight 500

	{
		map textures/base/comp_panel.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}

	{
		map textures/base/comp_panel.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base/ceil1_8
{
	light 1	
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/ceil1_8.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base/ceil1_3
{
	light 1	
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/ceil1_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base/ceil1_4
{
	light 1	
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/ceil1_4.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/base/border11light
{
	q3map_surfacelight 1000	
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base/border11light.blend.tga
		rgbGen wave sin 0.5 0.5 0 .2
		blendfunc GL_ONE GL_ONE
	}
}
textures/base/electricwall	
{
	light 1	
	q3map_surfacelight 400

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.blend.tga
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/base/electric.blend.tga
		tcMod scroll 1 1 10 20
		rgbGen wave sin 1 2 0 1
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/btactmach0
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/btactmach0.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/btactmach0.blend.tga
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_button/shootme2
{
	qer_editorimage textures/base_button/shootme1.tga
	q3map_lightimage textures/base_button/shootme_glow.tga
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal3_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_button/shootme_glow.tga
		rgbGen wave sin 0.5 1.0 0 .3
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_floor/techfloor2
{ 
        cull disable
        //surfaceparm trans	
        surfaceparm nomarks	
        //nomipmaps

        {
	        clampmap textures/base_floor/techfloor2.tga
		alphaFunc GE128
                tcmod rotate 70
                tcMod stretch sin .8 0.2 0 .3
	        rgbGen identity
	}
        {
                clampmap textures/base_floor/techfloor2.tga
                alphaFunc GE128
                tcmod rotate -50
                tcMod stretch sin .8 0.2 0 .2
                rgbGen identity
	}
        {
	        clampmap textures/base_floor/techfloor2.tga
		alphaFunc GE128
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}

}
textures/base_floor/techfloor
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/sfx/proto_zzztpink.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        //clampmap textures/gothic_block/blocks18cgeomtrn2.tga
                clampmap textures/base_floor/techfloor2.tga
		blendFunc blend
                tcmod rotate 170
                tcMod stretch sin .8 0.2 0 .4
	        rgbGen identity
	}
        {
		map textures/base_floor/techfloor.tga
                blendFunc blend
		rgbGen identity
	}
        
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
                depthFunc equal
       }
}
textures/base_floor/metalbridge04dbroke
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/metalbridge04dbroke.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_floor/clang_floor_ow3
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clang_floor_ow3.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/floor3_3dark_ow
{

        {
		map textures/effects/envmapblue.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/base_floor/floor3_3dark_ow.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/base_floor/proto_rustygrate2
{
	surfaceparm	metalsteps	
        surfaceparm trans	
	surfaceparm alphashadow
	cull none
        nopicmip
	// A RUSTY GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_rustygrate2.tga
		// tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/cybergrate3
{
    cull disable
    surfaceparm alphashadow
    surfaceparm	metalsteps	
    surfaceparm nomarks
        {
                map textures/sfx/hologirl.tga
                blendFunc add
                tcmod scale  1.2 .5
                tcmod scroll 3.1 1.1
		
        }
        {
                map textures/base_floor/cybergrate3.tga
                alphaFunc GE128
		depthWrite
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_floor/cybergrate2
{
    cull disable
    surfaceparm alphashadow
    surfaceparm	metalsteps	
    surfaceparm nomarks
        {
                map textures/base_floor/cybergrate2.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_floor/clang_floor_ow
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clang_floor_ow.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_floor/clangdark_ow3
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/clangdark_ow3.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/cybergrate
{
    cull disable
    surfaceparm alphashadow
    surfaceparm	metalsteps	
    surfaceparm nomarks
        {
                map textures/base_floor/cybergrate.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_floor/diamond2c_ow
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_floor/diamond2c_ow.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/diamond2cspot
{    
     surfaceparm	metalsteps	   
        
        {
		map textures/liquids/proto_grueldark2.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
	}
        
        {
		map textures/effects/tinfx3.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }
       
        {
		map textures/base_floor/diamond2cspot.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/clang_floor3blava
{
	surfaceparm nolightmap
        {
		map textures/liquids/protolava2.tga
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_floor/clang_floor3blava.tga
                blendfunc blend
		
	}
      
}
textures/base_floor/pool_side2
{

	
       	{
		map textures/liquids/pool3d_5e.tga
		tcmod scale -.5 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}
       
	{
		map textures/liquids/pool3d_6e.tga
		blendFunc GL_one GL_ONE
		tcmod scale .5 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_floor/pool_side2.tga
		blendFunc GL_one GL_src_color
		tcmod scale .5 .5
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}
       
              
}
textures/base_floor/pool_side3
{
	qer_editorimage textures/base_wall/patch10rusty5.tga
	
       	{
		map textures/liquids/pool3d_5e.tga
		tcmod scale -.5 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}
       
	{
		map textures/liquids/pool3d_6e.tga
		blendFunc GL_one GL_ONE
		tcmod scale .5 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_wall/patch10rusty5.tga
		blendFunc GL_one GL_src_color
		tcmod scale .5 .5
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}
       
              
}
textures/base_floor/pool_floor2
{
	
	
        	{
		map textures/liquids/pool3d_5e.tga
		tcmod scale -.25 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	
	}
       
	{
		map textures/liquids/pool3d_6e.tga
		blendFunc GL_one GL_ONE
		tcmod scale .25 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_floor/pool_floor2.tga
		blendFunc GL_one GL_src_color
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}
       
              
}
textures/base_floor/pool_floor3
{
	qer_editorimage textures/base_wall/patch10rusty5.tga
	
        	{
		map textures/liquids/pool3d_5e.tga
		tcmod scale -.25 -.25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	
	}
       
	{
		map textures/liquids/pool3d_6e.tga
		blendFunc GL_one GL_ONE
		tcmod scale .25 .25
		tcmod scroll .025 .025
		rgbgen wave sin .75 0 0 0
	}

	{
		map textures/base_wall/patch10rusty5.tga
		blendFunc GL_one GL_src_color
		rgbgen identity
	}


	{
		rgbGen identity
		map $lightmap
		blendfunc gl_dst_color gl_zero
	}
       
              
}


textures/base_floor/hfloor3
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/hfloor3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/effects/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/base_floor/hfloor3.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
       
              
}
textures/base_floor/clangspot
{    
     surfaceparm	metalsteps	
     qer_editorimage textures/base_floor/clangdarkspot.tga 
        //{
	//	map textures/base_floor/clangspot.tga
	//	rgbGen identity
	//}
        
        {
		map textures/liquids/proto_grueldark.tga
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                
		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}
        
        {
		map textures/effects/tinfx3.tga
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}
       
        {
		map textures/base_floor/clangspot.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/clangspot2
{    
     surfaceparm	metalsteps	
        
        {
		map textures/liquids/proto_grueldark.tga
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                
		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}
        
        {
		map textures/effects/tinfx3.tga
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}
       
        {
		map textures/base_floor/clangspot2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/clangdarkspot
{    
     surfaceparm	metalsteps	   
        //{
	//	map textures/base_floor/clangdarkspot.tga
	//	rgbGen identity
	//}
        
        {
		map textures/liquids/proto_grueldark.tga
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                
		tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}
        
        {
		map textures/effects/tinfx3.tga
                //tcGen environment
                blendFunc GL_ONE GL_ONE
                tcGen environment
		//tcMod turb 0 0.01 0 9
                //rgbGen identity
	}
       
        {
		map textures/base_floor/clangdarkspot.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_floor/tilefloor5
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/tilefloor5.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/base_floor/tile5_plain
{
	qer_editorimage textures/base_floor/tilefloor5.tga
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/tilefloor5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_floor/concretefloor1
{

	{
		map textures/base_wall/chrome_env.tga
		tcgen environment
		rgbgen wave sin .25 0 0 0
	}


	{
		map textures/base_floor/concretefloor1.tga
		blendFunc GL_ZERO GL_SRC_ALPHA
		tcmod scale .1 .1
		rgbgen identity	
	}

	{
		map textures/base_floor/concretefloor1.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		tcmod turb sin .5 1 0 1
		rgbgen identity	
	}


	{
		map $lightmap
        	blendfunc gl_dst_color gl_zero
		rgbgen identity 
	}




}

textures/base_floor/pjgrate1kc
{
	qer_editorimage textures/base_floor/proto_grate5.tga
	surfaceparm	metalsteps		
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	
	
	{
		map textures/base_floor/proto_grate5.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}


	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_floor/clangfloor_noisy
{
	qer_editorimage textures/base_floor/clang_floor.tga
	surfaceparm metalsteps
	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_floor/clang_floor.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity

	}

}

textures/base_floor/clang_floorshiny2
{
	qer_editorimage textures/base_floor/clang_floor.tga

	{
		map $lightmap
               	tcGen environment
		tcmod scale .25 .25 
		rgbgen identity 
	}


	{
		map textures/base_floor/clang_floorshiny_alpha2.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		alphagen wave triangle .98 .02 0 10
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}
textures/base_floor/clang_floorwet
{
	qer_editorimage textures/base_floor/clang_floor.tga

	{
		map textures/effects/tinfx3.tga
               	tcGen environment
		//tcmod scale .25 .25 
		rgbgen identity 
	}


	{
		map textures/base_floor/clang_floorwet.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		//alphagen wave triangle .98 .02 0 10
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}


textures/base_floor/clang_floorshiny
{
	qer_editorimage textures/base_floor/clang_floor.tga

	{
		map $lightmap
               	tcGen environment
		tcmod scale .25 .25  
	}


	{
		map textures/base_floor/clang_floorshiny_alpha.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}


textures/base_floor/tilefloor7_ow
{
	q3map_lightimage textures/base_floor/tilefloor7_owfx.tga
	q3map_surfacelight 100
	
        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_floor/tilefloor7_ow.tga
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}	
        {
		map textures/base_floor/tilefloor7_owfx.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 2 0 7
	}
        {
		map textures/base_floor/tilefloor7_owfx.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
    	
}
textures/base_floor/skylight1
{
	q3map_lightimage textures/base_floor/skylight1_lm.tga
	q3map_surfacelight 100
	
        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_floor/skylight1.tga
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}	
        {
		map textures/base_floor/skylight1_lm.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .2 2 0 7.7
	}
        {
		map textures/base_floor/skylight1_lm.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .2 5 1 5.1
	}
    	
}
/////////////////////////////
//     Shiny Skylight      //
/////////////////////////////
 
textures/base_floor/skylight_spec
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_floor/skylight_spec.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
//
//***************************************************************
//  This texture has a detail layer that is used to apply a 
//  smeary, dirty overlay to the diamond metal floor texture
//***************************************************************
textures/base_floor/diamond_dirty
{
	qer_editorimage textures/base_floor/diamond2.tga
	q3map_globaltexture
	surfaceparm metalsteps
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/base_floor/grunge2.tga
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 0.0693 0.0712
        }
	{
		map textures/base_floor/diamond2.tga
		tcMod scale 0.5 0.5
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

}
textures/base_floor/clangdark
{
	surfaceparm	metalsteps		

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/clangdark.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_floor/clangdark_ow
{
	surfaceparm	metalsteps		

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/clangdark_ow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}


}
textures/base_floor/diamond_noisy
{
	surfaceparm	metalsteps		

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/diamond2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/base_floor/proto_grate
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	cull none
        nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate.tga
		//tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/proto_grate2
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	cull none
        nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate2.tga
		//tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/proto_grate3
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	cull none
        nopicmip
	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate3.tga
		//tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/proto_grate4
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	surfaceparm nonsolid  //Tim's fuckage
	cull none
        nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate4.tga
		//tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_floor/kc_grate4b
{
	surfaceparm	metalsteps
	surfaceparm alphashadow	
        surfaceparm trans		
	surfaceparm nonsolid
	cull none
       // nopicmip

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/kc_grate4b.tga
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}


textures/base_floor/proto_grate5
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	cull none
        nopicmip
	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_grate5.tga
		//tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/proto_skullgrate
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	cull none
        nopicmip
	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_skullgrate.tga
		//tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/proto_rustygrate
{
	surfaceparm	metalsteps	
    surfaceparm trans	
	surfaceparm alphashadow
	cull none
        nopicmip
	// A RUSTY GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/proto_rustygrate.tga
		// tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/rusty_pentagrate
{
	surfaceparm	metalsteps	
    surfaceparm trans		
    surfaceparm alphashadow

	cull none
    nopicmip
	// A RUSTY and Eeevil grate THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/rusty_pentagrate.tga
		// tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/rusty_baphograte
{
	surfaceparm	metalsteps	
        surfaceparm trans		
	cull none
        nopicmip
	// A RUSTY and Eeevil grate THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/rusty_baphograte.tga
		// tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
        {
		map textures/base_floor/rusty_baphograte2.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave inversesawtooth 0 1 .2 .5
	}
        {
		map textures/base_floor/rusty_baphograte3.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave inversesawtooth 0 1 .4 .5
	}
    
}
textures/base_floor/pjgrate1
{
	surfaceparm	metalsteps		
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/pjgrate1.tga
		tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_floor/pjgrate2
{
	surfaceparm	metalsteps		
	cull none

	// A RUSTED GRATE THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_floor/pjgrate2.tga
		tcMod scale 2.0 2.0
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
		rgbGen identity
	}
}
textures/base_floor/glowfloor2
{
	q3map_surfacelight 800
	q3map_lightimage base_floor/glowfloor2.tga


	// GLOWING RED Floor Color on metalfloor_wall_15
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/metalfloor_wall_15.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_floor/glowred1.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}
textures/base_floor/glowfloor3
{
	q3map_surfacelight 500

	// GLOWING RED Floor Color on Diamond2 floor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/diamond2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_floor/glowred1.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}

textures/base_floor/nomarkstone_1
{
	qer_editorimage textures/base_floor/nomarkstone.tga
	q3map_lightimage textures/base_floor/smallstone.tga
	q3map_globaltexture
	surfaceparm nomarks
	surfaceparm noimpact

	// A stone that isn't marked by weapons. Used below red fog in pj_dm10
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_floor/smallstone.tga
		tcMod scale 2 2
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_light/runway
{
	q3map_lightimage textures/base_light/runway_glow.tga
	surfaceparm nomarks
	q3map_surfacelight 400
	{
		map textures/base_light/runway_glow.tga
		tcmod scale 1 .25
		rgbgen wave square -1 2 .5 8
		tcmod scroll 0 .5
	}	

	{
		map textures/base_light/runway.tga
		blendFunc blend
		rgbGen identity
	}
        
	{
		map $lightmap
		rgbGen identity
		blendfunc filter
	}

	{
		map textures/base_light/runwayb.tga
		blendFunc add
		rgbGen identity
	}

	
}
textures/base_light/geolight
{
	q3map_lightimage textures/base_light/geolight_glow.tga
	surfaceparm nomarks
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/geolight.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_light/geolight_glow.tga
		blendFunc add
		rgbgen wave sin .575 .025 0 10
	}
	
}



textures/base_light/dm18twr
{
	q3map_lightimage textures/base_light/dm18twr_glow.tga
	surfaceparm nomarks
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/dm18twr.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_light/dm18twr_glow.tga
		blendFunc add
		rgbgen wave sin .575 .025 0 10
	}
	
}
textures/base_light/proto_lightgreen
{
	q3map_lightimage textures/base_light/proto_lightgreen.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightgreen.tga
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightgreen.tga
		blendFunc add
	}
	
}
textures/base_light/cornerlight
{
	q3map_lightimage textures/base_light/cornerlight.glow.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map textures/base_light/cornerlight.tga
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

		
	{	
		map textures/base_light/cornerlight.glow.tga
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}		
}


textures/base_light/trianglelight
{
	q3map_lightimage textures/base_light/trianglelight.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map textures/base_light/trianglelight.tga
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

		
	{	
		map textures/base_light/trianglelight.blend.tga
		blendfunc GL_one gl_one
		rgbgen wave sawtooth .6 .1 0 7
	}

		
}

textures/base_light/proto_bulb
{
    deformVertexes autoSprite2
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
    
        {
                map textures/base_light/proto_bulb.tga
                blendFunc GL_ONE GL_ONE
                
        }


}
textures/base_light/shi
{
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull disable
	{
		map textures/base_light/shi.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale .5 .5
		rgbgen wave triangle 1 5.1 1 3
	}
	
        {	
		map textures/base_light/shi.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale .5 .5
                rgbgen wave triangle 1 2 0 7.3
	}
}
textures/base_light/proto_light
{
	q3map_lightimage textures/base_light/proto_lightmap.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/proto_lightmap.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}
textures/base_light/proto_lightred
{
	q3map_lightimage textures/base_light/proto_lightred.tga
	surfaceparm nomarks
	q3map_surfacelight 300
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightred.tga
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightred.tga
		blendFunc add
	}
	
}

textures/base_light/proto_lightred2
{
	q3map_lightimage textures/base_light/proto_lightred.tga
	qer_editorimage textures/base_light/proto_lightred.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_lightred.tga
		blendFunc filter
		rgbGen identity
	}
        {
		map textures/base_light/proto_lightred.tga
		blendFunc add
		rgbGen wave square .5 .5 0 1
	}
	
}

textures/base_light/proto_light_2k
{
	qer_editorimage textures/base_light/proto_light.tga
	q3map_lightimage textures/base_light/proto_lightmap.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/proto_lightmap.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}


textures/base_light/s_proto_light
{
	q3map_lightimage textures/base_light/s_proto_lightmap.tga
	surfaceparm nomarks
	q3map_surfacelight 100
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/proto_light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/proto_lightmap.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 1 .1
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
	}
        {	
		map textures/base_light/proto_light2.tga
		blendfunc GL_ONE GL_ONE
                tcmod scale -1 -1
                 rgbgen wave triangle 1 2 0 7
	}
}
textures/base_light/scrolllight
{
	q3map_lightimage textures/sfx/scrolllight2.tga
	q3map_surfacelight 100
	
        {
		map $lightmap
		rgbGen identity
	}
        {
		Map textures/base_light/scrolllight.tga
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}	
        {    
		Map textures/base_light/scrolllight2.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1 0
	}	
        {    
      	        Map textures/base_light/scrolllight2.tga
      	        blendFunc GL_ONE GL_ONE
                tcmod scroll -2 0
        }	
    
	
}
textures/base_light/lightflare_wht500
{
	qer_editorimage textures/base_light/light_flare.tga
	q3map_lightimage textures/base_light/light1.blend.tga 
	deformVertexes autoSprite
	q3map_surfacelight	500
	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		Map textures/base_light/light_flare.tga
		blendFunc GL_ONE GL_ONE
	}	
	
}
textures/base_light/lightflare_500
{
	qer_editorimage textures/base_light/light_flare.tga
	deformVertexes autoSprite
	q3map_surfacelight	500
	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		Map textures/base_light/light_flare.tga
		blendFunc GL_ONE GL_ONE
	}	
	
}
textures/base_light/border7_ceil50
{
	qer_editorimage textures/base_light/border7_ceil50.tga
	q3map_surfacelight 100
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border7_ceil50.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border7_ceil50glow.tga
		blendfunc GL_ONE GL_ONE
	}
}



textures/base_light/ceil1_38_10k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_20k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 20000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_30k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 30000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_40k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 40000
	light 1
	// Square dirty white light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_50k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 50000
	light 1
	// Square dirty white light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_38_70k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 70000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_38_90k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 90000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/light1dark
{
	qer_editorimage textures/base_light/light1.tga
	q3map_lightimage textures/base_light/light1.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 6000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light1red_2000
{
	qer_editorimage textures/base_light/light1red.tga
	q3map_lightimage textures/base_light/light1red.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1red.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1red_5000
{
	qer_editorimage textures/base_light/light1red.tga
	q3map_lightimage textures/base_light/light1red.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1red.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_5000
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light1blue_2000
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light2blue_2500
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue1.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/light1blue_800
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 800
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1blue_1500
{
	qer_editorimage textures/base_light/light1blue.tga
	q3map_lightimage textures/base_light/light1blue.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 1500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1blue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_5000
{
	qer_editorimage textures/base_light/light1.tga
	q3map_lightimage textures/base_light/light1.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_light/light1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_3000
{
	qer_editorimage textures/base_light/light1.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.tga
		//rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light1_1500
{
	qer_editorimage textures/base_light/light1.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 1500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.tga
		//rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt2_8000
{
	qer_editorimage textures/base_light/light2.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 8000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt2_4000
{
	qer_editorimage textures/base_light/light2.tga
	//light 1
	surfaceparm nomarks
	q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt2_2000
{
	qer_editorimage textures/base_light/light2.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light2.blend.tga
		rgbGen wave sin 0.6 0.1 .1 .1
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light3b_2500
{
	qer_editorimage textures/base_light/light3b.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light3b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light3b.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light4_2500
{
	qer_editorimage textures/base_light/light4.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light4.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light4.blend.tga
		rgbGen wave sin 0.5 0.5 0 3
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light5_3000
{
	qer_editorimage textures/base_light/light5.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 3000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_5k
{
	qer_editorimage textures/base_light/light5.tga
	//light 1
	surfaceparm nomarks
	surfaceparm nolightmap
	q3map_backsplash 0 0
	q3map_surfacelight 5000
	{
		map textures/base_light/light5.tga
		rgbGen identity
	}
//	{
//		map textures/base_light/light5.blend.tga
//		blendFunc GL_ONE GL_ONE
//	}
}

textures/base_light/light5_10k
{
	qer_editorimage textures/base_light/light5.tga
	q3map_lightimage textures/base_light/xlight5.blend.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 10000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/xlight5.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_15k
{
	qer_editorimage textures/base_light/light5.tga
	q3map_lightimage textures/base_light/light5.blend.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 15000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light5.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/light5_20k
{
	qer_editorimage textures/base_light/light5.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 20000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light5.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}


textures/base_light/lt6_2500
{
	qer_editorimage textures/base_light/light6.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light6.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light6.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/light6_2500
{
	qer_editorimage textures/base_light/light6.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light6.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light6.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/lt6_2p5k
{
	qer_editorimage textures/base_light/light6.tga
	light 1
	surfaceparm nomarks
	q3map_surfacelight 5000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light6.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light6.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/patch10_pj_lite
{
	q3map_surfacelight 2500
	surfaceparm nomarks
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/patch10_pj_lite2
{
	q3map_surfacelight 2000
	surfaceparm nomarks
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/patch10_pj_lite2_1000
{
	qer_editorimage textures/base_light/patch10_pj_lite2.tga
	q3map_surfacelight 1000
	surfaceparm nomarks
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/patch10_pj_lite2.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/steedmetallight
{
	q3map_surfacelight 2000	
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/steedmetallight.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/steedmetallight.blend.tga
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/border11light
{
	q3map_surfacelight 500	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border11light.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/base_light/border11light_300
{
	qer_editorimage textures/base_light/border11light.tga
	q3map_lightimage textures/base_light/border11light.blend.tga

	q3map_surfacelight 235	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/border11light.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}


textures/base_light/sm_light1red
{
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1red.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/sm_light1blue
{
	light 1
	surfaceparm nomarks
	q3map_surfacelight 2500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/sm_light1blue.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_light/wstlt1_5
{
	q3map_surfacelight 2000
	surfaceparm nomarks
	light 1

	// older wall lamp
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/pj_wstlt1_3k
{
	qer_editorimage textures/base_light/wstlt1_5.tga
	q3map_lightimage textures/base_light/wstlt1_5.blend.tga
	q3map_surfacelight 3000
	surfaceparm nomarks
	light 1

	// older wall lamp
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wstlt1_5.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/baslt3_1_2K
{
	qer_editorimage textures/base_light/baslt3_1.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	//light 1

	// Fluorescent light from Q2
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt3_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt3_1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/baslt4_1_2k
{
	qer_editorimage textures/base_light/baslt4_1.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	//light 1

	// New Fluorescent light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/baslt4_1_4k
{
	qer_editorimage textures/base_light/baslt4_1.tga
	surfaceparm nomarks
	q3map_surfacelight 4000
	//light 1

	// New Fluorescent light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/baslt4_1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_37
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Modified light blue ceil light from Q2
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_37.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_37.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_2
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_22a
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	//	A red-orange ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_22a_trans
{
	qer_editorimage textures/base_light/ceil1_22a.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 10000
	light 1
	//	A red-orange ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_22a_8k
{
	surfaceparm nomarks
	qer_editorimage textures/base_light/ceil1_22a
	q3map_surfacelight 8000
	light 1
	//	A red-orange ceiling light (wattage 8k)
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_4
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	//	A yellow ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_4.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_4.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_3
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	//	A red ceiling light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_3.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_35
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square green light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_35.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_35.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_30
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square rich blue light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_30_trans
{
	qer_editorimage textures/base_light/ceil1_30.tga
	surfaceparm nomarks
	surfaceparm nonsolid
	q3map_surfacelight 10000
	light 1
	// Square rich blue light non-solid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/ceil1_30_8k
{
	surfaceparm nomarks
	qer_editorimage textures/base_light/ceil1_30
	q3map_surfacelight 8000
	light 1
	// Square rich blue light (8k light wattage
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_31
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square magenta light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_31.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_31.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_32
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square violet light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_32.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_32.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_33
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square golden yellow light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_33.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_33.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_34
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_5k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_10k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_2k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	q3map_lightimage textures/base_light/ceil1_34.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_34_1k
{
	qer_editorimage textures/base_light/ceil1_34.tga
	q3map_lightimage textures/base_light/ceil1_34.blend.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	// Square tourquoise light
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_34.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/ceil_white5k
{
	qer_editorimage textures/base_light/ceil1_38.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square dirty white llight
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_38
{
	surfaceparm nomarks
	q3map_surfacelight 2500
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_38.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/pjceil1_39_1K
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 1000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/ceil1_39
{
	surfaceparm nomarks
	q3map_surfacelight 7500
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/pjceil1_39_1p5k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 1500
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/xceil1_39_2k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 2000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_5k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 5000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_10k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_15k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 15000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_20k
{
//	q3map_backsplash 0 0
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 20000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_30k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 30000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_50k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 50000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_70k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 70000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_90k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 90000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_110k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 110000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_500k
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 500000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}



textures/base_light/xceil1_39_1
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 10000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 20000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_light/xceil1_39_a
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 30000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/xceil1_39_b
{
	qer_editorimage textures/base_light/ceil1_39.tga
	surfaceparm nomarks
	q3map_surfacelight 40000
	light 1
	// Square dirty white
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/ceil1_39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_light/jaildr01_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr01_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr01_3.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr02_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr02_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr02_3.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr03_1
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_1.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr03_2
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr03_2.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_light/jaildr1_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr1_3.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/jaildr2_3
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/jaildr2_3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/jaildr2_3.blend.tga
//		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/wsupprt1_12
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	//light1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/wsupprt1_12h
{
	surfaceparm nomarks
	q3map_surfacelight 1000
	//light1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12h.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/wsupprt1_12h.blend.tga
		rgbGen wave sin 0.5 0.5 1 1
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_light/ceil1_26
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light1
}
textures/base_light/ceil1_28
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light1
}
textures/base_light/ceil1_6
{
	surfaceparm nomarks
	q3map_surfacelight 10000
	light1
}
textures/base_light/tlight05
{
	surfaceparm nomarks
	q3map_surfacelight 5000
	light1
}

textures/base_light/invisi_light1
{
	qer_editorimage base_light/ceil1_30.tga
	qer_trans 50
	//surfaceparm nodraw
	surfaceparm nomarks
	q3map_surfacelight 50000
	light 1
	// Square blue light
	
}


textures/base_object/plasmalogo_1
{
	q3map_lightimage textures/base_object/plasmalogo.tga
	//surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/plasmalogo_1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_object/plasmalogo.tga
		rgbGen wave triangle 0.5 0.5 0.5 0.15
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_object/quadsign_1
{
	qer_editorimage base_object/quadsign1.tga
	q3map_lightimage textures/base_object/quadsign1.blend.tga
	//surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/quadsign1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_object/quadsign1.blend.tga
		rgbGen wave triangle 0.5 0.5 0.5 0.15
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_object/hastesign_1
{
	qer_editorimage base_object/hastesign1.tga
	q3map_lightimage textures/base_object/hastesign1.blend.tga
	//surfaceparm nomarks
	q3map_surfacelight 1000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/hastesign1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_object/hastesign1.blend.tga
		rgbGen wave triangle 0.5 0.5 0.5 0.15
		blendfunc GL_ONE GL_ONE
	}

}
textures/base_object/boxQ3_1
{
	// A green box with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_1.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
textures/base_object/boxQ3_2
{
	// A silver box with a specular and a lightglow map on it
	
	q3map_surfacelight 200
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
	{
		map textures/base_object/boxQ3_2.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/base_object/boxQ3_3
{
	//	A red box side with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxQ3_3.tga
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}
textures/base_object/boxq3_4
{
	//	A golden yellow box with a specular map on it
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_object/boxq3_4.tga
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}


textures/base_support/x_support4
{
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support4.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_support/x_support3
{
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support3.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_support/support1shiny
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/base_support/support1shiny.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_support/support1rust
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/base_support/support1rust.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
       
textures/base_support/support2rust
{
	qer_editorimage textures/base_support/support1rust.tga
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_support/support1rust.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/base_support/grate1_3
{

	{
		map $lightmap
		rgbgen identity      
	}

	{
		map textures/base_support/grate1_3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}
				
}


textures/base_support/shinysupport2
{

	{
		map textures/base_wall/chrome_env.tga
		rgbgen identity      
	}

	{
		map textures/base_support/shinysupport2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphaGen lightingSpecular
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbgen identity      
	}

				
}

textures/base_support/shinysupport1
{

	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity      
	}
		
	
	{
		map textures/base_support/shinysupport1.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

			
}

textures/base_support/x_support
{
	surfaceparm	metalsteps	
	surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_support/z_support
{
	surfaceparm	metalsteps	
    surfaceparm trans	
	surfaceparm alphashadow
    surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/z_support.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_support/x_support2
{
	surfaceparm	metalsteps	
    	surfaceparm trans	
	surfaceparm alphashadow
	surfaceparm playerclip
   	surfaceparm nonsolid
	surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_support/x_support2.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_support/metal1_5
{
	surfaceparm	metalsteps
}

textures/base_support/pj_metal14_1
//Paul Jaquays uses this on the tops of metal frameworks
{
	surfaceparm	metalsteps		

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_support/metal14_1.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/base_support/cable_trans
{
	
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/base_support/cable_trans.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}



textures/base_trim/pj_launcher
{
        {
        	 map textures/base_trim/pj_launcher2.tga
        	 tcmod scroll 0 2
                 rgbGen identity
        }      
        {
        	 map textures/base_trim/pj_launcher.tga
        	 blendfunc blend
                 rgbGen identity
        }
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/base_trim/pewter_nonsolid
{
	qer_editorimage textures/base_trim/dirty_pewter.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/base_trim/dirty_pewter.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/base_trim/proto_comp
{
        {
        	 map textures/base_trim/proto_comp2.tga
        	 tcmod scroll 0 -.2
        	 rgbGen wave sin .5 .5 0 3
                 rgbGen identity
        }
        {
        	 clampmap textures/sfx/console03.tga
        	 tcmod rotate -33
                 tcMod stretch sin .8 0 0 0
                 blendfunc add
                 rgbGen wave sin .6 0 0 0
        }
        {
        	 clampmap textures/sfx/console02.tga
        	 tcmod rotate -333
                 tcMod stretch sin .8 0 0 0
                 blendfunc add
                 rgbGen wave sin .3 0 0 0
        }
        {
        	 map textures/effects/tinfx2c.tga
        	 tcGen environment
                 blendfunc add
                 rgbGen identity
        }
        {
        	 map textures/base_trim/proto_comp.tga
        	 blendfunc blend
        }
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/base_trim/pewter_shiney
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/base_trim/pewter_shiney.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_trim/panel_glo
{   
    
        {
                map textures/sfx/firegorre2.tga       
                
                tcMod turb 0 .6 0 0.06
                tcmod scale .53 .61
                tcmod scroll 0 4
                blendFunc GL_ONE GL_ZERO
                rgbGen wave sin 1 1 0 .1
	}   
        {
		map textures/base_trim/panel_glo.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/spidertrim4
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/base_trim/spidertrim4.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/panel_shiny
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/base_trim/panel_shiny.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/spidertrim3
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/base_trim/spidertrim3.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/wires02
{
    cull disable
    surfaceparm alphashadow
    surfaceparm trans	
        {
                map textures/base_trim/wires02.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_trim/wires01
{
    cull disable
    surfaceparm alphashadow
    deformVertexes autoSprite2
    surfaceparm trans	
        {
                map textures/base_trim/wires01.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_trim/wires01_ass
{
    cull disable
    surfaceparm alphashadow
    deformVertexes autoSprite2
        {
                map textures/base_trim/wires01_ass.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}
textures/base_trim/spiderbite
{

        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .3 0 .2
                tcmod scroll 6 .7
                tcmod scale .4 1
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_trim/spiderbite.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                tcMod stretch sin .8 0.4 0 .2
                tcmod scroll .3 0
	        rgbGen identity
	}
        {
	        map textures/base_trim/spiderbite.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                tcMod stretch sin .8 0.2 0 .1
                tcmod scroll -.5 0
	        rgbGen identity
	}
	{
	        map textures/base_trim/spiderbite.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_trim/dark_tin2
{   
   
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen vertex
	}  
        {
		map textures/base_trim/dark_tin2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
         
}
textures/base_trim/dark_tin2_trans
{  
	qer_editorimage textures/base_trim/dark_tin2
	surfaceparm nonsolid
   
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen vertex
	}  
        {
		map textures/base_trim/dark_tin2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
         
}

textures/base_trim/skull_monitor
{   
    
        {
                map textures/base_trim/skull_monitor.tga 
                tcMod turb 0 .05 0 .2
                rgbGen identity
	} 
        { 
                 map textures/sfx/text.tga
                 blendFunc GL_ONE GL_ONE
                 tcmod scroll 1 0
                 rgbGen identity
	}  
        { 
                 map textures/effects/tinfx2.tga
                 blendFunc GL_ONE GL_ONE
                 tcGen environment
                 rgbGen identity
	}  
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
         
}
textures/base_trim/deeprust_trans
{
	qer_editorimage textures/base_trim/deeprust.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/base_trim/deeprust.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/base_trim/yellow_rustc
{
	
	{
		map textures/base_wall/chrome_env.tga
		tcgen environment
		tcmod scale .25 .25
		rgbGen identity
	}
	{
		map textures/base_trim/yellow_rustc.tga
		blendFunc gl_one_minus_src_alpha gl_src_alpha
	//	alphagen lightingspecular
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

	
       
}


textures/base_trim/panelbrn010w
{
	q3map_lightimage textures/base_trim/panelbrn010wfx.tga
	
        {
		map textures/base_trim/panelbrn010w.tga
        }
	
        {
		map textures/sfx/hologirl2.tga
                tcmod scale .4 .4
                tcmod scroll 6 2
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
		map textures/base_trim/panelbrn010w.tga
                blendfunc blend
		
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
       
}
textures/base_trim/pewter_spec
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_trim/pewter_spec.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
      
}
textures/base_trim/tin
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_trim/tin.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/base_trim/tin.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}       
textures/base_trim/dark_tin
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_trim/dark_tin.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/base_trim/dark_tin.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
       
              
}
textures/base_trim/techborder
{
	q3map_surfacelight 300	
        q3map_lightimage textures/base_trim/techborder_fx.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/techborder.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/techborder_fx.tga
                //tcmod scale  .1 1
                tcmod scroll .1 0
                
		blendfunc GL_ONE GL_ONE
	}
        {
		map textures/base_trim/techborder_fx.tga
                tcmod scale  .1 1
                tcmod scroll .1 0
                
		blendfunc GL_ONE GL_ONE
	}
}
textures/base_trim/spiderbit
{
	q3map_lightimage textures/base_trim/spiderbit_fx.tga
	q3map_surfacelight 100
	
        {
		map $lightmap
		rgbGen identity
	}
        {
		map textures/base_trim/spiderbit.tga
		blendfunc gl_dst_color gl_zero
                rgbGen identity
	}	
        {
		map textures/base_trim/spiderbit_fx.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle .1 .5 0 7
	}
    	
}
textures/base_trim/proto_fence
{
	surfaceparm trans		
	cull none
        nopicmip

	{
		map textures/base_trim/proto_fence.tga
		tcMod scale 3 3
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/base_trim/border11light
{
	q3map_surfacelight 500
	Q3map_lightimage textures/base_trim/border11light.glow.tga	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border11light.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border11light.glow.tga
		blendfunc GL_ONE GL_ONE
		rgbgen wave sin .9 .1 0 10
	}
}

textures/base_trim/border11_250
{
	qer_editorimage textures/base_trim/border11light.tga
	q3map_surfacelight 250
	q3map_lightimage textures/base_trim/border11light.glow.tga	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border11light.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border11light.glow.tga
		blendfunc GL_ONE GL_ONE
		rgbgen wave sin .9 .1 0 10
	}
}

textures/base_trim/border12b
{
	q3map_surfacelight 1000	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border12bfx.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_trim/border12b_pj
{
	qer_editorimage textures/base_trim/border12b.tga
	q3map_surfacelight 150	
	q3map_lightimage textures/base_trim/border12bfx.tga	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border12bfx.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_trim/xborder12b
{
	qer_editorimage textures/base_trim/border12b.tga
	q3map_surfacelight 100	
	q3map_lightimage textures/base_trim/border12bfx.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/border12b.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/border12bfx.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/base_trim/drag_glass1
{
// ************************************************************
// A reddish dragonish glass panel (temp)
// ************************************************************
	surfaceparm trans
	surfaceparm nolightmap
	{
		map textures/base_trim/drag_glass1.tga
		blendFunc GL_ONE_MINUS_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/drag_glass1.tga
		alphaFunc LT128
		blendfunc GL_DST_COLOR GL_ONE
	}
}
textures/base_trim/electricwall	
{
	qer_editorimage textures/organics/wire02a_f.tga
	light 1	
q3map_surfacelight 400

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/organics/wire02a_f.tga
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/sfx/electric2.blend.tga
		rgbGen wave sin 0.6 1 0 2
	//	tcMod rotate 54
		tcMod scroll 0.53 0.43
		blendfunc GL_ONE GL_ONE
	}
}
//**********************************************************
//*    Electric wires with blue electical pattern dancing  *
//*    upon it giving off blue light			   *
//*    Created: 4/12/98 by Paul Jaquays                    *
//**********************************************************
textures/base_trim/electric_blue
{
	qer_editorimage textures/base_trim/electricwall_blue.tga
	q3map_lightimage textures/sfx/electric2.blend.tga
	q3map_globaltexture	
	q3map_surfacelight 200

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_trim/electricwall_blue.tga
		tcMod scale 0.5 0.5
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_trim/electricwall_blue.tga
		blendFunc GL_ONE GL_ONE
	}
	{
		map textures/sfx/electric2.blend.tga
		rgbGen wave sin 0.6 1 0 2
		tcMod scale 0.5 0.5
		tcMod rotate 54
		tcMod scroll 0.53 0.43
		blendfunc GL_ONE GL_ONE
	}
}



textures/base_wall/bluemetalsupport2eye
{
	
        surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/bluemetalsupport2eyel.tga
	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2eye.tga
		blendFunc blend	
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
        {
		map textures/base_wall/bluemetalsupport2eyel.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}
}
textures/base_wall/atechengine_ax
{       
      q3map_lightimage textures/base_wall/atechengine_ax2.tga
      q3map_surfacelight 300  
        {
		map textures/sfx/proto_zzztpink.tga
                tcmod rotate 60
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_wall/atechengine_ax.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_wall/concrete_ow
{       
        
        {
		map textures/sfx/proto_zzztblu2.tga
                tcMod turb 0 .5 0 9.6
                tcmod scale 2 2
                tcmod scroll 9 5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/base_wall/concrete_ow.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/base_wall/symbol_bluelt1   
{
	q3map_lightimage textures/base_wall/symbol_bluelt1_mask.tga
	q3map_surfacelight 100
	light 1

	{
		map $lightmap
		rgbGen identity
	}

	
	{
		map textures/base_wall/symbol_bluelt1.tga
		blendfunc filter
		rgbgen identity
	}
	
	{
		map textures/base_wall/symbol_bluelt1_mask.tga
		blendfunc add
		rgbgen wave sawtooth .2 .05 0 7
	}
}
	


textures/base_wall/metaltechgeomtrn
{


        {
		map textures/sfx/fire_ctfblue.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn.tga
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/base_wall/metaltechgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/base_wall/metaltechgeomtrn.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/base_wall/green_con04
{
     {
		map textures/sfx/specular.tga
                tcGen environment
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/green_con04.tga
                blendfunc blend
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
	//{
	//	map $lightmap
	//	rgbgen identity      
	//}
	//
	//{
	//	map textures/base_wall/green_con04.tga
	//	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	//	rgbGen identity
	//	alphaGen lightingSpecular
	//}
}


textures/base_wall/glass_frame
{
     cull none
     surfaceparm alphashadow

        {
		map textures/effects/tinfx2.tga
                blendFunc GL_ONE GL_ONE
                tcgen environment
                rgbGen identity
	}
	{
		map textures/base_wall/glass_frame.tga
                alphaFunc GE128
                depthWrite
		//rgbGen vertex
                //blendfunc blend	
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/metalfloor_wall_15ow
{
        {
		map textures/base_wall/metalfloor_wall_15ow.tga
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
        }
	
        {
		map textures/sfx/hologirl.tga
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ONE
                rgbGen identity
                
	}
	{
		map textures/base_wall/metalfloor_wall_15ow.tga
                blendfunc blend
		rgbGen identity
	}
        {
		map $lightmap
		blendFunc filter
                //blendfunc dst_color gl_zero                                             
	}

}

textures/base_wall/atech1_alpha
{
	
        {
		map textures/sfx/hologirl.tga
                tcmod scale 2 .4
                tcmod scroll 6 .6
                //tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/atech1_alpha.tga
                blendfunc blend
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/concrete4
{
	
        {
		map textures/liquids/protolava2.tga
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/base_wall/concrete4.tga
                blendfunc blend
                rgbGen identity
		
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}
textures/base_wall/protobanner_ow
{
     cull disable
     surfaceparm alphashadow
     surfaceparm trans	
     surfaceparm nomarks
     deformVertexes wave 100 sin 0 1 0 .1
     deformVertexes wave 100 sin 0 1 0 .2
     
        {
                map textures/base_wall/protobanner_ow.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}

textures/base_wall/girders1i_yellofin
{
	surfaceparm	metalsteps	
    	surfaceparm trans	
	surfaceparm alphashadow
	surfaceparm playerclip
   	surfaceparm nonsolid
	surfaceparm nomarks	
	cull none
        nopicmip
	{
		map textures/base_wall/girders1i_yellodark_fin.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}

textures/base_wall/protobanner
{
     cull disable
     surfaceparm alphashadow
     surfaceparm trans	
     surfaceparm nomarks
     tessSize 64
     deformVertexes wave 30 sin 0 3 0 .2
     deformVertexes wave 100 sin 0 3 0 .7
     
        {
                map textures/base_wall/protobanner.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}

textures/base_wall/protobanner_still
{
     qer_editorimage textures/base_wall/protobanner.tga
     cull disable
     surfaceparm alphashadow
     surfaceparm trans	
     surfaceparm nomarks
     tessSize 64
     //deformVertexes wave 30 sin 0 3 0 .2
     //deformVertexes wave 100 sin 0 3 0 .7
     
        {
                map textures/base_wall/protobanner.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}

textures/base_wall/medal_impressive
{
	qer_editorimage textures/base_wall/medal_impressive.tga
        q3map_surfacelight 100
	
	
	{
		animMap .25 textures/base_wall/medal_impressive.tga textures/base_wall/medal_gauntlet.tga textures/base_wall/medal_excellent.tga textures/base_wall/medal_accuracy.tga textures/base_wall/medal_victory.tga textures/base_wall/medal_frags.tga
		rgbGen wave sawtooth 0 1 0 .25
	
	}

	{
		map textures/base_wall/comp3textd.tga
		blendfunc add
		tcmod scroll 5 .25
		rgbGen wave inversesawtooth 0 1 0 .25
	}

	{
		map textures/base_wall/chrome_env.tga
		tcgen environment
		tcmod scale .5 .5
		blendfunc add
		rgbgen wave triangle .5 .05 0 10
	}

	{
		map textures/base_wall/comp3frame.tga
		blendfunc blend
		rgbgen identity
	}

	{
		map $lightmap
	        rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	          		
} 

textures/base_wall/q3tourneyscreen
{
	qer_editorimage textures/base_wall/q3tourney1.tga
        q3map_surfacelight 100
	
	

	{
		animMap .25 textures/base_wall/q3tourney1.tga textures/base_wall/q3tourney2.tga textures/base_wall/q3tourney3.tga textures/base_wall/q3tourney4.tga textures/base_wall/q3tourney5.tga
		rgbGen wave sawtooth 0 1 0 .25
	
	}

	{
		map textures/base_wall/comp3textd.tga
		blendfunc add
		rgbGen wave inversesawtooth 0 1 0 .25
		tcmod scroll 5 .25 
	}

	{
		map textures/base_wall/chrome_env.tga
		tcgen environment
		tcmod scale .5 .5
		blendfunc add
		rgbgen wave triangle .5 .05 0 10
	}

	{
		map textures/base_wall/comp3frame.tga
		blendfunc blend
		rgbgen identity
	}

	{
		map $lightmap
	        blendfunc gl_dst_color gl_zero
		rgbgen identity
	}
	          		
}     




textures/base_wall/main_q3abanner
{
	q3map_lightimage textures/base_wall/main_q3abanner.tga
        q3map_surfacelight 100


	{
		map textures/base_wall/main_q3abanner.tga
	        rgbGen wave square 0 1 0 .5
	}

	{
		map textures/base_wall/comp3text.tga
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}

	{
		map textures/base_wall/comp3textb.tga
		blendfunc add
	        rgbGen identity
		tcmod scroll 3 3
	}


	{
		map $lightmap
	        rgbGen identity
		blendfunc gl_dst_color gl_zero
	}

	{
		map $lightmap
		tcgen environment
		tcmod scale .5 .5
	        rgbGen wave sin .25 0 0 0
		blendfunc add
	}	          		
}     

  

textures/base_wall/metalfloor_wall_14_specular
{
	qer_editorimage textures/base_wall/metalfloor_wall_14_specular.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/metalfloor_wall_14_specular.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}


textures/base_wall/shinygrate1_4_glow
{
	q3map_lightimage textures/base_wall/shinygrate1_4_glow_light2.tga
	q3map_surfacelight 100
	q3map_lightsubdivide 32 
	
	{
		map textures/sfx/electricslime.tga
		rgbGen wave sin .5 .5 0 1
		tcmod scale .25 .25
		tcMod scroll -10 -1
	}
	
	
	{
		map textures/base_wall/shinygrate1_4_glow.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

	{
		map textures/base_wall/shinygrate1_4_glow_light2.tga
		blendfunc gl_one gl_one
		rgbGen wave triangle .2 .01 0 10
	}

			
}

textures/base_wall/bluemetal1b_chrome
{
	qer_editorimage textures/base_wall/bluemetal1b.tga

	{
		map textures/base_wall/chrome_env2.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetal1b_shiny.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}



textures/base_wall/bluemetal1c
{
	

	{
		map textures/base_wall/chrome_env2.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetal1c.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport_shiny
{
	

	{
		map textures/base_wall/chrome_env2.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport_shiny.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}


textures/base_wall/grill
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/grill.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}
textures/base_wall/grill2
{
	//deformVertexes wave 100 sin 3 2 .1 3
        {
		rgbGen identity
		map $lightmap
	}
	{
		map textures/base_wall/grill2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/effects/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/base_wall/grill2.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}       

textures/base_wall/bluemetalsupport2
{
	

	{
		map textures/base_wall/chrome_env2.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}



textures/base_wall/bluemetalsupport2c_1
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2c_1.tga
		blendFunc blend	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}
textures/base_wall/bluemetalsupport2c_1vent
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2c_1vent.tga
		blendFunc blend	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2c
{
	

	{
		map textures/base_wall/chrome_env2.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2c.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2clight
{
	surfaceparm nomarks
	q3map_surfacelight 500

	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2clight.tga
		blendFunc blend	
		rgbGen identity
	}
	
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2clight.glow.tga
		blendFunc add
		rgbgen wave sawtooth .6 .1 0 4
	}
}

textures/base_wall/bluemetalsupport2f
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2f.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
}




textures/base_wall/bluemetalsupport2e
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2e.tga
		blendFunc blend	
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_wall/bluemetalsupport2e2
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2e2.tga
		blendFunc blend	
		rgbGen identity
	}

	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}
textures/base_wall/bluemetalsupport2fline
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2fline_glow.tga

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2fline.tga
		blendFunc blend	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall/bluemetalsupport2fline_glow.tga
		blendFunc add	
		rgbGen wave sin .5 .5 0 1	
	}


}



textures/base_wall/bluemetalsupport2ftv
{
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2ftv_glow.tga

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2ftv.tga
		blendFunc blend	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}

	{
		map textures/base_wall/bluemetalsupport2ftv_glow.tga
		blendFunc add	
		rgbGen wave sawtooth .4 .05 0 10
	}


}


textures/base_wall/bluemetalsupport2d_1
{
	

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2d_1.tga
		blendFunc blend	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc filter
		rgbGen identity
	}
}

textures/base_door/shinymetaldoor_outside3a2
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside3a2.tga
		blendFunc blend
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc filter
	}

	{
		map textures/base_door/shinymetaldoor_outside3glow.tga
		blendFunc add
		rgbGen wave sin .9 .1 0 5
	}
		
} 

textures/base_door/shinymetaldoor_outside3a
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside3a.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 


textures/base_door/shinymetaldoor_outside3b
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside3b.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 



textures/base_door/shinymetaldoor_outside
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor_outside.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign_outside.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 

textures/base_wall/steedmetal2
{

	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/steedmetal2.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

			
}

textures/base_wall/steed1gf
{
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/steed1gf.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}
textures/base_wall/steed1gd
{
	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/steed1gd.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}

			
}

textures/base_wall/bluemetal1b_shiny
{
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/bluemetal1b_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/base_wall/bluemetal2_shiny
{
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/bluemetal2_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}		
}

textures/base_wall/bluemetal2_shiny_trans
{
	qer_editorimage textures/base_wall/bluemetal2_shiny.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/bluemetal2_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}		
}

textures/base_wall/bluemetal2_noisy
{
	qer_editorimage textures/base_wall/bluemetal2_shiny
	surfaceparm metalsteps
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/bluemetal2_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}			
}

textures/base_wall/train1
{

	{
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .1 
		rgbGen identity   
	}

		
	{
		map textures/base_wall/train1.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 

textures/base_wall/bloodstain
{
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/bloodstain.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
			
}


textures/base_door/shinymetaldoor
{

	{
		//map $lightmap
		map textures/base_wall/chrome_env.tga
                tcGen environment
		tcmod scale .25 .25 
		rgbGen identity   
	}

		
	{
		map textures/base_door/shinymetaldoor.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map textures/base_door/quake3sign.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}	
		
} 
textures/base_wall/dooreye
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight.tga

	
	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}
textures/base_wall/dooreye2
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight.tga

	
	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}


textures/base_wall/dooreye3
{
	surfaceparm nomarks
	q3map_surfacelight 300
	q3map_lightimage textures/base_wall/dooreyelight.tga

	
	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/base_wall/dooreye3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/base_wall/dooreyelight.tga
		blendFunc GL_ONE GL_ONE
		rgbgen wave triangle .5 .5 0 .5
	}


}


textures/base_wall/glass01
{
        surfaceparm trans	
	cull none
	qer_trans 	0.5
     
        {
		map textures/effects/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
           
}
textures/base_wall/patch10_beat4_drip
{
	qer_editorimage textures/base_wall/patch10_beatup4_stain.tga
	
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/waterdrip.tga
		blendFunc GL_ONE gl_src_alpha
		tcmod scroll 0 -.001
	}

	{
		map textures/base_wall/patch10_beatup4_stain.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity 
		blendfunc gl_dst_color gl_zero     
	}


	

			
}
textures/base_wall/patch10_beatup4_shiny2
{
	
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/patch10_beatup4_shiny2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/base_wall/patch10shiny
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/patch10_beatup4_alpha.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/base_wall/patch10shiny_trans
{
	qer_editorimage textures/base_wall/patch10_beatup4_alpha.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/patch10_beatup4_alpha.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/base_wall/patch11_shiny
{
	qer_editorimage textures/base_wall/patch11_shiny.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/patch11_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/base_wall/bluecover
	{

	{
		map $lightmap	
		tcgen environment
		tcmod scale .25 .25 
		rgbgen identity      
	}

		
	{
		map textures/base_wall/bluecover.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
		//alphaGen lightingSpecular
	}

	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbgen identity      
	}

			
}


textures/base_wall/shinybluemetal1b
{

	
	{
		map textures/base_wall/chrome_env.tga
		tcgen environment
		tcmod scale .25 .25 
		rgbgen identity      
	}

	{
		map textures/base_wall/shinybluemetal1b.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
		//alphaGen lightingSpecular
	}
	
	{	
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbgen identity      
	}


				
}

textures/base_wall/pjrock18
{
	qer_editorimage textures/stone/pjrock18.tga
	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity      
	}
		
	
	{
		map textures/stone/pjrock18.tga
		blendFunc GL_ONE GL_SRC_ALPHA
	//	alphaGen lightingSpecular
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

			
}

textures/base_wall/shinybluemetal1
{

	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/base_wall/shinybluemetal1.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}


textures/base_wall/shinygrate1_4
{

	{
		map $lightmap
		tcgen environment
		tcmod scale .25 .25
		rgbgen identity      
	}
		
	
	{
		map textures/base_wall/shinygrate1_4.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}


	{
		map $lightmap
    		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

			
}


textures/base_wall/chrome_metal
{
	{
		map textures/base_wall/chrome_env.tga
		tcGen environment
		tcmod scale .25 .25 
		
	}

	{
		map textures/base_wall/chrome_metal.tga
		blendFunc GL_ONE GL_ONE
		detail
        	tcMod scale 0.0693 0.0712
		rgbGen identity
	}


	{
		map $lightmap
                rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	   
	}

	
			
}

textures/base_wall/blupaintedmetalcomp
{

	{
		map $lightmap
                tcGen environment
		tcmod scale .25 .25    
	}
		
	{
		map textures/base_wall/blupaintedmetalcomp.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}		
}

textures/base_wall/blupaintedmetal
{

	{
		map $lightmap
                tcGen environment
		tcmod scale .25 .25    
	}
		
	{
		map textures/base_wall/blupaintedmetal.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}		
}

       
textures/base_wall/shinymetal2
{

	{
		map $lightmap
                tcGen environment
		tcmod scale .25 .25    
	}

	{
		map $lightmap
		rgbgen identity
		blendFunc GL_ONE GL_SRC_COLOR
	}

		
	{
		map textures/base_wall/shinymetal2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	
	

	
	
		
} 

textures/base_wall/comp3c
{
        {
		map textures/base_wall/comp3env.tga
	        rgbGen identity
		tcGen environment
	}
	      
        {
		map $lightmap
                tcGen environment
                blendFunc GL_ONE GL_ONE
	}

	{
		map textures/base_wall/comp3c.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}
      

textures/base_wall/comp3b
{
	q3map_lightimage textures/base_wall/comp3textb.tga
        q3map_surfacelight 1000
        {
		map textures/base_wall/comp3textb.tga
	        rgbGen identity
		tcmod scroll 3 3
	}
	      
        {
		map textures/base_wall/comp3env.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin .98 .02 0 5
	}
	
	{
		map $lightmap
                tcGen environment
                blendFunc GL_DST_COLOR GL_ONE
	}


	{
		map textures/base_wall/comp3b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
       
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}
 
textures/base_wall/comp3b_dark
{
	q3map_lightimage textures/base_wall/comp3textb.tga
        q3map_surfacelight 1
        {
		map textures/base_wall/comp3textb.tga
	        rgbGen identity
		tcmod scroll 3 3
	}
	      
        {
		map textures/base_wall/comp3env.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin .98 .02 0 5
	}
	
	{
		map $lightmap
                tcGen environment
                blendFunc GL_DST_COLOR GL_ONE
	}


	{
		map textures/base_wall/comp3b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
       
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}

}

      
textures/base_wall/comp3
{
	q3map_lightimage textures/base_wall/comp3env.tga
        q3map_surfacelight 1000
        {
		map textures/base_wall/comp3text.tga
	        rgbGen identity
		tcmod scroll 3 1
	}
	      
        {
		map textures/base_wall/comp3env.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin .98 .02 0 5
	}
	
	{
		map $lightmap
                tcGen environment
                blendFunc GL_DST_COLOR GL_ONE
	}


	{
		map textures/base_wall/comp3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
       
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
	
}       


textures/base_wall/basewall01bit
{
	q3map_lightimage textures/base_wall/basewall01bitfx.tga
        q3map_surfacelight 300
        {
		map textures/base_wall/basewall01bit.tga
	        rgbGen identity
	}
	      
	{
		map textures/base_wall/basewall01bitfx.tga
		blendfunc GL_ONE GL_ONE
                tcmod scroll 3.3 1
                rgbGen wave sin .5 0.5 0 5
	}
        {
		map textures/effects/envmap2.tga
                tcGen environment
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
               rgbGen identity
	}
	{
		map textures/base_wall/basewall01bit.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
       
	{
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
	
       
}
textures/base_wall/basewall01_ow
{
	q3map_lightimage textures/base_wall/basewall01_owfx.tga
	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/basewall01_ow.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/base_wall/basewall01_owfx.tga
		blendfunc GL_ONE GL_ONE
                rgbGen wave sin .5 0.5 0 .5
	}
       
}
textures/base_wall/blumtlspt2b
{
	
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/blumtlspt2bglow.tga


	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/blumtlspt2b.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2bglow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base_wall/bluemetalsupport2b
{
	
	q3map_surfacelight 100
	q3map_lightimage textures/base_wall/bluemetalsupport2bglow.tga


	{
		map textures/base_wall/chrome_env.tga
	        rgbGen identity
		tcGen environment
		tcmod scale .25 .25
	}
	
	{
		map textures/base_wall/bluemetalsupport2b.tga
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	{
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}


	{
		map textures/base_wall/bluemetalsupport2bglow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/base_wall/kcgrate1
{		
	cull disable

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/base_wall/kcgrate1.tga
		tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		// alphaFunc GT0
                   alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}


textures/base_wall/future9light
{
	q3map_lightimage textures/base_wall/future9light.color.tga
	q3map_surfacelight 400	
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/future9light.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/base_wall/future9light.blend.tga
		rgbGen wave sin 0.5 0.1 1 0.5
		blendFunc GL_ONE GL_ONE
	}
}
textures/base_wall/bluemetal1light
{
	//surfaceparm nomarks
	q3map_surfacelight 1000
	q3map_lightimage textures/base_wall/bluemetal1light_bl.tga
	light 1
	// blue light in a metal wall
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures//base_wall/bluemetal1light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_wall/bluemetal1light_bl.tga
		rgbGen wave sin 0.5 0.1 1 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/base_wall/green_contrim_noisey
//Paul Jaquays uses this on the tops of metal frameworks
{
	qer_editorimage textures/base_wall/green_contrim.tga
	surfaceparm	metalsteps		

	// metal that makes metalsteps sound
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_wall/green_contrim.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/common/nolightmap
{
	surfaceparm nolightmap
}

textures/common/nodrawnonsolid
{
	surfaceparm	nonsolid
	surfaceparm	nodraw
}

textures/common/invisible
{
	surfaceparm nolightmap			
        {
                map textures/common/invisible.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

textures/common/teleporter
{
	surfaceparm nolightmap
	surfaceparm noimpact
	q3map_lightimage textures/sfx/powerupshit.tga	
	q3map_surfacelight 800
	{
		map textures/sfx/powerupshit.tga
		tcGen environment
//		tcMod scale 5 5
		tcMod turb 0 0.015 0 0.3
	}
}

textures/common/nodrop
{
	qer_nocarve
	qer_trans	0.5
	surfaceparm 	trans
	surfaceparm	nonsolid
	surfaceparm	nomarks
	surfaceparm     nodrop
	surfaceparm 	nolightmap
	surfaceparm 	nodraw
	cull		disable
}

textures/common/weapclip
{
	qer_trans 0.40
	surfaceparm trans
	surfaceparm nomarks
	surfaceparm nodraw
}

textures/common/clip
{
	qer_trans 0.40
	surfaceparm 	nolightmap
	surfaceparm nomarks
	surfaceparm nodraw
	surfaceparm nonsolid
        //surfaceparm 	nolightmap //proto_addition 11/08/99
	surfaceparm playerclip
	surfaceparm noimpact
}

textures/common/full_clip
{
	qer_trans 0.40
	surfaceparm nodraw
	surfaceparm playerclip
}


textures/common/missileclip
{
	qer_trans 0.40
	surfaceparm nodamage
	surfaceparm nomarks
	surfaceparm nodraw
	//surfaceparm nonsolid
	surfaceparm playerclip
}

//*****************************************
//**   I've reduced the transparency on most editor-only brushes here.
//**   If the transparent textures are still too pale for
//**   things like clip, hint, trigger, etc.,
//**   Please make an editorimage to suit your needs.
//******************************************

textures/common/cushion
{
	qer_nocarve
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm nodamage
	surfaceparm trans
}

textures/common/hint
{
qer_nocarve
qer_trans 0.30
surfaceparm nodraw
surfaceparm nonsolid
surfaceparm structural
surfaceparm trans
surfaceparm noimpact
}

textures/common/skip
{
qer_nocarve
qer_trans 0.40
surfaceparm nodraw
surfaceparm nonsolid
surfaceparm structural
surfaceparm trans
}

textures/common/slick
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nomarks
	surfaceparm trans
	surfaceparm slick
}

textures/common/origin
{
	qer_nocarve
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm origin
}

textures/common/noimpact
{
	surfaceparm noimpact
}

textures/common/areaportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm structural
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm areaportal
}

//bot specific cluster portal
textures/common/clusterportal
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm detail
	surfaceparm clusterportal
}

//bot specific "do not enter" brush
textures/common/donotenter
{
	qer_trans 0.50
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm	nomarks
	surfaceparm detail
	surfaceparm donotenter
}

textures/common/trigger
{
	qer_trans 0.50
	qer_nocarve
	surfaceparm nodraw
}

textures/common/caulk
{
	surfaceparm nodraw
	surfaceparm nomarks
        surfaceparm nolightmap
}

textures/common/nodraw
{
	surfaceparm nodraw
	surfaceparm nonsolid
	surfaceparm trans
	surfaceparm nomarks
}

textures/common/mirror1
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
  
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
       
        

}

textures/common/mirror2
{
	qer_editorimage textures/common/qer_mirror.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
        {
               map textures/sfx/mirror.tga
	       blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
        }

}
textures/common/energypad
{
	qer_editorimage textures/common/bluegoal.tga
	surfaceparm nolightmap
	cull twosided
	{
		map textures/common/bluegoal.tga
		blendFunc GL_ONE GL_SRC_ALPHA
		tcGen environment
		tcMod turb 0 0.25 0 0.05
	}
}

textures/common/portal
{
	qer_editorimage textures/common/qer_portal.tga
	surfaceparm nolightmap
	portal
	{
		map textures/common/mirror1.tga
//		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
//		blendFunc GL_ONE GL_SRC_ALPHA
		blendfunc GL_ONE GL_ONE_MINUS_SRC_ALPHA
		depthWrite

	}
}

textures/common/timportal
{
	qer_editorimage textures/common/qer_portal.tga
	portal
	surfaceparm nolightmap
	{
		map textures/common/portal.tga
		tcMod turb 0 0.25 0 0.05
		blendFunc GL_ONE GL_SRC_ALPHA
		depthWrite
	}
}

textures/sfx/portal_sfx
{

	//	*************************************************
	//	*      	Portal Inside Effect 			*
	//	*      	April 29				*	
	//	*	Please Comment Changes			*
	//	*************************************************

	portal
	surfaceparm nolightmap
	deformVertexes wave 100 sin 0 2 0 .5


	{
		map textures/sfx/portal_sfx3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	//	This blend function is not working on RagePro drivers Mac only
	//	when it is used on top of portals
		depthWrite
	}


	{
		map textures/sfx/portal_sfx1.tga
		blendfunc gl_dst_color gl_zero
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}

	{
		map textures/sfx/portalfog.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		alphagen portal 256
		rgbGen identityLighting	
		tcmod turb sin 0 .5 0 1
		tcmod rotate .1 .1
		tcmod scroll .01 .03
	}
}
textures/sfx/portal2_sfx
{

	//	*************************************************
	//	*      	Portal Inside Effect 			*
	//	*      	April 29				*	
	//	*	Please Comment Changes			*
	//	*************************************************

	portal
	surfaceparm nolightmap
	deformVertexes wave 100 sin 0 2 0 .5


	{
		map textures/sfx/portal_sfx3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	//	This blend function is not working on RagePro drivers Mac only
	//	when it is used on top of portals
		depthWrite
	}


	{
		map textures/sfx/portal_sfx1.tga
		blendfunc gl_dst_color gl_zero
		tcMod rotate 360
	}

	{
		map textures/sfx/portal_sfx.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 .5 .2 .5
	}

	{
		map textures/sfx/portalfog.tga
		blendfunc gl_src_alpha gl_one_minus_src_alpha
		//alphagen portal 128
		rgbGen identityLighting	
		tcmod turb sin 0 .5 0 1
		tcmod rotate .1 .1
		tcmod scroll .01 .03
	}
}

textures/ctf/blue_telep
{ 
        cull disable	
        surfaceparm nomarks
        surfaceparm trans
        sort additive	

        {
	        
	        clampmap textures/ctf/blue_telep.tga
		blendFunc add
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 327
                rgbGen identity
	}
        {
	        clampmap textures/ctf/blue_telep2.tga
		blendFunc add
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .1
                tcmod rotate -211
                rgbGen identity
        }
        {
	        clampmap textures/ctf/telep.tga
		alphaFunc GE128
                depthWrite
                tcmod rotate 20
	        rgbGen identity
	}
        {
	        clampmap textures/ctf/telep.tga
		alphaFunc GE128
                depthWrite
                tcMod stretch sin .7 0 0 0
                tcmod rotate -20
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}



}
textures/ctf/red_telep
{ 
        cull disable	
        surfaceparm nomarks
        surfaceparm trans

        {
	        
	        clampmap textures/ctf/red_telep.tga
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 327
                rgbGen identity
	}
        {
	        clampmap textures/ctf/red_telep2.tga
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .1
                tcmod rotate -211
                rgbGen identity
        }
        {
	        clampmap textures/ctf/telep.tga
		alphaFunc GE128
                tcmod rotate 20
	        rgbGen identity
	}
        {
	        clampmap textures/ctf/telep.tga
		alphaFunc GE128
                tcMod stretch sin .7 0 0 0
                tcmod rotate -20
                rgbGen identity
	}
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}



}

textures/ctf/test2_trans
{
	qer_editorimage textures/ctf/test2.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/ctf/test2.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}

}

textures/ctf/test2_r_trans
{
	qer_editorimage textures/ctf/test2_r.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/ctf/test2_r.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/ctf/killblockctf_r
{
   qer_editorimage   textures/gothic_block/blocks15cgeomtrn.tga

        {
		map textures/sfx/fire_ctfred.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks15cgeomtrn.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/ctf/killblockctf_b
{
   qer_editorimage   textures/gothic_block/killblockgeomtrn.tga

        {
		map textures/sfx/fire_ctfblue.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/killblockgeomtrn.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/ctf/ctf_arch_b_shiny
{      
     qer_editorimage textures/ctf/ctf_arch_b.tga
	   {
		map textures/ctf/ctf_arch_b.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	} 
        {
                map textures/sfx/specular.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scale 10 10
                rgbGen identity
	}  
        {
		map textures/ctf/ctf_arch_b.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
         
}

textures/ctf/ctf_arch_r_shiny
{
	qer_editorimage textures/ctf/ctf_arch_r.tga      
        {
		map textures/ctf/ctf_arch_r.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	} 
        {
                map textures/sfx/specular.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scale 10 10
                rgbGen identity
	}  
        {
		map textures/ctf/ctf_arch_r.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
		blendfunc gl_dst_color gl_zero
		rgbGen identity
	}
         
}

textures/gothic_door/door02_bred2_shiny
{              
qer_editorimage textures/gothic_door/door02_bred2.tga 
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/gothic_door/door02_bred2.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/gothic_door/door02_eblue2_shiny
{              
qer_editorimage textures/gothic_door/door02_eblue2.tga

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/gothic_door/door02_eblue2.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}



textures/ctf/red_scary4_d3fin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/red_scary4_d3fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/ctf_tower_bluefin_shiny
{              
qer_editorimage textures/ctf/ctf_tower_bluefin.tga 
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/ctf_tower_bluefin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/ctf_tower_redfin_shiny
{              
qer_editorimage textures/ctf/ctf_tower_redfin.tga 
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/ctf_tower_redfin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/metalbase09_bluekillblock_shiny
{              
qer_editorimage textures/ctf/metalbase09_bluekillblock.tga 
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/metalbase09_bluekillblock.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/red_scary4_cfin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/red_scary4_cfin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/red_scary4_csansfacefin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/red_scary4_csansfacefin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}



textures/ctf/tallblue_2_fin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_2_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_1L_fin_shiny
{              
qer_editorimage textures/ctf/tallblue_1L_fin.tga 
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_1R_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_1R_fin_shiny
{              
qer_editorimage textures/ctf/tallblue_1R_fin.tga 
	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_1R_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}



textures/ctf/tallblue_2b_fin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_2b_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/tallblue_4c_fin_shiny
{              
qer_editorimage textures/ctf/tallblue_4c_fin.tga 

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_4c_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}




textures/ctf/tallblue_4bsmall_fin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_4bsmall_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}


textures/ctf/tallblue_5esmallb_fin
{              

	{
		map $lightmap
		rgbGen identity
	}


        {
		map textures/ctf/tallblue_5esmallb_fin.tga
                blendFunc GL_dst_color GL_SRC_ALPHA
		alphagen lightingspecular
		rgbGen identity
	}

}

textures/ctf/ctf_blueflag
{
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .5 .1
        surfaceparm nomarks
        cull none
        
        {
		map textures/ctf/ctf_blueflag.tga
		rgbGen identity
	}
        {
		map textures/effects/redflagmap.tga
                tcGen environment
                tcmod scale 9 3
                tcmod scroll .1 .7
                
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map textures/ctf/ctf_blueflag.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
        	map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}
textures/ctf/ctf_redflag
{
        tessSize 64
        deformVertexes wave 194 sin 0 3 0 .4
        deformVertexes normal .3 .2
        surfaceparm nomarks
        cull none

        {
		map textures/ctf/ctf_redflag.tga
		rgbGen identity
	}
        {
		map textures/effects/blueflagmap.tga
                 tcGen environment
                tcmod scale 9 3
                tcmod scroll .1 .7
                
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map textures/ctf/ctf_redflag.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {

        	map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}
powerups/redflag
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/redflagmap.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
		tcMod turb 0 0.2 0 1
	}
}

powerups/blueflag
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/blueflagmap.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
		tcMod turb 0 0.2 0 1
	}
}

sprites/friend
{
	nomipmaps
	nopicmip
	{
		map sprites/friend1.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

sprites/foe
{
	nomipmaps
	nopicmip
	{
		map sprites/foe2.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


textures/eerie/floor3_3dark
{
	surfaceparm	metalsteps
}


textures/eerie/xblocks11be
{
	qer_editorimage textures/eerie/blocks11b.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/blocks11b.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eerie/electricgrade3.tga
		rgbGen wave sin .25 .25 0.25 .25
		tcMod turb .2 .2 .1 1
		tcMod scale .25 .25
		tcMod scroll -.5 -1.2
		blendfunc GL_DST_COLOR GL_ONE
	}
}

textures/eerie/blackness
{
	surfaceparm nolightmap
	surfaceparm noimpact
	{
		map gfx/colors/black.tga
	}
}
textures/eerie/surface6jumppad
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		rgbGen identity
		map textures/eerie/surface6.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eerie/surface6jumppad.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
//		blendFunc GL_ONE GL_ONE
//		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/eerie/xgoopjumpypad
{
	q3map_surfacelight 100
	q3map_lightimage textures/eerie/surface6jumppad.blend.tga
	{
		rgbGen identity
		map $lightmap
	}
	{
		rgbGen identity
		map textures/eerie/xgoopq1metal.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		clampmap textures/eerie/surface6jumppad.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/eerie/xgoopy_pentagram
{
//	qer_editorimage textures/eerie/xgoopy_pentagram.tga
	q3map_surfacelight 250
//	q3map_lightimage textures/eerie/pentagramfloor.red.blend.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xgoopq1metal.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		clampmap textures/eerie/pentagramfloor.red.blend.tga
		blendFunc GL_ONE GL_ONE
//		rgbGen wave sin 0.5 0.5 0.3 .5
		tcMod rotate -60
//		blendFunc GL_ONE GL_ONE
//		rgbGen wave sin 0.5 0.5 0 .5
//		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1

	}
}

textures/eerie/gkcspine
{
	deformVertexes wave 100 sin 2 3 0 0.4
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/gkcspine.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/eerie/lavafogshader
{
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	fogonly
}

textures/eerie/lavahell
{
	qer_editorimage textures/eerie/lavahell.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 500
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms 0.8519142 0.309723 0.0 128 128

	{
		map textures/eerie/lavahell.tga
		tcMod turb .25 0.4 0 0.09
	}
}
textures/eerie/lavahell2
{
	qer_editorimage textures/eerie/lavahell.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 3000
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms 0.8519142 0.309723 0.0 128 128

	{
		map textures/eerie/lavahell.tga
		tcMod turb .25 0.2 1 0.02
		tcMod scroll 0.1 0.1
	}
}
textures/eerie/lavahell_goddamnbright
{
	qer_editorimage textures/eerie/lavahell.tga
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 7000
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms 0.8519142 0.309723 0.0 128 128

	{
		map textures/eerie/lavahell.tga
		tcMod turb .25 0.2 1 0.02
		tcMod scroll 0.1 0.1
	}
}


textures/eerie/uberiron
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/uberiron.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/firewall_light.tga
		blendfunc gl_dst_color gl_zero
		tcMod scroll 5 15
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
	}
}

textures/eerie/iron01_e_flicker
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/iron01_e_flicker.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/firewalla.tga
		blendfunc gl_dst_color gl_zero
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
		tcMod scroll -15 -5
	}
	{
		map textures/eerie/firewallb.tga
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale 0.1 0.1
		tcMod turb .2 .1 .1 1
		tcMod scroll -10 0
	}
}
textures/eerie/q1metal7_98d_flicker
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/q1metal7_98d.tga
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/eerie/firewalla.tga
		blendfunc gl_dst_color gl_zero
		tcMod scroll -15 -5
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
	}
}

textures/eerie/iron01_d_flicker
{
	tesssize 32
	surfaceparm nolightmap
	{
		map textures/eerie/iron01_d_flicker.tga
	}
	{
		map textures/eerie/firewalla.tga
		blendfunc gl_dst_color gl_zero
		tcMod scroll 5 15
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
	}
	{
		map textures/eerie/firewallb.tga
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale .1 .1 0 10
		tcMod turb .2 .1 .1 1
		tcMod scroll 0 10
	}
}
textures/eerie/iron01_g_flicker
{
	tesssize 32
	surfaceparm nolightmap
	{
		map textures/eerie/iron01_g_flicker.tga
	}
	{
		map textures/eerie/firewalla.tga
		blendfunc gl_dst_color gl_zero
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
		tcMod scroll 5 15
	}
	{
		map textures/eerie/firewallb.tga
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale 0.1 0.1
		tcMod turb .2 .1 .1 1
		tcMod scroll 0 10
	}
}


textures/eerie/firewall
{
	surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 6000
	tesssize 64
	{
		map textures/eerie/firewalla.tga
		blendfunc gl_one gl_zero
		tcMod scale 0.25 0.25
		tcMod turb .2 .2 .1 1
		tcMod scroll 5 15
	}
	{
		map textures/eerie/firewallb.tga
		blendFunc GL_dst_color gl_src_alpha
		tcMod scale .1 .1
		tcMod turb .2 .1 .1 1
		tcMod scroll 0 10
	}
	{
		map textures/eerie/firewall.tga
		blendFunc GL_dst_color gl_one
		tcMod turb .1 .1 .5 .5
		tcMod scroll 10 40
	}
}

textures/eerie/xq1metalbig_nojumppad
{
	surfaceparm nodamage
	{
		map $lightmap
		rgbGen identity
	}
	{
		rgbGen identity
		map textures/eerie/xq1metalbig_nojumppad.tga
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eerie/xq1metalbig_nojumppad.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/eerie/metal3_3
{
	surfaceparm metalsteps
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/metal3_3.tga
		rgbGen identity
		blendfunc GL_DST_COLOR GL_ZERO
	}

}

textures/eerie/teslacoil
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/cabletest2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/electricgrade3.tga

		rgbGen wave sin .25 .25 0.25 .25

		tcMod turb .2 .2 .1 1
		tcMod scale .25 .25
		tcMod scroll -.5 -1.2

		blendfunc GL_ONE GL_ONE
	}
	{
		map textures/eerie/electricslime.tga
		tcMod turb .2 .2 .1 1
		tcMod scale .25 .25
		tcMod scroll .5 1.5
		blendfunc GL_DST_COLOR GL_ONE

	}
}
textures/eerie/tesla_cable
{
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/tesla_cable.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/electricslime.tga
		tcMod turb .2 .2 1 .1
		tcMod scroll 0 15
		tcMod scale .1 .1
		blendfunc GL_DST_COLOR GL_ONE
	
//		map textures/eerie/electricslime.tga
//		tcMod turb 1 1 1 .01
//		tcMod scroll 1 5
//		tcMod scale .5 .5
//		blendfunc GL_ONE GL_ONE
	}
}
textures/eerie/jesus
{
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/eerie/jesus.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/jesus_mask3.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/eerie/xq1metalbig_jumppad
{
	surfaceparm nodamage
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/q1metal7_98d_256x256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		clampmap textures/eerie/surface6jumppad.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
//		map textures/eerie/jumppad.tga
//		blendFunc GL_ONE GL_ONE
//		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/eerie/blocks15b_jumppad
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/blocks15b_jumppad.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/jumppad.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}
textures/eerie/blocks11b_jumppad
{
	surfaceparm nodamage
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/castle/blocks11b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		clampmap textures/eerie/jumppad.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.75 0.25 0 .2
//		tcMod stretch sin 0.80 0.20 0 1
	}
}
textures/eerie/blocks11b_jumppad_smaller
{
	surfaceparm nodamage
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/blocks11b_jumppad_smaller.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/jumppad_smaller.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}


textures/eerie/pentagramfloor
{
//	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/pentagramfloor.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/pentagramfloor.red.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .5
	}
}
textures/eerie/pentagramfloor_rotating
{
	qer_editorimage textures/eerie/pentagramfloor.tga
//	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xhugefloor2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		clampmap textures/eerie/pentagramfloor.red.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.75 0.25 0 0.5
		tcMod rotate -60
	}
}


textures/eerie/q1metal7_98d_pent_256
{
	q3map_surfacelight 250
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/q1metal7_98d_pent_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/pentagramfloor_256x256.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .5
	}
}


textures/eerie/border11light
{
	q3map_surfacelight 1000	
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/border11light.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/eerie/borderlight_500
{
	q3map_surfacelight 500
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/border11light.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/border11light.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/darkness
{
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	surfaceparm 	nodrop
	cull back
	fogonly
	fogparms 0 0 0 128 128
}
textures/eerie/redgoal
{
	q3map_surfacelight 200

	{
		map textures/eerie/redgoal.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}
textures/eerie/bluegoal
{
	q3map_surfacelight 200
	{
		map textures/eerie/bluegoal.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}
textures/eerie/powerupshit
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided
	{
		map textures/eerie/powerupshit.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.5
	}
}
textures/eerie/xian_rune11
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xian_rune11.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/xian_rune11.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/xian_rune21
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xian_rune21.tga
		//map textures/eerie/xian_rune21.specular.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eerie/xian_rune21.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/eerie/lightcone
{
	{
		map textures/eerie/lightcone.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/q1metal7_97b_mirror
{
	surfaceparm nolightmap
	portal
	{
		map textures/eerie/q1metal7_97b_mirror.tga
		blendfunc GL_ONE GL_SRC_ALPHA
		depthWrite
	}
}
textures/eerie/cross_1000
{
	q3map_surfacelight 1000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/cross_1000.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/cross_1000.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/eerie/cross_2500
{
	q3map_surfacelight 2500
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/cross_2500.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/cross_2500.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/light1
{
	q3map_surfacelight 2000
	q3map_lightimage textures/eerie/light1.blend.tga
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/eerie/light1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/light1_5000
{
	qer_editorimage textures/eerie/light1.tga
	q3map_lightimage textures/eerie/light1.blend.tga
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{	
		map textures/eerie/light1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/light2
{
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/light2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/eerie/light3_8
{
	q3map_surfacelight 4000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/light3_8.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/eerie/light3_8.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/eerie/xian_light3_7
{
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/eerie/xian_light3_7.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/eerie/xian_light3_7.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

// GFX.SHADER
// 
// this file contains shaders that are used by the programmers to
// generate special effects not attached to specific geometry.  This
// also has 2D shaders such as fonts, etc.
//

// the REGION shader is generated by the map editor on temporary
// brushes around a selected area for testing parts of maps
textures/REGION
{
	surfaceparm nolightmap
}

// the background for the netgraph
lagometer
{
	nopicmip
	{
		map gfx/2d/lag.tga
	}
}

// blinked on top of lagometer when connection is interrupted
disconnected
{
	nopicmip
	{
		map gfx/2d/net.tga
	}
}

white
{
	{
		map *white
		blendfunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}

console
{
	nopicmip
	nomipmaps
    
        {
		map gfx/misc/console01.tga
                blendFunc GL_ONE GL_ZERO
                tcMod scroll .02  0
                tcmod scale 2 1
	}
        {
                map gfx/misc/console02.tga
                //map textures/sfx/firegorre3.tga
                blendFunc add
                tcMod turb 0 .1 0 .1
                tcMod scale 2 1
                tcmod scroll 0.2  .1
	} 

}

menuback
{
	nopicmip
	nomipmaps
        //{
        //        map textures/sfx/logo512.tga
        //}

        //{
        //        map textures/sfx/specular.tga
         //       //blendfunc add
        //        tcMod turb 0 .8 0 .2
        //        tcmod scroll -.1  -.2
	//} 
         {
                map textures/sfx/logo512.tga
                // blendFunc blend
                rgbgen identity
        }
        //{
	//	map textures/sfx/proto_zzzdrk.tga
        //        blendFunc add
        //        tcMod turb 0 .1 0 .9
        //         tcmod scale .2 .2
        //         tcMod scroll .02  0.7
        //         rgbgen identity
	//} 
        
}
menubacknologo
{
	nopicmip
	nomipmaps
       
        {
               map gfx/colors/black.tga
	       //map textures/sfx/proto_zzzdrk.tga
               // tcMod turb 0 .1 0 .9
               // tcmod scale .2 .2
               // tcMod scroll .02  0.7
	} 
        
}

menubackRagePro	// blends turn to shit on rage pro, so skip it
{
	nopicmip
	nomipmaps
        {
                map textures/sfx/logo512.tga
        }
        
}


levelShotDetail
// used to break up the blur on levelshots
{
	nopicmip
	{
		map textures/sfx/detail.tga
        blendFunc GL_DST_COLOR GL_SRC_COLOR
		rgbgen identity
	}
}

//
// special effects as seen on players
//
powerups/battleSuit
{
	deformVertexes wave 100 sin 1 0 0 0
	{
		map textures/effects/envmapgold2.tga
                //map textures/sfx/specular.tga
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc GL_ONE GL_ONE
	}
}
powerups/battleWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/envmapgold2.tga
                //map textures/sfx/specular.tga
		tcGen environment
		tcMod turb 0 0.15 0 0.3
                tcmod rotate 333
                tcmod scroll .3 .3
		blendfunc GL_ONE GL_ONE
	}
}

powerups/invisibility
{
	{
		map textures/effects/invismap.tga
                //map textures/sfx/specular.tga
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.15 0 0.25
		tcGen environment
	}
}
powerups/quad
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/quadWeapon
{
	deformVertexes wave 100 sin 0.5 0 0 0
	{
		map textures/effects/quadmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}
powerups/regen
{
	deformVertexes wave 100 sin 3 0 0 0
	{
		map textures/effects/regenmap2.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                tcmod rotate 30
		//tcMod turb 0 0.2 0 .2
                tcmod scroll 1 .1
	}
}


//=========================

//
// holdable item icons
//
icons/teleporter
{
	nopicmip
	{
		map icons/teleporter.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/medkit
{
	nopicmip
	{
		map icons/medkit.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// powerup icons
//
icons/envirosuit
{
	nopicmip
	{
		map icons/envirosuit.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/quad
{
	nopicmip
	{
		map icons/quad.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/haste
{
	nopicmip
	{
		map icons/haste.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/invis
{
	nopicmip
	{
		map icons/invis.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/regen
{
	nopicmip
	{
		map icons/regen.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/flight
{
	nopicmip
	{
		map icons/flight.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


// reward medals used in the game floating over client's heads
medal_impressive
{
	nopicmip
	{
		clampmap menu/medals/medal_impressive.tga
		blendFunc blend
	}
}

medal_excellent
{
	nopicmip
	{
		clampmap menu/medals/medal_excellent.tga
		blendFunc blend
	}
}

medal_gauntlet
{
	nopicmip
	{
		clampmap menu/medals/medal_gauntlet.tga
		blendFunc blend
	}
}


//
// weapon icons
//
icons/iconw_gauntlet
{
	nopicmip
	{
		map icons/iconw_gauntlet.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/iconw_machinegun
{
	nopicmip
	{
		map icons/iconw_machinegun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/iconw_rocket
{
	nopicmip
	{
		map icons/iconw_rocket.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_shotgun
{
	nopicmip
	{
		map icons/iconw_shotgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identitylighting
	}
}

icons/iconw_grenade
{
	nopicmip
	{
		map icons/iconw_grenade.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_lightning
{
	nopicmip
	{
		map icons/iconw_lightning.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_plasma
{
	nopicmip
	{
		map icons/iconw_plasma.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_railgun
{
	nopicmip
	{
		map icons/iconw_railgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_bfg
{
	nopicmip
	{
		map icons/iconw_bfg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconw_grapple
{
	nopicmip
	{
		map icons/iconw_grapple.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// ammo icons
//
icons/icona_machinegun
{
	nopicmip
	{
		map icons/icona_machinegun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
icons/icona_rocket
{
	nopicmip
	{
		map icons/icona_rocket.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_shotgun
{
	nopicmip
	{
		map icons/icona_shotgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen identitylighting
	}
}

icons/icona_grenade
{
	nopicmip
	{
		map icons/icona_grenade.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_lightning
{
	nopicmip
	{
		map icons/icona_lightning.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_plasma
{
	nopicmip
	{
		map icons/icona_plasma.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_railgun
{
	nopicmip
	{
		map icons/icona_railgun.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/icona_bfg
{
	nopicmip
	{
		map icons/icona_bfg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


//
// armor icons
//
icons/iconr_shard
{
	nopicmip
	{
		map icons/iconr_shard.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconr_yellow
{
	nopicmip
	{
		map icons/iconr_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconr_red
{
	nopicmip
	{
		map icons/iconr_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// health icons
//
icons/iconh_green
{
	nopicmip
	{
		map icons/iconh_green.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_yellow
{
	nopicmip
	{
		map icons/iconh_yellow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconh_red
{
	nopicmip
	{
		map icons/iconh_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
        //{
	//	clampmap icons/iconh_red2.tga
	//	blendFunc blend
        //        tcMod stretch sin .04 1 0 1
	//}
}

icons/iconh_mega
{
	nopicmip
	{
		map icons/iconh_mega.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

//
// CTF icons
//
icons/iconf_red
{
	nopicmip
	{
		map icons/iconf_red.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

icons/iconf_blu
{
	nopicmip
	{
		map icons/iconf_blu.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}


//===================================================

gfx/2d/menuinfo
{
	nopicmip
	{
		map gfx/2d/menuinfo.tga
	}
}

gfx/2d/menuinfo2
{
	nopicmip
	{
		map gfx/2d/menuinfo2.tga
	}
}

gfx/2d/quit
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/quit.tga
	}
}

gfx/2d/cursor
{
    nopicmip
	nomipmaps
    {
        map gfx/2d/cursor.tga
    }
}

//==========================================================================


sprites/balloon3
{
	{
		map sprites/balloon4.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

// this is an example of a crossfaded animation cycle
textures/animationTest
{
	qer_editorimage	textures/liquids/bloodwater1.tga
	{
		animMap 0.5 textures/liquids/bloodwater1.tga textures/liquids/pool.tga textures/liquids/slime7.tga
	}	
	{
		animMap 0.5 textures/liquids/pool.tga textures/liquids/slime7.tga textures/liquids/bloodwater1.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen	wave sawtooth 0 1 0 0.5
	}	
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

teleportEffect
{
	cull none
	{
		map gfx/misc/teleportEffect2.tga
                blendFunc GL_ONE GL_ONE
		rgbGen entity
		tcMod scale 1 4
		tcMod scroll 0 2
	}
}

// markShadow is the very cheap blurry blob underneat the player
markShadow
{
	polygonOffset
	{
		map gfx/damage/shadow.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}	
}

// projectionShadow is used for cheap squashed model shadows
projectionShadow
{
	polygonOffset
	deformVertexes projectionShadow
	{
		map			*white
		blendFunc GL_ONE GL_ZERO
		rgbGen wave square 0 0 0 0				// just solid black
	}	
}


// wake is the mark on water surfaces for paddling players
wake
{
	{
		clampmap sprites/splash.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                tcmod rotate 250
                tcMod stretch sin .9 0.1 0 0.7
		rgbGen wave sin .7 .3 .25 .5
	}	
        {
		clampmap sprites/splash.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                tcmod rotate -230
                tcMod stretch sin .9 0.05 0 0.9
		rgbGen wave sin .7 .3 .25 .4
	}	
}


// viewBloodBlend gives the blended directional cue when you get hit
viewBloodBlend
{
	sort	nearest
	{
		//map models/weaphits/blood201.tga
                map gfx/damage/blood_screen.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identityLighting
		alphaGen vertex
	}
}

waterBubble
{
	sort	underwater
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map sprites/bubble.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuff
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

hasteSmokePuff			// drops behind player's feet when speeded
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuff3.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //blendfunc GL_ONE GL_ONE
		rgbGen		vertex
		alphaGen	vertex
	}
}

smokePuffRagePro
{
	cull none
	entityMergable		// allow all the sprites to be merged together
	{
		map gfx/misc/smokepuffragepro.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}

shotgunSmokePuff
{
	cull none
	{
		map gfx/misc/smokepuff2b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen entity		
		rgbGen entity
	}
}

flareShader
{
	cull none
	{
		map gfx/misc/flare.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}
sun
{
	cull none
	{
		map gfx/misc/sun.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
	}
}
railDisc
{
	sort nearest
	cull none
        deformVertexes wave 100 sin 0 .5 0 2.4
	{
		clampmap gfx/misc/raildisc_mono2.tga 
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
                 tcMod rotate -30
	}
}

railCore
{
	sort nearest
	cull none
	{
		map gfx/misc/railcorethin_mono.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex
		tcMod scroll -1 0
	}
}

lightningBolt
{
	cull none
	{
		map gfx/misc/lightning3.tga
		blendFunc GL_ONE GL_ONE
//                rgbgen wave sin 1 5.1 0 7.1
                rgbgen wave sin 1 0.5 0 7.1
                 tcmod scale  2 1
		tcMod scroll -5 0
	}
    {
		map gfx/misc/lightning3.tga
		blendFunc GL_ONE GL_ONE
//                rgbgen wave sin 1 8.3 0 8.1
                rgbgen wave sin 1 0.8 0 8.1
                tcmod scale  -1.3 -1
		tcMod scroll -7.2 0
	}
}

// shader used on the occasional machinegun bullet tracers
gfx/misc/tracer
{
	cull none
	{
		map	gfx/misc/tracer2.tga
		blendFunc GL_ONE GL_ONE
	}
}

//
// wall marks
// use blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR so that
// their "contribution" can be damped down in fog volumes
// with distance
bloodMark
{
	nopicmip			// make sure a border remains
	polygonOffset
	{
		clampmap gfx/damage/blood_stain.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identityLighting
		alphaGen vertex
	}
}

bloodTrail
{
        
	nopicmip			// make sure a border remains
	entityMergable		// allow all the sprites to be merged together
	{
		//clampmap gfx/misc/blood.tga
                clampmap gfx/damage/blood_spurt.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen		vertex
		alphaGen	vertex
	}
}

gfx/damage/bullet_mrk
{
	polygonOffset
	{
		map gfx/damage/bullet_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/burn_med_mrk
{
	polygonOffset
	{
		map gfx/damage/burn_med_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/hole_lg_mrk
{
	polygonOffset
	{
		map gfx/damage/hole_lg_mrk.tga
		blendFunc GL_ZERO GL_ONE_MINUS_SRC_COLOR
		rgbGen exactVertex
	}
}
gfx/damage/plasma_mrk
{
	polygonOffset
	{
		map gfx/damage/plasma_mrk.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
		alphaGen vertex
	}
}


//===============================================================

// scoreboard header tabs

scoreboardName
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/name.tga
		blendfunc blend
	}
}

scoreboardScore
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/score.tga
		blendfunc blend
	}
}

scoreboardTime
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/time.tga
		blendfunc blend
	}
}

scoreboardPing
{
	nopicmip
	nomipmaps
	{
		clampmap menu/tab/ping.tga
		blendfunc blend
	}
}

//===============================================================

gfx/2d/crosshair
{
	nopicmip
	{
		map gfx/2d/crosshair.tga          
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA                
        rgbGen identity
	}
}

gfx/2d/crosshairb
{
	nopicmip
	{
		map gfx/2d/crosshairb.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairc
{
	nopicmip
	{
		map gfx/2d/crosshairc.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaird
{
	nopicmip
	{
		map gfx/2d/crosshaird.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshaire
{
	nopicmip
	{
		map gfx/2d/crosshaire.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairf
{
	nopicmip
	{
		map gfx/2d/crosshairf.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairg
{
	nopicmip
	{
		map gfx/2d/crosshairg.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairh
{
	nopicmip
	{
		map gfx/2d/crosshairh.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}

gfx/2d/crosshairi
{
	nopicmip
	{
		map gfx/2d/crosshairi.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}

}
gfx/2d/crosshairj
{
	nopicmip
	{
		map gfx/2d/crosshairj.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}
gfx/2d/crosshairk
{
	nopicmip
	{
		map gfx/2d/crosshairk.tga       
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}




gfx/2d/bigchars
{
	nopicmip
	nomipmaps
	{
		map gfx/2d/bigchars.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/select
{
	nopicmip
	{
		map gfx/2d/select.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
		rgbgen vertex
	}
}


gfx/2d/assault1d
{
	nopicmip
	{
		map gfx/2d/assault1d.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/armor1h
{
	nopicmip
	{
		map gfx/2d/armor1h.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/health
{
	nopicmip
	{
		map gfx/2d/health.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/blank
{
	nopicmip
	{
		map gfx/2d/blank.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	}
}
gfx/2d/numbers/zero_32b
{
	nopicmip
	{
		map gfx/2d/numbers/zero_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/one_32b
{
	nopicmip
	{
		map gfx/2d/numbers/one_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/two_32b
{
	nopicmip
	{
		map gfx/2d/numbers/two_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/three_32b
{
	nopicmip
	{
		map gfx/2d/numbers/three_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/four_32b
{
	nopicmip
	{
		map gfx/2d/numbers/four_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/five_32b
{
	nopicmip
	{
		map gfx/2d/numbers/five_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/six_32b
{
	nopicmip
	{
		map gfx/2d/numbers/six_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/seven_32b
{
	nopicmip
	{
		map gfx/2d/numbers/seven_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/eight_32b
{
	nopicmip
	{
		map gfx/2d/numbers/eight_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/nine_32b
{
	nopicmip
	{
		map gfx/2d/numbers/nine_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}
gfx/2d/numbers/minus_32b
{
	nopicmip
	{
		map gfx/2d/numbers/minus_32b.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbgen vertex
	}
}


//
// weapon hits
// All of these will be put on entities with a shaderTime offset, so they
// can be expected to start at time 0 for each separate explosion
//
// Many of these are use smoothly morphed animating textures by pairing
// sawtooth and iverse sawtooth rgbGens
plasmaExplosion
{
	cull disable
	{
		clampmap models/weaphits/plasmaboom.tga
		blendfunc add
                tcMod stretch triangle .6 0.1 0 8
                tcmod rotate 999
                rgbGen wave inversesawtooth 0 1 0 1.5
	}
}

railExplosion
{
	cull disable
        {
		animmap 5 models/weaphits/ring02_1.tga  models/weaphits/ring02_2.tga  models/weaphits/ring02_3.tga models/weaphits/ring02_4.tga gfx/colors/black.tga
		alphaGen wave inversesawtooth 0 1 0 5
		blendfunc blend
	}
	{
		animmap 5 models/weaphits/ring02_2.tga  models/weaphits/ring02_3.tga models/weaphits/ring02_4.tga gfx/colors/black.tga gfx/colors/black.tga
		alphaGen wave sawtooth 0 1 0 5
		blendfunc blend
	}
}

lightningExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/ring02_1.tga  models/weaphits/ring02_3.tga  models/weaphits/ring02_3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/ring02_2.tga  models/weaphits/ring02_3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bulletExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bullet1.tga  models/weaphits/bullet2.tga  models/weaphits/bullet3.tga gfx/colors/black.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bullet2.tga  models/weaphits/bullet3.tga  gfx/colors/black.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

rocketExplosion
{
	cull disable
	{
		animmap 8 models/weaphits/rlboom/rlboom_1.tga  models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga
		rgbGen wave inversesawtooth 0 1 0 8
		blendfunc add
	}
	{
		animmap 8 models/weaphits/rlboom/rlboom_2.tga models/weaphits/rlboom/rlboom_3.tga models/weaphits/rlboom/rlboom_4.tga models/weaphits/rlboom/rlboom_5.tga models/weaphits/rlboom/rlboom_6.tga models/weaphits/rlboom/rlboom_7.tga models/weaphits/rlboom/rlboom_8.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 8
		blendfunc add
	}
}

grenadeExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/glboom/glboom_1.tga  models/weaphits/glboom/glboom_2.tga models/weaphits/glboom/glboom_3.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/glboom/glboom_2.tga  models/weaphits/glboom/glboom_3.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bfgExplosion
{
	cull disable
	{
		animmap 5 models/weaphits/bfgboom/bfgboom_1.tga  models/weaphits/bfgboom/bfgboom_2.tga models/weaphits/bfgboom/bfgboom_3.tga
		rgbGen wave inversesawtooth 0 1 0 5
		blendfunc add
	}
	{
		animmap 5 models/weaphits/bfgboom/bfgboom_2.tga models/weaphits/bfgboom/bfgboom_3.tga gfx/colors/black.tga
		rgbGen wave sawtooth 0 1 0 5
		blendfunc add
	}
}

bloodExplosion		// spurt of blood at point of impact
{
	cull disable
	{
		animmap 5 models/weaphits/blood201.tga models/weaphits/blood202.tga models/weaphits/blood203.tga models/weaphits/blood204.tga models/weaphits/blood205.tga
		blendfunc blend
	}
}




textures/gothic_block/largerblock3blood
{

        {
		map textures/liquids/proto_grueldark2.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
        }
        {
		map textures/effects/tinfx3.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }
       
	{
	        map textures/gothic_block/largerblock3blood.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks17bloody
{

        {
		map textures/liquids/proto_grueldark2.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
        }
        {
		map textures/effects/tinfx3.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }
       
	{
	        map textures/gothic_block/blocks17bloody.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks17g_ow
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/gothic_block/blocks17g_ow.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks18b_ow
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/gothic_block/blocks18b_ow.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_door/skullarch_b
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/gothic_door/skullarch_b.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks17_ow
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 5.6
                tcmod scale 1.5 1.5
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
       
	{
	        map textures/gothic_block/blocks17_ow.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}
textures/gothic_block/blocks15cgeomtrn
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks15cgeomtrn.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/gothic_block/killblockgeomtrn
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/killblockgeomtrn.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}

textures/gothic_block/blocks18cgeomtrn2
{
       cull disable
       surfaceparm alphashadow
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2.tga
		alphaFunc GE128
                tcmod rotate 40
                tcMod stretch sin .8 0.2 0 .3
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2.tga
                alphaFunc GE128
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2.tga
		alphaFunc GE128
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
       
        {
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/gothic_block/blocks18cgeomtrn
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 2 2
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		//blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks18cgeomtrn.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/blocks18cgeomtrnx
{

        {
		map textures/sfx/fireswirl2blue.tga
                tcMod stretch sin .8 0.3 0 9.7
                tcmod rotate 333
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_block/blocks18cgeomtrn2.tga
		blendFunc blend
                tcmod rotate 20
                tcMod stretch sin .8 0.2 0 .1
	        rgbGen identity
	}
	{
	        map textures/gothic_block/blocks18cgeomtrnx.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/demon_block15fx
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
	        map textures/gothic_block/demon_block15fx.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/blocks15_ow
{

        {
		map textures/liquids/proto_grueldark.tga
                tcmod scroll 0 -.05
                tcmod scale 4 4
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
        {
		map textures/liquids/proto_grueldark.tga
                tcmod scroll 0.01 -.02
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_block/blocks15_ow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_block/xblocks17i_shiney
{
	qer_editorimage textures/gothic_block/xblocks17i_alpha.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_block/xblocks17i_alpha.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

//***************************************************************
//  This texture has a detail layer that is used to apply a 
//  grainy overlay to the blocks17 texture
//***************************************************************
textures/gothic_block/blocks17_sandy
{
	qer_editorimage textures/gothic_block/blocks17.tga
	q3map_globaltexture
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/gothic_block/sand2.tga
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 2.90 2.234        
	}
	{
		map textures/gothic_block/blocks17.tga
		tcMod scale 0.25 0.25
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/gothic_block/wetwall
{
	// Moist, reflective smear on Blockwall Sore. Yummy Yum.
        {
	        map textures/gothic_block/wetwall.tga
	        rgbGen identity
	}
        {
		map textures/gothic_block/wetwallfx.tga
                tcmod scroll 0 -.1
                tcmod scale 2 .6
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_block/wetwall.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
//***************************************************************
//  This texture has a detail layer that is used to apply a 
//  grainy overlay to the blocks15 texture
//***************************************************************
textures/gothic_block/blocks15_sandy
{
	qer_editorimage textures/gothic_block/blocks15.tga
	q3map_globaltexture
 {
       map $lightmap
       rgbGen identity
 }
	{
		map textures/gothic_block/sand2.tga
                blendfunc GL_DST_COLOR GL_SRC_COLOR
		rgbGen identity
                detail
                tcMod scale 2.90 2.234        
	}
	{
		map textures/gothic_block/blocks15.tga
		tcMod scale 0.25 0.25
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/gothic_block/evil_e3bwindow
{
	qer_editorimage textures/gothic_block/windowevil2c_killblock.tga
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2ckillblockglow.tga
	q3map_surfacelight 200
	// Glowing evil window for e3 demo map
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_killblock.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2ckillblockglow.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_block/evil_e3window
{
	qer_editorimage textures/gothic_block/windowevil2c_block18c.tga
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2cglow.tga
	q3map_surfacelight 1000
	// Glowing evil window for e3 demo map
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_block18c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2cglow.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_block/evil_e3window_dark
{
	qer_editorimage textures/gothic_block/windowevil2c_block18c.tga
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2cglow.tga
	q3map_surfacelight 100
	// Glowing evil window for temp in tim_dm7
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_block18c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2cglow.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_block/blocks17gwater

{

	{	map textures/gothic_block/blocks17gwater.tga
		blendfunc GL_dst_color GL_one
		alphafunc GT0
		depthwrite
	}
	

	{	map $lightmap
		blendfunc gl_dst_color gl_one
		tcgen environment
		depthfunc equal
	}
	
}


textures/gothic_light/flicker_light15k
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 15000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen wave noise 0.75 0.25 0 10
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave noise 0.75 0.25 0 10
	}
}
textures/gothic_block/flicker_blocks10
{
	qer_editorimage textures/gothic_block/blocks10.tga
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks10.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen wave noise 0.75 0.25 0 10
	}
}

textures/gothic_block/gkc17d
{
	// spine texture with specular highlights
	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/gothic_block/gkc17d.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}
textures/gothic_block/blocks11ct
{
	//cull twosided
	surfaceparm trans
	{
		map textures/gothic_block/blocks11c.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}
//textures/gothic_block/blocks11ct
//{
//	*************************************************
//	* JohnC's filter glass
//	*************************************************
//
//	surfaceparm trans
//	surfaceparm nolightmap
//	surfaceparm	lightfilter
//
//	cull twosided
//
//	{
//		map textures/hell/blocks11ct.tga
//		blendFunc GL_DST_COLOR GL_ZERO
//	}
//}

textures/gothic_block/gkcspinemove
{
	qer_editorimage textures/gothic_block/gkc17d.tga
	tessSize 128
//	deformVertexes wave 100 sin 3 2 0 0.3
	deformVertexes bulge 3 10 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/gkc17d.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
	
}
textures/gothic_block/electrohell	
{
	qer_editorimage textures/gothic_block/gkc14c.tga
	//light 1	
	q3map_surfacelight 400

	{
		rgbGen identity
		map $lightmap
	}
	{
		map textures/gothic_block/gkc14c.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
		
	{
		map textures/gothic_block/gkc14c.tga
		blendFunc GL_ONE GL_ONE
	}
		{
		map textures/sfx/electro2.tga
		rgbGen wave sin .7 .7 0 2
		tcMod rotate 1
		tcMod turb 0 0.2 0 0.4
		tcMod stretch sin 1 .5 0 .1
		tcMod scroll .2 .2

		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_block/mkc_evil_e3window
{
	qer_editorimage textures/gothic_block/windowevil2c_block18c.tga
	//surfaceparm nomarks
	q3map_lightimage textures/gothic_block/evil2cglow.tga
	q3map_surfacelight 400
	// Glowing evil window for pj_dm4
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/windowevil2c_block18c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_block/evil2cglow.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_block/blocks18d_trans
{
	qer_editorimage textures/gothic_block/blocks18d.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/gothic_block/blocks18d.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}


textures/gothic_floor/q1metal7_99spot
{

        {
		map textures/liquids/proto_grueldark2.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale 2 2
                tcMod scroll .01 .03
                tcMod turb 0 0.05 0 .05
        }
        {
		map textures/effects/tinfx3.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
        }
       
	{
	        map textures/gothic_floor/q1metal7_99spot.tga
		blendFunc blend
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc filter
		rgbGen identity
	}
}

textures/gothic_floor/xq1metalbig_ow
{
        {
	        map textures/gothic_floor/xq1metalbig_ow.tga
	        rgbGen identity
	}
        {
		map textures/sfx/specular.tga
                //map textures/liquids/proto_gruel3.tga
                tcGen environment
                tcmod scale 3 3
                //tcmod rotate 30
                tcMod turb 0 .25 0 .05
                //tcmod scroll .1 .2
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_floor/xq1metalbig_ow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/q1metal7_98blueow
{
        {
	        map textures/gothic_floor/q1metal7_98blueow.tga
	        rgbGen identity
	}
        {
		map textures/sfx/fire_ctfred.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_floor/q1metal7_98blueow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/q1metal7_97redow
{
        {
	        map textures/gothic_floor/q1metal7_97redow.tga
	        rgbGen identity
	}
        {
		map textures/sfx/fire_ctfblue.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
	{
	        map textures/gothic_floor/q1metal7_97redow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/fireblocks17floor3
{
//	surfaceparm nolightmap
        {
		map textures/liquids/protolava2.tga
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/gothic_floor/fireblocks17floor3.tga
                blendfunc blend
	}
	{
		map $lightmap
		blendfunc filter
	}
}

textures/gothic_floor/center2trn
{

        {
		map textures/sfx/fireswirl2.tga
                tcmod rotate 333
                tcMod stretch sin .8 0.2 0 9.7
	        rgbGen identity
	}
        {
	        map textures/gothic_floor/center2trn.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                tcmod rotate 30
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen identity
	}
        {
	        map textures/gothic_floor/center2trn.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/largerblock3b_ow
{

        {
		map textures/sfx/firegorre.tga
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
	        map textures/gothic_floor/largerblock3b_ow.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_floor/metalbridge06brokeb
{
        {
                map textures/sfx/kenelectric.tga  
                tcmod scale 2 2
                tcMod turb 0 .2 0 .3
                tcmod scroll 3 5
                rgbGen identity
	}  
        {
		map textures/gothic_floor/metalbridge06brokeb.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
   
         
}

textures/gothic_floor/xstepborder3_shiney
{
	qer_editorimage textures/gothic_floor/xstepborder3_alpha.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_floor/xstepborder3_alpha.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}


textures/gothic_floor/xlargeblockfloor5_pent
{
	{
		map textures/gothic_floor/xlargeblockfloor5_pent.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/sfx/pentfloor_256_glow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 .5	
		depthfunc equal
	}
}

textures/gothic_floor/xlargeblockfloor5_pent_offset
{
	{
		map textures/gothic_floor/xlargeblockfloor5_pent_offset.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/sfx/pentfloor_256_glow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 .5	
		depthfunc equal
	}
}

textures/gothic_floor/glowfloor1
{
	q3map_lightimage textures/gothicfloor/glowfloor1.tga
	q3map_surfacelight 600

	// GLOWING RED Floor Color on blocks17g floor
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_block/blocks17g.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/glowred2.blend.tga
		// rgbGen wave sin 0.5 0.5 0 0.5
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 1 0.5
	}
}

textures/gothic_floor/pent_metalbridge02
{
	q3map_lightimage textures/gothic_floor/pent_glow.tga
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge02.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 0.5
	}
}
textures/gothic_floor/pent_metalbridge06
{
	q3map_lightimage textures/gothic_floor/pent_glow.tga
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge06.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 0.5
	}
}

textures/gothic_floor/pent_metalbridge06b
{
	q3map_lightimage textures/gothic_floor/pent_glow.tga
	q3map_surfacelight 500

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_metalbridge06b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_floor/pent_glow.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .5 .5 0 0.5
	}
}


// Mar.31.1999
// -----------
// Xian: Note to self, q3map_backsplash 0 0 is used to turn off light backsplash
// ---

//****************************************
//*   Border combining border7 and ceil39
//*   Created 5/1/99 by Paul Jaquays
//****************************************
textures/gothic_light/border7_ceil39b_10k
{
	qer_editorimage textures/gothic_light/border7_ceil39b.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil39b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil39b.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
//****************************************
//*   Border combining border7 and ceil39
//*   Created 5/5/99 by Paul Jaquays
//****************************************
textures/gothic_light/border7_ceil39_6k
{
	qer_editorimage textures/gothic_light/border7_ceil39.tga
	q3map_surfacelight 3700
	light 1
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil39.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border_ceil39.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/border7_ceil22a
{
	qer_editorimage textures/gothic_light/border7_ceil22a.tga
	q3map_lightimage textures/gothic_light/border_ceil22a.blend.tga
	q3map_surfacelight 200
	//light 1
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil22a.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border_ceil22a.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/border7_ceil30
{
	qer_editorimage textures/gothic_light/border7_ceil30.tga
	q3map_lightimage textures/gothic_light/border_ceil30.blend.tga
	q3map_surfacelight 200
	//	light 1
	//surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/border7_ceil30.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/border_ceil30.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light2_lrg_2k
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light2_lrg_1k
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.tga
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light2_lrg_200
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.tga
	q3map_surfacelight 200
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light2_lrg_500
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.tga
	q3map_surfacelight 500
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/goth_lt2_lrg2k
{
	qer_editorimage textures/gothic_light/gothic_light2_lrg.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_lrg.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		//tcMod scale 0.5 0.5
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_15K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 15000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_20K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/gothic_light3_10K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_6K
{
//	q3map_backsplash 0 0
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 6000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_7K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 7000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/gothic_light3_8K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 8000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/gothic_light3_5K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/gothic_light3_4K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light3_3k
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}

}
textures/gothic_light/gothic_light3_2K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 2000
	surfaceparm nomarks
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}

}
textures/gothic_light/gothic_light3_1K
{
	qer_editorimage textures/gothic_light/gothic_light3.tga
	q3map_lightimage textures/gothic_light/gothic_light2_blend.tga
	q3map_surfacelight 1000
	surfaceparm nomarks
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light3.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}

}

textures/gothic_light/gothic_light2_4K
{
	qer_editorimage textures/gothic_light/gothic_light2.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light2_1k
{
	qer_editorimage textures/gothic_light/gothic_light2.tga
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/gothic_light2_2K
{
	qer_editorimage textures/gothic_light/gothic_light2.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/gothic_light2_blend.tga
		rgbGen wave sin .6 .1 .1 .1
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/pentagram_light1_1K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 1000
	//light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}

	
}

textures/gothic_light/pentagram_light1_2K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}
}

textures/gothic_light/pentagram_light1_3K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}
}

textures/gothic_light/pentagram_light1_4K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}
}

textures/gothic_light/pentagram_light1_5K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 5000
	q3map_flare flareShader
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}

	
}

textures/gothic_light/pentagram_light1_10K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}

	
}

textures/gothic_light/pentagram_light1_15K
{
	qer_editorimage textures/gothic_light/pentagram_light1.tga
	q3map_surfacelight 15000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/pentagram_light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	
	{
		map textures/gothic_light/pentagram_light1_blend.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave sin .8 .2 0 1
	}

	
}


textures/gothic_light/ironcrossltred_2000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_3000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_4000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_5000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrossltred_10000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltred_20000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrossltred_30000
{
	qer_editorimage textures/gothic_light/ironcrossltred.tga
	q3map_lightimage textures/gothic_light/ironcrossltred.blend.tga
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltred.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/ironcrossltblue_2000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_3000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_4000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_5000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_10000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_20000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrossltblue_30000
{
	qer_editorimage textures/gothic_light/ironcrossltblue.tga
	q3map_lightimage textures/gothic_light/ironcrossltblue.blend.tga
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrossltblue.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}



textures/gothic_light/crosslt1
{
	light 1
	q3map_surfacelight 3250
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/crosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/crosslt1.blend.tga
		rgbGen wave sin 0.5 0.5 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/light1_6Kgothicred
{
	qer_editorimage textures/base_light/light1red.tga
	q3map_lightimage textures/base_light/light1red.blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	//q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1red.blend.tga
		rgbGen wave sin 0.25 0.25 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/light1_4Kgothic
{
	qer_editorimage textures/base_light/light1.tga
	q3map_lightimage textures/base_light/light1.blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	//q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.tga
		rgbGen wave sin 0.25 0.25 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/light1_6Kgothic
{
	qer_editorimage textures/base_light/light1.tga
	q3map_lightimage textures/base_light/light1.blend.tga
	q3map_surfacelight 6000
	light 1
	surfaceparm nomarks
	//q3map_surfacelight 4000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/base_light/light1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/base_light/light1.blend.tga
		rgbGen wave sin 0.25 0.25 0 .2
		blendFunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_2500
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 3500
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_1000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_2000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 2000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_120000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 120000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_500000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 500000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_3000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_4000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_5000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_10000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt1_20000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_30000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt1_40000
{
	qer_editorimage textures/gothic_light/ironcrosslt1.tga
	q3map_lightimage textures/gothic_light/ironcrosslt1.blend.tga
	q3map_surfacelight 40000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_2000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 2000
	//light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/ironcrosslt2_2500
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 2500
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt2_3000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 3000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_4000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 4000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_5000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 5000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt2_10000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 10000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/gothic_light/ironcrosslt2_20000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 20000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_30000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 30000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_light/ironcrosslt2_40000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 40000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/gothic_light/ironcrosslt2_1000
{
	qer_editorimage textures/gothic_light/ironcrosslt2.tga
	q3map_lightimage textures/gothic_light/ironcrosslt2.blend.tga
	q3map_surfacelight 1000
	light 1
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_light/ironcrosslt2.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/gothic_trim/x_noblight
{   
   q3map_lightimage textures/gothic_trim/x_noblightfx.tga
   q3map_surfacelight 100
        {
                map textures/sfx/firegorre2.tga       
                tcmod scroll .1 1
                tcmod scale 1 1
	}   
        {
		map textures/gothic_trim/x_noblight.tga
                blendFunc blend
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
        {
		map textures/gothic_trim/x_noblightfx.tga
                blendFunc add
		rgbGen wave sin .5 .5 0 .1
	} 
}
textures/gothic_trim/zinc_shiny
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/gothic_trim/zinc_shiny.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_trim/chrome_rivet
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/gothic_trim/chrome_rivet.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_trim/km_arena1tower4fx
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/gothic_trim/km_arena1tower4fx.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_trim/km_arena1towerblue
{   
    
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/gothic_trim/km_arena1towerblue.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}         
//textures/gothic_trim/metalbase09_b_blocks15
//{              
//	{
//		map $lightmap
//		rgbGen identity
//	}
//
//
//       {
//		map textures/gothic_trim/metalbase09_b_blocks15.tga
//                blendFunc GL_dst_color GL_SRC_ALPHA
//		alphagen lightingspecular
//		rgbGen identity
//	}
//
//}
//

textures/gothic_trim/column2c_trans
{
	qer_editorimage textures/gothic_trim/column2c_test.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/gothic_trim/column2c_test.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/gothic_trim/metalsupport4b_trans
{
	qer_editorimage textures/gothic_trim/metalsupport4b.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/gothic_trim/metalsupport4b.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/gothic_trim/metalsupport4j_trans
{
	qer_editorimage textures/gothic_trim/metalsupport4j.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_trim/metalsupport4j.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
	}
}

textures/gothic_trim/border6_trans
{
	qer_editorimage textures/gothic_trim/border6.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity

	}
	{
		map textures/gothic_trim/border6.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	}
}

textures/gothic_trim/pitted_rust2_trans
{
	qer_editorimage textures/gothic_trim/pitted_rust2.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/gothic_trim/pitted_rust2.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}
textures/gothic_trim/pitted_rust3_trans
{
	qer_editorimage textures/gothic_trim/pitted_rust3.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/gothic_trim/pitted_rust3.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/gothic_block/killtrim_trans
{
	qer_editorimage textures/gothic_block/killtrim.tga
	surfaceparm nonsolid
	{
		map $lightmap
		rgbGen identity
	
	}
	{
		map textures/gothic_block/killtrim.tga
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO

	
	}
}

textures/gothic_trim/baseboard09_p_shiny
{
	

	{
		map $lightmap
	//	map textures/base_wall/chrome_env.tga
	        rgbGen identity
	//	tcGen environment
	//	tcmod scale .25 .25
	}
	
	{
		map textures/gothic_trim/baseboard09_p_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		alphagen lightingspecular
	//	blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA	
		rgbGen identity
	}
	//{
	//	map $lightmap
	//	blendfunc gl_dst_color gl_zero
	//	rgbGen identity
	//}
}


textures/gothic_trim/km_arena1tower4_shiny
{

	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_trim/km_arena1tower4_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}



textures/gothic_trim/metalsupport4h_shiny
{

	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_trim/metalsupport4h_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/gothic_trim/metalsupport4h_trans
{
	qer_editorimage textures/gothic_trim/metalsupport4h_shiny
	surfaceparm nonsolid
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_trim/metalsupport4h_shiny.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/gothic_trim/supportborderside_shiney
{
	qer_editorimage textures/gothic_trim/xsupportborderside_shiney.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_trim/xsupportborderside_shiney.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/gothic_trim/metlsupport4i_shiney
{
	qer_editorimage textures/gothic_trim/xmetalsupport4i_alpha.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_trim/xmetalsupport4i_alpha.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}

			
}

textures/gothic_trim/barbedwire
{	
        surfaceparm trans		
	cull disable

	// RUSTY Barbed wire
	{
		map textures/gothic_trim/barbedwire.tga
		// tcMod scale 2 2
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}
textures/gothic_button/timbutton
	{
	q3map_lightimage textures/gothic_button/timbutton2.tga
	q3map_surfacelight 10
	//light 1

		{
			map textures/gothic_button/timbutton.tga
		}


		{
			map $lightmap
			blendfunc gl_dst_color gl_zero
			rgbgen identity
		}

		{
			map textures/gothic_button/timbutton2.tga
			blendfunc gl_one gl_one
			rgbgen wave sin .5 .5 0 1
		}

	}

		

textures/gothic_wall/window_evil6a

{
	q3map_lightimage textures/gothic_wall/window_evil6a_glow.tga
	q3map_surfacelight 50
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	
	{
		map textures/gothic_wall/window_evil6a.tga
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil6a_glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen identity
	}
	
}

textures/gothic_wall/window_evil7

{
	q3map_lightimage textures/gothic_wall/window_evil7_glow.tga
	q3map_surfacelight 300
	//light 1

	{
		map $lightmap
		rgbGen identity
	}
	
	{
		map textures/gothic_wall/window_evil7.tga
		blendfunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}

	{
		map textures/gothic_wall/window_evil7_glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen identity
	}
	
}


textures/gothic_wall/glass_stained1

{

	surfaceparm trans
	qer_editorimage	textures/gothic_wall/glass_stained1.tga

	
	

	{
		map textures/gothic_wall/glass_stained1.tga
		blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
	

}

textures/gothic_trim/gothgrate3
{
	surfaceparm	metalsteps		
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/gothic_trim/gothgrate3.tga
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
		alphaFunc GT0
		depthWrite
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		depthFunc equal
	}
}

textures/gothic_trim/gothgrate2
{
	surfaceparm	metalsteps		
	cull none

	// A GRATE OR GRILL THAT CAN BE SEEN FROM BOTH SIDES
	{
		map textures/gothic_trim/gothgrate2.tga
		blendFunc GL_ONE GL_ZERO
		rgbGen identity
		alphaFunc GT0
		depthWrite
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
		depthFunc equal
	}
}
textures/gothic_trim/tongue_bone
{
	{	
		map $lightmap
		rgbGen identity
	}
	{
		map textures/gothic_trim/tongue_bone.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/gothic_trim/tongue_bone.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 0.2
//		rgbGen wave sin 0.5 0.5 0 0.2
	}
}

textures/gothic_trim/metalbase09d_iron
{
qer_editorimage	textures/gothic_trim/metalbase09_d.tga

	//	*************************************************
	//	*      	Tim's Border #1			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase09_d.tga
			// Name of border wall
			rgbGen identity
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		}

		{	
			map $lightmap
			rgbGen identity
			blendfunc GL_DST_COLOR GL_ZERO
		}				

	//	END
}

textures/gothic_trim/metalbase09e_iron
{
qer_editorimage	textures/gothic_trim/metalbase09_e.tga

	//	*************************************************
	//	*      	Tim's Borders			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase09_e.tga
			// Name of border wall
			rgbGen identity
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		}

		{	
			map $lightmap
			rgbGen identity
			blendfunc GL_DST_COLOR GL_ZERO
		}				

	//	END
}

textures/gothic_trim/metalbase02b_iron
{
qer_editorimage	textures/gothic_trim/metalbase02_b.tga

	//	*************************************************
	//	*      	Tim's Border #2			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase02_b.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}

textures/gothic_trim/metalbase03c_iron
{
qer_editorimage	textures/gothic_trim/metalbase03_c.tga

	//	*************************************************
	//	*      	Tim's Border #3			

		{
			map textures/gothic_wall/iron01_e.tga
			rgbGen identity
			// Name of background wall
		}

		{	
			map textures/gothic_trim/metalbase03_c.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}


textures/gothic_trim/metalbase02c_iron
{
qer_editorimage	textures/gothic_trim/metalbase02_c.tga

	//	*************************************************
	//	*      	Tim's Border #5 red			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase02_c.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}

textures/gothic_trim/metalbase03b_iron
{
qer_editorimage	textures/gothic_trim/metalbase03_b.tga

	//	*************************************************
	//	*      	Tim's Border #6 red			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase03_b.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}

textures/gothic_trim/metalbase09b_iron
{
qer_editorimage	textures/gothic_trim/metalbase09_b.tga

	//	*************************************************
	//	*      	Tim's Border #7 red			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase09_b.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}

textures/gothic_trim/metalbase03a_brick
{
qer_editorimage	textures/gothic_trim/metalbase03_a.tga

	//	*************************************************
	//	*      	Tim's Border			

		{
			map textures/gothic_wall/streetbricks10.tga
			// Name of background wall
			tcMod scale 2 2
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase03_a.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}

textures/gothic_trim/metalbase03d_iron
{
qer_editorimage	textures/gothic_trim/metalbase03_d.tga

	//	*************************************************
	//	*      	Tim's Border			

		{
			map textures/gothic_wall/iron01_e.tga
			// Name of background wall
			//tcMod scale 2 2 //this makes in normal size
			rgbGen identity
		}

		{	
			map textures/gothic_trim/metalbase03_d.tga
			// Name of border wall
			blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			rgbGen identity
		}

		{	
			map $lightmap
			blendfunc GL_DST_COLOR GL_ZERO
			rgbGen identity
		}				

	//	END
}




textures/gothic_wall/iron01_f
{
	qer_editorimage textures/gothic_wall/iron01_f.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_f.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_f2
{
	qer_editorimage textures/gothic_wall/iron01_f2.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_f2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_k
{
	qer_editorimage textures/gothic_wall/iron01_k.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_k.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_l
{
	qer_editorimage textures/gothic_wall/iron01_l.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_l.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_l2
{
	qer_editorimage textures/gothic_wall/iron01_l2.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_l2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_l4
{
	qer_editorimage textures/gothic_wall/iron01_l4.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_l4.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_m
{
	qer_editorimage textures/gothic_wall/iron01_m.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_m.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_m_circles
{
	qer_editorimage textures/gothic_wall/iron01_m_circles.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_m_circles.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_m2
{
	qer_editorimage textures/gothic_wall/iron01_m2.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_m2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_m3
{
	qer_editorimage textures/gothic_wall/iron01_m3.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_m3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_mtech2
{
	qer_editorimage textures/gothic_wall/iron01_mtech2.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_mtech2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_mthin
{
	qer_editorimage textures/gothic_wall/iron01_mthin.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map ttextures/gothic_wall/iron01_mthin.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_n
{
	qer_editorimage textures/gothic_wall/iron01_n.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_n.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_n_circles
{
	qer_editorimage textures/gothic_wall/iron01_n_circles.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_n_circles.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_ndark
{
	qer_editorimage textures/gothic_wall/iron01_ndark.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_ndark.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_ndark_circles
{
	qer_editorimage textures/gothic_wall/iron01_ndark_circles.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_ndark_circles.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_ntech
{
	qer_editorimage textures/gothic_wall/iron01_ntech.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_ntech.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/gothic_wall/iron01_ntech2
{
	qer_editorimage textures/gothic_wall/iron01_ntech2.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/iron01_ntech2.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}






textures/gothic_door/door02_i_ornate5_fin
{
	qer_editorimage textures/gothic_door/door02_i_ornate5_fin.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_door/door02_i_ornate5_fin.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}


textures/gothic_wall/xpipecolumn_gray_shiny
{   
 
        {
                map textures/effects/tinfx.tga       
                tcGen environment
                rgbGen identity
	}   
        {
		map textures/gothic_wall/xpipecolumn_gray_shiny.tga
                blendFunc blend
		rgbGen identity
	} 
        {
		map $lightmap
                blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA
		rgbGen identity
	}
}
textures/gothic_wall/streetbricks10_shiny
{
	q3map_globaltexture
	sort opaque

	{
		map $lightmap 
		tcmod turb sin .1 .1 0 0
		tcmod scale 2 2
		rgbgen identity
	}

	{
		map textures/gothic_wall/streetbricks11.tga
		rgbGen identity
		blendfunc gl_one gl_src_color
	}
	
	{
		map $lightmap 
		blendfunc gl_dst_color gl_zero
		rgbgen identity
	}


}


textures/gothic_wall/xoct20c_shiney
{
	qer_editorimage textures/gothic_wall/xoct20c_shiney.tga
	{
		map $lightmap
		rgbgen identity      
	}
	
	{
		map textures/gothic_wall/xoct20c_shiney.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
}

textures/hell/ironcrosslt1_5000
{
	qer_editorimage textures/hell/ironcrosslt1.tga
	q3map_lightimage textures/hell/ironcrosslt1.blend.tga
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/ironcrosslt1.blend.tga
		blendfunc GL_ONE GL_ONE
	}
}
textures/hell/skin7_teeth2
{
	deformVertexes wave 100 sin 2 3 0 0.4
	{
		map $lightmapt
		rgbGen identity
	}
	{
		map textures/hell/skin7_teeth2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/hell/hellredclouds
{
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 280

	cloudparms 512 full
	lightning

	{
		map env/redclouds.tga
		tcMod scroll 0.02 0
		tcMod scale 2 2
	}


	{
		map textures/dont_use/lightningsky8_kc.tga
		blendfunc GL_ONE GL_ONE
		tcMod scale 10 10
		tcMod scroll .2 .2
	}

	
	{
		map env/redcloudsa.tga
		blendFunc GL_ONE GL_ONE
		tcMod scale 3 3
		tcMod scroll 0.02 0.01
	}


}
textures/hell/hellbutt01
{
	{	
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/hellbutt01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/hellbutt01.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 0.2
	}
}
textures/hell/xfiretest1
{
	qer_editorimage textures/hell/firetestb.tga
	//surfaceparm trans
	surfaceparm noimpact
	//surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 1000
	tesssize 64
	
	
	{
	map textures/hell/firetestb.tga
	blendfunc gl_one gl_zero
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/hell/firetest.tga
	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}
	
	{
	map textures/hell/firetest2.tga
	blendFunc GL_DST_COLOR GL_ONE
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}

//	END
}
textures/hell/xfiretest2
{
	qer_editorimage textures/hell/firetestb.tga
	//surfaceparm trans
	surfaceparm noimpact
	//surfaceparm nonsolid
	surfaceparm nolightmap
	q3map_surfacelight 1000
	tesssize 64
	{
	map textures/hell/firetest2.tga
	blendfunc gl_one gl_zero
	tcMod turb .2 .2 .1 1
	tcMod scale .25 .25
	tcMod scroll .5 1.5
	}

	{
	map textures/hell/firetest.tga

//	blendFunc GL_DST_COLOR GL_ONE
	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .2 .1 .1 1
	tcMod scale .1 .1
	tcMod scroll 0 1.0
	}
	
	{

	map textures/hell/firetestb.tga
	blendFunc GL_DST_COLOR GL_ONE
//	blendFunc GL_DST_COLOR GL_SRC_ALPHA
	tcMod turb .1 .1 .5 .5
	tcMod scroll 1 5.0
	}

//	END
}


textures/hell/metal2_2
{
	cull twosided
	surfaceparm trans
	{
		map textures/hell/metal2_2.tga
		rgbGen identity
		alphaFunc GE128
		//blendFunc GL_ONE GL_ZERO
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		depthWrite
	}
	{
		map $lightmap
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/hell/ironcrosslt1
{
	q3map_surfacelight 7000
	//light 1

	{
		map $lightmap
		rgbGen identity
	}

	{
		map textures/hell/ironcrosslt1.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	
}
textures/hell/killblock_b
{
	q3map_surfacelight 50
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/killblock_b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/killblock_b.blend.tga
		blendFunc GL_ONE GL_ONE
	}
}

textures/hell/killblock_c
{
	q3map_surfacelight 50
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/killblock_c.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/killblock_c.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 0 0.2
	}
}
textures/hell/bluepad
{
	q3map_surfacelight 2000
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/bluepad.tga
		blendFunc GL_DST_COLOR GL_ZERO		
		rgbGen identity
	}
	{
		map textures/hell/bluepad.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.5 0 .2
	}
}

textures/hell/light1dark
{
	q3map_surfacelight 6000
	//light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/light1dark.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/light1dark.tga
		blendFunc GL_ONE GL_ONE
//		rgbGen wave sin 0.5 0.1 0 .2
	}
}
textures/hell/light1red
{
	q3map_surfacelight 5000
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/light1red.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/light1red.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 0 .2
	}
}
textures/hell/light1blue
{
	q3map_surfacelight 3250
	light 1
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/hell/light1blue.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/hell/light1blue.blend.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 0.5 0.1 0 .2
	}
}
textures/hell/lava2z	
{
	surfaceparm nonsolid	
	surfaceparm lava	
	surfaceparm nolightmap	
	q3map_surfacelight 150
}

textures/hell/darkness
{
	surfaceparm	trans
	surfaceparm	nonsolid
	surfaceparm	fog
	surfaceparm	nolightmap
	cull back
	fogonly
	fogparms 0 0 0 400 256
}


textures/liquids/protolava
{
	
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 600
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
        {
		map textures/liquids/protolava2.tga
                tcmod scale .2 .2
                tcmod scroll .04 .03
                tcMod turb 0 .1 0 .01
                blendFunc GL_ONE GL_ZERO
                rgbGen identity
	}
	{
		map textures/liquids/protolava.tga
                blendfunc blend
		tcMod turb 0 .2 0 .1
	}

}

textures/liquids/slime2
	{
	//	*************************************************		
	//	* SLIME Feb 11 1999 				*
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
	//	*************************************************	

		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/slime7e.tga
		q3map_lightimage textures/liquids/slime7e4.tga
		q3map_globaltexture
		qer_trans .5

		surfaceparm noimpact
		surfaceparm lava
		surfaceparm trans		

		q3map_surfacelight 2000
		tessSize 64
		cull disable
		deformVertexes wave 100 sin 2 4 0 .5
		
		
		{	
			map $lightmap
			rgbgen identity
		}
		

		{
			map textures/liquids/slime7e.tga
			blendFunc GL_DST_COLOR GL_SRC_ALPHA
			rgbGen identity
			alphaGen lightingSpecular
			tcMod turb 0 .2 .5 .05
			tcmod scroll .01 .01
		}


		
		{
			map textures/liquids/slime7e4.tga
			blendfunc add
			rgbgen wave inversesawtooth 0 1 0 4
			tcMod turb 0 .2 .5 .05
			tcmod scroll .01 .01
		}



		// 	END
	}

textures/liquids/watertest

//	************************************************************
//	*      Water test with environmentmap. Created September 21*
//	************************************************************
	
	{
		qer_editorimage textures/liquids/pool3d_3b.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		tessSize 32
		deformVertexes normal .1 .5

		{
			map textures/liquids/pool3d_3f.tga
			blendfunc add
			tcgen environment
			rgbgen wave sin .25 0 0 0
			tcmod scale 2 1
			tcMod scroll .05 .05
		}

		




	}


textures/liquids/flatripplewater_1500
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/pool2.tga
	q3map_globaltexture
	q3map_lightsubdivide 32
	//surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 500
	cull disable
	
//	tesssize 128
//	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/pool2.tga
		tcMod turb 0 .2 0 .1
	}
}

textures/liquids/xctf_painwater
	{
		qer_editorimage textures/liquids/pool2.tga
		q3map_globaltexture
		qer_trans .5

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		q3map_surfacelight 450

		cull disable
		tesssize 64
		deformVertexes wave 100 sin 1 1 1 .1
		{
			map textures/liquids/pool2.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .03 .03
			tcMod scroll .001 .001
		}
		{
			map textures/liquids/pool3.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}
                {
			map textures/sfx/bolts.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
                        //tcGen environment
			tcMod scroll .1 .1
                        tcmod rotate 290
                        //rgbgen wave sin .1 1 5 .1
		}
	}
textures/liquids/clear_calm1

//	*********************************************************
//	*      Medium clear calm water. Created September 9	*
//	*********************************************************
		
	{
		qer_editorimage textures/liquids/pool3d_3e.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
	
		cull disable
		deformVertexes wave 64 sin .25 .25 0 .5	
		{ 
			map textures/liquids/pool3d_5e.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod scroll .025 .01
		}
	
		{ 
			map textures/liquids/pool3d_3e.tga
			blendFunc GL_dst_color GL_one
			tcmod scale -.5 -.5
			tcmod scroll .025 .025
		}

	
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	
	

//	END
	}

textures/liquids/clear_ripple3

//	*********************************************************
//	*      Medium clear ripple water. Created September 9	*
//	*********************************************************
		
	{
		qer_editorimage textures/liquids/pool3d_3c.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
	
		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	
		
		{ 
			map textures/liquids/pool3d_5c.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6c.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3c.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}
	
		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	

//	END
	}


textures/liquids/clear_ripple2

//	*********************************************************
//	*      Small clear ripple water. Created September 9	*
//	*********************************************************
	
	{
		qer_editorimage textures/liquids/pool3d_3b.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	

		{ 
			map textures/liquids/pool3d_5b.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6b.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3b.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}

		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
	

//	END
	}


textures/liquids/clear_ripple1

//	*********************************************************
//	*      Large clear ripple water. Created September 9	*
//	*********************************************************
	
	{
		qer_editorimage textures/liquids/pool3d_3.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	
	
		
		{ 
			map textures/liquids/pool3d_5.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}	

		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
//	END
	}

textures/liquids/clear_ripple1_q3dm1

//	*********************************************************
//	*      Large clear ripple water. Created September 9	*
//	*********************************************************
	
	{
		qer_editorimage textures/liquids/pool3d_3.tga
		qer_trans .5
		q3map_globaltexture
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		deformVertexes wave 64 sin .5 .5 0 .5	
	
		
		{ 
			map textures/liquids/pool3d_5.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3.tga
			blendFunc GL_dst_color GL_one
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}	

		{
			map $lightmap
			blendFunc GL_dst_color GL_zero
			rgbgen identity		
		}
//	END
	}


textures/liquids/mercury
{
        tesssize 128
	deformVertexes wave 100 sin 5 5 0 0.4
        {
		rgbGen identity
		map $lightmap
                blendFunc GL_ONE GL_ONE
	}
	{
		map textures/liquids/mercury.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map textures/base_trim/tinfx.tga
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
       
        {
		map textures/liquids/mercury.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}       
}
textures/liquids/proto_spec
{
       // tesssize 128
	cull disable
	//deformVertexes wave 100 sin 3 2 .1 2
         

	{
                map $lightmap
		//map textures/effects/envmapdim2.tga
                blendFunc GL_ONE GL_ONE
		tcgen environment
		 tcmod scale .25 .25
                //tcmod scroll -.05 -.5
		rgbgen identity      
	}
        // {
	//	map textures/liquids/proto_gruel2.tga
        //        tcmod scroll .01 .02
        //        tcmod scale .03  .04
	//	blendFunc GL_ONE GL_ONE
	//	rgbGen identity
	//}
        //{
	//	map textures/liquids/proto_spec.tga
	//        //blendFunc GL_DST_COLOR GL_SRC_ALPHA
        //        blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
        //        tcmod scroll -.05 -.07
	//	rgbGen identity
	//	alphaGen lightingSpecular
	//}
		
	
	{
		map textures/liquids/proto_spec.tga
                tcmod scroll .01 .02
		blendFunc GL_ONE_MINUS_SRC_ALPHA GL_SRC_ALPHA
		rgbGen identity
	}
        {
			map textures/liquids/proto_gruel2.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
			tcMod scroll .01 .02
        }
       

	{
		map $lightmap
                //blendFunc GL_ONE GL_ONE
    		rgbgen identity
	        blendFunc GL_DST_COLOR GL_ZERO
               
	}

			
}

textures/liquids/lavahell
{
	// Added to g3map_global texture on May 11, 1999
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 600
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}


	
//	END
}

textures/liquids/lavahell_xdm1
{
	qer_editorimage textures/liquids/lavahell.tga
	// Added to g3map_global texture on May 11, 1999
	q3map_globaltexture
	//surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm nodlight
	surfaceparm noimpact
	//surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 600
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
	
//	END
}

textures/liquids/lavahell_1000
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 1000
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
}

textures/liquids/lavahell_2000
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 2000
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
}
textures/liquids/lavahell_750
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	q3map_lightsubdivide 32
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 500
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
}

textures/liquids/flatlavahell_1500
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	q3map_lightsubdivide 32
	//surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 1500
	cull disable
	
//	tesssize 128
//	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
       
}


textures/liquids/lavahell_2500
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 2500
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
}

textures/liquids/lavahelldark
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 150
	cull disable
	
	tesssize 128
	cull disable
	deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
	
//	END
}

textures/liquids/lavahellflat_400
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell.tga
	q3map_globaltexture
	surfaceparm trans
	//surfaceparm nonsolid
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 400
	cull disable
	
	tesssize 128
	cull disable
	//deformVertexes wave 100 sin 3 2 .1 0.1
	
	{
		map textures/liquids/lavahell.tga
		tcMod turb 0 .2 0 .1
	}
	
//	END
}

textures/liquids/lavahell2
{
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/lavahell2.tga
	q3map_globaltexture
	qer_nocarve
	surfaceparm noimpact
	surfaceparm lava
	surfaceparm nolightmap
	q3map_surfacelight 3000
	tesssize 256
	cull disable
	deformVertexes wave 100 sin 5 5 .5 0.02
	fogparms ( 0.8519142 0.309723 0.0 ) 128

	{
		map textures/liquids/lavahell.tga
		tcMod turb .25 0.2 1 0.02
		tcMod scroll 0.1 0.1
	}
}

textures/liquids/calm_pool
	{
		//	*************************************************
		//	* CALM GREEN WATER POOL Feb 19, 1998		*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************

		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/pool2.tga
		qer_trans .5
		q3map_globaltexture

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

		cull disable
		tesssize 64
		deformVertexes wave 100 sin 1 1 1 .1
		
	
	
		{
			map textures/liquids/pool2.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .03 .03
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/pool3.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}


		//	END
	}

textures/liquids/ps_bloodwater1
	{
		//	*************************************************
		//	*  I made this for ps_dm5 on June 13 1999	*
		//      *      (it's okay if you fuck it up)		*
		//	*************************************************

		qer_editorimage textures/liquids/ps_bloodwater1.tga
		q3map_globaltexture
		qer_trans .5

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		q3map_surfacelight 50

		cull disable
		tesssize 64
		deformVertexes wave 100 sin 1 1 1 .1
		
	
	
		{
			map textures/liquids/ps_bloodwater1.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .03 .03
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/ps_bloodwater1.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}


		//	END
	}


textures/liquids/calm_poollight
	{
		//	*************************************************
		//	* CALM GREEN WATER POOL may 5 1999
		//    * same as calm water but emits light		*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************

	
		qer_editorimage textures/liquids/pool3d_4b.tga
		q3map_globaltexture
		qer_trans .75

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap
		q3map_surfacelight 50

		cull disable
		tesssize 64
		deformVertexes wave 100 sin 1 1 1 .1
		
	
	
		{ 
			map textures/liquids/pool3d_5c2.tga
			blendFunc GL_dst_color GL_zero
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 1.5 0 1.5 1 1 2
			tcmod scroll -.05 .001
		}
	
		{ 
			map textures/liquids/pool3d_6c2.tga
			blendFunc GL_dst_color GL_zero
			rgbgen identity
			tcmod scale .5 .5
			tcmod transform 0 1.5 1 1.5 2 1
			tcmod scroll .025 -.001
		}

		{ 
			map textures/liquids/pool3d_3c2.tga
			blendFunc GL_dst_color GL_zero
			rgbgen identity
			tcmod scale .25 .5
			tcmod scroll .001 .025
		}
		{
			map textures/liquids/pool3d_4b2.tga
			blendfunc add
			tcmod scale .125 .125	
			rgbgen identity
		}


		//	END
	}


textures/liquids/calm_pool2
	{
		//	*************************************************
		//	* CALM GREEN WATER POOL Feb 19, 1998		*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************

		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/pool3.tga
		q3map_globaltexture
		qer_trans .5

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water

		cull disable
		tesssize 64
		deformVertexes wave 100 sin 1 1 1 .1
		
	
	
			

		{
			map textures/liquids/pool2.tga
			blendfunc GL_one GL_src_color
			tcMod scale .03 .03
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/pool3.tga 
			blendfunc GL_DST_COLOR GL_one
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}

		{
			map $lightmap
			blendfunc GL_dst_color GL_one
			tcmod turb 0 .001 0 1
		}	

		{
			map textures/liquids/pj_e3_reflection.tga
			blendfunc gl_dst_color gl_one
			tcgen environment
		}

			



		//	END
	}


textures/liquids/pool
	{
		//	*************************************************
		//	* GREEN WATER POOL Feb 19, 1998			*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************

		// Added to g3map_global texture on May 11, 1999
		qer_trans .5

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

		q3map_globaltexture		
		// so the scMod scales work properly 5/11/99

		cull disable
		tesssize 64
		deformVertexes wave 100 sin 1 1 1 .1
		
	
	
		{
			map textures/liquids/pool2.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .03 .03
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/pool.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod scale .2 .2
			tcMod stretch sin 1 .1 0 .05
			rgbGen wave sin .5 .5 0 .05
			tcMod scroll -.001 .001
		}
	
		{
			map textures/liquids/pool3.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}
	
		{
			map textures/liquids/pool4.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod scale .3 .3
			tcMod turb .1 .01 0 .01
			tcMod stretch sin 1 .3 0 .015
			rgbGen wave sin .5 .5 0 .07
			tcMod scroll .001 -.001
		}

		//	END
	}
	
textures/liquids/calm_pool_bgtess
	{
		//	*************************************************
		//	* CALM GREEN WATER POOL Feb 19, 1998		*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//      * Large tesselations added on May 26, '99
		//	*************************************************

		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/pool2.tga
		qer_trans .5
		q3map_globaltexture

		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

		cull disable
		tesssize 256
		deformVertexes wave 256 sin 1 1 1 .1
		
	
	
		{
			map textures/liquids/pool2.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .03 .03
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/pool3.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}


		//	END
	}

textures/liquids/ripplewater2
	{
		//	*************************************************
		//	* Ripply Water Feb 16 1999			*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************

		// Added to g3map_global texture on May 11, 1999
		q3map_globaltexture
		qer_trans .5
	
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

		// JDC: testing foggy water
		surfaceparm	fog
		fogparms ( .5 .12 1 ) 200

		tesssize 64
		deformVertexes wave 100 triangle 2 2 1 0.1
		
		{
			map textures/liquids/ripplewater3.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .05 .05
			tcGen environment
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/ripplewater2.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}

		{
			map textures/liquids/ripplewater.tga
			blendFunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .07 .1 .01
			tcMod scale .5 .5
			tcMod stretch sin 1 .1 0 .01
			tcMod scroll 0 .025
		}	

		

		//	END
	}

textures/liquids/proto_pool3
	{
		///////////////////////////////////////////
		//   Water Fuckage June 18 99 Kenneth	 //
		///////////////////////////////////////////
                
		q3map_globaltexture
	    	qer_trans .80
                surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
                q3map_surfacelight 50
		cull disable
                // tesssize 256
	        //deformVertexes wave 100 sin 1 5 .1 .5
	        
		
		{
			map textures/liquids/proto_pool3.tga
			blendfunc GL_ONE GL_ONE //SRC_COLOR
			tcMod scale 1 1
			tcMod scroll .02 .02
                       
		}
	        {
			map textures/liquids/proto_poolpass2.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .5 .6
			tcMod scroll .06 .04
		}
	        {
			map textures/liquids/proto_poolpass.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
			tcMod scroll .05 .05
		}
	        {
		        map $lightmap
			rgbgen identity
			blendfunc GL_DST_COLOR GL_ZERO
                }
               
		

		//	END
	}
 textures/liquids/proto_poolpass
        {
		///////////////////////////////////////////
	        //Electric Slime. FOUR passes of FURY ---//
		///////////////////////////////////////////
                
		q3map_globaltexture
	    	//qer_editorimage textures/liquids/proto_pool3.tga
                 q3map_lightimage textures/liquids/proto_pool3.tga
	        q3map_globaltexture	
	        q3map_surfacelight 240
		// tesssize 256
	        //deformVertexes wave 100 sin 1 5 .1 .5
	        surfaceparm slime
		
		{
	        	map textures/liquids/proto_gruel2.tga
		        //tcMod scale 1 1
                         tcMod scale .5 .6
			//tcMod scroll .4 .01
                        tcMod turb .1 .25 0 -.1
                       
		}
	       //{
		//	map textures/liquids/proto_poolpass2.tga
		//	blendfunc GL_ONE GL_ONE
		//	tcMod scale .5 .6
		//	//tcMod scroll .6 .04
                //        tcMod turb .1 .25 0 .01
		//}
	        {
			map textures/liquids/proto_poolpass.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
			//tcMod scroll .5 .05
                        tcMod turb .1 .25 0 .07
		}
	        {
		        map $lightmap
			rgbgen identity
			blendfunc GL_DST_COLOR GL_ZERO
                }
                {
			map textures/sfx/bolts.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
                        //tcGen environment
			tcMod scroll .1 .1
                        tcmod rotate 290
                        //rgbgen wave sin .1 1 5 .1
		}
		

		//	END
	}
textures/liquids/jello
        {
		///////////////////////////////////////////
	        //DANGER JELLO! FOUR passes of FURY ---  //
		///////////////////////////////////////////
                
		q3map_globaltexture
	    	//qer_editorimage textures/liquids/proto_pool3.tga
                 q3map_lightimage textures/liquids/proto_pool3.tga
	        q3map_globaltexture	
	        q3map_surfacelight 240
		// tesssize 256
	        //deformVertexes wave 100 sin 1 5 .1 .5
	        surfaceparm slime
		
		{
	        	map textures/liquids/jello.tga
		        //tcMod scale 1 1
                         tcMod scale .5 .6
			//tcMod scroll .4 .01
                        tcMod turb .1 .25 0 -.1
                       
		}
	        {
			map textures/liquids/jello2.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
			//tcMod scroll .5 .05
                        tcMod turb .1 .25 0 .07
		}
	        {
		        map $lightmap
			rgbgen identity
			blendfunc GL_DST_COLOR GL_ZERO
                }
                {
			map textures/sfx/bolts2.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .2 .2
                        //tcGen environment
			tcMod scroll 5  5
                        tcmod rotate 296
                        //rgbgen wave sin .1 1 5 .1
		}
		

		//	END
	}
 textures/liquids/proto_slime
        {
		///////////////////////////////////////////
		//   Slimage June 22 99 Kenneth	         //
		///////////////////////////////////////////
                
		q3map_globaltexture
	     // qer_trans .001
                surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
                cull disable
	        
		
		{
			map textures/liquids/proto_slime.tga
		        alphaFunc GE128
		        depthWrite
		        //rgbGen vertex
			tcMod scale 1 1
			tcMod scroll .02 .02
                       
		}
	        {
		        map $lightmap
			rgbgen identity
			blendfunc GL_DST_COLOR GL_ZERO
                }
		

		//	END
	}
textures/liquids/proto_gruel
        {
		///////////////////////////////////////////////////
		//   Wrongful, Afterbirth-esque goo June 24 99 //
		///////////////////////////////////////////////////
              q3map_globaltexture
	    	qer_trans 80
                surfaceparm trans
		surfaceparm nonsolid
                surfaceparm nomarks
		surfaceparm water
		cull disable
                //tesssize 256
	        //deformVertexes wave 100 sin 1 5 .1 .5
	        
		
		{
			map textures/liquids/proto_gruel.tga
			// blendfunc GL_ONE GL_ONE
			tcMod scale 1 1
			tcMod scroll .02 .02
                       
		}
	        {
			map textures/liquids/proto_gruel.tga
			blendfunc GL_ONE GL_ONE
			tcMod scale .5 .6
			tcMod scroll .06 .04
		}
	        //{
		//	map textures/liquids/proto_poolpass.tga
		//	blendfunc GL_ONE GL_ONE
		//	tcMod scale .2 .2
		//	tcMod scroll .05 .05
		//}
	        {
		        map $lightmap
			rgbgen identity
			blendfunc GL_DST_COLOR GL_ZERO
                }
		
        }
textures/liquids/xripplewater2
	{
		//	*************************************************
		//	* Ripply Water Feb 16 1999			*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************
		// June.9.1999 -- Added q3map_surfacelight -- Xian
		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/ripplewater2.tga
		q3map_surfacelight 600
		q3map_globaltexture
		qer_trans .5
	
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

		// JDC, testing backshader cull disable
		tesssize 64
		deformVertexes wave 100 triangle 2 2 1 0.1
		
		surfaceparm fog
		fogparms ( 0.3 0.3 1.0 ) 512

		{
			map textures/liquids/ripplewater3.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .05 .05
			tcGen environment
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/ripplewater2.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}

		{
			map textures/liquids/ripplewater.tga
			blendFunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .07 .1 .01
			tcMod scale .5 .5
			tcMod stretch sin 1 .1 0 .01
			tcMod scroll 0 .025
		}	

		

		//	END
	}

ripplewater2_back
	{
		// Added to g3map_global texture on May 11, 1999
		q3map_globaltexture
	//	this is used when looking from inside the water to the outside
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

//		fogonly
		{
			map textures/liquids/ripplewater3.tga
			blendfunc GL_DST_COLOR GL_SRC_COLOR
			tcMod scale .05 .05
			tcGen environment
			tcMod scroll .001 .001
		}

		//	END
	}

textures/liquids/ripplewater2a
	{
		//	*************************************************
		//	* Ripply Water large tesselations MAr 15 1999			*
		//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
		//	*************************************************

		// Added to g3map_global texture on May 11, 1999
		q3map_globaltexture
		qer_trans .5
		qer_editorimage textures/liquids/ripplewater2
		surfaceparm trans
		surfaceparm nonsolid
		surfaceparm water
		surfaceparm nolightmap

		cull disable
		tesssize 128
		deformVertexes wave 100 triangle 2 2 1 0.1
		

		{
			map textures/liquids/ripplewater3.tga
			blendfunc GL_ONE GL_SRC_COLOR	
			tcMod scale .05 .05
			tcGen environment
			tcMod scroll .001 .001
		}
	
		{
			map textures/liquids/ripplewater2.tga
			blendfunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .1 0 .01
			tcMod scale .5 .5
			tcMod scroll -.025 .02
		}

		{
			map textures/liquids/ripplewater.tga
			blendFunc GL_DST_COLOR GL_ONE
			tcMod turb .1 .07 .1 .01
			tcMod scale .5 .5
			tcMod stretch sin 1 .1 0 .01
			tcMod scroll 0 .025
		}	
		//	END
	}

textures/liquids/slime1
	{
	//	*************************************************		
	//	* SLIME Feb 11 1999 				*
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
	//	*************************************************	

		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/slime7.tga
		q3map_lightimage textures/liquids/slime7.tga
		q3map_globaltexture
		qer_trans .5

		surfaceparm noimpact
		surfaceparm slime
		surfaceparm nolightmap
		surfaceparm trans		

		q3map_surfacelight 100
		tessSize 32
		cull disable

		deformVertexes wave 100 sin 0 1 .5 .5

		{
			map textures/liquids/slime7c.tga
			tcMod turb .3 .2 1 .05
			tcMod scroll .01 .01
		}
	
		{
			map textures/liquids/slime7.tga
			blendfunc GL_ONE GL_ONE
			tcMod turb .2 .1 1 .05
			tcMod scale .5 .5
			tcMod scroll .01 .01
		}

		{
			map textures/liquids/bubbles.tga
			blendfunc GL_ZERO GL_SRC_COLOR
			tcMod turb .2 .1 .1 .2
			tcMod scale .05 .05
			tcMod scroll .001 .001
		}		

		// 	END
	}

textures/liquids/slime1_2000
	{
	//	*************************************************		
	//	* SLIME Feb 11 1999 				*
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
	//	*************************************************	

		// Added to g3map_global texture on May 11, 1999
		qer_editorimage textures/liquids/slime7.tga
		q3map_lightimage textures/liquids/slime7.tga
		q3map_globaltexture
		qer_trans .5

		surfaceparm noimpact
		surfaceparm slime
		surfaceparm nolightmap
		surfaceparm trans		

		q3map_surfacelight 2000
		tessSize 32
		cull disable

		deformVertexes wave 100 sin 0 1 .5 .5

		{
			map textures/liquids/slime7c.tga
			tcMod turb .3 .2 1 .05
			tcMod scroll .01 .01
		}
	
		{
			map textures/liquids/slime7.tga
			blendfunc GL_ONE GL_ONE
			tcMod turb .2 .1 1 .05
			tcMod scale .5 .5
			tcMod scroll .01 .01
		}

		{
			map textures/liquids/bubbles.tga
			blendfunc GL_ZERO GL_SRC_COLOR
			tcMod turb .2 .1 .1 .2
			tcMod scale .05 .05
			tcMod scroll .001 .001
		}		

		// 	END
	}



textures/liquids/lavacrust
	{
	//	*************************************************
	//	* CRUSTY LAVA Feb 11 1999			*
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
	//	*************************************************
	// change 5/3 - lighting changed from 300 to 50	
	// change 5/5 - made lavacrust solid
	// Added to g3map_global texture on May 11, 1999
		q3map_globaltexture
		surfaceparm trans
		//surfaceparm lava

		
		q3map_surfacelight 50
		q3map_lightimage textures/liquids/lava.tga

		//tesssize 64
		//deformVertexes wave 100 sin 0 5 0 .05
		//cull disable

		{
			map textures/liquids/lava.tga
			tcMod turb 0 0.1 0 0.02
			rgbGen wave triangle .9 .1 0 1
			tcMod scroll -.02 -.02
		}

		{
			map textures/liquids/lavacrust.tga
			blendfunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
			tcmod turb 0 .5 0 .005
			rgbgen identity
		}

		{
			map $lightmap
			blendfunc gl_dst_color gl_zero
			rgbgen identity
		}

			
		//	END
	}

textures/liquids/bloodwater_pj
	{
	//	*************************************************
	//	* Brighter BLOODY WATER Apr 7 1999		        *
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
	//	*************************************************
	// Added to g3map_global texture on May 11, 1999
	qer_editorimage textures/liquids/bloodwater.tga
	q3map_globaltexture
	qer_trans .5
	
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	//testing out a dim surface light, march 19 - bj
	q3map_surfacelight 500
	tesssize 128
	cull disable
	deformVertexes wave 128 sin 1 1 .5 .5
	
	
		{
			map textures/liquids/bloodwater1.tga
			blendFunc GL_ONE GL_ONE
			tcGen environment
			tcMod scroll 0 .01
		}

		{
			map textures/liquids/bloodwater2.tga
			blendFunc GL_DST_COLOR GL_SRC_COLOR
			tcMod scale .1 .1
			tcMod turb .1 .1 1 .01
			tcMod scroll 0 .01
		}

		{
			map textures/liquids/bloodwater.tga
			blendFunc GL_DST_COLOR GL_SRC_COLOR
			tcMod scale .25 .25
			tcMod scroll 0 .007
		}
	
		//	END
	}

textures/liquids/bloodwater
	{
	//	*************************************************
	//	* BLOODY WATER Feb 16 1999		        *
	//	* IF YOU CHANGE THIS PLEASE COMMENT THE CHANGE	*
	//	*************************************************

	// Added to g3map_global texture on May 11, 1999
	q3map_globaltexture
	qer_trans .5

	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm water
	surfaceparm nolightmap
	//testing out a dim surface light, march 19 - bj
	q3map_surfacelight 200
	tesssize 64
	cull disable
	deformVertexes wave 100 sin 1 1 .5 .5
	
	
		{
			map textures/liquids/bloodwater1.tga
			blendFunc GL_ONE GL_ONE
			tcGen environment
			tcMod scroll 0 .01
		}

		{
			map textures/liquids/bloodwater2.tga
			blendFunc GL_DST_COLOR GL_SRC_COLOR
			tcMod scale .1 .1
			tcMod turb .1 .1 1 .01
			tcMod scroll 0 .01
		}

		{
			map textures/liquids/bloodwater.tga
			blendFunc GL_DST_COLOR GL_SRC_COLOR
			tcMod scale .25 .25
			tcMod scroll 0 .007
		}
	
		//	END
	}


textures/hell/lavasolid
{
	// Added to g3map_global texture on May 11, 1999
	q3map_globaltexture
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_surfacelight 450

	tesssize 64
	deformVertexes wave 100 sin 2 2 0 0.1

	{
		map textures/hell/lava2d.tga
		tcGen environment
		tcMod turb 0 0.25 0 0.05
	}

	{
		map textures/hell/lava2d.tga
		blendfunc GL_ONE GL_ONE
		tcMod turb 0 0.25 0 0.05
	}
}

// menu shader























//
// this file contains shaders attached models
//

models/mapobjects/console/under

{
	cull disable
        surfaceparm alphashadow
        //surfaceparm nodraw
        {
		clampmap models/mapobjects/console/under.tga
		alphaFunc GE128
                depthWrite
		rgbGen vertex
                
	}
}
models/mapobjects/console/rotate

{
	cull disable
        
        {
		clampmap models/mapobjects/console/rotate.tga
		blendFunc add
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 40
		rgbGen vertex
	}
}

models/mapobjects/console/centercon

{
	cull disable
        {
		map models/mapobjects/console/scrolltext.tga
		blendFunc add
                tcmod scroll 0 -.3
                //tcMod stretch sin .9 0.1 0 1.1
		rgbGen vertex
	}
        
        {
		clampmap models/mapobjects/console/centercon.tga
		blendFunc add
                tcMod stretch sin .9 0.1 0 .2
                tcmod rotate 40
		rgbGen vertex
	}
}

models/mapobjects/console/console

{
	cull disable
        
        {
		map textures/effects/tinfx2c.tga
		blendFunc GL_ONE GL_ZERO
                tcGen environment
		rgbGen vertex
	}
        {
		map models/mapobjects/console/console.tga
		blendFunc blend
		rgbGen vertex
	}
        {
		map models/mapobjects/console/console2.tga
		blendFunc add
		rgbGen vertex
                rgbGen wave sin .5 .5 0 .2
	}
}

models/mapobjects/console/sphere

{
	cull disable
        
        {
		map models/mapobjects/console/spherex2.tga
		blendFunc add
	        tcmod rotate 40
                tcGen environment
                tcmod scroll 5 .4
		rgbGen wave sin .5 .5 0 .2
	}
        
	 {
		map models/mapobjects/console/spherex.tga
		blendFunc add
	        tcmod rotate 40
                tcGen environment
                tcmod scroll 5 .4
		rgbGen wave sin .5 .5 0 -.2
	}
}

models/mapobjects/console/sphere2

{
	cull disable
        deformVertexes autoSprite

        //{
	//	clampmap models/mapobjects/console/sphere2.tga
	//	alphaFunc GE128
        //        depthWrite
        //        //tcMod stretch sin .9 0.1 0 .5
        //        tcmod rotate 40
	//	rgbGen identity
	//}
        {
		map models/mapobjects/console/sphere3.tga
		blendFunc add
               // depthWrite
		rgbGen wave sin .5 .5 0 .2
	}
        {
		map models/mapobjects/console/sphere4.tga
		blendFunc add
               // depthWrite
		rgbGen wave sin .5 .5 0 -.2
	}
         {
		clampmap models/mapobjects/console/sphere2.tga
		alphaFunc GE128
                //blendfunc blend
                //depthWrite
                //tcMod stretch sin .9 0.1 0 .5
                tcmod rotate 40
		rgbGen identity
	}
}

models/mapobjects/console/jacobs
{
	cull disable
        
        {
		map textures/effects/tinfxb.tga
		blendFunc add
                tcGen environment
                rgbGen identity
	}
}

models/mapobjects/console/scrolltext

{
	cull disable
        
        {
		map models/mapobjects/console/scrolltext.tga
		blendFunc add
                tcmod scroll 0 -.3
                //tcMod stretch sin .9 0.1 0 1.1
		rgbGen vertex
	}
}

models/players/slash/yurikoskate
{
	cull disable
        deformVertexes autoSprite
       
        
        {
		clampmap models/players/slash/yurikoskate.tga
		blendFunc blend
                //tcMod stretch sin .9 0.1 0 1.1
                tcmod rotate 999
		rgbGen lightingdiffuse
	}
        {
		clampmap models/players/slash/yurikoskate.tga
		blendFunc blend
                //tcMod stretch sin .9 0.1 0 -1.1
                tcMod stretch sin .9 0 0 0
                tcmod rotate 20
		rgbGen lightingdiffuse
	}
}
models/players/slash/yuriko
{
        {
                map textures/effects/envmaproc.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/yuriko.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/slash/yuriko_h
{
        {
                map textures/effects/envmaproc.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/slash/yuriko_h.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy
{
        {
                map textures/effects/envmaproc.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/hunter/hunter2.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy_h
{
        {
                map textures/effects/envmaproc.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/hunter/hunter_h.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/hunter/harpy_f
{
      surfaceparm	nodraw
}
models/mapobjects/standlamp2
{

        {
                map textures/effects/tinfx2.tga
                tcGen environment
                rgbGen identity
        }
        {
                map models/mapobjects/standlamp2.tga
                blendfunc blend
                rgbGen vertex
        }
        
}
models/players/uriel/zael
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/uriel/zael.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
models/mapobjects/pipe/pipe02
{

        {
                map textures/effects/tinfx2d.tga
                tcGen environment
                rgbGen identity
        }
        {
                map models/mapobjects/pipe/pipe02.tga
                blendfunc blend
                rgbGen lightingdiffuse
        }
        
}
models/players/slash/grrl_h
{

        {
                map textures/effects/tinfx2d.tga
                tcGen environment
                rgbGen identity
        }
        {
                map models/players/slash/grrl_h.tga
                blendfunc blend
                rgbGen lightingdiffuse
        }
        
}
models/mapobjects/pipe/pipe02x
{
    q3map_lightimage textures/sfx/electricslime_old.tga
    q3map_surfacelight 150
    cull disable
        {
                map textures/effects/tinfx2b.tga
                tcGen environment
                tcmod scale 1 2
                blendfunc add
                rgbGen identity
        }
        {
                map textures/sfx/electricslime_old.tga
                //tcGen environment
                //tcmod scale 2 2
                //tcmod rotate  240
                tcmod scroll 7.2 1
                blendfunc add
                rgbGen identity
        }
        
}
models/mapobjects/skull/monkeyhead

{
        //deformVertexes wave 100 sin 0 .7 0 .2
        //deformVertexes wave 100 sin 0 .5 1 .1
        cull disable
        nomipmaps

        {
                map models/mapobjects/skull/monkeyhead.tga
                rgbGen vertex
        }
	{
		//animMap 0.5 models/mapobjects/skull/monkeyhead.tga //models/mapobjects/wallhead/femhead2.tga
                map models/mapobjects/skull/monkeyheadb.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen	wave sin 0 1 1 .1
                // alphaGen	wave triangle 0 .7 0 .2
                rgbGen vertex
	}	
	
}
models/mapobjects/skull/monkeyhead2
{
    cull disable
    surfaceparm  trans
    nomipmaps
        {
                map models/mapobjects/skull/monkeyhead2.tga
                blendfunc blend
		depthWrite
		rgbGen vertex
        }
}

models/powerups/armor/shard2
{
        {
                map textures/effects/tinfx2c.tga
                tcGen environment
                rgbGen identity
        }
        {
                map models/powerups/armor/shard2.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/jets/jet_1
{
     surfaceparm	trans
     nomipmaps
     cull disable
        {
		map models/mapobjects/jets/jet_1.tga
                blendFunc add
                tcmod scale  .5  1
                tcmod scroll 6 0
                rgbGen identity
	}
        {
		map models/mapobjects/jets/jet_2.tga
                blendFunc add
                tcmod scroll 3 -.5
                rgbGen wave inversesawtooth -.3 1.3 0 .5
	}
}
models/mapobjects/jets/jet_as
{
     deformVertexes autoSprite2
     deformVertexes wave 100 sin 0 1 0 9
     surfaceparm	trans
     nomipmaps
        {
		map models/mapobjects/jets/jet_as.tga
                blendFunc add
                rgbGen identity
	}
}
models/players/crash/crash_f
{

        {
                map textures/sfx/snow.tga
                tcmod scale .5 .5
                tcmod scroll  9 0.3
                rgbGen identity
        }
        {
                map textures/effects/tinfx2b.tga
                tcGen environment
                blendFunc add
                rgbGen lightingdiffuse
        }
}
models/players/crash/crash_t
{
        {
                map textures/effects/envmapblue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/crash/crash_t.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/crash/crash
{
        {
                map textures/effects/envmapblue.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/crash/crash.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/razor/id
{
        {
                map textures/effects/tinfx2d.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/razor/id.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/players/razor/h_id
{
        {
                map textures/effects/tinfx2d.tga
                tcGen environment
                rgbGen lightingdiffuse
        }
        {
                map models/players/razor/h_id.tga
                blendFunc blend
                rgbGen lightingdiffuse
        }
}
models/mapobjects/cross/cross_skull
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/cross/cross_skull.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}


models/mapobjects/cross/cross
{      
    q3map_lightimage models/mapobjects/cross/cross_light.tga
    q3map_surfacelight 300

        {
                map textures/sfx/firewalla.tga
                tcmod scale 4 4
                tcmod scroll 0.1 2
                rgbGen identity
	}  
        {
		map models/mapobjects/cross/cross.tga
                blendFunc blend
		rgbGen vertex
	}
       
}
models/mapobjects/baph/baphomet_gold
{      

        {
                map textures/sfx/firewalla.tga
                tcmod scroll 0.1 1
                rgbGen identity
	}  
        {
		map models/mapobjects/baph/baphomet_gold.tga
                blendFunc blend
		rgbGen vertex
	}
       
}
models/mapobjects/baph/baphomet
{      

        {
                map textures/sfx/firewalla.tga
                tcmod scroll 0.1 1
                rgbGen identity
	}  
        {
		map models/mapobjects/baph/baphomet.tga
                blendFunc blend
		rgbGen vertex
	}
       
}
models/mapobjects/banner/q3banner04

{      
  cull disable 
  nomipmaps
  
        {
		//map models/mapobjects/banner/q3banner04.tga
                map textures/sfx/firegorre2.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale .05 .1
                tcMod turb 0 .25 0 .6
                tcmod scroll .4 .3
	        //rgbGen wave sin .5 .5 0 .1
	}
        {
		
               map textures/sfx/bolts.tga
               tcmod scale .2 .2
               tcmod rotate 999
               tcmod scroll 9 9
               blendfunc add 
               rgbGen wave sin .5 .5 0 .2
	}  
        {
                map textures/sfx/firegorre2.tga
                //map models/mapobjects/banner/q3banner04.tga
                blendFunc add
                tcGen environment
                tcmod scale 5  5 
                tcmod scroll 0.09 0.04
                //rgbGen wave sin .5 .5 0 .1
	}    
	
}

models/mapobjects/banner/q3banner02

{      
    cull disable
    nomipmaps
    //deformVertexes wave 70 sin 0 .7 0 .4

        {
		map models/mapobjects/banner/q3banner02.tga
                blendFunc add
                tcmod scale  2  1
                tcmod scroll .33 0
                rgbGen wave sin .5 .5 0 .2
	}
        {
		map models/mapobjects/banner/q3banner02.tga
                blendFunc add
                tcmod scale  3  1
                tcmod scroll -.45 0
                rgbGen wave sin .5 .5 0 .2
	} 
        {
		map models/mapobjects/banner/q3banner02x.tga
                blendFunc add
                tcmod scale  4  1
                tcmod scroll 1 0
               // rgbGen wave sin .5 .5 0 -.2
	} 
}
models/mapobjects/horned/horned
{      

        {
                map textures/sfx/firewalla.tga
                tcmod scroll 0.1 1
	}  
        {
		map models/mapobjects/horned/horned.tga
                blendFunc blend
		rgbGen vertex
	}
       
}
models/players/bones/red
{
    
    cull disable
        {
                map models/players/bones/red.tga
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/players/bones/blue
{
    
    cull disable
        {
                map models/players/bones/blue.tga
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/players/bones/xray
{
    
    cull disable
        {
                map models/players/bones/xray.tga
                blendfunc add
                //rgbGen wave sin 1 .8 0 9
        }
        {
		
                map models/mapobjects/bitch/hologirl2.tga
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}    


}

models/players/bones/stiff
{
    
    cull disable
        {
                map models/players/bones/stiff.tga
                alphaFunc GE128
		depthWrite
		rgbGen lightingdiffuse
        }
}

models/mapobjects/skel/skel
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/skel/skel.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }
}

models/mapobjects/skel/xray
{
    deformVertexes move 0 0 .7  sin 0 5 0 0.2
    cull disable
    q3map_surfacelight 300	
        {
                map models/mapobjects/skel/xray.tga
                blendfunc add
                rgbGen wave sin 1 .8 0 .3
        }
        {
		
                map models/mapobjects/bitch/hologirl2.tga
                tcMod scroll -6 -.2
                tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}    


}
models/mapobjects/spotlamp/spotlamp
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/spotlamp/spotlamp.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/spotlamp/beam
{
        surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nonsolid
	surfaceparm nolightmap
	cull none
        nomipmaps
	{
		map models/mapobjects/spotlamp/beam.tga
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        //{
	//	map models/mapobjects/spotlamp/beam.tga
         //       tcMod Scroll -.3 0
         //       blendFunc GL_ONE GL_ONE
        //}
     
}
models/mapobjects/spotlamp/spotlamp_l

{
      cull disable
      q3map_surfacelight	200

        {
                map models/mapobjects/spotlamp/spotlamp_l.tga
		rgbGen identity
        }


}

models/players/grunt/stripe_h
{      
 
       {
	        //map textures/effects/tinfx.tga
                map textures/sfx/electricgrade3.tga
		//tcmod scale 6 6
                //tcmod rotate 350
                tcmod scroll 0 -.5
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
        }
        {
		map models/players/grunt/stripe_h.tga
                blendfunc gl_src_alpha gl_one_minus_src_alpha
		rgbGen lightingDiffuse
	}
       
}
models/mapobjects/timlamp/timlamp
{
    cull disable
    surfaceparm alphashadow
        {
                map models/mapobjects/timlamp/timlamp.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/wallhead/lion_m
{      
        {
		map models/mapobjects/wallhead/lion_m.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen vertex
	} 
        {
                map textures/sfx/firewalla.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll 0.1 1
                //rgbGen wave triangle .5 1 0 .4
	}  
        {
		map models/mapobjects/wallhead/lion_m.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
       
}
models/mapobjects/grenadel/grenadelx
{
        surfaceparm trans	
        surfaceparm nomarks	
	cull none
        nopicmip
	{
		clampmap models/mapobjects/grenadel/grenadelx.tga
		tcMod rotate 10 
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
}
//models/mapobjects/baph/bapho_lamp
//{   
//   
//        {
//                map textures/sfx/specular3b.tga         
//                tcGen environment
//                tcmod scroll .1 0
//                rgbGen identity
//	}  
//        {
//		map models/mapobjects/baph/bapho_lamp.tga
//                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
//		rgbGen vertex
//	}
//       
//         
//}

models/mapobjects/baph/wrist
{
     cull none
     nomipmaps
     surfaceparm	trans

        {
         map models/mapobjects/baph/wrist.tga
         blendFunc GL_ONE GL_ONE
         tcmod scale  2 1
         tcmod scroll 3 0
         rgbGen identity
        }
        {
         map models/mapobjects/baph/wrist.tga
         blendFunc GL_ONE GL_ONE
         tcmod scale  1 1
         tcmod scroll -5 0
         rgbGen identity
        }
}

models/mapobjects/baph/bapholamp_fx
{
     deformVertexes autoSprite
     surfaceparm	trans
     cull none
     nomipmaps
        {
         clampmap models/mapobjects/baph/bapholamp_fx.tga
         blendFunc GL_ONE GL_ONE
         tcmod rotate 333
         tcMod stretch sin .9 0.1 0 7
         rgbGen identity
        }
        {
         clampmap models/mapobjects/baph/bapholamp_fx2.tga
         blendFunc GL_ONE GL_ONE
         tcmod rotate -301
         tcMod stretch sin 1 .1 0 9
         rgbGen identity
        }
    
}
models/players/biker/cadaver
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/biker/cadaver.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
models/players/xaero/xaero
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/xaero/xaero.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
models/players/xaero/xaero_h
{      
        {
		map models/players/xaero/xaero_h.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/sfx/firewalla.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll 0.1 1
                //rgbGen wave triangle .5 1 0 .4
	}  
        {
		map models/players/xaero/xaero_h.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
}
models/players/xaero/xaero_q
{
   
    cull disable
   
        {
                map models/players/xaero/xaero_q.tga
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/xaero/xaero_a
{      
        {
		map textures/effects/envmapbfg.tga
                tcmod rotate 350
                tcmod scroll 3 1
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	} 
        {
        	map models/players/xaero/xaero_a.tga
		blendFunc blend
		rgbGen lightingdiffuse
	}
}
models/players/klesk/klesk_h
{
	{
		map models/players/klesk/klesk_h.tga
                blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
		
        }
	
	{
		map models/players/klesk/klesk_g.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave triangle .5 1 0 .5
		
	}
}
models/players/uriel/uriel_h
{      
        {
		map models/players/uriel/uriel_h.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/sfx/proto_zzzt.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll -0.2 1
                rgbGen identity
	}  
        {
		map models/players/uriel/uriel_h.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
models/players/klesk/flisk
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/klesk/flisk.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
models/players/klesk/flisk_h
{      
        {
		map models/players/klesk/flisk_h.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/sfx/bolts.tga
                blendFunc GL_ONE GL_ONE
                tcmod scale 2 2
                tcmod scroll 2 2
	}   
        {
		map models/players/klesk/flisk_h.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
models/weaphits/bfg01
{
        deformVertexes autoSprite
	cull none
    
        {
                clampmap models/weaphits/bfg01.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 333
                rgbGen identity
        }
        {
                clampmap models/weaphits/bfg01.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate -100
                rgbGen identity
        }

}
models/weaphits/bfg02
{
	cull none
        nomipmaps
        {
                map models/weaphits/bfg03.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll 2 0
                rgbGen identity
        }
        {
                map models/weaphits/bfg02.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll 3 0
                tcMod turb 0 .25 0 1.6
                rgbGen identity
        }
}

models/flags/flagtest
{
      
	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .2 .2
        cull none
        
        {
		map models/flags/flagtest.tga
		rgbGen identity
        }
        {
		map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
      
    
}
 models/weapons2/grapple/grapple
{      
        {
		map models/weapons2/grapple/grapple.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/sfx/specular.tga
                blendFunc GL_ONE GL_ONE
                tcmod scroll .1 .1
                tcGen environment
                rgbGen lightingDiffuse
	}  
        {
		map models/weapons2/grapple/grapple.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
models/weapons2/grapple/grapple_j
{
   
    cull disable
   
        {
                map models/weapons2/grapple/grapple_j.tga
                blendFunc GL_ONE GL_ZERO
                tcMod turb 0 .5 0 .7
                tcMod scroll 1 -1
                tcmod scale .5 .5
                rgbGen identity
        }
        {
                map textures/liquids/jello2.tga
                blendFunc GL_ONE GL_ONE
                tcmod scale .7 .7
                tcMod turb 0 .4 0 .3
                tcMod scroll .7 -.4
                rgbGen identity
        }
        {
		map textures/effects/tinfx2.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE              
                rgbGen lightingDiffuse
	}   

}
models/weapons2/grapple/grapple_h
{
   
    cull disable
   
        {
                map models/weapons2/grapple/grapple_h.tga
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}

models/players/sarge/krusade
{       
        {
                map textures/sfx/firegorre.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}  
        {
		map models/players/sarge/krusade.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}

models/players/sarge/roderic
{       
        {
                map textures/sfx/firegorre.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}  
        {
		map models/players/sarge/roderic.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
models/players/sarge/null
{       
    {
	map models/players/sarge/null.tga
        blendFunc GL_ONE GL_ONE
    }
         
}
models/players/uriel/null
{       
    {
	map models/players/uriel/null.tga
        blendFunc GL_ONE GL_ONE
    }
         
}
models/players/major/daemia
{       
        {
                map textures/sfx/electricslime.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale 3 3
                tcMod turb 0 .5 0 .7
                tcMod scroll 1 -1
                rgbGen identity
	}   
        {
		map models/players/major/daemia.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
 models/weapons2/gauntlet/gauntlet2
{      
        {
                map textures/sfx/specular.tga
                blendFunc GL_ONE GL_ZERO
                tcGen environment
                //rgbGen lightingDiffuse
                rgbGen identity
	}  
        {
		map models/weapons2/gauntlet/gauntlet2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
  
///////////////
// begin Podium
////////////// 

models/mapobjects/podium/podium
{      
        {
		map models/mapobjects/podium/podium.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/sfx/specular.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scroll .2 0.01
                rgbGen identity
	}  
        {
		map models/mapobjects/podium/podium.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
        {
                map models/mapobjects/podium/podiumglo.tga
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin 1 1 0 .2
        }
       
         
}
models/mapobjects/podium/podskull
{      
        {
		map models/mapobjects/podium/podskull.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/sfx/specular.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod scroll .2 0.03
                rgbGen identity
	}  
        {
		map models/mapobjects/podium/podskull.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
        {
                map models/mapobjects/podium/podskullfx.tga
                blendFunc GL_ONE GL_ONE
                rgbGen wave sin 1 1 0 .2
        }
}
models/mapobjects/podium/podiumfx1
{
      cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll 2 -.3
		rgbGen wave inversesawtooth 0 1 .35 .3
	} 
        {
		map models/mapobjects/podium/podiumfx1b.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1.7 -.3
               rgbGen wave inversesawtooth 0 1 .35 .3
	} 
        {
		map models/mapobjects/podium/podiumfx1b.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 .35 .3
	}                             
}
models/mapobjects/podium/podiumfx2
{
       cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .5
                tcmod scroll .8 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	} 
        {
		map models/mapobjects/podium/podiumfx1b.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .5
                tcmod scroll -1.7 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	} 
        {
		map models/mapobjects/podium/podiumfx1b.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .5
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 .7 .6
	}                                 
}
models/mapobjects/podium/podiumfx3
{
       cull none
      surfaceparm trans
	{
		map models/mapobjects/podium/podiumfx1.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .1
                tcmod scroll 1 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	} 
        {
		map models/mapobjects/podium/podiumfx1b.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .1
                tcmod scroll -1.7 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	} 
        {
		map models/mapobjects/podium/podiumfx1b.tga
		blendFunc GL_ONE GL_ONE
                tcmod scale 1 .1
                tcmod scroll -1.1 -.3
		rgbGen wave inversesawtooth 0 1 1.1 .9
	}                                           
}

///////////////
// End Podium
//////////////

//models/players/ranger/wrack
//{      
//        {
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//        	map models/players/ranger/wrack.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//          
//}
models/players/ranger/wrack
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/ranger/wrack.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
models/players/visor/gorre
{   
 
        {
                map textures/sfx/firegorre.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scroll 0 1
                tcMod turb 0 .25 0 1.6
                tcmod scale 4 4
                rgbGen identity
	}  
        //{
        //        map textures/sfx/firewallb.tga
        //        blendFunc GL_ONE GL_ONE
        //        tcmod scale 3 3
        //        tcMod turb 0 .2 0 .1
        //        tcMod scroll 0 3
        //        //tcmod rotate 360
        //        rgbGen identity
        //}            
        {
		map models/players/visor/gorre.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
}
models/powerups/armor/newred
{      
        {
                map textures/sfx/specular.tga          
                tcGen environment
                rgbGen identity
	}  
        {
		map models/powerups/armor/newred.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
       
         
}

models/powerups/armor/newyellow
{      
        {
                map textures/sfx/specular.tga          
                tcGen environment
                rgbGen identity
	}  
        {
		map models/powerups/armor/newyellow.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
       
         
}
models/players/doom/phobos_f
{    
 
         {
		map textures/effects/tinfx.tga
                tcGen environment
                blendFunc GL_ONE GL_ZERO              
                rgbGen lightingDiffuse
	} 
        {
		map models/players/doom/phobos_f.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
}
models/players/doom/phobos
{    
         {
                map models/players/doom/phobos_fx.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scale 7 7
                tcMod scroll 5 -5
                tcmod rotate 360
                rgbGen identity
	}
        //{
	//	map textures/effects/tinfx2.tga
        //        tcGen environment
        //        blendFunc GL_ONE GL_ONE              
        //        rgbGen lightingDiffuse
	//}   
        {
		map models/players/doom/phobos.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		 rgbGen lightingDiffuse
	}
}
models/mapobjects/bat/bat
{
    deformVertexes wave 10 sin 0 3 0 3
    deformVertexes move 500 0 0   sawtooth 0 5 0 .1
    deformVertexes move 0 0 7  sin 0 5 0 .5
    cull disable
   
        {
                map models/mapobjects/bat/bat.tga
                alphaFunc GE128
		depthWrite
		rgbGen identity
        }


}
models/mapobjects/meteor
{
         deformVertexes move 0 0 10  sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
       
    
        {
                map models/mapobjects/meteor.tga
                rgbGen vertex
                tcMod scale 4.90 2.234        
	}


}
models/mapobjects/corpse/torso
{    
  deformVertexes wave 100 sin 0 .2 0 .2
         {
		map textures/liquids/proto_grueldark.tga
                //tcGen environment
                blendFunc GL_ONE GL_ZERO
                tcmod scale 4 4
                tcMod scroll 0 -.09
                tcMod turb 0 0.05 0 .05
                //rgbGen identity
	}
        //{
	//	map textures/liquids/proto_grueldark.tga
        //        //tcGen environment
        //        blendFunc GL_ONE GL_ONE
        //        tcmod scale 2 2
        //        tcMod scroll 0 -.09
       //         tcMod turb 0 0.07 0 .08
       //         //rgbGen identity
	//}       
        {
		map models/mapobjects/corpse/torso.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen vertex
	}
}
models/mapobjects/corpse/chain
{
    cull disable
    
        {
                map models/mapobjects/corpse/chain.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/spine
{
    cull disable
    
        {
                map models/mapobjects/corpse/spine.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/intestine
{
    
    cull disable
    
        {
                map models/mapobjects/corpse/intestine.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/corpse/intestine2
{
    cull disable
    deformVertexes wave 100 sin 0 .6 0 .2
    // surfaceparm	trans
        {
                map models/mapobjects/corpse/intestine2.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/players/lucy/h_angel
{
      cull none
          
        {
                map models/players/lucy/h_angel.tga
                depthWrite
                rgbGen lightingDiffuse
              
        }
        {
		 
		//map textures/effects/envmapcirc3.tga
               
                map models/mapobjects/bitch/hologirl2.tga
                 tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc GL_ONE GL_ONE
		 rgbGen identity
                // rgbGen vertex
                 rgbGen lightingDiffuse
	}    
		
}
models/players/lucy/angel
{
         cull none
       
        {
                map models/players/lucy/angel.tga
                alphaFunc GE128
		depthWrite
		//rgbGen identity
                rgbGen lightingDiffuse
              
        }	
        {
		 
		//map textures/effects/envmapcirc3.tga
               
                map models/mapobjects/bitch/hologirl2.tga
                 tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc GL_ONE GL_ONE
		//rgbGen identity
                //rgbGen vertex
                rgbGen lightingDiffuse
	}    
        
}

models/mapobjects/lamps/bot_wing2
{
    //deformVertexes wave 100   sin 0 .5 0 .5
    //deformVertexes move 0 0 1   triangle 0 20 0 1
    deformVertexes move 0 0 2   sin 0 5 0 0.3
    deformVertexes move .6 .8 0   sin 0 9 0 0.1
     deformVertexes wave 100   sin 0 .5 0 .5
    cull disable
    
        {
                map models/mapobjects/lamps/bot_wing2.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/lamps/bot_lamp2b
{ 
     cull disable
     deformVertexes move 0 0 2   sin 0 5 0 0.3
     deformVertexes move .6 .8 0   sin 0 9 0 0.1
        {
                map models/mapobjects/lamps/bot_lamp2b.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/lamps/bot_light
{
      cull disable
      q3map_surfacelight	200
      deformVertexes move 0 0 2   sin 0 5 0 0.3
      deformVertexes move .6 .8 0   sin 0 9 0 0.1
        {
                map models/mapobjects/lamps/bot_light.tga
		rgbGen identity
        }


}

models/mapobjects/lamps/beam
{
        surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nonsolid
	surfaceparm nolightmap
        deformVertexes move 0 0 2   sin 0 5 0 0.3
        deformVertexes move .6 .8 0   sin 0 9 0 0.1
	cull none
        //nopicmip
	{
		map models/mapobjects/lamps/beam.tga
                tcMod Scroll .3 0
                blendFunc GL_ONE GL_ONE
        }
        {
		map models/mapobjects/lamps/beam.tga
                tcMod Scroll -.3 0
                blendFunc GL_ONE GL_ONE
        }
     
}

///////////////////////////////////
/// Start of Floating Skull Bot  //
///////////////////////////////////

models/mapobjects/lamps/bot_flare
{
        deformVertexes autoSprite
        deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
    
        {
                clampmap models/mapobjects/lamps/bot_flare.tga
                blendFunc GL_ONE GL_ONE
                tcMod rotate 20
                
                
        }


}

models/mapobjects/lamps/bot_flare2
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
         deformVertexes wave 100 sin 0 1 0 9
        surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
    
        {
                map models/mapobjects/lamps/bot_flare2.tga
                blendFunc GL_ONE GL_ONE
                
        }


}

models/mapobjects/lamps/bot_lamp
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
    
        {
                map models/mapobjects/lamps/bot_lamp.tga
                rgbGen vertex
                
        }


}
models/mapobjects/lamps/bot_lamp2
{
         deformVertexes move 0 0 3   sin 0 5 0 0.1
        deformVertexes move 2 2 0   sin 0 9 0 0.05
    
        {
                map models/mapobjects/lamps/bot_lamp2.tga
                rgbGen vertex
                
        }


}
models/mapobjects/lamps/bot_wing
{
     deformVertexes move 0 0 3   sin 0 5 0 0.1
    deformVertexes move 2 2 0   sin 0 9 0 0.05
     deformVertexes wave 100   sin 0 .5 0 .5
    cull disable
    
        {
                map models/mapobjects/lamps/bot_wing.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratetorch
{
    cull disable
    
        {
                map models/mapobjects/gratelamp/gratetorch.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratetorch2b
{
    cull disable
    
        {
                map models/mapobjects/gratelamp/gratetorch2b.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/chain/chain3
{
        {
		map $whiteimage
		rgbGen identity
	}
	{
		map models/mapobjects/chain/chain3.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
        {
		map models/mapobjects/chain/chain3.tga
		//blendFunc GL_ONE GL_ONE
                blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
       
       
}

models/flags/flagbits
{
               cull none
	      // deformVertexes wave 100 sin 0 5 0 .7
	 {
                map models/flags/flagbits.tga
                //blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen lightingDiffuse
                depthWrite
        }


}
models/flags/r_flag2
{
      
	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none
        
        {
		map models/flags/r_flag2.tga
		 rgbGen identity
	}
        {
		map models/flags/red_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                
                blendFunc GL_ONE GL_ONE
                 rgbGen identity
	}
        {
		map models/flags/r_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
               rgbGen identity
	}
}
models/flags/b_flag2
{
      
	deformVertexes wave 100 sin 4 3 0 0.3
        deformVertexes wave 30 sin 0 3 0 .8
        deformVertexes normal .3 .2
        cull none
        
        {
		map models/flags/b_flag2.tga
		 rgbGen identity
	}
        {
		map models/flags/blue_fx.tga
                tcGen environment
                //tcmod scale 9 3
                //tcmod scroll .1 .7
                blendFunc GL_ONE GL_ONE
                rgbGen identity
	}
        {
		map models/flags/b_flag2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
	        rgbGen identity
	}
        {
		map textures/sfx/shadow.tga
                tcGen environment 
                //blendFunc GL_ONE GL_ONE            
                blendFunc GL_DST_COLOR GL_ZERO
                rgbGen identity
	}
}
models/flags/flag_red
{
               cull none
	       deformVertexes wave 90 sin 1 5.6 1 .4
               deformVertexes wave 100 sin 1 2 1 .9
               deformVertexes wave 50 sin 1 .5 1 1
	 {
                map models/flags/flag_red.tga
                //blendfunc gl_src_alpha gl_one_minus_src_alpha
                //alphaFunc GE128
                blendFunc GL_ONE GL_ONE
                rgbGen lightingDiffuse
                depthWrite
        }


}
models/mapobjects/bitch/hologirl
{
        cull none 
		//sort additive	// alphaFunc with a later blend pass doesn't
						// make its own sort properly
         deformVertexes move 0 0 .7  sin 0 5 0 0.2
      
      
        {
                map models/mapobjects/bitch/hologirl.tga
                alphaFunc GE128
                depthWrite
                rgbGen lightingdiffuse
               
        }
        {
                map models/mapobjects/bitch/hologirl2.tga
                tcgen environment
                tcMod scroll -6 -.2
                tcMod scale 1 1
		blendFunc GL_ONE GL_ONE
		//rgbGen wave sin .5 .5 0 .1
	}    
		

}
models/mapobjects/bitch/bitch02
{
	cull none
	
	{
		Map models/mapobjects/bitch/bitch02.tga
		blendFunc GL_ONE GL_ONE
                tcGen environment
                tcMod scroll 0 0.3
	}	
      
      
	
}
models/mapobjects/barrel/barrel2
{
	
	{
		Map models/mapobjects/barrel/barrel2.tga
                rgbgen vertex
               
	}	
        {
		clampmap models/mapobjects/barrel/barrel2fx.tga
		blendFunc GL_ONE GL_ONE
               // rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate 403
	}	
        {
		clampmap models/mapobjects/barrel/barrel2fx.tga
		blendFunc GL_ONE GL_ONE
               // rgbgen wave triangle 1 1 0 8.7
                tcMod rotate -100
	}	
	
}
models/weaphits/electric
{
	cull none
	
	{
		clampmap models/weaphits/electric.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle .8 2 0 9
                tcMod rotate 360
	}	
        {
		clampmap models/weaphits/electric.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate -202
	}	
	
}
models/mapobjects/flares/electric
{
	

	q3map_surfacelight	200

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		clampmap models/mapobjects/flares/electric.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle .8 2 0 9
                tcMod rotate 360
	}	
        {
		clampmap models/mapobjects/flares/electric.tga
		blendFunc GL_ONE GL_ONE
                rgbgen wave triangle 1 1.4 0 9.5
                tcMod rotate -202
	}	
	
}
models/players/anarki/anarki_b

{
         {
		map textures/effects/envmapbfg.tga
                tcGen environment
                tcmod rotate 350
                tcmod scroll 3 1
                blendFunc GL_ONE GL_ZERO
		rgbGen identity
	} 
        {
                map models/players/anarki/anarki_b.tga
                blendfunc blend
                rgbGen lightingDiffuse
        }
        
}
models/players/anarki/anarki_g

{
        {
                map models/players/anarki/anarki_g.tga
                //rgbGen vertex
        }
        {
		
		map models/players/anarki/anarki_g_fx.tga
		rgbGen lightingDiffuse
                rgbGen wave triangle 0 1 0 .5
		blendfunc gl_ONE gl_ONE 		
	}
}

models/mapobjects/wallhead/femhead

{
        deformVertexes wave 100 sin 0 .7 0 .2
        //deformVertexes wave 100 sin 0 1 1 .1
        cull disable

        {
                map models/mapobjects/wallhead/femhead3.tga
                rgbGen vertex
        }
	{
		//animMap 0.5 models/mapobjects/wallhead/femhead4.tga //models/mapobjects/wallhead/femhead2.tga
                map models/mapobjects/wallhead/femhead4.tga
		blendFunc	GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		alphaGen	wave sin 0 1 1 .1
                // alphaGen	wave triangle 0 .7 0 .2
                rgbGen vertex
	}	
	
}
models/mapobjects/wallhead/wallhead_eye

{
       
       
        {
              animMap 0.2 models/mapobjects/wallhead/wallhead_eye.tga models/mapobjects/wallhead/wallhead_eye2.tga 
                rgbGen vertex
        }
	

}
models/mapobjects/wallhead/wallhead

{
       
       
        {
             map models/mapobjects/wallhead/wallhead.tga
             rgbGen vertex
        }
	
}
//models/mapobjects/wallhead/femhead
//{
//   deformVertexes wave 100 sin 0 .7 0 .2
//   cull disable
//    
//          
//        {
//                map models/mapobjects/wallhead/femhead2.tga
//                rgbGen vertex
//        }
//        {
//                map models/mapobjects/wallhead/femhead.tga
//                Blendfunc GL_ONE GL_ONE
//                rgbGen vertex
//                rgbGen wave triangle 0 1 0 .05
//        }
// 
//}

//models/mapobjects/wallhead/tongue
//{
//	{
//		//rgbGen lightingDiffuse
//		map $whiteimage
//                rgbGen vertex
//	}
//	{
//		map models/mapobjects/wallhead/tongue.tga
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//		rgbGen identity
//		alphaGen lightingSpecular
//	}
//}

models/players/mynx/mynx_shiny
{      
 
        {
                map textures/sfx/specular5.tga            
                blendFunc GL_ONE GL_ZERO
                tcGen environment
	}  
        {
		map models/players/mynx/mynx_shiny.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
                
}
models/players/razor/patriot
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/razor/patriot.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
models/players/razor/patriot_gogs
{
        {
		map textures/effects/tinfx2d.tga
                tcGen environment
                blendFunc GL_ONE GL_ZERO              
                rgbGen lightingDiffuse
	}   

          
}
models/mapobjects/scoreboard/s_name
{
	sort additive
	cull disable
    deformVertexes text0
	{
		map gfx/2d/bigchars.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}


models/mapobjects/scoreboard/s_score
{
	sort additive
	cull disable
    deformVertexes text1
	{
		map gfx/2d/bigchars.tga
		blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen identity
	}
}


models/weapons2/lightning/crackle1
{
	sort additive
	cull disable
	
	{
		animMap 15 models/weapons2/lightning/crackle1.tga models/weapons2/lightning/crackle2.tga models/weapons2/lightning/crackle3.tga models/weapons2/lightning/crackle4.tga models/weapons2/lightning/crackle5.tga models/weapons2/lightning/crackle6.tga models/weapons2/lightning/crackle7.tga models/weapons2/lightning/crackle8.tga
		blendFunc GL_ONE GL_ONE
	}
		
}

models/weapons2/lightning/button
{
        {
		map models/weapons2/lightning/button.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin 1 1 0 1		
	}
	
}

models/weapons2/lightning/glass
{
        {
		map models/weapons2/lightning/glass.tga
	}
	{
		map textures/effects/envmapdim.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
		rgbGen lightingDiffuse
	}
}
models/weapons2/lightning/trail
{
	{
		map models/weapons2/lightning/trail.tga
		tcMod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc GL_ONE GL_ONE
	}
        {
		map models/weapons2/lightning/trail.tga
		tcMod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/lightning/trail2
{
	{
		map models/weapons2/lightning/trail2.tga
		tcMod scroll 3.1 1
                rgbgen wave triangle 1 2 0 7
		blendfunc GL_ONE GL_ONE
	}
        {
		map models/weapons2/lightning/trail2.tga
		tcMod scroll -1.7 1
                rgbgen wave triangle 1 1.1 0 5.1
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/lightning/trail1
{
	sort additive
	cull disable
	
	{
		animMap 15 models/weapons2/lightning/trail1.tga models/weapons2/lightning/trail2.tga models/weapons2/lightning/trail3.tga models/weapons2/lightning/trail4.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex				
	}
	
}

models/weapons2/lightning/ball1
{
	sort additive
	cull disable
	
	{
		animMap 15 models/weapons2/lightning/ball1.tga models/weapons2/lightning/ball2.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex				
	}
	
}

models/mapobjects/slamp/slamp3
{
    deformVertexes autoSprite2
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
   q3map_surfacelight	100
    
        {
                map models/mapobjects/slamp/slamp3.tga
                blendFunc GL_ONE GL_ONE
                
        }


}
models/mapobjects/slamp/slamp2
{
    cull disable
    surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
    
        {
                map models/mapobjects/slamp/slamp2.tga
                blendFunc GL_ONE GL_ONE
        }
        {
		map textures/effects/envmapdimb.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	        //rgbGen lightingDiffuse
	}


}

models/mapobjects/lightning/white/white1
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		animMap 15 models/mapobjects/lightning/white/white1.tga models/mapobjects/lightning/white/white2.tga models/mapobjects/lightning/white/white3.tga models/mapobjects/lightning/white/white4.tga models/mapobjects/lightning/white/white5.tga models/mapobjects/lightning/white/white6.tga models/mapobjects/lightning/white/white7.tga models/mapobjects/lightning/white/white8.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex				
	}
	
}

models/mapobjects/lightning/red/red01
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		animMap 15 models/mapobjects/lightning/red/red01.tga models/mapobjects/lightning/red/red02.tga models/mapobjects/lightning/red/red03.tga models/mapobjects/lightning/red/red04.tga models/mapobjects/lightning/red/red05.tga models/mapobjects/lightning/red/red06.tga models/mapobjects/lightning/red/red07.tga models/mapobjects/lightning/red/red08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex				
	}
	
}

models/mapobjects/lightning/yel/yel01
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		animMap 15 models/mapobjects/lightning/yel/yel01.tga models/mapobjects/lightning/yel/yel02.tga models/mapobjects/lightning/yel/yel03.tga models/mapobjects/lightning/yel/yel04.tga models/mapobjects/lightning/yel/yel05.tga models/mapobjects/lightning/yel/yel06.tga models/mapobjects/lightning/yel/yel07.tga models/mapobjects/lightning/yel/yel08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex				
	}
	
}

models/mapobjects/lightning/blu/blu01
{
	deformVertexes wave 100 sin 0 1 0 5
        q3map_surfacelight	3000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		animMap 15 models/mapobjects/lightning/blu/blu01.tga models/mapobjects/lightning/blu/blu02.tga models/mapobjects/lightning/blu/blu03.tga models/mapobjects/lightning/blu/blu04.tga models/mapobjects/lightning/blu/blu05.tga models/mapobjects/lightning/blu/blu06.tga models/mapobjects/lightning/blu/blu07.tga models/mapobjects/lightning/blu/blu08.tga
		blendFunc GL_ONE GL_ONE
		rgbGen vertex				
	}
	
}

models/mapobjects/pitted_rust_ps
{
     cull disable
     
        {
                map models/mapobjects/pitted_rust_ps.tga
                rgbGen vertex
        }


}

models/mapobjects/signs/bioh
{
     cull disable
     
        {
                map models/mapobjects/signs/bioh.tga
                rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratelamp
{
    cull disable
    
        {
                map models/mapobjects/gratelamp/gratelamp.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/gratelamp/gratelamp_flare
{
	deformVertexes autoSprite

	q3map_surfacelight	300

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		Map models/mapobjects/gratelamp/gratelamp_flare.tga
		blendFunc GL_ONE GL_ONE
	}	
	
}

models/weapons2/grenadel/ring
{
	
	{
		map models/weapons2/grenadel/ring.tga
        }

        {
                map textures/effects/envmapdim.tga
		tcGen environment
		blendFunc GL_ONE GL_ONE
                //rgbGen identity
        }
}
models/mapobjects/chain/chain
{
     cull disable
        {
                map models/mapobjects/chain/chain.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/chain/chain2
{
     cull disable
    deformVertexes autoSprite2
        {
                map models/mapobjects/chain/chain2.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/chain/chain2_end
{
     cull disable
    deformVertexes autoSprite2
        {
                map models/mapobjects/chain/chain2_end.tga
                alphaFunc GE128
		depthWrite
		rgbGen vertex
        }


}
models/mapobjects/tree/branch
{
     cull disable
     deformVertexes wave 100 sin 0 .1 0 .2
      surfaceparm	trans
        {
                map models/mapobjects/tree/branch.tga
                alphaFunc GE128
		depthWrite
		//rgbGen identity
                //rgbGen lightingDiffuse
                rgbGen vertex
        }


}
models/players/orbb/orbb_tail
{
	
	{
		map models/players/orbb/orbb_tail.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll 0 .5
		rgbGen wave sin .5 .25 0 .5		
	}
}
models/players/orbb/orbb_tail_blue
{
	
	{
		map models/players/orbb/orbb_tail_blue.tga
		blendFunc GL_ONE GL_ONE
                tcmod scroll 0 .5
		rgbGen wave sin .5 .25 0 .5		
	}
}
models/players/orbb/orbb_light
{
	{
		map models/players/orbb/orbb_light.tga
		rgbGen wave sin 1 1 0 1
		
	}
}
models/players/orbb/orbb_light_blue
{
	{
		map models/players/orbb/orbb_light_blue.tga
		rgbGen wave sin 1 1 0 1
		
	}
}
models/players/orbb/orbb_h2
{      
        {
		map models/players/orbb/orbb_h2.tga
                blendFunc GL_ONE GL_ZERO
		rgbGen lightingDiffuse
	} 
        {
                map textures/effects/tinfx.tga
                blendFunc GL_ONE GL_ONE
                tcGen environment
                rgbGen lightingDiffuse
	}  
        {
		map models/players/orbb/orbb_h2.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}

models/players/orbb/red_h
{
	
	{
		map models/players/orbb/red_h.tga
                rgbGen lightingDiffuse
        }

        {
	        clampmap textures/base_floor/techfloor2.tga
		blendfunc blend
                tcmod rotate 90
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen lightingDiffuse
	}
       
}
models/players/orbb/blue_h
{
	
	{
		map models/players/orbb/blue_h.tga
                rgbGen lightingDiffuse
        }

        {
	        clampmap textures/base_floor/techfloor2.tga
		blendfunc blend
                tcmod rotate 90
                tcMod stretch sin .8 0.2 0 .2
	        rgbGen lightingDiffuse
	}
       
}
models/mapobjects/teleporter/transparency2
{
   cull disable
            
        {
                map models/mapobjects/teleporter/transparency2.tga
                blendfunc GL_ONE GL_ONE
                tcMod scroll .1 .2
        }

}

models/flags/b_flag
{
               cull disable
	       deformVertexes wave 100 sin 0 3 0 .7
		   
        {
               map models/flags/b_flag.tga
              
        }


}

models/flags/r_flag
{
               cull disable
	       deformVertexes wave 100 sin 0 3 0 .7
		   
        {
               map models/flags/r_flag.tga
              
        }


}
models/flags/pole
{
	  
        {
             map models/flags/skull.tga
		tcGen environment
		rgbGen lightingDiffuse	
                
        }


}
models/flags/skull
{
	  
        {
             map models/flags/skull.tga
		//tcGen environment
		rgbGen lightingDiffuse	
                
        }


}
models/players/hunter/hunter_f
{
     deformVertexes wave 100 sin 0 .3 0 .2
     cull disable
        {
                map models/players/hunter/hunter_f.tga
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/hunter/red_f
{
     deformVertexes wave 100 sin 0 .3 0 .2
     cull disable
        {
                map models/players/hunter/red_f.tga
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/uriel/uriel_w
{
     deformVertexes wave 100 sin 0 .5 0 .2

        {
                map models/players/uriel/uriel_w.tga
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/uriel/red_w
{
     deformVertexes wave 100 sin 0 .5 0 .2

        {
                map models/players/uriel/red_w.tga
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/players/uriel/blue_w
{
     deformVertexes wave 100 sin 0 .5 0 .2

        {
                map models/players/uriel/blue_w.tga
                //blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
                //alphaFunc GT0
                alphaFunc GE128
		depthWrite
		rgbGen lightingDiffuse
        }


}
models/mapobjects/bitch/orb
{
	deformVertexes autoSprite

	q3map_surfacelight	70

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		clampmap models/mapobjects/bitch/orb.tga
		blendFunc GL_ONE GL_ONE
                tcMod rotate 30
	}	
	
}

models/mapobjects/bitch/forearm
{
        {
                map models/mapobjects/bitch/forearm.tga
                rgbGen vertex  
        }
	{
               map models/mapobjects/bitch/forearm01.tga
               blendfunc GL_ONE GL_ONE
               tcMod scroll 2.2 0
             
        }
        {
               map models/mapobjects/bitch/forearm02.tga
               blendfunc GL_ONE GL_ONE
               tcMod scroll -1.1 0
             
        }
}

models/players/parkr/parkr_head
{
	{
		map textures/effects/envmap2.tga
		tcGen environment	
	}
}

models/players/parkr/parkr_chest
{
         {
                map models/players/parkr/parkr_chest.tga
        }
	{
		AnimMap 4 models/players/parkr/parkr_chest_red.tga models/players/parkr/parkr_chest_blu.tga
	       blendfunc GL_ONE GL_ONE
	}
}
models/mapobjects/teleporter/energy
{
   cull disable
   
               
       {
               map models/mapobjects/teleporter/energy.tga
               blendfunc GL_ONE GL_ONE
               tcMod scroll 2.2 1.3
               rgbGen wave inversesawtooth -.3 1.3 0 1.3
             
       }
	{    
		map models/mapobjects/teleporter/energy2.tga
		blendfunc GL_ONE GL_ONE
		tcMod scroll -1 .5
		rgbGen wave inversesawtooth -.2 1.2 0 .5
              
	}
	{    
                map models/mapobjects/teleporter/energy3.tga
                blendfunc GL_ONE GL_ONE
                tcMod scroll 3 0
		rgbGen wave triangle 1 1 0 5.3
              
	}

}

models/mapobjects/teleporter/widget
{
   cull disable
            
        {
                map models/mapobjects/teleporter/widget.tga
                blendfunc GL_ONE GL_ONE
                
        }
        {
                map models/mapobjects/teleporter/transparency2.tga
                blendfunc GL_ONE GL_ONE
                tcMod scroll -.1 -.2
        }

}

models/mapobjects/teleporter/transparency
{
   cull disable
            
        {
                map models/mapobjects/teleporter/transparency.tga
                blendfunc GL_ONE GL_ONE
                 
        }
        {
                map models/mapobjects/teleporter/transparency2.tga
                blendfunc GL_ONE GL_ONE
                tcMod scroll .1 .2
        }

}

models/mapobjects/teleporter/teleporter_edge
{
         

        {
          map models/mapobjects/teleporter/teleporter_edge.tga 
          rgbGen vertex  
        }  
        {
                map models/mapobjects/teleporter/teleporter_edge2.tga
                blendfunc GL_ONE GL_ONE
                rgbgen wave inversesawtooth 0 1 .2 1.5
        }
    
}

models/mapobjects/jesus/jesuswall
{
   deformVertexes wave 100 sin 0 .2 0 .2
   cull none         
        {
		map $lightmap
              	//rgbGen identity
	}
	{
		map models/mapobjects/jesus/jesuswall.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen vertex
		alphaGen lightingSpecular
	}


}


models/mapobjects/hand
{
   deformVertexes wave 100 sin 0 .3 0 .2
               
        {
                map models/mapobjects/hand.tga
                rgbGen vertex
        }


}

models/mapobjects/corpse/corpse
{
   deformVertexes wave 100 sin 0 .2 0 .2
               
        {
                map models/mapobjects/corpse/corpse.tga
                rgbGen exactVertex
        }
        

}
models/mapobjects/skull/ribcage
{
	sort underwater
        cull disable      
        {
                map models/mapobjects/skull/ribcage.tga
                // blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
        }


}

//models/mapobjects/flag/banner_eg1
//{
//               cull disable
//               surfaceparm nolightmap
//	       deformVertexes wave 100 sin 0 8 0 8
//		   sort banner
//        {
//                map models/mapobjects/flag/banner_eg1.tga
//                // blendfunc gl_src_alpha gl_one_minus_src_alpha
//                alphaFunc GE128
//                rgbGen vertex
//        }
//
//
//}
models/mapobjects/flag/banner_strgg
{
        cull disable
        surfaceparm nolightmap
        surfaceparm alphashadow

	    deformVertexes wave 100 sin 0 3 0 .7
            //deformVertexes normal 0.2 2
		sort banner
        {
                map models/mapobjects/flag/banner_strgg.tga
                 blendfunc gl_src_alpha gl_one_minus_src_alpha
                alphaFunc GE128
                rgbGen vertex
                
        }
}
models/mapobjects/flag/banner02
{
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
		  
        {
                map models/mapobjects/flag/banner02.tga
              
        }


}

models/mapobjects/weeds/weed02
{
	sort underwater
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
        {
                map models/mapobjects/weeds/weed02.tga
                blendfunc gl_src_alpha gl_one_minus_src_alpha
        }


}
models/mapobjects/weeds/weed01
{
	sort additive
               cull disable
               surfaceparm nolightmap
	       deformVertexes wave 100 sin 0 2 0 .7
        {
                map models/mapobjects/weeds/weed01.tga
                blendfunc gl_src_alpha gl_one_minus_src_alpha
        }


}

models/mapobjects/portal_2/portal_3_edge
{
        {
                map models/mapobjects/portal_2/portal_3_edge.tga
                rgbGen vertex
        }

	{
		map models/mapobjects/portal_2/portal_3_edge_glo.tga
		blendFunc GL_ONE GL_ONE
		tcMod scroll 9.7 .5
	}

}

models/players/razor/razor_gogs
{
	{
		map models/players/razor/razor_gogs.tga	
                tcGen environment

	}

	
	{
		map	models/players/razor/razor_gogs_fx.tga	
		blendfunc GL_ONE GL_ONE
		tcMod scroll 1.2 9.3
		
	}
}

models/players/slash/slashskate
{
        //deformVertexes wave 100 sin 0 1 1 5
	sort additive
	cull disable
	{
		clampmap models/players/slash/slashskate.tga
		blendFunc GL_ONE GL_ONE
                //tcmod rotate 100
                tcMod stretch sin .9 0.1 0 1.1
                rgbgen identity
		
	}
}


models/mapobjects/colua0/colua0_lght
{
	surfaceparm	trans
	{
		map textures/effects/tinfx2b.tga
		tcGen environment
		blendFunc GL_ONE GL_ONE
	}
}
models/mapobjects/colua0/colua0_flare
{
	deformVertexes autoSprite

	q3map_surfacelight	1000

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		Map models/mapobjects/colua0/colua0_flare.tga
		blendFunc GL_ONE GL_ONE
	}	
	
}
models/mapobjects/kmlamp_white
{
	
	surfaceparm	trans
	{
		map textures/effects/tinfxb.tga
		tcGen environment
		blendFunc GL_ONE GL_ONE
	}
}

models/mapobjects/lamps/flare03
{
	deformVertexes autoSprite

	q3map_surfacelight 200	

	surfaceparm	trans
	surfaceparm nomarks
	surfaceparm nolightmap
	cull none
	
	{
		Map models/mapobjects/lamps/flare03.tga
		blendFunc GL_ONE GL_ONE
	}	
	
}

//models/weapons2/chainsaw/f_chainsaw
//{
//	sort nearest
//	cull back
//	{
//		map	models/weapons2/chainsaw/f_chainsaw.tga
//		blendfunc GL_ONE GL_ONE_MINUS_SRC_COLOR
//
//	}
//}

models/players/sarge/cigar
{
	{
		map models/players/sarge/cigar.tga
                blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
		
        }
	
	{
		map models/players/sarge/cigar.glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen wave triangle .5 1 0 .2
		
	}
}
//
// powerups
//
//
// ammo
//
//models/powerups/ammo/ammo_rail1
//{
//	{
//		map models/powerups/ammo/ammo_rail1.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail1.glow.tga
//		blendfunc GL_ONE GL_ONE
//		rgbGen wave sin 0.75 0.25 0 1
//	}
//}
//models/powerups/ammo/ammo_rail2
//{
//	{
//		map models/powerups/ammo/ammo_rail2.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/ammo_rail2.glow.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}
models/powerups/ammo/bfgammo
{
   cull none
       {
	        map textures/effects/envmapbfg.tga
		 //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
        {
	        map textures/effects/tinfx2.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
                rgbGen identity
       }
       {
	        map models/powerups/ammo/bfgammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/bfgammo1
{
        {
	        map textures/effects/envmapbfg.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
        }
}
models/powerups/ammo/bfgammo2
{
	{
		map models/powerups/ammo/bfgammo2.tga
		rgbGen identity
	}
	
}
//models/powerups/ammo/bounammo1
//{
//	{
//		map models/powerups/ammo/bounammo1.tga
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/bounammo2
//{
//	{
//		map models/powerups/ammo/bounammo2.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/bounammo2.glow.tga
//		blendfunc GL_ONE GL_ONE
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo1
//{
//	{
//		map models/powerups/ammo/flamammo1.tga
//		rgbGen lightingDiffuse
//	}
//}
//models/powerups/ammo/flamammo2
//{
//	{
//		map models/powerups/ammo/flamammo2.tga
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/powerups/ammo/flamammo2.glow.tga
//		blendfunc GL_ONE GL_ONE
//	}
//}
models/powerups/ammo/grenammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/grenammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/grenammo1
{
	{
	        map textures/effects/envmapgren.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/ammo/grenade
{
        {
                map models/ammo/grenade.tga
        }
	{
		AnimMap 7 models/ammo/grenade_r.tga models/ammo/grenade_g.tga
	       blendfunc GL_ONE GL_ONE
	}
}
models/powerups/ammo/grenammo2
{
	{
		map models/powerups/ammo/grenammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/lighammo
{
       {
	        map textures/effects/envmapligh.tga
		 //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/lighammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/lighammo1
{
	{
	        map textures/effects/envmapligh.tga
                tcGen environment
		//tcmod scale 2 2
                tcmod rotate 6
                tcmod scroll .09 .09
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/lighammo2
{
	{
		map models/powerups/ammo/lighammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/machammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/machammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo1
{
       {
	        map textures/effects/envmapmach.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/machammo2
{
	{
		map models/powerups/ammo/machammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/plasammo1
{
       {
	        map textures/effects/envmapplas.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/plasammo
{
       {
	        map textures/effects/envmapplas.tga
                //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/plasammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/plasammo2
{
	{
		map models/powerups/ammo/plasammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/railammo1
{
       {
	        map textures/effects/envmaprail.tga
                tcGen environment
		//tcmod scale 4 4
                //tcmod rotate 70
                //tcmod scroll .5 .5
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/railammo
{
       {
	        map textures/effects/envmaprail.tga
                //tcmod scale 3 3
                tcmod rotate 350
                tcmod scroll 3 1
		//tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/railammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/railammo2
{
	{
		map models/powerups/ammo/railammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/rockammo
{
       {
	        map textures/effects/tinfx2d.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/rockammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo1
{
       {
	        map textures/effects/envmaproc.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/rockammo2
{
	{
		map models/powerups/ammo/rockammo2.tga
		rgbGen identity
	}
	
}
models/powerups/ammo/shotammo
{
       {
	        map textures/effects/tinfx2c.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
       }
       {
	        map models/powerups/ammo/shotammo.tga
		blendfunc blend
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo1
{
       {
	        map textures/effects/envmapgold3.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen lightingDiffuse
       }
}
models/powerups/ammo/shotammo2
{
	{
		map models/powerups/ammo/shotammo2.tga
		rgbGen identity
	}

}

//
// health
//
models/powerups/health/yellow
{
	
	{
		map textures/effects/envmapyel.tga
                tcGen environment
		//blendfunc GL_ONE GL_ONE
		
	}
        
}
models/powerups/health/yellow_sphere
{
	{
		map textures/effects/tinfx2b.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/red
{	
	
	{
		map textures/effects/envmapgold.tga
                tcGen environment
		blendfunc GL_ONE GL_ZERO
		
	}
        {
		map textures/sfx/kenelectric.tga
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc GL_ONE GL_ONE
		
	}
}
models/powerups/health/mega2
{	
	
	{
		map textures/effects/envmapblue.tga
                tcGen environment
		blendfunc GL_ONE GL_ZERO
		
	}
        {
		map textures/sfx/kenelectric.tga
                tcmod scale 2 2
                tcmod rotate 333
                tcmod scroll 9 9
		blendfunc GL_ONE GL_ONE
		
	}
}
models/powerups/health/mega1
{
	{
		map textures/effects/envmapblue2.tga
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/red_sphere
{
	{
		map textures/effects/envmapgold2.tga
                tcGen environment
                tcmod rotate 33
                tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/green
{
	
	{
		map textures/effects/envmaprail.tga
		tcGen environment
		
	}
}
models/powerups/health/green_sphere
{
	{
		map textures/effects/tinfx2b.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}
models/powerups/health/blue
{
	{
		map textures/effects/envmapbfg.tga
		tcGen environment
		
	}
}
models/powerups/health/blue_sphere
{
	{
		map textures/effects/tinfx2b.tga
		tcGen environment
		blendfunc GL_ONE GL_ONE
	}
}


//
// mapobjects
//
models/powerups/armor/energy_red1
{
   
	{
		map models/powerups/armor/energy_red1.tga 
                blendFunc GL_ONE GL_ONE
		tcMod scroll 7.4 1.3
	}

}

models/powerups/armor/energy_yel1
{

	{
		map models/powerups/armor/energy_yel3.tga 
		blendFunc GL_ONE GL_ONE
		tcMod scroll 7.4 1.3
	}

}

models/powerups/armor/energy_grn1
{
   deformVertexes wave 100 sin 2 0 0 0
	{
		map textures/effects/envmaprail.tga
		blendFunc GL_ONE GL_ONE
                tcGen environment
                tcmod rotate 30
		tcMod scroll 1 1
                rgbGen wave triangle -.3 1.3 0 .3
	}

}

models/mapobjects/lamplight_ys
{
	{	
		map models/mapobjects/lamplight_ys.tga
		blendfunc GL_ONE GL_ONE
		
	}
}

models/mapobjects/pj_light
{
     cull none
        {
		map textures/effects/tinfx2.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE              
                rgbGen vertex
	}   
	{	
		map models/mapobjects/pj_light.tga
		blendfunc GL_ONE GL_ONE
		rgbGen vertex
	}
      
}

models/mapobjects/lamplight_y
{
	q3map_surfacelight 10000
	light 1
        cull disable
	{
                map textures/effects/envmapmach.tga
		//map models/mapobjects/lamplight_y.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
                rgbGen identity
	}
}

models/mapobjects/arenalogo
{
	deformVertexes wave 100 sin 0.25 0 0 0
	{
		map textures/effects/quadmap.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
		tcMod turb 0 1 0 0.2
	}
}


//
// weapons
//
models/weapons2/machinegun/f_machinegun
{
	sort additive
	cull disable
	{
		map	models/weapons2/machinegun/f_machinegun.tga
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/railgun/f_railgun2
{
	sort additive
	cull disable
	{
		map	models/weapons2/railgun/f_railgun2.tga
		blendfunc GL_ONE GL_ONE
		rgbgen entity
	}
}

models/weapons2/railgun/railgun2
{
	sort additive
	cull disable
	{
		map	models/weapons2/railgun/railgun2.glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen entity	// identity
	}
}

models/weapons2/railgun/railgun3
{
	{
		map	models/weapons2/railgun/railgun3.tga
		rgbGen lightingDiffuse				
	}

	{
		map	models/weapons2/railgun/railgun3.glow.tga
		blendfunc GL_ONE GL_ONE
		rgbGen entity	// identity
	}
}

models/weapons2/railgun/railgun4
{
	{
		map models/weapons2/railgun/railgun4.tga
		tcMod scroll 0 1
		rgbGen entity	// identity
	}

}

models/weapons2/shotgun/f_shotgun
{
	sort additive
	cull disable
	{
		map	models/weapons2/shotgun/f_shotgun.tga
		blendfunc add
	}
}

models/weapons2/shotgun/shotgun_laser
{
	
	{
		map	models/weapons2/shotgun/shotgun_laser.tga
		blendfunc add
	}
}
models/weapons2/bfg/f_bfg
{
	sort additive
	cull disable
	{
		clampmap models/weapons2/bfg/f_bfg.tga
		blendfunc GL_ONE GL_ONE         
                tcmod rotate 360              
        }
        {
		clampmap models/weapons2/bfg/f_bfg2.tga
		blendfunc GL_ONE GL_ONE
                tcmod rotate -129
                //tcMod stretch sin .8 0.10 0 .7
        }
     
}
models/weapons2/bfg/bfg_e
{	
	{
		//map models/weapons2/bfg/bfg_e2.tga
                map textures/effects/envmapbfg.tga
		blendfunc GL_ONE GL_ZERO                   
                tcMod turb 0 .5 0 .1
                tcmod scale .4 .4
                tcMod scroll .2 -.2         
                rgbGen identity             
        }	
        {
                //map models/weapons2/bfg/bfg_e2.tga
		//map models/players/doom/phobos_fx.tga
                map textures/effects/envmapbfg.tga
		blendfunc GL_ONE GL_ONE                   
                tcMod turb 0 .5 0 .1
                tcmod scale .2 .2
                tcMod scroll .3 .6         
                rgbGen identity             
        }	
        {
		map textures/effects/tinfx.tga
                tcGen environment
                blendFunc GL_ONE GL_ONE              
                rgbGen lightingDiffuse
	}        
}
 models/weapons2/bfg/bfg
{   
        {
                map textures/effects/tinfx2d.tga
                blendFunc GL_ONE GL_ZERO
                tcmod scroll .01 .01
                tcGen environment
                rgbGen lightingDiffuse
	}  
        {
		map models/weapons2/bfg/bfg.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
 models/weapons2/bfg/bfg_k
{     
 
        {
                map textures/effects/envmapbfg.tga
                blendFunc GL_ONE GL_ZERO
                tcmod rotate 30
                tcmod scroll 1 1
                tcGen environment
                rgbGen identity
	}  
        {
		map models/weapons2/bfg/bfg_k.tga
                blendFunc GL_SRC_ALPHA GL_ONE_MINUS_SRC_ALPHA
		rgbGen lightingDiffuse
	}
       
         
}
models/weapons2/grenadel/f_grenadel
{
	sort additive
	cull disable
	{
		map	models/weapons2/grenadel/f_grenadel.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/lightning/f_lightning
{
	sort additive
	cull disable
	{
		map models/weapons2/lightning/f_lightning.tga
		blendfunc GL_ONE GL_ONE
	}
}
sprites/plasma1
{
	cull disable
	{
		clampmap sprites/plasmaa.tga
		blendfunc GL_ONE GL_ONE
                tcMod rotate 931
	}
}
models/ammo/rocket/rockfls1
{
	cull disable
	{
		map models/ammo/rocket/rockfls1.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/ammo/rocket/rockfls2
{
	cull disable
	{
		map models/ammo/rocket/rockfls2.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/ammo/rocket/rockflar
{
	cull disable
	{
		map models/ammo/rocket/rockflar.tga
		blendfunc GL_ONE GL_ONE
	}
}

sprites/plasma2
{
	cull disable
	{
		map sprites/plasma2.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/plasma/f_plasma
{
	cull disable
	sort additive
	{
		map models/weapons2/plasma/f_plasma.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/flamethrower/f_flamethrower
{
	cull disable
	sort additive
	{
		map models/weapons2/flamethrower/f_flamethrower.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/grapple/f_grapple
{
	cull disable
	sort additive
	{
		map models/weapons2/grapple/f_grapple.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/weapons2/rocketl/f_rocketl
{
	cull disable
	sort additive
	{
		map models/weapons2/rocketl/f_rocketl.tga
		blendfunc GL_ONE GL_ONE
	}
}

models/weapons2/gauntlet/gauntlet3
{
	
	cull disable
	sort additive
	{
              // map models/weapons2/gauntlet/gauntlet3.tga
               AnimMap 10 models/weapons2/gauntlet/gauntlet3.tga models/weapons2/gauntlet/gauntlet4.tga
	       blendfunc GL_ONE GL_ONE
	}
}

// this one can go away eventually
models/weapons2/rocketl/rocketl14
{
	cull disable
	sort additive
	{
		map models/weapons2/rocketl/f_rocketl.tga
		blendfunc GL_ONE GL_ONE
	}
}

//
// players
//
models/players/tankjr/tankjr
{
      
        {
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
        	map models/players/tankjr/tankjr.tga
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
		rgbGen identity
		alphaGen lightingSpecular
	}
          
}
//models/players/visorhead
//{
//	{
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/players/visor/visorhead.tga
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}
//models/players/visor/visortorso2
//{
//	{
//		map $whiteimage
//		rgbGen lightingDiffuse
//	}
//	{
//		map models/players/visor/visortorso2.tga
//		rgbGen identity
//		alphaGen lightingSpecular
//		blendFunc GL_DST_COLOR GL_SRC_ALPHA
//	}
//}

models/players/doom/f_doom
{
	{
		map models/players/doom/f_doom.tga			
	}
	{
		
		map models/players/doom/fx_doom.tga
		tcGen environment
		rgbGen lightingDiffuse
		blendfunc gl_ONE gl_ONE 		
	}
}
models/players/doom/doom_f
{
	{
		map models/players/doom/doom_f.tga	
                rgbGen lightingDiffuse		
	}
        {
		
		map models/players/doom/doom_fx.tga
		tcGen environment
		rgbGen lightingDiffuse
		blendfunc gl_ONE gl_ONE 		
	}
	
}

models/players/xian/xianfacf
{
	{
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
		map models/players/medium/xian/xianfacf.tga
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
}
models/brandon/braneye
{
	{
		map $whiteimage
		rgbGen lightingDiffuse
	}
	{
		map models/players/light/brandon/braneye.tga
		rgbGen identity
		alphaGen lightingSpecular
		blendFunc GL_DST_COLOR GL_SRC_ALPHA
	}
	{
		map models/players/light/brandon/braneye.glow.tga
		blendfunc GL_ONE GL_ONE
	}
}
models/players/brandon/branhat
{
	{
		map models/players/light/brandon/branhat.tga
	}
	{
		map models/players/light/brandon/branhat.glow.tga
		blendfunc GL_ONE GL_ONE
	}
}

//
// weapons
//

models/weapons2/plasma/plasma_glass
{

	{
		map textures/effects/tinfxb.tga
		tcGen environment
                tcMod scroll .01 .02
		blendfunc GL_ONE GL_ONE
		rgbGen lightingDiffuse
	}
}
models/weapons2/plasma/plasma_glo
{
    
	{
		map models/weapons2/plasma/plasma_glo.tga
                tcmod rotate 33
                tcMod scroll .7 1
                rgbGen identity
	}
        {
		map textures/effects/tinfxb.tga
		tcGen environment
                tcMod scroll .01 .02
		blendfunc GL_ONE GL_ONE
		rgbGen lightingDiffuse
	}
}

////////////////////////////
/// Lightning gun Shader ///
////////////////////////////
models/weapons2/lightning/ball
{
   deformVertexes autoSprite
        {
		map models/weapons2/lightning/ball.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 2 0 7
                tcMod rotate 360
	}
        {
		map models/weapons2/lightning/ball.tga
		blendfunc GL_ONE GL_ONE
                rgbgen wave triangle 1 5 1 3
                tcMod rotate -200
	}
	
}

//
//
// instant: as seen on the powerups themselves
//

models/powerups/instant/scan
{
	{
		map models/powerups/instant/scan.tga
	}
	{
		map textures/effects/envmapdim.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
	}
}
models/powerups/instant/quad
{
	//{
	//	map gfx/colors/darkblue.tga
	//}
	{
		map textures/effects/envmapblue.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/enviro
{
	//{
	//	map models/powerups/instant/enviro.tga
	//}
	{
		map textures/effects/envmapgold.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/flight
{
	{
		map textures/effects/envmappurp.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/haste
{
	{
		map textures/effects/envmapyel.tga
		blendfunc GL_ONE GL_ZERO
		tcGen environment
                rgbGen identity
	}
}
models/powerups/instant/invis
{
	{
		map textures/effects/tinfx2c.tga
                //map textures/sfx/specular.tga
		blendfunc GL_ONE GL_ONE
		tcGen environment
	}
}
models/powerups/instant/regen
{
	{
		map textures/effects/envmapred.tga
		tcGen environment
		blendfunc GL_ONE GL_ZERO
                rgbGen identity
	}
}

//
// holdable powerups
//

models/powerups/holdable/medkit_base
{
	{
		map textures/effects/envmap.tga
		tcgen environment
	}
	
}

models/powerups/holdable/medkit_sphere
{
	{
		map textures/effects/envmapdim.tga
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/holdable/medkit_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/medkit_fluid.tga
		tcMod scroll 0 2
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/holdable/teleport_base
{
	{
		map textures/effects/envmap.tga
		tcgen environment
	}
	
}

models/powerups/holdable/teleport_sphere
{
	{
		map textures/effects/envmapdim.tga
		tcgen environment
		blendfunc GL_ONE GL_ONE
	}
	
}

models/powerups/holdable/teleport_fluid
{
	sort additive
	cull back
	{
		map models/powerups/holdable/teleport_fluid.tga
		tcMod scroll 0 2
		blendfunc GL_ONE GL_ONE
	}
	
}

textures/organics/wire02a_f	
{
	light 1	
q3map_surfacelight 200
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02a_f.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}
textures/organics/wire02_f2	
{
	light 1	
q3map_surfacelight 400
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/organics/wire02_f2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/sfx/blocks17g_jumpad
{
	surfaceparm nodamage
	q3map_surfacelight 400

	
	{
		map textures/sfx/blocks17g_jumpad.tga
		rgbGen identity
	}
	
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	
	{
		map textures/sfx/bouncepad01b_layer1.tga
		blendfunc gl_one gl_one
		rgbGen wave sin .5 .5 0 1.5	
	}

	{
		clampmap textures/sfx/jumppadsmall.tga
		blendfunc gl_one gl_one
		tcMod stretch sin 1.2 .8 0 1.5
		rgbGen wave square .5 .5 .25 1.5
	}

	//	END
}


textures/sfx/bullseye
{ 
        cull disable
        //surfaceparm trans	
        surfaceparm nomarks	
        surfaceparm nolightmap 
        deformVertexes autosprite
        //nomipmaps

        {
		clampmap textures/sfx/bullseye.tga
                tcMod stretch sin .8 0.2 0 .2
                tcmod rotate 200
                blendFunc add
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2.tga
	        tcMod stretch sin .8 0.2 0 .3
                tcmod rotate 70
                alphaFunc GE128 
                rgbGen identity
	}
        {
	        //clampmap textures/sfx/bullseye.tga
                clampmap textures/gothic_block/blocks18cgeomtrn2.tga
                tcMod stretch sin .8 0.2 0 .2
                tcmod rotate 50
                alphaFunc GE128
                rgbGen identity
	}
        {
	        clampmap textures/gothic_block/blocks18cgeomtrn2.tga
                tcMod stretch sin .8 0.2 0 .1
                tcmod rotate 30
                alphaFunc GE128
                rgbGen identity
	}

}
textures/sfx/omm
{ 
    
        surfaceparm trans	
	surfaceparm alphashadow
	cull none

       {