MENU:

.variables_a_volcar:

				ld		de,LETRAS_SPRITES								; Pintamos los datos de los sprites letras
				ld		hl,SPRITES_MENU_A_VOLCAR
				ld		bc,12*31										
				ldir

				ld		hl,DATA_COLOR_INICIO
				ld		a,16
				ld		c,1
				call	carga_paleta_g9b

				ld		hl,DATA_COLOR_INICIO
				ld		a,16
				ld		c,2
				call	carga_paleta_g9b
								
				call    G9kDisplayEnable

				ld		hl,FADE_IN_PLANO_A
								
				ld		a,16
				ld		(FADE_CANTIDAD_DE_COLORES),a
				ld		a,2
				ld		(FADE_PALETA),a
				call	BUCLE_FADE

				ld		hl,FADE_IN_PLANO_B
				ld		a,1
				ld		(FADE_PALETA),a
				call	BUCLE_FADE
				
				ld		hl,PALETA_SPRITES_MENU
				ld		a,16
				ld		c,0
				call	carga_paleta_g9b
				
				ld		a,30
				ld		(LIMITE_PARON),a
				
.esperamos_respuesta_pre:

				xor		a
				ld		(OPCION_MENU),a
				
				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de
				ld		a,31
				ld		(variable_circunstanc),a
				
				ld		a,(IDIOMA)
				or		a
				jp		nz,.regresamos_a_ingles
				
.regresamos_a_castellano:
												
				ld		hl,DATA_EMPEZAR
				jp		VALORES_LETRAS.bucle

.regresamos_a_ingles:

				ld		hl,DATA_EMPEZAR_I
				jp		VALORES_LETRAS.bucle
																
.esperamos_respuesta:

				call	ANIMACION_DE_LETRAS
				xor		a
				call	GTTRIG
				cp		$FF
				jp		z,.opcion_escogida
				
				xor		a
				ld		(CONFIRM_NO_TR),a
				
				call	GTSTCK
				cp		1
				jp		z,.opcion_arriba
				cp		5
				jp		z,.opcion_abajo
			
				xor		a
				ld		(CONFIRM_NO_ST),a
								
				jp		.esperamos_respuesta

.opcion_escogida:
				
				ld		a,(CONFIRM_NO_TR)
				or		a
				jp		nz,.esperamos_respuesta
				ld		a,1
				ld		(CONFIRM_NO_TR),a
				
				ld		a,(OPCION_MENU)
				cp		1
				jp		z,.escoge_nivel
				cp		2
				jp		z,.escoge_idioma
				cp		3
				jp		z,.escoge_equipo

.escoge_empezar:

				ld		a,30
				ld		(LIMITE_PARON),a
									
				call	.letras_fuera
				jp		.fade_out	

.letras_fuera:

				ld		ix,LETRAS_SPRITES
				ld		de,20*12+8
				add		ix,de
				ld		a,32
				ld		(ix),a
				ld		(ix+12),a
				
				
				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de
				ld		hl,TODA_LETRA_OUT
				
				ld		b,31


.bucle_escoge_empezar:
				
				push	ix
				pop		de
				push	bc								
				ld		bc,2											
				ldir
				ld		de,12
				add		ix,de

				pop		bc
				djnz	.bucle_escoge_empezar


				ld		a,20
				ld		(variable_circunstanc_2),a
				
.bucle_sacamos_las_letras:

				call	ANIMACION_DE_LETRAS

				ld		a,(variable_circunstanc_2)
				dec		a
				ld		(variable_circunstanc_2),a
				or		a
				jp		nz,.bucle_sacamos_las_letras				
				
				ret
				
.fade_out:
				
				ld		hl,FADE_OUT_PLANO_B
								
				ld		a,16
				ld		(FADE_CANTIDAD_DE_COLORES),a
				ld		a,1
				ld		(FADE_PALETA),a
				call	BUCLE_FADE

				ld		hl,FADE_OUT_PLANO_A
				ld		a,2
				ld		(FADE_PALETA),a
				call	BUCLE_FADE

				call    G9kDisplayDisable
				
				G9kWaitVsync
												
				ret
				
.escoge_nivel:

				ld		a,30
				ld		(LIMITE_PARON),a
				
				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de
				ld		a,31
				ld		(variable_circunstanc),a								
				ld		hl,DATA_CONTROL_NIVEL
				jp		VALORES_LETRAS_DE_NIVEL.bucle_de_nivel
				
.esperamos_respuesta_de_nivel:

				call	ANIMACION_DE_LETRAS
				call	NUMEROS_DE_NIVELES				
				xor		a
				call	GTTRIG
				cp		$FF
				jp		z,.esperamos_respuesta_pre_entre
				
				xor		a
				ld		(CONFIRM_NO_TR),a
				
				call	GTSTCK
				cp		1
				jp		z,.opcion_arriba_de_nivel
				cp		5
				jp		z,.opcion_abajo_de_nivel
				cp		3
				jp		z,.opcion_derecha_de_nivel
				cp		7
				jp		z,.opcion_izquierda_de_nivel
				xor		a
				ld		(CONFIRM_NO_ST),a
								
				jp		.esperamos_respuesta_de_nivel

.esperamos_respuesta_pre_entre:

				ld		a,30
				ld		(LIMITE_PARON),a
				
				ld		a,(CONFIRM_NO_TR)
				or		a
				jp		nz,.esperamos_respuesta_de_nivel
				
				ld		a,1
				ld		(CONFIRM_NO_TR),a
				jp		.esperamos_respuesta_pre				

.opcion_izquierda_de_nivel:

				ld		a,(CONFIRM_NO_ST)
				or		a
				jp		nz,.esperamos_respuesta_de_nivel
				ld		a,1
				ld		(CONFIRM_NO_ST),a
				
				ld		a,(OPCION_NIVEL)
				cp		1
				jp		z,.cambiamos_nivel_acciones_down
				cp		2
				jp		z,.cambiamos_nivel_pyv_down
				cp		3
				jp		z,.cambiamos_nivel_sucesos_down
				cp		4
				jp		z,.cambiamos_nivel_recoger_down
				cp		5
				jp		z,.cambiamos_nivel_reforzar_down
				cp		6
				jp		z,.cambiamos_nivel_resistencia_down
				

.cambiamos_nivel_movimiento_down:

				ld		a,(CANT_MOVIMIENTO)
				cp		8
				jp		z,.a_12_movim
				cp		6
				jp		z,.a_8_movim
				
				jp		.esperamos_respuesta_de_nivel

.a_6_movim:

				ld		a,6
				ld		(CANT_MOVIMIENTO),a
				jp		.esperamos_respuesta_de_nivel
				
.a_8_movim:

				ld		a,8
				ld		(CANT_MOVIMIENTO),a
				jp		.esperamos_respuesta_de_nivel

.a_12_movim:

				ld		a,12
				ld		(CANT_MOVIMIENTO),a
				jp		.esperamos_respuesta_de_nivel
					
.cambiamos_nivel_acciones_down:

				ld		a,(CANT_ACCIONES)
				cp		2
				jp		z,.a_3_accion
				cp		3
				jp		z,.a_4_accion
				
				jp		.esperamos_respuesta_de_nivel

.a_2_accion:

				ld		a,2
				ld		(CANT_ACCIONES),a
				jp		.esperamos_respuesta_de_nivel

.a_3_accion:

				ld		a,3
				ld		(CANT_ACCIONES),a
				jp		.esperamos_respuesta_de_nivel

.a_4_accion:

				ld		a,4
				ld		(CANT_ACCIONES),a
				jp		.esperamos_respuesta_de_nivel
								
.cambiamos_nivel_pyv_down:

				ld		a,(CANT_VP_A_ABRIR)
				cp		18
				jp		z,.a_3_pv
				cp		35
				jp		z,.a_18_pv
				
				jp		.esperamos_respuesta_de_nivel

.a_3_pv:

				ld		a,3
				ld		(CANT_VP_A_ABRIR),a
				jp		.esperamos_respuesta_de_nivel

.a_18_pv:

				ld		a,18
				ld		(CANT_VP_A_ABRIR),a
				jp		.esperamos_respuesta_de_nivel

.a_35_pv:

				ld		a,35
				ld		(CANT_VP_A_ABRIR),a
				jp		.esperamos_respuesta_de_nivel
												
.cambiamos_nivel_sucesos_down:

				ld		a,(CANT_SUCESOS)
				cp		127
				jp		z,.a_100_sucesos
				cp		100
				jp		z,.a_80_sucesos
				
				jp		.esperamos_respuesta_de_nivel

.a_80_sucesos:

				ld		a,80
				ld		(CANT_SUCESOS),a
				jp		.esperamos_respuesta_de_nivel

.a_100_sucesos:

				ld		a,100
				ld		(CANT_SUCESOS),a
				jp		.esperamos_respuesta_de_nivel

.a_127_sucesos:

				ld		a,127
				ld		(CANT_SUCESOS),a
				jp		.esperamos_respuesta_de_nivel
				
.cambiamos_nivel_recoger_down:

				ld		a,(CANT_MADERA_CONSEGUIR)
				cp		8
				jp		z,.a_12_recog
				cp		6
				jp		z,.a_8_recog
				
				jp		.esperamos_respuesta_de_nivel

.a_6_recog:

				ld		a,6
				ld		(CANT_MADERA_CONSEGUIR),a
				jp		.esperamos_respuesta_de_nivel

.a_8_recog:

				ld		a,8
				ld		(CANT_MADERA_CONSEGUIR),a
				jp		.esperamos_respuesta_de_nivel

.a_12_recog:

				ld		a,12
				ld		(CANT_MADERA_CONSEGUIR),a
				jp		.esperamos_respuesta_de_nivel
												
.cambiamos_nivel_reforzar_down:

				ld		a,(CANT_REFORZAR)
				cp		8
				jp		z,.a_12_refor
				cp		6
				jp		z,.a_8_refor
				
				jp		.esperamos_respuesta_de_nivel

.a_6_refor:

				ld		a,6
				ld		(CANT_REFORZAR),a
				jp		.esperamos_respuesta_de_nivel
	
.a_8_refor:

				ld		a,8
				ld		(CANT_REFORZAR),a
				jp		.esperamos_respuesta_de_nivel
	
.a_12_refor:

				ld		a,12
				ld		(CANT_REFORZAR),a
				jp		.esperamos_respuesta_de_nivel
										
.cambiamos_nivel_resistencia_down:

				ld		a,(CANT_RESISTENCIA)
				cp		3
				jp		z,.a_2_resist
				cp		2
				jp		z,.a_1_resist
				
				jp		.esperamos_respuesta_de_nivel

.a_1_resist:

				ld		a,1
				ld		(CANT_RESISTENCIA),a
				jp		.esperamos_respuesta_de_nivel
	
.a_2_resist:

				ld		a,2
				ld		(CANT_RESISTENCIA),a
				jp		.esperamos_respuesta_de_nivel
		
.a_3_resist:

				ld		a,3
				ld		(CANT_RESISTENCIA),a
				jp		.esperamos_respuesta_de_nivel
			
.opcion_derecha_de_nivel:

				ld		a,(CONFIRM_NO_ST)
				or		a
				jp		nz,.esperamos_respuesta_de_nivel
				ld		a,1
				ld		(CONFIRM_NO_ST),a
				
				ld		a,(OPCION_NIVEL)
				cp		1
				jp		z,.cambiamos_nivel_acciones_up
				cp		2
				jp		z,.cambiamos_nivel_pyv_up
				cp		3
				jp		z,.cambiamos_nivel_sucesos_up
				cp		4
				jp		z,.cambiamos_nivel_recoger_up
				cp		5
				jp		z,.cambiamos_nivel_reforzar_up
				cp		6
				jp		z,.cambiamos_nivel_resistencia_up

.cambiamos_nivel_movimiento_up:

				ld		a,(CANT_MOVIMIENTO)
				cp		12
				jp		z,.a_8_movim
				cp		8
				jp		z,.a_6_movim
				
				jp		.esperamos_respuesta_de_nivel
								
.cambiamos_nivel_acciones_up:

				ld		a,(CANT_ACCIONES)
				cp		4
				jp		z,.a_3_accion
				cp		3
				jp		z,.a_2_accion
				
				jp		.esperamos_respuesta_de_nivel
				
.cambiamos_nivel_pyv_up:

				ld		a,(CANT_VP_A_ABRIR)
				cp		18
				jp		z,.a_35_pv
				cp		3
				jp		z,.a_18_pv
				
				jp		.esperamos_respuesta_de_nivel
				
.cambiamos_nivel_sucesos_up:

				ld		a,(CANT_SUCESOS)
				cp		80
				jp		z,.a_100_sucesos
				cp		100
				jp		z,.a_127_sucesos
				
				jp		.esperamos_respuesta_de_nivel

.cambiamos_nivel_recoger_up:

				ld		a,(CANT_MADERA_CONSEGUIR)
				cp		8
				jp		z,.a_6_recog
				cp		12
				jp		z,.a_8_recog
				
				jp		.esperamos_respuesta_de_nivel
				
.cambiamos_nivel_reforzar_up:

				ld		a,(CANT_REFORZAR)
				cp		8
				jp		z,.a_6_refor
				cp		12
				jp		z,.a_8_refor
				
				jp		.esperamos_respuesta_de_nivel
				
.cambiamos_nivel_resistencia_up:

				ld		a,(CANT_RESISTENCIA)
				cp		1
				jp		z,.a_2_resist
				cp		2
				jp		z,.a_3_resist
				
				jp		.esperamos_respuesta_de_nivel
								
.opcion_arriba_de_nivel:

				ld		a,(CONFIRM_NO_ST)
				or		a
				jp		nz,.esperamos_respuesta_de_nivel
				ld		a,1
				ld		(CONFIRM_NO_ST),a
				
				ld		a,(OPCION_NIVEL)
				dec		a
				ld		(OPCION_NIVEL),a
				cp		255
				jp		nz,VALORES_LETRAS_DE_NIVEL
				ld		a,6
				ld		(OPCION_NIVEL),a
				jp		VALORES_LETRAS_DE_NIVEL
				
.opcion_abajo_de_nivel:

				ld		a,(CONFIRM_NO_ST)
				or		a
				jp		nz,.esperamos_respuesta_de_nivel
				ld		a,1
				ld		(CONFIRM_NO_ST),a
				
				ld		a,(OPCION_NIVEL)
				inc		a
				ld		(OPCION_NIVEL),a
				cp		7
				jp		nz,VALORES_LETRAS_DE_NIVEL
				xor		a
				ld		(OPCION_NIVEL),a
				jp		VALORES_LETRAS_DE_NIVEL
								
.escoge_idioma:

				ld		a,30
				ld		(LIMITE_PARON),a
				
				ld		a,(IDIOMA)
				inc		a
				and		00000001B
				ld		(IDIOMA),a
				jp		VALORES_LETRAS.idioma
				
.escoge_equipo:

				ld		a,30
				ld		(LIMITE_PARON),a
				
				jp	.esperamos_respuesta

.opcion_arriba:
				
				ld		a,(CONFIRM_NO_ST)
				or		a
				jp		nz,.esperamos_respuesta
				ld		a,1
				ld		(CONFIRM_NO_ST),a
				
				ld		a,30
				ld		(LIMITE_PARON),a	
							
				ld		a,(OPCION_MENU)
				dec		a
				ld		(OPCION_MENU),a
				cp		255
				jp		nz,VALORES_LETRAS
				ld		a,3
				ld		(OPCION_MENU),a
				jp		VALORES_LETRAS
				
.opcion_abajo:


				
				ld		a,(CONFIRM_NO_ST)
				or		a
				jp		nz,.esperamos_respuesta
				ld		a,1
				ld		(CONFIRM_NO_ST),a
				
				ld		a,30
				ld		(LIMITE_PARON),a
								
				ld		a,(OPCION_MENU)
				inc		a
				ld		(OPCION_MENU),a
				cp		4
				jp		nz,VALORES_LETRAS
				xor		a
				ld		(OPCION_MENU),a
				jp		VALORES_LETRAS

VALORES_LETRAS:
				
				cp		1
				jp		z,.nivel
				cp		2
				jp		z,.idioma
				cp		3
				jp		z,.equipo
				
.empezar:

				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de

				ld		a,31
				ld		(variable_circunstanc),a
				ld		a,(IDIOMA)
				or		a
				jp		z,.empezar_castellano

.empezar_ingles:
				
				ld		hl,DATA_EMPEZAR_I
				jp		.bucle
				
.empezar_castellano:
				
				ld		hl,DATA_EMPEZAR
				jp		.bucle
			
.nivel:

				ld		a,30
				ld		(LIMITE_PARON),a
				
				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de

				ld		a,31
				ld		(variable_circunstanc),a
				ld		a,(IDIOMA)
				or		a
				jp		z,.nivel_castellano

.nivel_ingles:
				
				ld		hl,DATA_NIVEL_I
				jp		.bucle
				
.nivel_castellano:
				
				ld		hl,DATA_NIVEL
				jp		.bucle
				
.idioma:	
				
				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de

				ld		a,31
				ld		(variable_circunstanc),a
				ld		a,(IDIOMA)
				or		a
				jp		z,.idioma_castellano

.idioma_ingles:
				
				ld		hl,DATA_IDIOMA_I
				jp		.bucle
				
.idioma_castellano:
				
				ld		hl,DATA_IDIOMA
				jp		.bucle
				
.equipo:
				
				ld		ix,LETRAS_SPRITES
				ld		de,6
				add		ix,de

				ld		a,31
				ld		(variable_circunstanc),a
				ld		a,(IDIOMA)
				or		a
				jp		z,.equipo_castellano

.equipo_ingles:
				
				ld		hl,DATA_EQUIPO_I
				jp		.bucle
				
.equipo_castellano:
				
				ld		hl,DATA_EQUIPO
				jp		.bucle
								
.bucle:

				push	ix
				pop		de								
				ld		bc,2											
				ldir
				ld		de,12
				add		ix,de
				ld		a,(variable_circunstanc)
				dec		a
				ld		(variable_circunstanc),a
				or		a
				jp		nz,.bucle
				jp		MENU.esperamos_respuesta
				
VALORES_LETRAS_DE_NIVEL:

				cp		1
				jp		z,.acciones
				cp		2
				jp		z,.puertas_y_ventanas
				cp		3
				jp		z,.sucesos
				cp		4
				jp		z,.coge_madera
				cp		5
				jp		z,.refuerza
				cp		6
				jp		z,.fuerza_puertas
				
.movimiento:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,47
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel
				
.acciones:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,48
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel

.puertas_y_ventanas:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,49
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel
				
.sucesos:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,50
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel

.coge_madera:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,51
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel

.refuerza:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,52
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel

.fuerza_puertas:

				ld		ix,LETRAS_SPRITES
				ld		de,12*27+9
				add		ix,de
				ld		a,53
				ld		(ix),a
				jp		MENU.esperamos_respuesta_de_nivel

.bucle_de_nivel:
				
				push	ix
				pop		de								
				ld		bc,2											
				ldir
				ld		de,12
				add		ix,de
				ld		a,(variable_circunstanc)
				dec		a
				ld		(variable_circunstanc),a
				or		a
				jp		nz,.bucle_de_nivel
				jp		MENU.esperamos_respuesta_de_nivel

NUMEROS_DE_NIVELES:

				ld		a,(OPCION_NIVEL)
				cp		1
				jp		z,.acciones
				cp		2
				jp		z,.puertas_y_ventanas
				cp		3
				jp		z,.sucesos
				cp		4
				jp		z,.coge_madera
				cp		5
				jp		z,.refuerza
				cp		6
				jp		z,.fuerza_puertas
				
.movimiento:
				
				ld		a,(CANT_MOVIMIENTO)
				cp		8
				jp		z,.numeros_a_2
				CP		12
				jp		z,.numeros_a_1
				jp		.numeros_a_3
								
.acciones:
				
				ld		a,(CANT_ACCIONES)
				cp		3
				jp		z,.numeros_a_2
				CP		4
				jp		z,.numeros_a_1
				jp		.numeros_a_3
								

.puertas_y_ventanas:
							
				ld		a,(CANT_VP_A_ABRIR)
				cp		18
				jp		z,.numeros_a_2
				CP		35
				jp		z,.numeros_a_3
				jp		.numeros_a_1
											
.sucesos:
				
				ld		a,(CANT_SUCESOS)
				cp		100
				jp		z,.numeros_a_2
				CP		127
				jp		z,.numeros_a_3
				jp		.numeros_a_1				

.coge_madera:
				
				ld		a,(CANT_MADERA_CONSEGUIR)
				cp		8
				jp		z,.numeros_a_2
				CP		12
				jp		z,.numeros_a_1
				jp		.numeros_a_3			

.refuerza:
				
				ld		a,(CANT_REFORZAR)
				cp		8
				jp		z,.numeros_a_2
				CP		12
				jp		z,.numeros_a_1
				jp		.numeros_a_3				

.fuerza_puertas:
				
				ld		a,(CANT_RESISTENCIA)
				cp		2
				jp		z,.numeros_a_2
				CP		3
				jp		z,.numeros_a_3
				jp		.numeros_a_1

.numeros_a_1:

				ld		ix,LETRAS_SPRITES
				ld		de,12*28+9
				add		ix,de
				ld		a,38
				ld		(ix),a

				ret
												
.numeros_a_2:

				ld		ix,LETRAS_SPRITES
				ld		de,12*28+9
				add		ix,de
				ld		a,39
				ld		(ix),a

				ret

.numeros_a_3:

				ld		ix,LETRAS_SPRITES
				ld		de,12*28+9
				add		ix,de
				ld		a,40
				ld		(ix),a

				ret
																								
ANIMACION_DE_LETRAS:

				ld		b,31

				ld		a,(LIMITE_PARON)
				dec		a
				ld		(LIMITE_PARON),a
				cp		#FF
				jp		nz,.bucle_1
				
				xor		a
				ld		(LIMITE_PARON),a
			
.bucle_1:
				
				ld		a,b
				dec		a				
				ld		ix,LETRAS_SPRITES
				ld		e,a
				ld		d,0
[12]			add		ix,de

				ld		a,(ix)
				and		00000011B
				ld		(ix),a
				ld		a,(ix+2)
				and		00000011B
				ld		(ix+2),a

				ld		a,(ix+4)
				cp		239
				jp		nc,.rebotes_x
				cp		16
				jp		c,.rebotes_x
				ld		a,(ix+5)
				cp		196
				jp		nc,.rebotes_y
				cp		16
				jp		c,.rebotes_y
				jp		.revision_x

.rebotes_x:

				ld		a,(ix+1)
				inc		a
				and		00000001B
				ld		(ix+1),a
				jp		.revision_x
				
.rebotes_y:

				ld		a,(ix+3)
				inc		a
				and		00000001B
				ld		(ix+3),a
				jp		.revision_x
				
.revision_x:				

				ld		a,(LIMITE_PARON)
				or		a
				jp		nz,.revision_x_de_verdad
				ld		a,(ix+6)
				ld		(ix+4),a				
				
.revision_x_de_verdad:				

				ld		a,(ix+4)
				ld		c,(ix+6)
				cp		c
				jp		z,.revision_y  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				jp		c,.x_es_menor_que_destino

.x_es_mayor_que_destino:

				ld		a,(ix+1)
				or		a
				jp		nz,.x_mayor_pero_nos_alejamos

.x_mayor_nos_acercamos:

				ld		a,(ix)
				inc		a
				ld		(ix),a
				ld		c,(ix+10)
				cp		c
				jp		nz,.restamos_la_x
				dec		a
				ld		(ix),a
				jp		.restamos_la_x
				
.sumamos_la_x:
				
				ld		a,(ix+4)
				ld		c,(ix)
				add		c
				ld		(ix+4),a
	
				jp		.revision_y
				
.x_mayor_pero_nos_alejamos:

				ld		a,(ix)
[2]				dec		a
				ld		(ix),a
				cp		250
				jp		c,.sumamos_la_x
				xor		a
				ld		(ix+1),a
				jp		.revision_y
				
.restamos_la_x:
				
				ld		a,(ix+4)
				ld		c,(ix)
				sub		c
				ld		(ix+4),a					
 				jp		.revision_y				

.x_es_menor_que_destino:

				ld		a,(ix+1)
				or		a
				jp		z,.x_menor_pero_nos_alejamos

.x_menor_nos_acercamos:

				ld		a,(ix)
				inc		a
				ld		(ix),a
				ld		c,(ix+10)
				cp		c
				jp		nz,.sumamos_la_x
				dec		a
				ld		(ix),a
				jp		.sumamos_la_x
					
.x_menor_pero_nos_alejamos:

				ld		a,(ix)
[2]				dec		a
				ld		(ix),a
				cp		250
				jp		c,.restamos_la_x
				ld		a,1
				ld		(ix+1),a
				jp		.revision_y
								
.revision_y:				

				ld		a,(LIMITE_PARON)
				or		a
				jp		nz,.revision_y_de_verdad
				ld		a,(ix+7)
				ld		(ix+5),a	
				
.revision_y_de_verdad:
				
				ld		a,(ix+5)
				ld		c,(ix+7)
				cp		c
				jp		z,.pintamos_sprite  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;				
				jp		c,.y_es_menor_que_destino
				
.y_es_mayor_que_destino:

				ld		a,(ix+3)
				or		a
				jp		nz,.y_mayor_pero_nos_alejamos

.y_mayor_nos_acercamos:

				ld		a,(ix+2)
				inc		a
				ld		(ix+2),a
				ld		c,(ix+11)
				cp		c
				jp		nz,.restamos_la_y
				dec		a
				ld		(ix+2),a
				jp		.restamos_la_y
				
.sumamos_la_y:
				
				ld		a,(ix+5)
				ld		c,(ix+2)
				add		c
				ld		(ix+5),a		
				jp		.pintamos_sprite
				
.y_mayor_pero_nos_alejamos:

				ld		a,(ix+2)
[2]				dec		a
				ld		(ix+2),a
				cp		250
				jp		c,.sumamos_la_y
				xor		a
				ld		(ix+3),a
				jp		.pintamos_sprite
				
.restamos_la_y:
				
				ld		a,(ix+5)
				ld		c,(ix+2)
				sub		c
				ld		(ix+5),a
 				jp		.pintamos_sprite				

.y_es_menor_que_destino:

				ld		a,(ix+3)
				or		a
				jp		z,.y_menor_pero_nos_alejamos
				
.y_menor_nos_acercamos:

				ld		a,(ix+2)
				inc		a
				ld		(ix+2),a
				ld		c,(ix+11)
				cp		c
				jp		nz,.sumamos_la_y
				dec		a
				ld		(ix+2),a
				jp		.sumamos_la_y

.y_menor_pero_nos_alejamos:

				ld		a,(ix+2)
[2]				dec		a
				ld		(ix+2),a
				cp		250
				jp		c,.restamos_la_y
				ld		a,1
				ld		(ix+3),a
				jp		.pintamos_sprite
				
.pintamos_sprite:

				ld		hl,#fE00
				ld		a,b
				ld		e,a
				ld		d,0
				or		a
[4]				adc		hl,de
				ld		e,#03
				call	G9kSetVramWrite

				ld		a,(variable_circunstanc)
				inc		a
				and		00000111B
				ld		(variable_circunstanc),a
				or		a
				jp		nz,.pintando
				
				G9kWaitVsync

.pintando:
				
				ld		h,(ix+9)
				ld		l,(ix+5)
				call	OUT_ESCRIBE_UN_BYTE

				ld		h,(ix+8)
				ld		l,(ix+4)
				call	OUT_ESCRIBE_UN_BYTE
				
.revisamos_para_terminar_u_otro_sprite:
				
				ld		a,b
				dec		a
				or		a
				ld		b,a
				jp		nz,.bucle_1

				ret
				
SPRITES_MENU_A_VOLCAR:

						db			1,3,4,0,120,105,69,165,32,32,5,3
						db			1,4,5,0,120,105,89,165,32,4,5,4
						db			2,3,4,0,120,105,99,165,32,12,4,5
						db			1,4,5,0,120,105,109,165,32,16,5,4
						db			2,3,5,0,120,105,119,165,32,4,4,5
						db			2,4,5,0,120,105,129,165,32,26,4,4
						db			1,4,4,0,120,105,139,165,32,0,5,4
						db			2,3,4,0,120,105,149,165,32,18,4,5
						db			1,4,5,0,120,105,169,165,32,32,3,4				
						db			2,3,4,1,120,105,120,105,32,13,4,5				
						db			1,4,5,1,120,105,120,105,32,8,5,4				
						db			2,3,4,1,120,105,120,105,32,22,4,5				
						db			2,3,3,1,120,105,120,105,32,11,4,5				
						db			1,3,4,1,120,105,120,105,32,3,5,3				
						db			2,4,5,1,120,105,120,105,32,8,4,4				
						db			1,4,5,1,120,105,120,105,32,15,5,4				
						db			2,3,4,1,120,105,120,105,32,6,4,5				
						db			1,4,3,1,120,105,120,105,32,17,5,4				
						db			2,3,4,1,120,105,120,105,32,21,4,5				
						db			1,3,4,1,120,105,120,105,32,20,3,5				
						db			1,4,5,0,119,150,119,150,0,33,5,4				
						db			1,4,5,0,119,150,119,190,0,34,5,4				
						db			1,4,4,1,120,105,120,105,32,0,5,4				
						db			2,3,3,1,120,105,120,105,32,6,4,5
						db			2,3,4,1,120,105,120,105,32,11,4,5				
						db			1,4,5,0,120,105,120,105,32,19,5,4
						db			2,3,4,0,120,105,120,105,32,20,4,5

						db			1,4,4,0,120,105,120,105,32,47,5,4
						db			1,4,4,0,120,105,120,105,32,43,5,4
						db			2,3,4,0,120,105,120,105,32,36,4,5
						db			1,4,5,0,120,105,120,105,32,35,3,5					
							
DATA_EMPEZAR:

						db			069,165,089,165,099,165,108,165,119,165,129,165
						db			139,165,149,165,169,165,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,119,150,119,190,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105,120,105

DATA_EMPEZAR_I:

						db			079,165,120,105,120,105,120,105,120,105,120,105
						db			119,165,129,165,159,165,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,109,165,119,150,119,190,120,105,120,105
						db			120,105,099,165,139,165,120,105
						db			120,105,120,105,120,105
						
DATA_NIVEL:

						db			079,165,129,165,120,105,120,105,120,105,120,105
						db			120,105,120,105,159,165,099,165,109,165,119,165
						db			139,165,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,119,150,119,190,120,105,120,105			
						db			120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105
DATA_NIVEL_I:

						db			079,165,129,165,120,105,120,105,109,165,120,105
						db			120,105,120,105,159,165,120,105,120,105,119,165
						db			139,165,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,119,150,119,190,120,105,120,105	
						db			099,165,120,105,120,105,120,105
						db			120,105,120,105,120,105
				
DATA_IDIOMA:

						db			074,165,120,105,134,165,120,105,120,105,120,105
						db			144,165,120,105,164,165,120,105,094,165,120,105
						db			120,105,104,165,114,165,124,165,120,105,120,105
						db			120,105,120,105,119,150,119,190,120,105,120,105
						db			120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105

DATA_IDIOMA_I:

						db			064,165,154,165,120,105,120,105,120,105,120,105
						db			094,165,120,105,174,165,104,165,120,105,120,105
						db			084,165,120,105,120,105,120,105,114,165,120,105
						db			124,165,120,105,119,150,119,190,134,165,144,165
						db			120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105
				
DATA_EQUIPO:

						db			074,165,094,165,120,105,134,165,120,105,120,105
						db			120,105,120,105,164,165,120,115,124,165,120,105
						db			120,105,120,105,120,105,144,165,120,105,104,165
						db			114,165,120,105,119,150,119,190,120,105,120,105
						db			120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105

DATA_EQUIPO_I:

						db			084,165,114,165,134,165,120,105,120,105,120,105
						db			124,165,120,105,154,165,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,104,165,119,150,119,190,120,105,120,105
						db			120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105

TODA_LETRA_OUT:

						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105

DATA_CONTROL_NIVEL:
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,120,105,120,105,120,105,120,105
						db			120,105,120,105,119,150,119,190,120,105,120,105
						db			120,105,120,105,120,105,109,165,129,165
						db			089,165,149,165
																		
DATA_COLOR_INICIO:                                
                                                                
FADE_IN_PLANO_A:                                
                                
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,2,0,0,2,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,1,0,0,0,0,3,0,0,3,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,2,0,0,0,0,4,0,0,4,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,3,1,0,0,0,5,0,0,5,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,4,2,0,0,0,6,0,0,6,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,5,3,0,0,0,7,0,0,7,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,6,0,0,1,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,6,4,0,0,0,8,0,0,8,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,7,0,0,2,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,1,7,5,0,0,0,9,0,0,9,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,8,0,0,3,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,2,8,6,0,0,0,10,0,1,10,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,9,0,0,4,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,3,9,7,0,0,1,11,0,2,11,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,10,0,0,5,0,0,1,0,0,0,0,1,0,0
						db		0,0,0,0,0,4,10,8,1,0,2,12,0,3,12,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,11,0,0,6,0,0,2,0,0,0,0,2,0,0
						db		0,0,0,0,0,5,11,9,2,0,3,13,0,4,13,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,12,0,0,7,0,0,3,0,0,0,0,3,1,0
						db		0,0,1,0,0,6,12,10,3,0,4,14,0,5,14,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,13,0,0,8,0,0,4,0,0,0,1,4,2,0
						db		0,0,2,0,0,7,13,11,4,0,5,15,0,6,15,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
						db		0,0,14,0,0,9,0,0,5,0,0,0,2,5,3,1
						db		0,0,3,0,0,8,14,12,5,0,6,16,0,7,16,1
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0
						db		0,0,15,0,0,10,0,0,6,0,0,0,3,6,4,2
						db		0,0,4,0,0,9,15,13,6,0,7,17,0,8,17,2
										
						db		0,0,0,0,0,0,0,0,0,1,0,0,3,0,0,0
						db		1,0,16,0,0,11,0,0,7,1,0,0,4,7,5,3
						db		0,0,5,0,0,10,16,14,7,0,8,18,0,9,18,3
										
						db		0,0,0,0,0,0,0,0,0,2,0,0,4,0,0,0
						db		2,0,17,0,0,12,0,0,8,2,0,0,5,8,6,4
						db		0,1,6,0,0,11,17,15,8,0,9,19,0,10,19,4
										
						db		0,0,0,0,0,1,0,0,0,3,1,0,5,0,0,0
						db		3,0,18,0,0,13,1,0,9,3,0,0,6,9,7,5
						db		0,2,7,0,0,12,18,16,9,0,10,20,0,11,20,5
										
						db		0,0,0,0,0,2,1,1,0,4,2,0,6,1,0,0
						db		4,0,19,0,0,14,2,0,10,4,0,0,7,10,8,6
						db		0,3,8,0,0,13,19,17,10,0,11,21,1,12,21,6
										
						db		0,0,0,0,0,3,2,2,0,5,3,0,7,2,0,1
						db		5,0,20,0,1,15,3,0,11,5,0,0,8,11,9,7
						db		0,4,9,0,0,14,20,18,11,0,12,22,2,13,22,7
                                
FADE_OUT_PLANO_A:                                
                                
						db		0,0,0,0,0,2,1,1,0,4,2,0,6,1,0,0
						db		4,0,19,0,0,14,2,0,10,4,0,0,7,10,8,6
						db		0,3,8,0,0,13,19,17,10,0,11,21,1,12,21,6
										
						db		0,0,0,0,0,1,0,0,0,3,1,0,5,0,0,0
						db		3,0,18,0,0,13,1,0,9,3,0,0,6,9,7,5
						db		0,2,7,0,0,12,18,16,9,0,10,20,0,11,20,5
										
						db		0,0,0,0,0,0,0,0,0,2,0,0,4,0,0,0
						db		2,0,17,0,0,12,0,0,8,2,0,0,5,8,6,4
						db		0,1,6,0,0,11,17,15,8,0,9,19,0,10,19,4
										
						db		0,0,0,0,0,0,0,0,0,1,0,0,3,0,0,0
						db		1,0,16,0,0,11,0,0,7,1,0,0,4,7,5,3
						db		0,0,5,0,0,10,16,14,7,0,8,18,0,9,18,3
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0
						db		0,0,15,0,0,10,0,0,6,0,0,0,3,6,4,2
						db		0,0,4,0,0,9,15,13,6,0,7,17,0,8,17,2
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0
						db		0,0,14,0,0,9,0,0,5,0,0,0,2,5,3,1
						db		0,0,3,0,0,8,14,12,5,0,6,16,0,7,16,1
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,13,0,0,8,0,0,4,0,0,0,1,4,2,0
						db		0,0,2,0,0,7,13,11,4,0,5,15,0,6,15,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,12,0,0,7,0,0,3,0,0,0,0,3,1,0
						db		0,0,1,0,0,6,12,10,3,0,4,14,0,5,14,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,11,0,0,6,0,0,2,0,0,0,0,2,0,0
						db		0,0,0,0,0,5,11,9,2,0,3,13,0,4,13,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,10,0,0,5,0,0,1,0,0,0,0,1,0,0
						db		0,0,0,0,0,4,10,8,1,0,2,12,0,3,12,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,9,0,0,4,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,3,9,7,0,0,1,11,0,2,11,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,8,0,0,3,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,2,8,6,0,0,0,10,0,1,10,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,7,0,0,2,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,1,7,5,0,0,0,9,0,0,9,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,6,0,0,1,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,6,4,0,0,0,8,0,0,8,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,5,3,0,0,0,7,0,0,7,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,4,2,0,0,0,6,0,0,6,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,3,1,0,0,0,5,0,0,5,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,2,0,0,0,0,4,0,0,4,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,1,0,0,0,0,3,0,0,3,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,2,0,0,2,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
										
                                
FADE_IN_PLANO_B:                                
                                
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,1,0,0,2,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,2,0,0,3,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,3,0,0,4,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1
						db		0,0,1,0,0,1,0,1,1,0,4,1,0,5,1,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		2,0,0,2,0,0,1,0,0,2,0,0,2,0,0,2
						db		0,0,2,0,0,2,0,2,2,0,5,2,0,6,2,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		3,0,0,3,0,0,2,0,0,3,0,0,3,0,0,3
						db		0,0,3,0,0,3,0,3,3,0,6,3,0,7,3,0
										
						db		0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
						db		4,0,0,4,0,0,3,0,0,4,0,0,4,0,0,4
						db		0,0,4,0,1,4,0,4,4,0,7,4,0,8,4,0
										
						db		0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0
						db		5,0,0,5,0,0,4,0,0,5,0,0,5,0,0,5
						db		0,0,5,0,2,5,0,5,5,0,8,5,0,9,5,0
										
						db		0,0,0,0,0,0,3,0,0,0,0,0,1,0,0,0
						db		6,0,0,6,0,0,5,0,0,6,0,0,6,0,0,6
						db		0,1,6,0,3,6,0,6,6,0,9,6,0,10,6,0
										
						db		0,0,0,0,0,0,4,0,0,0,0,0,2,0,0,0
						db		7,0,0,7,0,0,6,0,0,7,0,0,7,0,0,7
						db		0,2,7,0,4,7,0,7,7,0,10,7,0,11,7,0
										
						db		0,0,0,1,0,0,5,0,0,0,0,0,3,0,0,0
						db		8,1,0,8,0,0,7,0,0,8,0,0,8,0,0,8
						db		0,3,8,0,5,8,0,8,8,0,11,8,0,12,8,0
										
						db		0,0,0,2,0,0,6,0,0,0,0,0,4,0,0,0
						db		9,2,0,9,0,0,8,0,0,9,0,0,9,0,1,9
						db		0,4,9,0,6,9,0,9,9,0,12,9,0,13,9,0
										
						db		0,0,0,3,0,0,7,0,0,1,0,0,5,0,0,0
						db		10,3,0,10,1,0,9,0,0,10,0,0,10,0,2,10
						db		0,5,10,0,7,10,0,10,10,0,13,10,0,14,10,0
										
						db		0,0,0,4,0,0,8,0,0,2,0,0,6,0,0,0
						db		11,4,0,11,2,0,10,0,0,11,1,0,11,0,3,11
						db		0,6,11,0,8,11,0,11,11,0,14,11,0,15,11,0
										
						db		0,0,0,5,0,0,9,0,0,3,0,0,7,0,0,0
						db		12,5,0,12,3,1,11,0,0,12,2,1,12,1,4,12
						db		0,7,12,0,9,12,0,12,12,0,15,12,0,16,12,0
										
						db		0,0,0,6,0,0,10,0,0,4,0,0,8,1,0,0
						db		13,6,0,13,4,2,12,0,0,13,3,2,13,2,5,13
						db		1,8,13,0,10,13,0,13,13,0,16,13,0,17,13,0
										
						db		0,0,0,7,0,0,11,0,0,5,0,0,9,2,0,0
						db		14,7,0,14,5,3,13,0,0,14,4,3,14,3,6,14
						db		2,9,14,0,11,14,0,14,14,0,17,14,0,18,14,0
										
						db		0,0,0,8,0,0,12,0,0,6,0,0,10,3,0,0
						db		15,8,0,15,6,4,14,0,0,15,5,4,15,4,7,15
						db		3,10,15,1,12,15,0,15,15,0,18,15,0,19,15,0
										
						db		0,0,0,9,0,0,13,0,0,7,0,0,11,4,0,0
						db		16,9,0,16,7,5,15,0,1,16,6,5,16,5,8,16
						db		4,11,16,2,13,16,1,16,16,0,19,16,0,20,16,0
										
						db		0,0,0,10,0,0,14,0,0,8,0,0,12,5,0,0
						db		17,10,1,17,8,6,16,0,2,17,7,6,17,6,9,17
						db		5,12,17,3,14,17,2,17,17,1,20,17,0,21,17,0
										
						db		0,0,0,11,0,0,15,0,0,9,0,0,13,6,0,0
						db		18,11,2,18,9,7,17,0,3,18,8,7,18,7,10,18
						db		6,13,18,4,15,18,3,18,18,2,21,18,0,22,18,0
										
						db		0,0,0,12,0,0,16,0,0,10,0,0,14,7,0,0
						db		19,12,3,19,10,8,18,0,4,19,9,8,19,8,11,19
						db		7,14,19,5,16,19,4,19,19,3,22,19,1,23,19,1
										
						db		0,0,0,13,0,0,17,0,0,11,0,0,15,8,0,0
						db		20,13,4,20,11,9,19,0,5,20,10,9,20,9,12,20
						db		8,15,20,6,17,20,5,20,20,4,23,20,2,24,20,2
										
						db		0,0,0,14,0,0,18,0,0,12,0,0,16,9,0,0
						db		21,14,5,21,12,10,20,0,6,21,11,10,21,10,13,21
						db		9,16,21,7,18,21,6,21,21,5,24,21,3,25,21,3
										
						db		0,0,0,15,0,0,19,0,0,13,1,0,17,10,0,0
						db		22,15,6,22,13,11,21,1,7,22,12,11,22,11,14,22
						db		10,17,22,8,19,22,7,22,22,6,25,22,4,26,22,4
										
						db		0,0,0,16,1,0,20,0,1,14,2,0,18,11,0,1
						db		23,16,7,23,14,12,22,2,8,23,13,12,23,12,15,23
						db		11,18,23,9,20,23,8,23,23,7,26,23,5,27,23,5
                                
FADE_OUT_PLANO_B:                                
                                
						db		0,0,0,15,0,0,19,0,0,13,1,0,17,10,0,0
						db		22,15,6,22,13,11,21,1,7,22,12,11,22,11,14,22
						db		10,17,22,8,19,22,7,22,22,6,25,22,4,26,22,4
FADE_OUT_PLANO_B_extra:										
						db		0,0,0,14,0,0,18,0,0,12,0,0,16,9,0,0
						db		21,14,5,21,12,10,20,0,6,21,11,10,21,10,13,21
						db		9,16,21,7,18,21,6,21,21,5,24,21,3,25,21,3
										
						db		0,0,0,13,0,0,17,0,0,11,0,0,15,8,0,0
						db		20,13,4,20,11,9,19,0,5,20,10,9,20,9,12,20
						db		8,15,20,6,17,20,5,20,20,4,23,20,2,24,20,2
										
						db		0,0,0,12,0,0,16,0,0,10,0,0,14,7,0,0
						db		19,12,3,19,10,8,18,0,4,19,9,8,19,8,11,19
						db		7,14,19,5,16,19,4,19,19,3,22,19,1,23,19,1
										
						db		0,0,0,11,0,0,15,0,0,9,0,0,13,6,0,0
						db		18,11,2,18,9,7,17,0,3,18,8,7,18,7,10,18
						db		6,13,18,4,15,18,3,18,18,2,21,18,0,22,18,0
										
						db		0,0,0,10,0,0,14,0,0,8,0,0,12,5,0,0
						db		17,10,1,17,8,6,16,0,2,17,7,6,17,6,9,17
						db		5,12,17,3,14,17,2,17,17,1,20,17,0,21,17,0
										
						db		0,0,0,9,0,0,13,0,0,7,0,0,11,4,0,0
						db		16,9,0,16,7,5,15,0,1,16,6,5,16,5,8,16
						db		4,11,16,2,13,16,1,16,16,0,19,16,0,20,16,0
										
						db		0,0,0,8,0,0,12,0,0,6,0,0,10,3,0,0
						db		15,8,0,15,6,4,14,0,0,15,5,4,15,4,7,15
						db		3,10,15,1,12,15,0,15,15,0,18,15,0,19,15,0
										
						db		0,0,0,7,0,0,11,0,0,5,0,0,9,2,0,0
						db		14,7,0,14,5,3,13,0,0,14,4,3,14,3,6,14
						db		2,9,14,0,11,14,0,14,14,0,17,14,0,18,14,0
										
						db		0,0,0,6,0,0,10,0,0,4,0,0,8,1,0,0
						db		13,6,0,13,4,2,12,0,0,13,3,2,13,2,5,13
						db		1,8,13,0,10,13,0,13,13,0,16,13,0,17,13,0
										
						db		0,0,0,5,0,0,9,0,0,3,0,0,7,0,0,0
						db		12,5,0,12,3,1,11,0,0,12,2,1,12,1,4,12
						db		0,7,12,0,9,12,0,12,12,0,15,12,0,16,12,0
										
						db		0,0,0,4,0,0,8,0,0,2,0,0,6,0,0,0
						db		11,4,0,11,2,0,10,0,0,11,1,0,11,0,3,11
						db		0,6,11,0,8,11,0,11,11,0,14,11,0,15,11,0
										
						db		0,0,0,3,0,0,7,0,0,1,0,0,5,0,0,0
						db		10,3,0,10,1,0,9,0,0,10,0,0,10,0,2,10
						db		0,5,10,0,7,10,0,10,10,0,13,10,0,14,10,0
										
						db		0,0,0,2,0,0,6,0,0,0,0,0,4,0,0,0
						db		9,2,0,9,0,0,8,0,0,9,0,0,9,0,1,9
						db		0,4,9,0,6,9,0,9,9,0,12,9,0,13,9,0
										
						db		0,0,0,1,0,0,5,0,0,0,0,0,3,0,0,0
						db		8,1,0,8,0,0,7,0,0,8,0,0,8,0,0,8
						db		0,3,8,0,5,8,0,8,8,0,11,8,0,12,8,0
										
						db		0,0,0,0,0,0,4,0,0,0,0,0,2,0,0,0
						db		7,0,0,7,0,0,6,0,0,7,0,0,7,0,0,7
						db		0,2,7,0,4,7,0,7,7,0,10,7,0,11,7,0
										
						db		0,0,0,0,0,0,3,0,0,0,0,0,1,0,0,0
						db		6,0,0,6,0,0,5,0,0,6,0,0,6,0,0,6
						db		0,1,6,0,3,6,0,6,6,0,9,6,0,10,6,0
										
						db		0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0
						db		5,0,0,5,0,0,4,0,0,5,0,0,5,0,0,5
						db		0,0,5,0,2,5,0,5,5,0,8,5,0,9,5,0
										
						db		0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
						db		4,0,0,4,0,0,3,0,0,4,0,0,4,0,0,4
						db		0,0,4,0,1,4,0,4,4,0,7,4,0,8,4,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		3,0,0,3,0,0,2,0,0,3,0,0,3,0,0,3
						db		0,0,3,0,0,3,0,3,3,0,6,3,0,7,3,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		2,0,0,2,0,0,1,0,0,2,0,0,2,0,0,2
						db		0,0,2,0,0,2,0,2,2,0,5,2,0,6,2,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		1,0,0,1,0,0,0,0,0,1,0,0,1,0,0,1
						db		0,0,1,0,0,1,0,1,1,0,4,1,0,5,1,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,3,0,0,4,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,2,0,0,3,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,1,0,0,2,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0
										
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
						db		0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

PALETA_SPRITES_MENU:

						db		#00,#00,#00,#09,#03,#03,#11,#02,#02,#09,#05,#06,#1F,#00,#00,#10
						db		#06,#0B,#1C,#02,#04,#1A,#04,#10,#1C,#0D,#0E,#1C,#0F,#17,#06,#18
						db		#17,#1F,#1F,#1F,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00,#00
