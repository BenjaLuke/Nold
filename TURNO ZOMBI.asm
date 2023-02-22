TURNO_DE_ZOMBIS:

				push	ix
				push	iy

				ld		iy,FRASE_TURNO_ZOMBI
				call	COMUN_EN_FRASES_DE_SIMBOLOS	

.restando_madera:


				ld		ix,ZOMBI_1								; En cada IX miraremos si tiene cerca una IY
				ld		iy,P_672
				
				ld		a,(SPRITES_EN_PANTALLA)	; Miraremos tantos zombis como hay activos en este momento
				sub		5
				ld		b,a
								
.bucle_revision_para_madera:
				
				
				ld		l,(ix)											; HL es la casilla en la que está el zombi
				ld		h,(ix+1)
				
				push	bc										; Salvamos la B para poder usarla en otro bucle DJNZ				
				ld		b,36

.bucle_revision_puertas_y_ventanas:

				ld		a,(iy+2)
				and		00011111B
				ld		d,a
				ld		e,(iy+1)

				call	DCOMPR
				call	z,.restamos_madera
				
				push	hl
				ex		de,hl
				ld		de,1
				or		a
				sbc		hl,de
				ex		de,hl
				pop		hl
				call	DCOMPR
				call	z,.restamos_madera
				
				push	hl
				ex		de,hl
				ld		de,43
				or		a
				sbc		hl,de
				ex		de,hl
				pop		hl
				call	DCOMPR
				call	z,.restamos_madera
				
				ld		de,3
				add		iy,de
				
				djnz	.bucle_revision_puertas_y_ventanas
				
				ld		de,8											; Colocamos el puntero en el siguiente zombi
				add		ix,de
				ld		iy,P_672
				
				pop		bc
				djnz	.bucle_revision_para_madera
				jp		.movimiento
				
.restamos_madera:


				ld		a,(iy)											; Está cerrada o reforzada?
				and		11000000B
[2]				rlc		a
				cp		2
				ret		c												; Si no lo está, regresamos
				
				
[2]				rrc		a												; Si lo está, descontamos madera
				ld		b,a
				ld		a,(iy)
				and		00111111B
				dec		a
				add		b
				ld		(iy),a
				
				and		00111111B										; Está en 0 de madera?
				or		a
				ret		nz												; Si no lo está, regresamos
			
				xor		a												; Si sí lo está,  Rompemos la puerta o ventana, la borramos en mapa variables y volvemos
				ld		(iy),a			

				push	de
				push	ix
				ld		a,(iy+2)
				and		00011111B
				ld		d,a
				ld		e,(iy+1)
				ld		ix,MAPA_DE_VARIABLES
				add		ix,de
				ld		a,8
				ld		(ix),a
				pop		ix
				pop		de		
				ret
				
.movimiento:

				ld		ix,ZOMBI_1
				ld		iy,ATR_ZOM_1
				
				ld		a,(SPRITES_EN_PANTALLA)
				sub		5
				or		a
				jp		z,.final
				ld		b,a
				
.bucle_general_de_revision:
				
				xor		a
				ld		(REVISIONES_ZOMBIS),a
				ld		(SALTO_OPCIONES),a

				call	GASOLINERA
				
				call	HUMANO_OLIDO									; Estas 4 opciones de la AI
				call	HUMANO											; están en orden inverso al de la importancia, ya que sólo marcan una dirección
				call	RESTO_HUMANO									; En la que moverse y predominará la última que se haya activado

				ld		a,15
				call	CAMBIA_PAGINA_2
				
				call	HUIR_FUEGO
				
				ld		a,47
				call	CAMBIA_PAGINA_2
				
				call	PUERTA_O_VENTANA
				
				ld		a,(SALTO_OPCIONES)
				or		a
				jp		nz,.resitua_la_capa
								
				call	DEAMBULAR

.resitua_la_capa
				
				ld		a,15
				ld		[#7000],a
				push	iy
				ld		iy,MAPA_CONSTANTES
				ld		e,(ix)
				ld		d,(ix+1)
				add		iy,de
				ld		a,(iy)
				and		11110000B
[4]				rlc		a
				inc		a
				pop		iy
				ld		(ix+5),a
				
.final_de_bucle:

				ld		de,8
				add		ix,de
				add		iy,de
				djnz	.bucle_general_de_revision
				
.final:

				xor		a
				ld		(TURNO),a
				
				pop		iy
				pop		ix
				
				ret
				
GASOLINERA:

				ret
				
HUMANO_OLIDO:

				push	iy
				push	bc
				
				ld		l,(ix)
				ld		h,(ix+1)
				ld		iy,RASTRO_1
				ex		de,hl
				
				ld		b,66
				
.bucle_de_rastros:
				
				ld		l,(iy)
				ld		h,(iy+1)
				call	DCOMPR
				jp		z,.seguimos_la_casilla
				
				push	de
				ld		de,2
				add		iy,de
				pop		de
				djnz	.bucle_de_rastros
				
.final:
				
				pop		bc
				pop		iy
				ret

.seguimos_la_casilla:

				ld		de,2
				add		iy,de
				push	iy
				pop		de
				
.delimita_rastro_1:
				
				ld		de,RASTRO_2
				call	DCOMPR
				jp		nz,.delimita_rastro_2
				
				ld		iy,RASTRO_1
				jp		.damos_nuevo_destino
				
.delimita_rastro_2:
				
				ld		de,RASTRO_3
				call	DCOMPR
				jp		nz,.delimita_rastro_3
				
				ld		iy,RASTRO_2
				jp		.damos_nuevo_destino
				
.delimita_rastro_3:
				
				ld		de,RASTRO_4
				call	DCOMPR
				jp		nz,.delimita_rastro_4
				
				ld		iy,RASTRO_3
				jp		.damos_nuevo_destino
				
.delimita_rastro_4:
				
				ld		de,RASTRO_5
				call	DCOMPR
				jp		nz,.delimita_rastro_5
				
				ld		iy,RASTRO_4
				jp		.damos_nuevo_destino
				
.delimita_rastro_5:
				
				ld		de,RASTRO_6
				call	DCOMPR
				jp		nz,.delimita_rastro_6
				
				ld		iy,RASTRO_5
				jp		.damos_nuevo_destino
				
.delimita_rastro_6:
				
				ld		de,FINAL_DE_RASTROS
				call	DCOMPR
				jp		nz,.damos_nuevo_destino
				
				ld		iy,RASTRO_6
				jp		.damos_nuevo_destino
				
.damos_nuevo_destino:

				ld		l,(iy)
				ld		h,(iy+1)
				ld		de,#ffff
				call	DCOMPR
				jp		z,.final
								
				push	hl
				pop		de
				
				ld		l,(ix)
				ld		h,(ix+1)
.norte:
				
				push	de
				ld		de,44
				or		a
				sbc		hl,de
				pop		de
				call	DCOMPR
				jp		nz,.oeste
				ld		a,1
				ld		(ix+2),a
				jp		.final

.oeste:
								
				push	de
				ld		de,43
				or		a
				adc		hl,de
				pop		de
				call	DCOMPR
				jp		nz,.este
				ld		a,4
				ld		(ix+2),a
				jp		.final
.este:

				push	de
				ld		de,2
				or		a
				adc		hl,de
				pop		de
				call	DCOMPR
				jp		nz,.sur
				ld		a,3
				ld		(ix+2),a
				jp		.final
.sur:

				push	de
				ld		de,43
				or		a
				adc		hl,de
				pop		de
				call	DCOMPR
				jp		nz,.final
				ld		a,2
				ld		(ix+2),a
				jp		.final				
				
												
												
HUMANO:

				push	iy
				push	bc
								
				ld		iy,PERSONAJE_1
				ld		hl,ANTORCHA
				ld		(DONDE_ESTA_ANTORCHA),hl
				
				ld		b,6
.todo_el_bucle:

				jp		.bucle_revision_cerca_de_humanos

.cierre_bucle:

				ld		de,8
				add		iy,de
				ld		hl,(DONDE_ESTA_ANTORCHA)
				ld		de,1
				or		a
				adc		hl,de
				ld		(DONDE_ESTA_ANTORCHA),hl
				
				djnz	.bucle_revision_cerca_de_humanos

.final:
								
				pop		bc
				pop		iy
				
				ret				
				
.bucle_revision_cerca_de_humanos:

				ld		l,(ix)
				ld		h,(ix+1)
				ld		e,(iy)
				ld		d,(iy+1)
				push	de
				ld		de,135
				or		a
				sbc		hl,de
				pop		de
				call	DCOMPR
				jp		z,.arriba_izquierda
				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha
								
				call	.siguiente_en_paralelo
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha
								
				call	.siguiente_en_paralelo
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.arriba_derecha
								
				call	.siguiente_en_paralelo
				call	DCOMPR
				jp		z,.izquierda	
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.izquierda	
				call	.siguiente_en_linea_salto
				call	DCOMPR
				jp		z,.derecha	
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.derecha	

				call	.siguiente_en_paralelo
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				

				call	.siguiente_en_paralelo
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha

				call	.siguiente_en_paralelo
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_izquierda				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha				
				call	.siguiente_en_linea
				call	DCOMPR
				jp		z,.abajo_derecha
				
				jp		.cierre_bucle
				
.siguiente_en_linea:

				push	de
				ld		de,1
				or		a
				adc		hl,de
				pop		de				
				
				ret

.siguiente_en_paralelo:

				push	de
				ld		de,38
				or		a
				adc		hl,de
				pop		de				
				
				ret

.siguiente_en_linea_salto:

				push	de
				ld		de,4
				or		a
				adc		hl,de
				pop		de				
				
				ret

.arriba_izquierda:

				ld		a,r
				and		00000001B
				or		a
				jp		z,.izquierda

.arriba:
				
				pop		bc
				pop		iy

				push	hl
				ld		hl,(DONDE_ESTA_ANTORCHA)
				ld		a,(hl)
				cp		2
				pop		hl
				jp		z,.abajo_abajo

.arriba_arriba:
				
				ld		a,1
				ld		(ix+2),a
				
				jp		DEAMBULAR.que_zombi_es_norte
				
.arriba_derecha:

				ld		a,r
				and		00000001B
				or		a
				jp		z,.arriba
				jp		.derecha

.izquierda:

				pop		bc
				pop		iy

				push	hl
				ld		hl,(DONDE_ESTA_ANTORCHA)
				ld		a,(hl)
				cp		2
				pop		hl
				jp		z,.derecha_derecha

.izquierda_izquierda:
				
				ld		a,4
				ld		(ix+2),a
				
				jp		DEAMBULAR.que_zombi_es_oeste
				
.derecha:

				pop		bc
				pop		iy

				push	hl
				ld		hl,(DONDE_ESTA_ANTORCHA)
				ld		a,(hl)
				cp		2
				pop		hl
				jp		z,.izquierda_izquierda

.derecha_derecha:
				
				ld		a,3
				ld		(ix+2),a
				
				jp		DEAMBULAR.que_zombi_es_este
				
.abajo_izquierda:

				ld		a,r
				and		00000001B
				or		a
				jp		z,.izquierda
				
.abajo:

				pop		bc
				pop		iy

				push	hl
				ld		hl,(DONDE_ESTA_ANTORCHA)
				ld		a,(hl)
				cp		2
				pop		hl
				jp		z,.arriba_arriba
				
.abajo_abajo:
								
				ld		a,2
				ld		(ix+2),a
				
				jp		DEAMBULAR.que_zombi_es_sur
				
.abajo_derecha:

				ld		a,r
				and		00000001B
				or		a
				jp		z,.abajo
				jp		.derecha
				
				ret
								
RESTO_HUMANO:

				ret				
								
PUERTA_O_VENTANA:

				push	iy
				push	bc
				ld		iy,P_672

				ld		b,36

.bucle_revision_cada_puerta_ventana:

				ld		l,(ix)
				ld		h,(ix+1)
				
				ld		a,(iy+2)
				and		00011111B
				ld		d,a
				ld		e,(iy+1)
				call	DCOMPR
				jp		z,.hay_algo_en_misma_casilla
				
				push	de
				ld		de,1
				or		a
				add		hl,de
				pop		de
				call	DCOMPR
				jp		z,.hay_algo_a_la_derecha
				
				push	de
				ld		de,43
				or		a
				add		hl,de
				pop		de
				call	DCOMPR
				jp		z,.hay_algo_abajo				
				
				ld		de,3
				add		iy,de
				djnz	.bucle_revision_cada_puerta_ventana
				
				pop		bc
				pop		iy
				ret
				
.hay_algo_en_misma_casilla:

				ld		a,(iy+2)
				and		10000000B
				or		a
				jp		nz,.mira_arriba
				jp		.mira_izquierda
						
.hay_algo_a_la_derecha:

				ld		a,(iy+2)
				and		10000000B
				or		a
				jp		nz,.sigue_como_si_nada
				jp		.mira_derecha
								
.hay_algo_abajo:

				ld		a,(iy+2)
				and		10000000B
				or		a
				jp		nz,.mira_abajo
				jp		.sigue_como_si_nada
				
.mira_arriba:

				ld		a,(iy)
				and		11000000B
[2]				rlc   	a
				cp		2
				jp		c,.sigue_como_si_nada

				ld		a,1
				ld		(ix+2),a
				
				ld		a,1
				ld		(SALTO_OPCIONES),a

				pop		bc
				pop		iy
				jp		DEAMBULAR.que_zombi_es_norte
				
.mira_abajo:
			
				ld		a,(iy)
				and		11000000B
[2]				rlc   	a
				cp		2
				jp		c,.sigue_como_si_nada

				ld		a,2
				ld		(ix+2),a
	
				ld		a,1
				ld		(SALTO_OPCIONES),a
				pop		bc
				pop		iy
				jp		DEAMBULAR.que_zombi_es_sur
				
.mira_izquierda:

				ld		a,(iy)
				and		11000000B
[2]				rlc   	a
				cp		2
				jp		c,.sigue_como_si_nada
				
				ld		a,4
				ld		(ix+2),a
				
				ld		a,1
				ld		(SALTO_OPCIONES),a
				pop		bc
				pop		iy
				jp		DEAMBULAR.que_zombi_es_oeste
				
.mira_derecha:
				
				ld		a,(iy)
				and		11000000B
[2]				rlc   	a
				cp		2
				jp		c,.sigue_como_si_nada
				
				ld		a,3
				ld		(ix+2),a
				
				ld		a,1
				ld		(SALTO_OPCIONES),a
				pop		bc
				pop		iy
				jp		DEAMBULAR.que_zombi_es_este
				
.sigue_como_si_nada:

				pop		bc
				pop		iy
				
				ret
																								
DEAMBULAR:
 
				ld		a,(REVISIONES_ZOMBIS)
				cp		5
				ret		z
				
				ld		a,(ix+2)
				cp		0
				jp		z,.asigno_direccion
				cp		1
				jp		z,.norte
				cp		2
				jp		z,.sur
				cp		3
				jp		z,.este
				cp		4
				jp		z,.oeste
				
.asigno_direccion:

				ld		a,(ix+5)
				cp		1
				jp		z,.se
				cp		9
				jp		z,.no
				
.se:

				ld		l,(ix)
				ld		h,(ix+1)
				ld		de,16*44
				call	DCOMPR
				jp		nc,.e

.s:
				ld		a,2
				ld		(ix+2),a
				jp		DEAMBULAR

.e:
				ld		a,3
				ld		(ix+2),a
				jp		DEAMBULAR
				
.no:

				ld		l,(ix)
				ld		h,(ix+1)
				ld		de,36*44
				call	DCOMPR
				jp		c,.o

.n:
				ld		a,1
				ld		(ix+2),a
				jp		DEAMBULAR

.o:
				ld		a,4
				ld		(ix+2),a
				jp		DEAMBULAR
				
.norte:
				
				call	.comun_cuatro_direcciones_1
				cp		2
				jp		z,.aleatorio_e_o
				cp		5
				jp		z,.aleatorio_e_o
				cp		6
				jp		z,.aleatorio_e_o

				push	hl												; evita a otros sprites
				ld		de,44
				or		a
				sbc		hl,de
				ld		(COMPARATIVA),hl
				push	bc
				call	ON_SPRITE_POSIBLES 
				pop		bc
				pop		hl
				cp		1
				jp		z,.aumenta_rutina
								
				ld		de,44
				or		a
				sbc		hl,de
				ld		(ix),l
				ld		(ix+1),h

.que_zombi_es_norte:
				
				ld		a,(ix+7)
				inc		a
				ld		de,LISTA_DE_ZOMBIS_NORTE
				jp		LISTA_DE_OPCIONES
				
.norte_karen:

				ld		a,47
				jp		APLICAMOS_EL_SPRITE_ADECUADO
					
.norte_zombi1:
				
				ld		a,42
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi2:
				
				ld		a,67
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi3:
				
				ld		a,71
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi4:
				
				ld		a,75
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi5:
				
				ld		a,79
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi6:
				
				ld		a,99
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi7:
				
				ld		a,102
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi8:
				
				ld		a,107
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi9:
				
				ld		a,111
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.norte_zombi10:
				
				ld		a,131
				jp		APLICAMOS_EL_SPRITE_ADECUADO
				
.sur:

				call	.comun_cuatro_direcciones_1
				cp		4
				jp		z,.aleatorio_e_o
				cp		7
				jp		z,.aleatorio_e_o
				cp		8
				jp		z,.aleatorio_e_o

				push	hl												; evita a otros sprites
				ld		de,44
				or		a
				adc		hl,de
				ld		(COMPARATIVA),hl
				push	bc
				call	ON_SPRITE_POSIBLES 
				pop		bc
				pop		hl
				cp		1
				jp		z,.aumenta_rutina
												
				ld		de,44
				or		a
				adc		hl,de
				ld		(ix),l
				ld		(ix+1),h

.que_zombi_es_sur:

				ld		a,(ix+7)
				inc		a
				ld		de,LISTA_DE_ZOMBIS_SUR
				jp		LISTA_DE_OPCIONES
				
.sur_karen:

				ld		a,45
				jp		APLICAMOS_EL_SPRITE_ADECUADO
					
.sur_zombi1:
				
				ld		a,40
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi2:
				
				ld		a,65
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi3:
				
				ld		a,69
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi4:
				
				ld		a,73
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi5:
				
				ld		a,77
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi6:
				
				ld		a,97
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi7:
				
				ld		a,100
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi8:
				
				ld		a,105
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi9:
				
				ld		a,109
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.sur_zombi10:
				
				ld		a,129
				jp		APLICAMOS_EL_SPRITE_ADECUADO
	
				
.este:

				call	.comun_cuatro_direcciones_1
				cp		1
				jp		z,.aleatorio_n_s
				cp		5
				jp		z,.aleatorio_n_s
				cp		8
				jp		z,.aleatorio_n_s

				push	hl												; evita a otros sprites
				ld		de,1
				or		a
				adc		hl,de
				ld		(COMPARATIVA),hl
				push	bc
				call	ON_SPRITE_POSIBLES 
				pop		bc
				pop		hl
				cp		1
				jp		z,.aumenta_rutina
								
				ld		de,1
				or		a
				adc		hl,de
				ld		(ix),l
				ld		(ix+1),h

.que_zombi_es_este:

				ld		a,(ix+7)
				inc		a
				ld		de,LISTA_DE_ZOMBIS_ESTE
				jp		LISTA_DE_OPCIONES
				
.este_karen:

				ld		a,46
				jp		APLICAMOS_EL_SPRITE_ADECUADO
					
.este_zombi1:
				
				ld		a,41
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi2:
				
				ld		a,66
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi3:
				
				ld		a,70
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi4:
				
				ld		a,74
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi5:
				
				ld		a,78
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi6:
				
				ld		a,98
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi7:
				
				ld		a,102
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi8:
				
				ld		a,105
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi9:
				
				ld		a,110
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.este_zombi10:
				
				ld		a,130
				jp		APLICAMOS_EL_SPRITE_ADECUADO
				
.oeste:

				call	.comun_cuatro_direcciones_1
				cp		3
				jp		z,.aleatorio_n_s
				cp		6
				jp		z,.aleatorio_n_s
				cp		7
				jp		z,.aleatorio_n_s

				push	hl												; evita a otros sprites
				ld		de,1
				or		a
				sbc		hl,de
				ld		(COMPARATIVA),hl
				push	bc
				call	ON_SPRITE_POSIBLES 
				pop		bc
				pop		hl
				cp		1
				jp		z,.aumenta_rutina
								
				ld		de,1
				or		a
				sbc		hl,de
				ld		(ix),l
				ld		(ix+1),h

.que_zombi_es_oeste:

				ld		a,(ix+7)
				inc		a
				ld		de,LISTA_DE_ZOMBIS_OESTE
				jp		LISTA_DE_OPCIONES
				
.oeste_karen:

				ld		a,64
				jp		APLICAMOS_EL_SPRITE_ADECUADO
					
.oeste_zombi1:
				
				ld		a,43
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi2:
				
				ld		a,68
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi3:
				
				ld		a,72
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi4:
				
				ld		a,76
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi5:
				
				ld		a,96
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi6:
				
				ld		a,100
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi7:
				
				ld		a,104
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi8:
				
				ld		a,108
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi9:
				
				ld		a,128
				jp		APLICAMOS_EL_SPRITE_ADECUADO

.oeste_zombi10:
				
				ld		a,132
				jp		APLICAMOS_EL_SPRITE_ADECUADO	
								
.comun_cuatro_direcciones_1:


				ld		a,(REVISIONES_ZOMBIS)							; Si pasa por un punto de estos 5 veces, significa que ha intentado andar en todas direcciones sin conseguirlo
				inc		a
				ld		(REVISIONES_ZOMBIS),A

				ld		a,15
				ld		[#7000],a

				ld		l,(ix)
				ld		h,(ix+1)
								
				push	iy
				ld		iy,MAPA_CONSTANTES
				push	hl
				pop		de
				add		iy,de
				ld		a,(iy)
				pop		iy
				and		00001111B
				
				ret				

.aleatorio_n_s:

				ld		a,r
				and		00000001B
				or		a
				jp		z,.n
				cp		1
				jp		z,.s

.aleatorio_e_o:

				ld		a,r
				and		00000001B
				or		a
				jp		z,.e
				cp		1
				jp		z,.o

.aleatorio_n_s_e_o:

				ld		a,r
				and		00000011B
				or		a
				jp		z,.n
				cp		1
				jp		z,.s
				cp		2
				jp		z,.e
				cp		3
				jp		z,.o
				
.aumenta_rutina:

				ld		a,(ix+3)
				inc		a
				ld		(ix+3),a
				cp		6
				ret		nz
				xor		a
				ld		(ix+3),a
				jp		.aleatorio_n_s_e_o
				
APLICAMOS_EL_SPRITE_ADECUADO:

				ld		(iy+1),a
				add		16
				ld		(iy+5),a
				
				push	af
				ld		a,#E0
				ld		(iy+3),a
				ld		(iy+7),a
				pop		af
				
				ret
