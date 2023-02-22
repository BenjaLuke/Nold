COGE_UTENSILIOS:

				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				xor		a
				ld		(FLECHA_SI_NO),a

				ld		a,(ACCIONES_LIBRES)
				or		a
				jp		z,SIN_ACCIONES_LIBRES
								
				push	ix
				push	iy
				
				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		ix,A_669
				ld		iy,UTENSILIOS_A_669
				
.rarezas:

				ld		de,1173
				call	DCOMPR
				jp		z,.estanteria_sala_3
				
				jp		.seguimos_con_el_bucle
				
.estanteria_sala_3:

				ld		ix,E_1174
				jp		.miramos_si_es_baularmario_o_estanteriamesa
				
.seguimos_con_el_bucle:
				
				ld		b,21

.bucle_de_revision:
				
				ld		a,(ix+2)
				and		00001111B
				ld		d,a
				ld		e,(ix+1)
				
				push	de
				ld		de,44
				or		a
				sbc		hl,de
				pop		de
				call	DCOMPR
				jp		z,.miramos_si_es_baularmario_o_estanteriamesa
				push	de
				ld		de,43
				or		a
				adc		hl,de
				pop		de
				call	DCOMPR
				jp		z,.miramos_si_es_baularmario_o_estanteriamesa
				push	de
				ld		de,2
				or		a
				adc		hl,de
				pop		de
				call	DCOMPR
				jp		z,.miramos_si_es_baularmario_o_estanteriamesa	
				push	de
				ld		de,43
				or		a
				adc		hl,de
				pop		de
				call	DCOMPR
				jp		z,.miramos_si_es_baularmario_o_estanteriamesa
															
				ld 		de,3
				add		ix,de
				ld		de,4
				add		iy,de

				ld		hl,(SEGUIMIENTO_CASILLA)
				
				djnz	.bucle_de_revision
				
				jp		.nada_que_revisar
				
.miramos_si_es_baularmario_o_estanteriamesa:				

				ld		a,(ix+2)
				and		01000000B
[2]				rlc		a
				or		a
				jp		nz,.comparamos_objetos_con_posibles_de_coger

.miramos_si_esta_abierto:

				ld		a,(ix)
				and		11000000B
[2]				rlc		a				
				or		a
				jp		z,.nada_que_revisar
				cp		2
				jp		z,.esto_hay_que_abrirlo_antes
				
.miramos_si_esta_encarado:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				or		a
				jp		z,.miramos_si_esta_a_su_derecha

.miramos_si_esta_debajo:

				ld		hl,(SEGUIMIENTO_CASILLA)
				ld	    de,44
				or		a
				sbc		hl,de
				ld		a,(ix+2)
				and		00001111b
				ld		d,a
				ld		e,(ix+1)
				call	DCOMPR
				jp		nz,.no_puedes_desde_aqui
				jp		.comparamos_objetos_con_posibles_de_coger
				
.miramos_si_esta_a_su_derecha:

				ld		hl,(SEGUIMIENTO_CASILLA)
				ld	    de,1
				or		a
				sbc		hl,de
				ld		a,(ix+2)
				and		00001111b
				ld		d,a
				ld		e,(ix+1)
				call	DCOMPR
				jp		nz,.no_puedes_desde_aqui
				
.comparamos_objetos_con_posibles_de_coger:				
				
				push	ix
				ld		ix,FRASE
				push	ix
				pop		hl
				pop		ix
				ld		(DONDE_FRASE),hl
				
				ld		a,(ix)										; Si el estado es de desmantelamiento, es que se han acabado los objetos
				and		11000000B
[2]				rlc		a
				cp		3
				jp		z,.esto_esta_vacio
								
				ld		a,(ix+2)
				and		00110000B
[4]				rlc		a
				inc		a
				push	iy
				ld		iy,DATOS_PERSONAJE_1
				push	af
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[8]				add		iy,de
				ld		a,(iy+4)
				and		00001110B
				rrc		a	
				ld		b,a
				pop		af
				pop		iy
				cp		b
				jp		nc,.cogemos_los_utensilios_que_toca

.predomina_capacidad_del_armario:

				ld		b,a				
				
.cogemos_los_utensilios_que_toca:

				ld		a,(ix+2)
				and		00110000B
[4]				rlc		a

				push	iy
				pop		hl
				ld		(GUARDADO_DE_IY),hl
				
				ld		e,a
				ld		d,0
				add		iy,de											; IY apunta a la carta adecuada a mirar
				
				ld		a,(iy)
				or		a
				jp		z,.esto_esta_vacio
				
				push	af												; Borramos el utensilio (quitamos la carta del montón)
				xor		a
				ld		(iy),a
				pop		af
				
				push	bc
				call	LOCALIZA_UTENSILIO_Y_REPARTE

				ld		a,(ix+2)										; La cantidad de utensilios que tiene el objeto se reduce en 1
				and		00110000B
[4]				rlc		a
				
				dec		a
				and		00000011b										; Reducimos en uno la cantidad de utensilios que hay en el objeto
[4]				rlc		a
				ld		b,a
				ld		a,(ix+2)
				and		11001111B
				add		b				
				ld		(ix+2),a
				pop		bc	
				ld		hl,(GUARDADO_DE_IY)
				push	hl
				pop		iy
							
				djnz	.cogemos_los_utensilios_que_toca

				ld		hl,(DONDE_FRASE)
				push	hl
				pop		iy
				ld		hl,991
				ld		(iy),l
				ld		(iy+1),h
				
				push	ix
				ld		a,31
				ld		[#7000],a
				call	PINTA_DIBUJOS
				pop		ix
				
				ld		a,(ix+2)										; Si el número de objetos es 3 es que ha rotado. así que ya está vacio. desmantelamos el mueble 
				and		00110000B
[4]				rlc		a
				cp		3
				jp		nz,.ya_esta
				
				ld		a,(ix)											; Estado desmantelado
				or		11000000B
				ld		(ix),a
				ld		a,(ix+2)										; Sin objetos
				and		11001111B
				ld		(ix+2),a							
				
.ya_esta:
				
				ld		a,(ACCIONES_LIBRES)
				dec		a
				ld		(ACCIONES_LIBRES),a

				ld		a,(DADO_DEL_JUGADOR)
				dec		a
				ld		(DADO_DEL_JUGADOR),a
							
				jp		.salida

.esto_esta_vacio:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION

				
				jp		.salida
				
.no_puedes_desde_aqui:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
			
				jp		.salida
				
.esto_hay_que_abrirlo_antes:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
			
				jp		.salida
								
.nada_que_revisar:

				call	RUTINA_FRASE_INTERROGANTE
								
.salida:

				ld		iy,FRASE_VACIA
				call	PACK_FRASE_MARCADORES
								
				pop		iy
				pop		ix
				xor		a
				ret

RUTINA_FRASE_CHOCA_PERSONAJE:

				ld		iy,FRASE_CHOCA_PERSONAJE
				jp		COMUN_EN_FRASES_DE_SIMBOLOS
				
RUTINA_FRASE_INTERROGANTE:

				ld		iy,FRASE_INTERROGANTE
				jp		COMUN_EN_FRASES_DE_SIMBOLOS
				
RUTINA_FRASE_NO_FUNCIONA_LA_ACCION:

				ld		iy,FRASE_NO_FUNCIONA_LA_ACCION

COMUN_EN_FRASES_DE_SIMBOLOS:


				ld		a,31
				ld		[#7000],a
				call	PACK_FRASE
				ld		b,40
				call	PACK_ESPERA
				ld		iy,FRASE_VACIA
				jp		PACK_FRASE_MARCADORES		
										
LOCALIZA_UTENSILIO_Y_REPARTE:

				ld		iy,(DONDE_FRASE)
				ld		de,LISTA_DE_UTENSILIOS
				jp		LISTA_DE_OPCIONES

ENCUENTRA_BOTELLA:

				ld		hl,163
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl
				
				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix)
				inc		a
				ld		(ix),a
				pop		ix
				ret				
				
ENCUENTRA_CARGADOR:

				ld		hl,165
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+1)
				add		4
				ld		(ix+1),a
				pop		ix
				ret	
				
ENCUENTRA_CLAVOS:

				ld		hl,19
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+2)
				add		40
				ld		(ix+2),a
				pop		ix
				ret	

ENCUENTRA_CUCHILLO:

				ld		hl,83
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+3)
				inc		a
				ld		(ix+3),a
				pop		ix
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,6
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				ret	
				
ENCUENTRA_CUERDA:

				ld		hl,29
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+4)
				add		10
				ld		(ix+4),a
				pop		ix
				ret	
		
ENCUENTRA_ESCOPETA:

				ld		hl,93
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+5)
				inc		a
				ld		(ix+5),a
				pop		ix
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,10
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				ret	

ENCUENTRA_PALETA:

				ld		hl,157
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+6)
				add		10
				ld		(ix+6),a
				pop		ix

				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,5
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				ret	

ENCUENTRA_GASOLINA:

				ld		hl,219
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+7)
				add		5
				ld		(ix+7),a
				pop		ix
				ret	

ENCUENTRA_HACHA:

				ld		hl,101
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+8)
				add		10
				ld		(ix+8),a
				pop		ix
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,8
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				ret	

ENCUENTRA_MARTILLO:

				ld		hl,221
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+9)
				add		20
				ld		(ix+9),a
				pop		ix
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,7
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				ret	

ENCUENTRA_ZIPPO:

				ld		hl,283
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+10)
				add		5
				ld		(ix+10),a
				pop		ix
				ret	

ENCUENTRA_TRAPO:

				ld		hl,285
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+11)
				add		5
				ld		(ix+11),a
				pop		ix
				ret	

ENCUENTRA_PICO:

				ld		hl,99
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+12)
				add		20
				ld		(ix+12),a
				pop		ix
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,9
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
								
				ret	

ENCUENTRA_LLAVE:

				ld		hl,29
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,1
				ld		(ix+13),a
				pop		ix
				ret	

ENCUENTRA_ZOMBI:

				push	ix
				push	iy
				ld		a,(SPRITES_EN_PANTALLA)
				inc		a
				cp		200
				jp		nc,.fin
				ld		(SPRITES_EN_PANTALLA),a
		
				ld		ix,PERSONAJE_1											; IX está en la posicion del primer personaje
				ld		e,a														; DE vale la cantidad de sprites que hay en juego
				ld		d,0
				ld		hl,0
				or		a
[8]				adc		hl,de													; HL vale la cantidad de bytes que hay en total sobre sprites activos
				ld		e,b														; DE vale la cantidad de sprites nuevos añadidos
				ld		d,0
				or		a
[8]				sbc		hl,de													; Le restamos a HL la cantidad de bytes de los nuevos sprites y HL está ahora en la posición del último sprite antes de haber añadido nuevos
				ex		de,hl
				add		ix,de
				ld		de,8													; Ahora le añadimos 8 bytes a HL para que esté apuntando al sprite nuevo sobre el que trabajar
				add		ix,de													;Ahora IX apunta a ese nuevo sprite
				
				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		de,1
				or		a
				adc		hl,de
				
				ld		iy,PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[8]				add		iy,de
				ld		c,(iy+5)
				
				ld		(ix),l
				ld		(ix+1),h
				ld		(ix+5),c
				call	PINTAMOS_MAPA_DE_SPRITES				
				
.fin
				
				pop		iy
				pop		ix
				ld		hl,991
				ld		(iy),l
				ld		(iy+1),h
				ld		de,2
				add		iy,de
				push	iy
				pop		hl
				ld		(DONDE_FRASE),hl
				
				ret
