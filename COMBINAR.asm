PREPARAR_UTENSILIOS:

				exx

				ld		a,(DADO_DEL_JUGADOR)
				cp		3
				jp		c,CARGA_RIFLE.no_se_puede
				ld		a,(ACCIONES_LIBRES)
				cp		1
				jp		c,CARGA_RIFLE.no_se_puede
				
				ld		iy,FRASE_COMBINAMOS_OBJETOS
				ld		a,31
				call	COMBINAR_PG1_1				
				jp		.coctel
				
.bucle_sticks:

				ld		a,4												; Rutina especial pulsando M				
				call	SNSMAT
				bit		2,a
				jp		z,.bucle_sticks
				
				xor		a
				call	GTSTCK
				or		a
				call	z,LIBERA_TRIG
				cp		3
				jp		z,.antorcha
				cp		7
				jp		z,.coctel
				
				xor		a
				call	GTTRIG
				cp		255
				jp		z,.accion
				
				jp		.bucle_sticks
				
.antorcha:

				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				ld		hl,146											; flecha
				push	hl				
				ld		hl,2846											
				push	hl
				call	pack_un_tile_PG1				
				

				ld		hl,31											; flecha borrada
				push	hl				
				ld		hl,2840											
				push	hl
				call	pack_un_tile_PG1				


				ld		a,1
				ld		(variable_circunstanc),a
				
				jp		.bucle_sticks

.coctel:

				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				ld		hl,31											; flecha
				push	hl				
				ld		hl,2846											
				push	hl
				call	pack_un_tile_PG1								

				ld		hl,146											; flecha borrada
				push	hl				
				ld		hl,2840											
				push	hl
				call	pack_un_tile_PG1				


				xor		a
				ld		(variable_circunstanc),a
				
				jp		.bucle_sticks
								
.accion:

				ld		a,(variable_circunstanc)
				or		a
				jp		nz,.posibilidades_de_antorcha
				
.posibilidades_de_coctel:

				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				ld		ix,COCTEL_MOLOTOF
				add		ix,de
				ld		a,(ix)
				cp		1
				jp		z,.coctel_por_encender
				cp		2
				jp		z,.coctel_nada_que_hacer
				
.coctel_por_crear:

				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix)
				or		a
				jp		z,.coctel_nada_que_hacer
				ld		a,(ix+7)
				or		a
				jp		z,.coctel_nada_que_hacer
				ld		a,(ix+11)
				or		a
				jp		z,.coctel_nada_que_hacer

				ld		a,(ix)
				dec		a
				ld		(ix),a
				
				ld		a,(ix+7)
				dec		a
				ld		(ix+7),a
				
				ld		a,(ix+11)
				dec		a
				ld		(ix+11),a
				
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				ld		ix,COCTEL_MOLOTOF
				add		ix,de
				
				ld		a,1
				ld		(ix),a

				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,3
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				jp		.pintamos_los_cambios		
												
.coctel_por_encender:

				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+10)
				or		a
				jp		z,.coctel_nada_que_hacer

				ld		a,(ix+10)
				dec		a
				ld		(ix+10),a
				
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				ld		ix,COCTEL_MOLOTOF
				add		ix,de
				
				ld		a,2
				ld		(ix),a

				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,4
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				jp		.pintamos_los_cambios		
								
.coctel_nada_que_hacer:				

				ld		hl,31											; borra flecha
				push	hl				
				ld		hl,2840											
				push	hl
				call	pack_un_tile_PG1				
							
				jp		CARGA_RIFLE.no_se_puede
				
.posibilidades_de_antorcha:

				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				ld		ix,ANTORCHA
				add		ix,de
				ld		a,(ix)
				cp		1
				jp		z,.antorcha_por_encender
				cp		2
				jp		z,.antorcha_nada_que_hacer
				
.antorcha_por_crear:

				ld		ix,MADERA_ADQUIRIDA
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				
				ld		a,(ix)
				or		a
				jp		z,.antorcha_nada_que_hacer
				
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+7)
				or		a
				jp		z,.antorcha_nada_que_hacer
				ld		a,(ix+11)
				or		a
				jp		z,.antorcha_nada_que_hacer

				
				ld		a,(ix+7)
				dec		a
				ld		(ix+7),a
				
				ld		a,(ix+11)
				dec		a
				ld		(ix+11),a
				
				ld		ix,MADERA_ADQUIRIDA
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de				
				
				ld		a,(ix)
				dec		a
				ld		(ix),a			
				
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				ld		ix,ANTORCHA
				add		ix,de
				
				ld		a,1
				ld		(ix),a

				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,1
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				jp		.pintamos_los_cambios
				
.antorcha_por_encender:

				
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+10)
				or		a
				jp		z,.antorcha_nada_que_hacer
				
				ld		a,(ix+10)
				dec		a
				ld		(ix+10),a
				
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				ld		ix,ANTORCHA
				add		ix,de
				
				ld		a,2
				ld		(ix),a
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,2
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
				
				jp		.pintamos_los_cambios
				
.antorcha_nada_que_hacer:

				ld		hl,31											; borra flecha
				push	hl				
				ld		hl,2846											
				push	hl
				call	pack_un_tile_PG1

				jp		CARGA_RIFLE.no_se_puede
				
.pintamos_los_cambios:

				ld		a,(DADO_DEL_JUGADOR)
				sub		3
				ld		(DADO_DEL_JUGADOR),a
				
				ld		a,(ACCIONES_LIBRES)
				dec		a
				ld		(ACCIONES_LIBRES),a
				
				call	PINTAMOS_TODO_PG1
				
				ld		hl,31											; borra flecha
				push	hl				
				ld		hl,2846											
				push	hl
				call	pack_un_tile_PG1				


				ld		hl,31											; borra flecha
				push	hl				
				ld		hl,2840											
				push	hl
				call	pack_un_tile_PG1				

								
				ld		a,1
				ld		(ARRASTRA_STRIG),a

.salimos:


				ld		iy,FRASE_VACIA
				ld		a,31
				call	COMBINAR_PG1_1
				
				exx
				
				jp		RUTINA_ESPECIAL_FINAL_DATOS_EXTRA_VISIBLES.rutina_de_acciones
