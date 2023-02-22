CEDER_OBJETOS:

				xor		a
				ld		(FLECHA_SI_NO),a
				
				exx

				ld		a,(DADO_DEL_JUGADOR)
				cp		2
				jp		c,CARGA_RIFLE.no_se_puede
				ld		a,(ACCIONES_LIBRES)
				cp		1
				jp		c,CARGA_RIFLE.no_se_puede
				
.revisamos_si_hay_personaje_cerca:				

				ld		hl,(SEGUIMIENTO_CASILLA)
				
				ld		de,44
				or		a
				sbc		hl,de
				
				ld		b,6

.bucle_ver_personajes_up:				
								
				ld		ix,PERSONAJE_1
				ld		a,b
				dec		a
				ld		e,a
				ld		d,0
[8]				add		ix,de
				ld		e,(ix)
				ld		d,(ix+1)
				
				call	DCOMPR
				jp		z,.definimos_en_pantalla_el_personaje_con_el_que_se_hara_la_transaccion
				
				djnz	.bucle_ver_personajes_up

				ld		de,43
				or		a
				adc		hl,de

				ld		b,6
				
.bucle_ver_personajes_left:

				ld		ix,PERSONAJE_1
				ld		a,b
				dec		a
				ld		e,a
				ld		d,0
[8]				add		ix,de
				ld		e,(ix)
				ld		d,(ix+1)
				
				call	DCOMPR
				jp		z,.definimos_en_pantalla_el_personaje_con_el_que_se_hara_la_transaccion
				
				djnz	.bucle_ver_personajes_left

				ld		de,2
				or		a
				adc		hl,de

				ld		b,6
				
.bucle_ver_personajes_right:

				ld		ix,PERSONAJE_1
				ld		a,b
				dec		a
				ld		e,a
				ld		d,0
[8]				add		ix,de
				ld		e,(ix)
				ld		d,(ix+1)
				
				call	DCOMPR
				jp		z,.definimos_en_pantalla_el_personaje_con_el_que_se_hara_la_transaccion
				
				djnz	.bucle_ver_personajes_right

				ld		de,43
				or		a
				adc		hl,de

				ld		b,6
				
.bucle_ver_personajes_down:

				ld		ix,PERSONAJE_1
				ld		a,b
				dec		a
				ld		e,a
				ld		d,0
[8]				add		ix,de
				ld		e,(ix)
				ld		d,(ix+1)
				
				call	DCOMPR
				jp		z,.definimos_en_pantalla_el_personaje_con_el_que_se_hara_la_transaccion
				
				djnz	.bucle_ver_personajes_down

				jp		CARGA_RIFLE.no_se_puede	
							
.definimos_en_pantalla_el_personaje_con_el_que_se_hara_la_transaccion:

				dec		b
				ld		a,b
				ld		(PERSONAJE_A_ENTREGAR),a
				
				ld		hl,146											; flecha
				push	hl				
				ld		hl,152											
				push	hl
				call	pack_un_tile_PG1
								
				ld		hl,840											; carita
				ld		a,b
				ld		e,a
				ld		d,0
				or		a
[2]				adc		hl,de

				push	hl				
				ld		hl,154											
				push	hl
				call	pack_dos_tiles_PG1
				
				ld		a,b
				ld		l,a
				ld		h,0
				ld		(variable_circunstanc_4),hl
				
.informamos_que_si_vamos_a_hacer_transaccion:				
				
				ld		iy,FRASE_CEDEMOS_OBJETOS
				ld		a,31
				call	COMBINAR_PG1_1				

				jp		.botella
				
.bucle_sticks:

				xor		a
				call	GTSTCK
				or		a
				call	z,LIBERA_TRIG
				cp		1
				jp		z,.up
				cp		3
				jp		z,.right
				cp		5
				jp		z,.down
				cp		7
				jp		z,.left												

				or		a
				call	GTTRIG
				cp		255
				jp		z,.revisamos
				
				jp		.bucle_sticks
								
.up:

				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a

				ld		a,(variable_circunstanc)
				inc		a
				ld		de,LISTA_DE_UTENSILIO_AL_QUE_VA_UP
				jp		LISTA_DE_OPCIONES	
												
.right:

				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a

				ld		a,(variable_circunstanc)
				inc		a
				ld		de,LISTA_DE_UTENSILIO_AL_QUE_VA_RIGHT
				jp		LISTA_DE_OPCIONES	
												
.down:

				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a

				ld		a,(variable_circunstanc)
				inc		a
				ld		de,LISTA_DE_UTENSILIO_AL_QUE_VA_DOWN
				jp		LISTA_DE_OPCIONES	
												
.left:
				
				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				ld		a,(variable_circunstanc)
				inc		a
				ld		de,LISTA_DE_UTENSILIO_AL_QUE_VA_LEFT
				jp		LISTA_DE_OPCIONES				

.bloque_general_de_utensilios:

				push	ix
				call	.limpieza_general				
				pop		ix
				
				ld		l,(ix)
				ld		h,(ix+1)
				push	hl
				ld		l,(ix+2)
				ld		h,(ix+3)
				push	hl
				call	pack_un_tile_PG1
				
				ld		a,(ix+4)
				ld		(variable_circunstanc),a
				jp		.bucle_sticks
				
				
.botella:

				ld		ix,LISTA_DIREC_BOTELLA
				jp		.bloque_general_de_utensilios
								
.cartucho:
			
				ld		ix,LISTA_DIREC_CARTUCHOS
				jp		.bloque_general_de_utensilios
				
.clavos:
				
				ld		ix,LISTA_DIREC_CLAVOS
				jp		.bloque_general_de_utensilios
				
.cuchillo:

				ld		ix,LISTA_DIREC_CUCHILLO
				jp		.bloque_general_de_utensilios
				
.cuerda:

				ld		ix,LISTA_DIREC_CUERDA
				jp		.bloque_general_de_utensilios
				
.paleta:

				ld		ix,LISTA_DIREC_PALETA
				jp		.bloque_general_de_utensilios
				
.gasolina:

				ld		ix,LISTA_DIREC_GASOLINA
				jp		.bloque_general_de_utensilios
				
.hacha:

				ld		ix,LISTA_DIREC_HACHA
				jp		.bloque_general_de_utensilios
				
.martillo:

				ld		ix,LISTA_DIREC_MARTILLO
				jp		.bloque_general_de_utensilios
				
.zippo:

				ld		ix,LISTA_DIREC_ZIPPO
				jp		.bloque_general_de_utensilios
				
.trapo:

				ld		ix,LISTA_DIREC_TRAPO
				jp		.bloque_general_de_utensilios
				
.pico:

				ld		ix,LISTA_DIREC_PICO
				jp		.bloque_general_de_utensilios
				
.madera:

				ld		ix,LISTA_DIREC_MADERA
				jp		.bloque_general_de_utensilios
				
.rifle:

				ld		ix,LISTA_DIREC_RIFLE
				jp		.bloque_general_de_utensilios
				
.cubo:

				ld		ix,LISTA_DIREC_CUBO
				jp		.bloque_general_de_utensilios
				
.coctel:

				ld		ix,LISTA_DIREC_COCTEL
				jp		.bloque_general_de_utensilios
				
.antorcha:

				ld		ix,LISTA_DIREC_ANTORCHA
				jp		.bloque_general_de_utensilios
				
.limpieza_general:
				
				ld		ix,LISTA_DE_LIMPIEZA			
				ld		b,17
				
.bucle_de_limpieza:
				
				ld		hl,31											; flecha borrada
				push	hl				
				ld		l,(ix)
				ld		h,(ix+1)											
				push	hl
				call	pack_un_tile_PG1
				ld		de,2
				add		ix,de
				djnz	.bucle_de_limpieza
				
				ret

.revisamos:

				ld		a,(ARRASTRA_STRIG)
				cp		1
				jp		z,.bucle_sticks
				ld		a,1
				ld		(ARRASTRA_STRIG),a

				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				
				ld		iy,UTENSILIOS_PERSONAJE_1
				ld		de,(variable_circunstanc_4)
[15]			add		iy,de
				
				ld		a,(variable_circunstanc)
				inc		a
				ld		de,LISTA_DE_QUE_DA
				jp		LISTA_DE_OPCIONES

.valor_a_max:

				ld		a,255
				ret

.global:

				ld		b,a
				push	bc
				push	ix
				push	de
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,(ix)
				pop		de
				pop		ix
				cp		b
				jp		nz,.global_sigue_1

				push	ix
				push	de
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				xor		a
				ld		(ix),a
				pop		de
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
.global_sigue_1:

				pop		bc
				
				ld		a,b
				
				cp		11
				jp		z,.global_sigue_2
				
				push	ix
				push	de
				ld		ix,OBJETO_EN_MANO
				ld		a,(PERSONAJE_A_ENTREGAR)
				ld		e,a
				ld		d,0
				add		ix,de
				
				ld		a,b
				ld		(ix),a
				
				ld		a,(TURNO)
				push	af
				ld		a,(PERSONAJE_A_ENTREGAR)
				ld		(TURNO),a

				call	DANDO_IMAGEN_AL_SPRITE
				
				pop		af
				ld		(TURNO),a
				pop		de
				pop		ix
				

.global_sigue_2:
				
				add		ix,de
				add		iy,de
				ld		a,(ix)
				or		a
				jp		z,CARGA_RIFLE.no_se_puede
				ld		b,a
				ld		a,(iy)
				add		b
				
				cp		b
				call	c,.valor_a_max
				
				ld		(iy),a
				xor		a
				ld		(ix),a	
				
				jp		.pintamos_todo
							
.da_botella:

				ld		de,0
				ld		a,11
				jp		.global
				
.da_cartucho:

				ld		de,1
				ld		a,11
				jp		.global

.da_clavos:

				ld		de,2
				ld		a,11
				jp		.global

.da_cuchillo:

				ld		de,3
				ld		a,6
				jp		.global

.da_cuerda:

				ld		de,4
				ld		a,11
				jp		.global

.da_paleta:

				ld		de,6
				ld		a,5
				jp		.global

.da_gasolina:

				ld		de,7
				ld		a,11
				jp		.global

.da_hacha:

				ld		de,8
				ld		a,8
				jp		.global

.da_martillo:

				ld		de,9
				ld		a,7
				jp		.global

.da_zippo:

				ld		de,10
				jp		.global

.da_trapo:

				ld		de,11
				ld		a,11
				jp		.global

.da_pico:

				ld		de,12
				ld		a,9
				jp		.global

.da_madera:

				ld		ix,MADERA_ADQUIRIDA
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				
				ld		iy,MADERA_ADQUIRIDA
				ld		de,(variable_circunstanc_4)
				add		iy,de
				
				ld		de,0
				ld		a,11
				jp		.global
				
.da_rifle:

				ld		de,5
				ld		a,10
				jp		.global

.da_cubo:

				ld		de,14
				ld		a,11
				jp		.global

.da_coctel:

				ld		ix,COCTEL_MOLOTOF
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				
				ld		iy,COCTEL_MOLOTOF
				ld		de,(variable_circunstanc_4)
				add		iy,de
				
				ld		de,0
				ld		a,3
				jp		.global
				
.da_antorcha:	

				ld		ix,ANTORCHA
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				
				ld		iy,ANTORCHA
				ld		de,(variable_circunstanc_4)
				add		iy,de
				
				ld		de,0
				ld		a,1
				jp		.global

.pintamos_todo:

				ld		a,(DADO_DEL_JUGADOR)
				sub		2
				ld		(DADO_DEL_JUGADOR),a
				
				ld		a,(ACCIONES_LIBRES)
				dec		a
				ld		(ACCIONES_LIBRES),a
				
				call	PINTAMOS_TODO_PG1
				
				call	.limpieza_general
			
				ld		ix,LISTA_DE_LIMPIEZA_DE_CARITAS
				ld		b,3

.bucle_limpia_caras:
								
				ld		hl,31											; flecha borrar
				push	hl				
				ld		l,(ix)
				ld		h,(ix+1)										
				push	hl
				call	pack_un_tile_PG1
				
				ld		de,2
				add		ix,de
				
				djnz	.bucle_limpia_caras
																				
				ld		a,1
				ld		(ARRASTRA_STRIG),a
												
.salimos:

				ld		iy,FRASE_VACIA
				ld		a,31
				call	COMBINAR_PG1_1				
				
				exx								

				jp		RUTINA_ESPECIAL_FINAL_DATOS_EXTRA_VISIBLES.rutina_de_acciones

LISTA_DE_LIMPIEZA_DE_CARITAS:

				dw		152,154,156
				
LISTA_DE_UTENSILIO_AL_QUE_VA_UP:

				dw		CEDER_OBJETOS.botella
				dw		CEDER_OBJETOS.botella
				dw		CEDER_OBJETOS.cartucho
				dw		CEDER_OBJETOS.clavos
				dw		CEDER_OBJETOS.cuchillo
				dw		CEDER_OBJETOS.cuerda
				dw		CEDER_OBJETOS.gasolina
				dw		CEDER_OBJETOS.gasolina
				dw		CEDER_OBJETOS.hacha
				dw		CEDER_OBJETOS.martillo
				dw		CEDER_OBJETOS.zippo
				dw		CEDER_OBJETOS.trapo
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.paleta
				dw		CEDER_OBJETOS.paleta
				dw		CEDER_OBJETOS.pico
				dw		CEDER_OBJETOS.pico

LISTA_DE_UTENSILIO_AL_QUE_VA_RIGHT:

				dw		CEDER_OBJETOS.gasolina
				dw		CEDER_OBJETOS.hacha
				dw		CEDER_OBJETOS.martillo
				dw		CEDER_OBJETOS.zippo
				dw		CEDER_OBJETOS.trapo
				dw		CEDER_OBJETOS.pico
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.madera
				dw		CEDER_OBJETOS.cubo
				dw		CEDER_OBJETOS.coctel
				dw		CEDER_OBJETOS.antorcha
				dw		CEDER_OBJETOS.madera
				
LISTA_DE_UTENSILIO_AL_QUE_VA_DOWN:

				dw		CEDER_OBJETOS.cartucho
				dw		CEDER_OBJETOS.clavos
				dw		CEDER_OBJETOS.cuchillo
				dw		CEDER_OBJETOS.cuerda
				dw		CEDER_OBJETOS.paleta
				dw		CEDER_OBJETOS.rifle
				dw		CEDER_OBJETOS.hacha
				dw		CEDER_OBJETOS.martillo
				dw		CEDER_OBJETOS.zippo
				dw		CEDER_OBJETOS.trapo
				dw		CEDER_OBJETOS.pico
				dw		CEDER_OBJETOS.coctel
				dw		CEDER_OBJETOS.antorcha
				dw		CEDER_OBJETOS.rifle
				dw		CEDER_OBJETOS.cubo
				dw		CEDER_OBJETOS.coctel
				dw		CEDER_OBJETOS.antorcha
								
LISTA_DE_UTENSILIO_AL_QUE_VA_LEFT:

				dw		CEDER_OBJETOS.botella
				dw		CEDER_OBJETOS.cartucho
				dw		CEDER_OBJETOS.clavos
				dw		CEDER_OBJETOS.cuchillo
				dw		CEDER_OBJETOS.cuerda
				dw		CEDER_OBJETOS.paleta
				dw		CEDER_OBJETOS.botella
				dw		CEDER_OBJETOS.cartucho
				dw		CEDER_OBJETOS.clavos
				dw		CEDER_OBJETOS.cuchillo
				dw		CEDER_OBJETOS.cuerda
				dw		CEDER_OBJETOS.paleta
				dw		CEDER_OBJETOS.zippo
				dw		CEDER_OBJETOS.rifle
				dw		CEDER_OBJETOS.rifle
				dw		CEDER_OBJETOS.cubo
				dw		CEDER_OBJETOS.coctel
				
LISTA_DE_QUE_DA:

				dw		CEDER_OBJETOS.da_botella
				dw		CEDER_OBJETOS.da_cartucho
				dw		CEDER_OBJETOS.da_clavos
				dw		CEDER_OBJETOS.da_cuchillo
				dw		CEDER_OBJETOS.da_cuerda
				dw		CEDER_OBJETOS.da_paleta
				dw		CEDER_OBJETOS.da_gasolina
				dw		CEDER_OBJETOS.da_hacha
				dw		CEDER_OBJETOS.da_martillo
				dw		CEDER_OBJETOS.da_zippo
				dw		CEDER_OBJETOS.da_trapo
				dw		CEDER_OBJETOS.da_pico
				dw		CEDER_OBJETOS.da_madera
				dw		CEDER_OBJETOS.da_rifle
				dw		CEDER_OBJETOS.da_cubo
				dw		CEDER_OBJETOS.da_coctel
				dw		CEDER_OBJETOS.da_antorcha	

LISTA_DE_LIMPIEZA:

				dw 		512,896,1280,1664,2048,2432,524,908,1292,1676,2060,2444,1704,2816,2822,2840,2846											

LISTA_DIREC_BOTELLA:

				dw		146,512
				db		0
				
LISTA_DIREC_CARTUCHOS:
			
				dw		146,896											
				db		1
				
LISTA_DIREC_CLAVOS:
				
				dw		146,1280											
				db		2

LISTA_DIREC_CUCHILLO:

				dw		146,1664											
				db		3
			
LISTA_DIREC_CUERDA:

				dw		146,2048											
				db		4
				
LISTA_DIREC_PALETA:

				dw		146,2432											
				db		5

LISTA_DIREC_GASOLINA:

				dw		146,524											
				db		6
	
LISTA_DIREC_HACHA:

				dw		146,908											
				db		7
	
LISTA_DIREC_MARTILLO:

				dw		146,1292											
				db		8
		
LISTA_DIREC_ZIPPO:

				dw		146,1676											
				db		9

LISTA_DIREC_TRAPO:

				dw		146,2060											
				db		10
		
LISTA_DIREC_PICO:

				dw		146,2444											
				db		11
			
LISTA_DIREC_MADERA:

				dw		146,1704											
				db		12
				
LISTA_DIREC_RIFLE:

				dw		146,2816											
				db		13
				
LISTA_DIREC_CUBO:

				dw		146,2822											
				db		14

LISTA_DIREC_COCTEL:

				dw		146,2840											
				db		15
			
LISTA_DIREC_ANTORCHA:

				dw		146,2846											
				db		16
