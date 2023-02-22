HA_SUCEDIDO_ALGO:

				push	ix
				push	iy
				
.buscando_carta:
				
				ld		ix,BARAJA_DE_SUCESOS

.seguridad:

				ld		a,(ix)
				or		a
				jp		nz,.la_usamos
			
				ld		de,1
				add		ix,de
				
				jp		.seguridad
				
.buscando_una_por_una:

				ld		a,(ix)				
				or		a
				jp		nz,.la_usamos
			
				ld		de,1
				add		ix,de
				ld		a,(ix)
				cp		12
				jp		nz,.buscando_una_por_una
				
				ld		ix,BARAJA_DE_SUCESOS
				jp		.buscando_una_por_una
				
				
.la_usamos:
				
				push	af
				ld		a,0
				ld		(ix),a
							
				ld		a,31
				ld		[#7000],a
				pop		af
				
				ld		de,LISTA_DE_SUCESOS
				jp		LISTA_DE_OPCIONES				

APARECE_UN_ZOMBI:

				ld		a,1
				call	APARECEN_ZOMBIS.punto_con_cantidad_de_zombis_ya_seleccionados
				ld		iy,FRASE_DEMASIADO_RUIDO
				call	COMUN_EN_FRASES_DE_SIMBOLOS				
				jp		COMUN_FINAL_DE_SUCESOS
				
APARECEN_ZOMBIS_EN_GASOLINERA:

				ld		a,r												; Sumamos un número aleatorio entre 1 y 8 
				and		00000111B										; a la pila de zombis de la gasolinera
				inc		a				
				ld		b,a
				ld		a,(ZOMBIS_GASOLINERA)
				add		b
				and		01111111B										; La cantidad nunca será superior a 127
				ld		(ZOMBIS_GASOLINERA),a			
				
				
				ld		iy,FRASE_MASIFICACION_DE_ZOMBIS
				call	COMUN_EN_FRASES_DE_SIMBOLOS								
				jp		COMUN_FINAL_DE_SUCESOS
	
SERENIDAD:

				push	ix
				ld		ix,DATOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[8]				add		ix,de
			
.velocidad:
			
				ld		a,(ix)
				cp		8
				jp		nc,.velocidad_en_negativo

.velocidad_en_positivo:

				inc		a
				ld		(ix),a
				cp		3
				jp		nz,.v_n_s
				
				ld		a,2
				
				jp		.v_n_s
				

.velocidad_en_negativo:

[3]				rrc		a
				dec		a
[3]				rlc		a
				cp		7
				jp		nz,.v_n_s
				
				or		a
				
.v_n_s:
				
				ld		(ix),a

.ataque:
			
				ld		a,(ix+5)
				cp		8
				jp		nc,.ataque_en_negativo

.ataque_en_positivo:

				inc		a
				ld		(ix+5),a
				cp		3
				jp		nz,.a_n_s
				
				ld		a,2
				
				jp		.a_n_s

.ataque_en_negativo:

[3]				rrc		a
				dec		a
[3]				rlc		a
				jp		nz,.a_n_s
				
				or		a
				
.a_n_s:

				ld		(ix+5),a

.defensa:
			
				ld		a,(ix+6)
				cp		8
				jp		nc,.defensa_en_negativo

.defensa_en_positivo:

				inc		a
				ld		(ix+6),a
				cp		3
				jp		nz,.d_n_s
				
				ld		a,2
				
				jp		.d_n_s

.defensa_en_negativo:

[3]				rrc		a
				dec		a
[3]				rlc		a
				jp		nz,.d_n_s
				
				or		a
				
.d_n_s:

				ld		(ix+6),a

.final:
				
				pop		ix
													
				ld		iy,FRASE_LA_SANGRE_FRIA_TE_INVADE
				call	COMUN_EN_FRASES_DE_SIMBOLOS								
				jp		COMUN_FINAL_DE_SUCESOS
	
PASA_UNA_HORA:

				ld		a,(HORA)
				inc		a
				cp		24
				jp		nz,.pasa_una_hora_seguimos
				xor		a

.pasa_una_hora_seguimos:

				ld		(HORA),a
				
				ld		iy,FRASE_EL_TIEMPO_AVANZA
				call	COMUN_EN_FRASES_DE_SIMBOLOS								
				jp		COMUN_FINAL_DE_SUCESOS
	
PANICO:

				push	ix
				ld		ix,DATOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[8]				add		ix,de
			
.velocidad:
			
				ld		a,(ix)
				cp		8
				jp		nc,.velocidad_en_negativo

.velocidad_en_positivo:

				dec		a
				ld		(ix),a
				cp		255
				jp		nz,.v_n_s
				
				ld		a,8
				
				jp		.v_n_s

.velocidad_en_negativo:

[3]				rrc		a
				inc		a
[3]				rlc		a
				
				cp		24
				jp		nz,.v_n_s
				
				ld		a,16
				
.v_n_s:

				ld		(ix),a


.ataque:
			
				ld		a,(ix+5)
				cp		8
				jp		nc,.ataque_en_negativo

.ataque_en_positivo:

				dec		a
				ld		(ix+5),a
				cp		255
				jp		nz,.v_n_s
				
				ld		a,8
				
				jp		.a_n_s

.ataque_en_negativo:

[3]				rrc		a
				inc		a
[3]				rlc		a
				cp		24
				jp		nz,.a_n_s
				
				ld		a,16
				
.a_n_s:

				ld		(ix+5),a


.defensa:
			
				ld		a,(ix+6)
				cp		8
				jp		nc,.defensa_en_negativo

.defensa_en_positivo:

				dec		a
				ld		(ix+6),a
				cp		255
				jp		nz,.v_n_s
				
				ld		a,8
				
				jp		.d_n_s

.defensa_en_negativo:

[3]				rrc		a
				inc		a
[3]				rlc		a
				cp		24
				jp		nz,.d_n_s
				
				ld		a,16
				
.d_n_s:

				ld		(ix+6),a


.final:
				
				pop		ix
					
					
				ld		iy,FRASE_TE_PONES_NERVIOSO
				call	COMUN_EN_FRASES_DE_SIMBOLOS								
				jp		COMUN_FINAL_DE_SUCESOS
	
MUERTE_DE_KAREN:

				push	ix
				push	iy
				ld		a,(SPRITES_EN_PANTALLA)
				inc		a
				cp		200
				jp		c,.seguimos

				dec		a
.seguimos:
				
				ld		(SPRITES_EN_PANTALLA),a
		
				ld		ix,PERSONAJE_1											; IX está en la posicion del primer personaje
				ld		iy,ATRIBUTOS_1
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
				add		iy,de
				
				ld		de,8													; Ahora le añadimos 8 bytes a HL para que esté apuntando al sprite nuevo sobre el que trabajar
				add		ix,de													;Ahora IX apunta a ese nuevo sprite
				add		iy,de
				
				ld		hl,#882
				ld		(ix),l
				ld		(ix+1),h
				ld		a,12
				ld		(ix+5),a
				ld		a,1
				ld		(ix+7),a
				ld		(KAREN),a
				ld		a,2
				ld		(ix+2),a
				
				ld		a,45
				ld		(iy+1),a
				ld		a,45+16
				ld		(iy+5),a
				
				call	PINTAMOS_MAPA_DE_SPRITES				
				
.fin
				
				pop		iy
				pop		ix

				ld		iy,FRASE_EN_EL_SOTANO_KAREN_MUERE
				call	COMUN_EN_FRASES_DE_SIMBOLOS								
				jp		COMUN_FINAL_DE_SUCESOS
	
AGRESION:

				ld		ix,P_672
				ld		b,36
				
.bucle_de_revision:

.miramos_si_existe_y_cerrada_o_reforzada:

				ld		a,(ix)											; Si está destruída o cerrada, no hay que desgastarla
				and		11000000B
[2]				rlc		a
				cp		2
				jp		c,.final_de_bucle
				
.miramos_si_es_puerta_o_ventana:

				ld		a,(ix+2)										; Dependiendo de si es puerta o ventana, irá a una rutina o a otra
				and		01100000B
[3]				rlc		a
				cp		2
				jp		c,.vemos_si_esta_siendo_atacada_la_puerta
				
.vemos_si_esta_siendo_atacada_la_ventana:

				ld		a,(ix)											; Se compara con su valor inicial, (10) si es diferente es que está
				and		00111111B										; Siendo atacada (en la mayoría de los casos) y la desgastamos
				cp		10
				jp		z,.final_de_bucle								; Si no, pasamos a mirar la siguiente.
				jp		.descuento_comun_para_puertas_y_ventanas
				

				
.vemos_si_esta_siendo_atacada_la_puerta:

				ld		a,(ix)											; Se compara con su valor inicial, (20) si es diferente es que está
				and		00111111B										; Siendo atacada (en la mayoría de los casos) y la desgastamos
				cp		20
				jp		z,.final_de_bucle								; Si no, pasamos a mirar la siguiente.
				
.descuento_comun_para_puertas_y_ventanas:				

				dec		a
				ld		c,a
				ld		a,(ix)
				and		11000000B
				add		c
				ld		(ix),a
				
.final_de_bucle:
				
				ld		de,3
				add		ix,de
				djnz	.bucle_de_revision
				
				ld		iy,FRASE_ALGO_ALTERA_A_LOS_ZOMBIS
				call	COMUN_EN_FRASES_DE_SIMBOLOS											
				jp		COMUN_FINAL_DE_SUCESOS

MEJORA_HABILIDAD:

				push	ix
				ld		ix,DATOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[8]				add		ix,de
			
.coger_madera:
			
				ld		a,(ix+2)
				cp		8
				jp		nc,.coger_madera_en_negativo

.coger_madera_en_positivo:

				inc		a
				ld		(ix+2),a
				cp		3
				jp		nz,.p_m
				
				ld		a,2
				
				jp		.p_m
				

.coger_madera_en_negativo:

[3]				rrc		a
				dec		a
[3]				rlc		a
				cp		7
				jp		nz,.p_m
				
				or		a
				
.p_m:
				
				ld		(ix+2),a

.poner_madera:
			
				ld		a,(ix+3)
				cp		8
				jp		nc,.poner_madera_en_negativo

.poner_madera_en_positivo:

				inc		a
				ld		(ix+3),a
				cp		3
				jp		nz,.fin
				
				ld		a,2
				
				jp		.fin

.poner_madera_en_negativo:

[3]				rrc		a
				dec		a
[3]				rlc		a
				jp		nz,.fin
				
				or		a
				
.fin:

				ld		(ix+3),a
				
				pop		ix
				
				ld		iy,FRASE_MEJORA_HABILIDAD
				call	COMUN_EN_FRASES_DE_SIMBOLOS											
				jp		COMUN_FINAL_DE_SUCESOS

EMPEORA_HABILIDAD:

				push	ix
				ld		ix,DATOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[8]				add		ix,de
			
.coger_madera:
			
				ld		a,(ix+2)
				cp		8
				jp		nc,.coger_madera_en_negativo

.coger_madera_en_positivo:

				dec		a
				ld		(ix+2),a
				cp		255
				jp		nz,.p_m
				
				ld		a,8
				
				jp		.p_m

.coger_madera_en_negativo:

[3]				rrc		a
				inc		a
[3]				rlc		a
				
				cp		32
				jp		nz,.p_m
				
				ld		a,24
				
.p_m:

				ld		(ix+2),a


.poner_madera:
			
				ld		a,(ix+3)
				cp		8
				jp		nc,.poner_madera_en_negativo

.poner_madera_en_positivo:

				dec		a
				ld		(ix+3),a
				cp		255
				jp		nz,.fin
				
				ld		a,8
				
				jp		.fin

.poner_madera_en_negativo:

[3]				rrc		a
				inc		a
[3]				rlc		a
				cp		32
				jp		nz,.fin
				
				ld		a,24

.fin:

				ld		(ix+3),a

				pop		ix
								
				ld		iy,FRASE_EMPEORA_HABILIDAD
				call	COMUN_EN_FRASES_DE_SIMBOLOS											
				jp		COMUN_FINAL_DE_SUCESOS

MEJORA_RECURSOS:

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+2)
				add		a
				ld		(ix+2),a
				
				ld		a,(ix+11)
				add		a
				ld		(ix+11),a
				
				pop		ix
				
				ld		iy,FRASE_MEJORA_HABILIDAD
				call	COMUN_EN_FRASES_DE_SIMBOLOS											
				jp		COMUN_FINAL_DE_SUCESOS

EMPEORA_RECURSOS:

				push	ix
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+2)
				srl		a
				ld		(ix+2),a
				
				ld		a,(ix+11)
				srl		a
				ld		(ix+11),a
				
				pop		ix
				
				ld		iy,FRASE_EMPEORA_HABILIDAD
				call	COMUN_EN_FRASES_DE_SIMBOLOS											
				jp		COMUN_FINAL_DE_SUCESOS

SE_ACABO:


				
COMUN_FINAL_DE_SUCESOS:
				
				pop		iy
				pop		ix
				
				ret
