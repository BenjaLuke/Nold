PINTAMOS_MAPA_DE_SPRITES:
				
				push	ix												; Nos guardamos IX para no perder su dato

				xor		a												; BUCLE FOR SPRITE_BLOQUE_A_PINT = 1 TO SPRITES_EN_PANTALLA
				ld		(SPRITE_BLOQUE_A_PINT),a
				ld		(FLECHA_SI_NO),a
				ld		a,1
				ld		(NUM_SPRITE),a									; El primer sprite que se pinte será el 1

.vamos_a_mirar_personaje_por_personaje:
						
				ld		ix,PERSONAJE_1									; DEL SPRITE_BLOQUE_A_PINT MIRAMOS LA CASILLA EN LA QUE ESTÁ (IX E IX+1)
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Le sumamos SPRITE_BLOQUE_A_PINT multiplicado por 8
				ld		d,0
				ld		e,a
				ld		hl,0
				or		a
[8]				adc		hl,de
				push	hl
				pop		de
				add		ix,de											; Ahora IX apunta exactamente al primer byte del personaje que queremos cotejar en cuestión
				
				ld		b,(ix+1)										; Le damos a BC el valor de la casilla en la que está
				ld		c,(ix)
				
				ld		hl,(SEGUIMIENTO_CASILLA)						; MIRAMOS SI ESTÁ ENTRE (SEGUIMIENTO_CASILLA-803) Y (SEGUIMIENTO_CASILLA+712) (es decir 803+1+712=1516 casillas)
				ld		de,847
				or		a
				sbc		hl,de											; HL vale la primera casilla a la vista
				
				push	hl												; Lo convertimos en DE
				pop		de
						
				push	bc
				pop		hl												; HL vale la casilla en la que está el personaje a mirar
				push	hl
				push	de
				
				or		a
				sbc		hl,de											; Le restamos a la primera casilla a vista, la casilla del personaje. Si está por encima de la casilla a la vista, dará 0 o más (hasta 2024 max. Luego ya es por debajo de 0)
				
				ld		de,1517											; Comparando HL con DE con 	DCOMPR tendremos una reacción de C y Z igual que con 8 bits un CP
				call	DCOMPR
				jp		c,.esta_entre_esas_casillas
				
.no_esta_entre_esas_casillas:											; NO ESTÁ ENTRE ESAS CASILLAS

				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos mirando
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos a pintar


				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos mirando
				cp		63
				jp		nc,.final_frustrado

				ld		a,#CF											; Le ponemos un sprite imposible para identificarlo como fuera de pantalla
				ld		(ix+1),a

.final_frustrado:
								
				pop		ix
				pop		ix						
				jp		.final_de_bucle									; VAMOS A FIN DE BUCLE
								
.esta_entre_esas_casillas:												; SI ESTÁ ENTRE ESAS CASILLAS
				 
				ld		a,16											; Pasamos la página de la tabla de posiciones de sprites al puerto 2
				ld		[#7000],a

.miramos_si_coincide_en_habitacion:

				push	ix												; Vamos a grabar en los datos del sprite la habitación en la que está		
				ld		ix,PERSONAJE_1
				ld		a,(TURNO)
				ld		d,0
				ld		e,a
				ld		hl,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de
				ld		a,(ix+5)
				push	af

				ld		ix,PERSONAJE_1
				ld		a,(SPRITE_BLOQUE_A_PINT)
				ld		d,0
				ld		e,a
				ld		hl,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de
				ld		a,(ix+5)
				ld		b,a
				pop		af
				cp		b
				pop		ix
				jp		nz,.no_esta_entre_esas_casillas
											
.si_coincide:
				
				ld		ix,TABLA_POSICION_SPRITES						; SEGUIMIENTO_CASILLA-803 = 1 POR LO QUE CASILLA EN LA QUE ESTÁ ES = A X COMPROBAMOS ESA X EN LA LISTA
				pop		de												; Convertimos BC (casilla del personaje a mirar) en DE
				pop		hl
				or		a
				sbc		hl,de											; Casilla del personaje a mirar - (Casilla-803)
				push	hl
				pop		de
				or		a
				adc		hl,de											; Multiplicado por 2

				push	hl
				pop		de												; La volvemos a pasar a DE
				
				add		ix,de											; Ahora IX apunta directamente a las coordenadas que corresponden a la casilla en la que está
				
				ld		a,(ix)											; X e Y estarán en BC
				add		8
				ld		b,a
				ld		c,(ix+1)
								
				ld		a,(PAR_IMPAR_Y)									; Miramos la posible corrección de 4 pixeles según la posición del decorado
				or		a
				jp		nz,.seguimos_sin_correccion_impar

				ld		a,c
				sub		4
				ld		c,a
					
.seguimos_sin_correccion_impar:

				push	ix												; Salvamos IX
				
				ld		ix,ATRIBUTOS_1									; IX apunta ahora a la lista de atributos
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos mirando
				
				ld		d,0
				ld		e,a
				ld		hl,0
				
				or		a												; Se lo sumamos a HL (que vale 0)  multiplicado por 16
[8]				add		hl,de
				
				push	hl												; Convertimos HL en DE
				pop		de
				
				add		ix,de											; Ahora IX apunta exáctamente al primer byte de los atributos del sprite en cuestión	
				
				pop		de												; El antiguo IX ahora es DE
				push	ix												; Guardamos el valor de IX
				push	de												; Convertimos DE otra vez en IX
				pop		ix
							
				ld		a,(ix+1)										; Vamos a filtrar las rarezas
				cp		220												; Si Y es 220 significa que no hay que pintarlo
				jp		z,.prefinal_de_bucle
				ld		a,(ix)
				cp		255												; Si X es 255 significa que tampoco lo vamos a pintar
				jp		z,.prefinal_de_bucle
				cp		1												; Si X es 1, sólo pitamos el sprite 2
				jp		z,.solo_sprites_2
				
.rescatamos_las_coordenadas_para_dos_sprites:				

				pop		ix												; Recuperamos el IX con el que vamos a trabajar
				
				ld		a,b												; Ponemos los valor X e Y en los atributos adecuados
				ld		(ix+2),a
				ld		(ix+6),a
				
				ld		a,c
				ld		(ix),a
				add		16
				ld		(ix+4),a
			
				jp		.pintamos_el_sprite
				
.solo_sprites_2:

				pop		ix												; Recuperamos el IX con el que vamos a trabajar

				ld		a,b												; Ponemos los valor X e Y en los atributos adecuados
				dec		a
				ld		(ix+2),a
				ld		(ix+6),a
				
				ld		a,c
				ld		(ix+4),a
				
				ld		a,220	
				ld		(ix),a
				
				jp		.pintamos_el_sprite
				
.pintamos_el_sprite:	

				ld		a,31
				ld		[#7000],a
				
				call	POR_DELANTE_O_DETRAS_COSAS						; De el plano A
			
				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos mirando
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos a pintar

				cp		63
				jp		nc,.pintamos_el_sprite_2

				ld		a,(NUM_SPRITE)									; Salvamos el número de sprite que es
				ld		(ix+1),a

.pintamos_el_sprite_2:
				
				call	PINTA_SPRITE									; Pinta el sprite en pantalla	

				call	RECOLOCAMOS_SPRITES								; Por delante o detrás entre ellos
				
				ld		a,(NUM_SPRITE)									; SPRITE QUE VAMOS A PINTAR (DE 4 EN 4) AUMENTA PARA EL SIGUIENTE
				inc		a
				ld		(NUM_SPRITE),a
	
				jp		.final_de_bucle
				
.prefinal_de_bucle:

				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos mirando
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos a pintar

				cp		63
				jp		nc,.prefinal_de_bucle_salida
				
				ld		a,#FC											; Salvamos el número de sprite que es
				ld		(ix+1),a

.prefinal_de_bucle_salida:
				
				pop		ix												; Liberamos un IX guardado en la pila que nos va a molestar
				
.final_de_bucle:														; FINAL DE BUCLE
			
				ld		a,(SPRITE_BLOQUE_A_PINT)						; AUMENTAMOS EL BUCLE Y LO REPETIMOS SI NO HA LLEGADO A SU FINAL
				inc		a
				ld		(SPRITE_BLOQUE_A_PINT),a
				ld		b,a
				ld		a,(SPRITES_EN_PANTALLA)
				inc		a
				cp		b
				jp		nz,.vamos_a_mirar_personaje_por_personaje

.el_resto_de_sprites_a_0_220:											; DESDE SPRITE QUE VAMOS A PINTAR HASTA SPRITES EN PANTALLA POR 4 LOS PONEMOS EN Y 220
								
				ld		ix,ATRIBUTOS_1									; IX apunta ahora a la lista de atributos
				ld		a,(NUM_SPRITE)									; Vemos el sprite que estamos mirando
				dec		a

				ld		d,0
				ld		e,a
				ld		hl,0
				
				or		a												; Se lo sumamos a HL  multiplicado por 8 (atributos de 2 sprites)
[8]				add		hl,de
				
				ex		de,hl												; Convertimos HL en DE
				
				add		ix,de											; Ahora IX apunta exáctamente al primer byte de los atributos del sprite en cuestión	
				
				ld		a,220
				
				ld		(ix),a
				ld		(ix+4),a
								
				call	PINTA_SPRITE
															
				ld		a,(NUM_SPRITE)									; SPRITE QUE VAMOS A PINTAR (DE 4 EN 4) AUMENTA PARA EL SIGUIENTE
				inc		a
				ld		(NUM_SPRITE),a
				cp		206
				jp		nz,.el_resto_de_sprites_a_0_220
				
				ld		hl,#fE04
				ld		e,#03
				call	G9kSetVramWrite	
				ld		h,#dc
				ld		l,#dc
				call	OUT_ESCRIBE_UN_BYTE
							
				
											
.terminando:															; FIN
				
				pop		ix												; Recuperamos el IX que guardamos al principio de la secuencia
			
				xor		a
				
				ret														; Regresamos
					
PINTA_SPRITE:

				push	ix
				ld		hl,#fE00
				ld		a,(NUM_SPRITE)
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ld		e,#03
				call	G9kSetVramWrite

				ld		ix,ATRIBUTOS_1									; Puntero en el primer atributos
				ld		a,(SPRITE_BLOQUE_A_PINT)						; El sprite que toca que siempre es múltiplo de 2
				ld		e,a
				ld		d,0
				ld		hl,0
				or		a
[8]				adc		hl,de
				push	hl
				pop		de
				add		ix,de											; Ahora IX está apuntando al sprite que toca
				ld		b,4
				
.bucle:
				
				ld		h,(ix+1)
				ld		l,(ix)
				call	OUT_ESCRIBE_UN_BYTE

				ld		de,2
				add		ix,de
				djnz	.bucle
				
				pop		ix
				
				ret

RECOLOCAMOS_SPRITES:													; Aquí vemos si el sprite pintado colisiona con otro superior
																		; y le cambiamos las posiciones si es necesario.
				push	ix
				
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Si sólo es el primero que revisamos, no tiene sentido comparar con nada, así que nos vamos
				or		a
				jp		z,.final
				
				ld		hl,0											; IX va a valer la casilla en la que está el personaje que revisamos
				ld		d,0
				ld		e,a
				or		a
[8]				adc		hl,de
				push	hl
				pop		de
				ld		ix,PERSONAJE_1
				add		ix,de
				ld		l,(ix)
				ld		h,(ix+1)
				ld		(PERSONAJE_EN_ESTUDIO),hl						; Salvamos su casilla en esta variable para acceder rápidamente luego
							
				xor		a				
				ld		(SPRITE_A_RECOLOCAR),a							; El primer sprite con el que compararemos será el 0
				
.bucle_de_comparacion:

				ld		a,(SPRITE_A_RECOLOCAR)
				ld		hl,0											; IX valdrá la casilla del personaje con el que comparamos a cada ciclo
				ld		d,0
				ld		e,a
				or		a
[8]				adc		hl,de
				push	hl
				pop		de
				ld		ix,PERSONAJE_1
				add		ix,de
				ld		l,(ix)
				ld		h,(ix+1)

				ld		b,3												; Revisaremos 3 casillas que son las 3 que pueden colindar con el personaje de estudio
				
.bucle_de_revision_triple:				
				
				ld		de,45											; Cada 45 casilla hay una posible colisión
				or		a
				adc		hl,de
				ld		de,(PERSONAJE_EN_ESTUDIO)
				call	DCOMPR
				jp		z,.preintercambiamos							; Si el número de casilla coincide en cualquiera de las iteraciones, es que está en una casilla de colisión y es posible que haya que intercambiar

.final_de_bucle_de_revision_triple:
				
				djnz	.bucle_de_revision_triple
				
.cerramos_el_bucle:				
				
				ld		a,(SPRITE_A_RECOLOCAR)
				inc		a
				ld		(SPRITE_A_RECOLOCAR),a
				ld		b,a
				ld		a,(SPRITE_BLOQUE_A_PINT)
				inc		a
				cp		b
				jp		nz,.bucle_de_comparacion
				jp		.final

.preintercambiamos:
				
				push	ix
				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_A_RECOLOCAR)							; Vemos el sprite con el que hemos visto que colisiona
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(ix+1)										; Vemos si está en pantalla
				cp		#FF
				pop		ix
				jp		z,.final_de_bucle_de_revision_triple			; Si no lo está, seguimos la secuencia de la triple revisión
				
.intercambiamos:				

				push	ix
				
				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos comparando con el resto
				ld		(ORIGEN1),a
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(IX+1)										
				ld		(ORIGEN),a
				
				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_A_RECOLOCAR)							; Vemos el sprite que estamos comparando con el resto
				ld		(DESTINO1),a
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(IX+1)										
				ld		(DESTINO),a
								
				pop		ix
				
				
				call	RECOLOCA_SPRITE_EN_VRAM
				

				push	ix

				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos comparando con el resto
				ld		(DESTINO1),a
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(IX+1)										
				ld		(DESTINO),a
				
				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_A_RECOLOCAR)							; Vemos el sprite que estamos comparando con el resto
				ld		(ORIGEN1),a
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(IX+1)										
				ld		(ORIGEN),a
				
				pop		ix
				 				
				call	RECOLOCA_SPRITE_EN_VRAM	
				

				push	ix

				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos comparando con el resto
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(IX+1)										
				ld		b,a
				push	ix
				
				ld		ix,DATOS_PERSONAJE_1							; IX apunta ahora a la lista de datos de personajes
				ld		a,(SPRITE_A_RECOLOCAR)							; Vemos el sprite que estamos comparando con el resto
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ex		de,hl
				add		ix,de											; Ahora IX apunta a los datos de sprite que vamos intercambiar
				ld		a,(ix+1)										
				ld		(ix+1),b
				pop		ix							
				ld		(ix+1),a
				pop		ix
.final:

				ld		hl,#fE04
				ld		e,#03
				call	G9kSetVramWrite	
				ld		h,#dc
				ld		l,#dc
				call	OUT_ESCRIBE_UN_BYTE
				
				pop		ix
				ret

RECOLOCA_SPRITE_EN_VRAM:

				push	ix
				
				ld		hl,#fE00
				ld		a,(DESTINO)
				ld		e,a
				ld		d,0
				or		a
[8]				adc		hl,de
				ld		e,#03
				call	G9kSetVramWrite
				
				ld		ix,ATRIBUTOS_1
				ld		a,(ORIGEN1)
				ld		hl,0
				ld		e,a
				ld		d,0
[8]				add		ix,de

				ld		b,4
				
.bucle:
				
				ld		h,(ix+1)
				ld		l,(ix)
				call	OUT_ESCRIBE_UN_BYTE

				ld		de,2
				add		ix,de
				djnz	.bucle
				
				pop		ix
				
				ret
								
CUATRO_VALORES_2_SPRITES:

				ld		a,(ix+1)
				add		16
				ld		(ix+5),a

				ret
