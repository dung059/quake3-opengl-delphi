# quake3-opengl-delphi
Quake 3 OpenGL Delphi

Tuyên bố từ chối:
Mặc dù kiểm soát nội dung cẩn thận, tôi không chịu trách nhiệm về nội dung của các liên kết bên ngoài. Nội dung của các trang được liên kết là trách nhiệm duy nhất của nhà điều hành.

----------------------------------

Based on Harry Paintner (http://harrypaintner.de/)

Haftungshinweis:
Trotz sorgfältiger inhaltlicher Kontrolle übernehme ich keine Haftung für die Inhalte externer Links. Für den Inhalt der verlinkten Seiten sind ausschließlich deren Betreiber verantwortlich.

----------------------------------

Features
	BSP, PVS and frustum culling
	Depth sorted surfaces
	Shaders or multipass rendered surfaces (all types of geometry animation incl. vertices, colors, texture coordinates, env mapping, animated textures, etc.)
	Bezier curves (with LOD)
	Fast collision test thru planes
	3D-sounds (fmod)
	Delphi source code available
	Supports all kinds of graphic cards
	
Todo
	Optimized shader manager (new parser already implemented)
	Missing shaders (AUTOSPRITE, FOG) and shader bugs
	PAK-file support
Instructions
	If you have Quake 3 already installed, extract all files from PAK0.PK3. If you don't have Quake 3 installed, download the demo version and extract PAK0.PK3.
	Edit the config file Q3MapView.ini and set the folder path:
		FOLDER=C:\Quake3\baseq3.
	Set BSP to the map that you would like to use:
		BSP=q3dm1.bsp
	Set all other options to values that fit best for you.
	
Keys:
	A, cursor left : strafe left
	D, cursor right : strafe right
	W, cursor up : move forward
	A, cursor down : move backward
	P, pause on/off
	^, show/hide console
Console commands:
	QUIT - terminate program
	CLR - clear log
	STATS 1/0 - Show statistics on/off
	POS - change camera position
	COLLISION 1/0 - collision test on/off
	SORT 1/0 - depth sort faces on/off
	MULTITEXTURE 1/0 - Multitexturing on/off
	SHADERS 1/0 - Use shaders on/off
	WIREFRAME 1/0 - Wireframe on/off
	SKYBOX 1/0 - Render skybox on/off
	FOG 1/0 - Render fog on/off
	MUSIC 0..255 - Music volume
	FX 0..255 - FX volume
	Cursor up - previous command
	Cursor down - next command
	PgUp - scroll up
	PgDown - scroll down
	Home - show first log entries
	End - show last log entries
	^ - close console
 
If you have any queries or bug reports, please mail me

Code : Bui The Dung
Mail : dung059@gmail.com
Web  : 
