CIERRA_ABRE_COSAS:
				
				xor		a
				ld		(PUERTA_LEJANA),a								; Para ver si hay que pintar en la casilla lejana o no
				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		de,1250
				call	DCOMPR
				jp		z,NO_DESDE_ESTE_LADO
								
				ld		a,(ACCIONES_LIBRES)
				or		a
				jp		z,SIN_ACCIONES_LIBRES
				
				push	ix												; Salvamos IX para no interfereir en el proceso
				ld		ix,P_672										; IX ahora ahora vale la primera puerta
				ld		de,(SEGUIMIENTO_CASILLA)						; DE vale el número de casilla en la que está el jugador
				
				ld		hl,942
				call	DCOMPR
				jp		z,.pasa_por_todo_2

				ld		hl,2663
				call	DCOMPR
				jp		nz,.cierra_abre_cosas_1

				ld		de,1250
				
				ld		a,2
				ld		(CAPA_A_REPETIR),a
				ld		b,36											; Para revisar las 36 puertas y ventanas
				jp		.pasa_por_todo
				
.cierra_abre_cosas_1:
																		; Para revisar las 36 puertas y ventanas
				xor		a
				ld		(CAPA_A_REPETIR),a
				ld		b,36											; Para revisar las 36 puertas y ventanas

.pasa_por_todo:
				

				call	.bucle_de_revision_1

.pasa_por_todo_2:

				ld		hl,(SEGUIMIENTO_CASILLA)						; DE vale el número de casilla en la que está el jugador
				ld		de,1
				or		a
				sbc		hl,de
				ex		de,hl
				
				ld		ix,A_669										; IX ahora ahora vale el primer armario							
				ld		b,12											; Para revisar las 12 armarios y baules
				xor		a
				ld		(CAPA_A_REPETIR),a
								
				call	.bucle_de_revision_4

				ret
				
.bucle_de_revision_1:
				
				ld		a,(ix+2)										; A vale una parte del número de casilla en la que está la  puerta/ventana a revisar
				and		00011111B										; Le quitamos los valores que no interesan
				ld		h,a
				ld		l,(ix+1)										; Ahora HL vale el número de casilla en la que está la puerta/ventana
				call	DCOMPR											; Las comparamos						
				jp		z,.abierta_o_cerrada							; Si coincide, ya hemos dado con una, así que vamos a ver qué hacemos con ella
				
				push	de												; Guardamos DE para que luego siga valiendo el numero de casilla del jugador
				ld		de,3											; Le sumamos a IX 3 bytes para mirar la siguiente ventana/puerta
				add		ix,de
				pop		de												; Recuperamos DE
				djnz	.bucle_de_revision_1

				ex		de,hl
				ld		de,1
				or		a
				add		hl,de
				ex		de,hl

				ld		ix,P_672										; IX ahora ahora vale la primera puerta			
				ld		b,36											; Para revisar las 36 puertas y ventanas
				ld		a,1
				ld		(CAPA_A_REPETIR),a
				
.bucle_de_revision_2:
				
				ld		a,(ix+2)										; A vale una parte del número de casilla en la que está la  puerta/ventana a revisar
				and		00011111B										; Le quitamos los valores que no interesan
				ld		h,a
				ld		l,(ix+1)										; Ahora HL vale el número de casilla en la que está la puerta/ventana
				call	DCOMPR											; Las comparamos						
				jp		z,.abierta_o_cerrada							; Si coincide, ya hemos dado con una, así que vamos a ver qué hacemos con ella
				
				push	de												; Guardamos DE para que luego siga valiendo el numero de casilla del jugador
				ld		de,3											; Le sumamos a IX 3 bytes para mirar la siguiente ventana/puerta
				add		ix,de
				pop		de												; Recuperamos DE
				djnz	.bucle_de_revision_2

				ex		de,hl
				ld		de,43
				or		a
				add		hl,de
				ex		de,hl

				ld		ix,P_672										; IX ahora ahora vale la primera puerta							
				ld		b,36											; Para revisar las 36 puertas y ventanas
				ld		a,2
				ld		(CAPA_A_REPETIR),a
			
.bucle_de_revision_3:
				
				ld		a,(ix+2)										; A vale una parte del número de casilla en la que está la  puerta/ventana a revisar
				and		00011111B										; Le quitamos los valores que no interesan
				ld		h,a
				ld		l,(ix+1)										; Ahora HL vale el número de casilla en la que está la puerta/ventana
				call	DCOMPR											; Las comparamos						
				jp		z,.abierta_o_cerrada							; Si coincide, ya hemos dado con una, así que vamos a ver qué hacemos con ella
				
				push	de												; Guardamos DE para que luego siga valiendo el numero de casilla del jugador
				ld		de,3											; Le sumamos a IX 3 bytes para mirar la siguiente ventana/puerta
				add		ix,de
				pop		de												; Recuperamos DE
				djnz	.bucle_de_revision_3
				
				RET														; Seguimos

.bucle_de_revision_4:
				
				ld		a,(ix+2)										; A vale una parte del número de casilla en la que está la  puerta/ventana a revisar
				and		00001111B										; Le quitamos los valores que no interesan
				ld		h,a
				ld		l,(ix+1)										; Ahora HL vale el número de casilla en la que está la puerta/ventana
				call	DCOMPR											; Las comparamos						
				jp		z,.abierto_o_cerrado_aa							; Si coincide, ya hemos dado con una, así que vamos a ver qué hacemos con ella
				
				push	de												; Guardamos DE para que luego siga valiendo el numero de casilla del jugador
				ld		de,3											; Le sumamos a IX 3 bytes para mirar la siguiente ventana/puerta
				add		ix,de
				pop		de												; Recuperamos DE
				djnz	.bucle_de_revision_4

				ex		de,hl
				ld		de,43
				or		a
				sbc		hl,de
				ex		de,hl
				
				ld		ix,A_669										; IX ahora ahora vale la primera puerta							
				ld		b,12											; Para revisar las 36 puertas y ventanas
				ld		a,3
				ld		(CAPA_A_REPETIR),a

.bucle_de_revision_5:
				
				ld		a,(ix+2)										; A vale una parte del número de casilla en la que está la  puerta/ventana a revisar
				and		00001111B										; Le quitamos los valores que no interesan
				ld		h,a
				ld		l,(ix+1)										; Ahora HL vale el número de casilla en la que está la puerta/ventana
				call	DCOMPR											; Las comparamos						
				jp		z,.abierto_o_cerrado_ns							; Si coincide, ya hemos dado con una, así que vamos a ver qué hacemos con ella
				
				push	de												; Guardamos DE para que luego siga valiendo el numero de casilla del jugador
				ld		de,3											; Le sumamos a IX 3 bytes para mirar la siguiente ventana/puerta
				add		ix,de
				pop		de												; Recuperamos DE
				djnz	.bucle_de_revision_5
																				
				jp	   .imposible										; Seguimos

.abierto_o_cerrado_aa:

				ld		a,(ix+2)
				and		10000000B
				cp		128
				jp		z,.imposible
				
				jp		.armario_o_baul

.abierto_o_cerrado_ns:

				ld		a,(ix+2)
				and		10000000B
				cp		128
				jp		nz,.imposible

.armario_o_baul:

				ld		a,(ix+2)
				and		01000000B
				or		a
				jp		z,.armario_abierto_o_cerrado

.baul_abierto_o_cerrado:

				ld		a,(ix)
				and		11000000B
[2]				rlc		a
				cp		1
				jp		z,.ba_cerrar_comun
				cp		2
				jp		z,.ba_abrir_comun
				jp		.imposible
				
.armario_abierto_o_cerrado:				

				ld		a,(ix)
				and		11000000B
[2]				rlc		a
				cp		1
				jp		z,.ba_cerrar_comun
				cp		2
				jp		z,.ba_abrir_comun
				jp		.imposible

.ba_cerrar_comun:

				ld		a,(ix)
				and		00111111B
				ld		b,10000000B
				add		a,b
				ld		(ix),a

				xor		a
				ld		(FLECHA_SI_NO),a
				
				JP		.final

.ba_abrir_comun:
	
				ld		a,(ix)
				and		00111111B
				ld		b,01000000B
				add		a,b
				ld		(ix),a

				xor		a
				ld		(FLECHA_SI_NO),a

				jp		.final
				
.abierta_o_cerrada:

				ld		a,(ix)
				and		11000000B
[2]				rlc		a
				cp		2
				jp		z,.tipo_de_puerta_ventana_cerrada
				cp		1
				jp		z,.tipo_de_puerta_ventana_abierta
				jp		.imposible
				
.tipo_de_puerta_ventana_cerrada:

				ld		a,(ix+2)
				and		01100000B
[3]				rlc		a
				cp		0
				jp		z,.orientacion_p_i_abre
				cp		1
				jp		z,.orientacion_p_d_abre
				cp		2
				jp		z,.orientacion_v_i_abre
				cp		3
				jp		z,.orientacion_v_d_abre

.tipo_de_puerta_ventana_abierta:

				ld		a,(ix+2)
				and		01100000B
[3]				rlc		a
				cp		0
				jp		z,.orientacion_p_i_cierra
				cp		1
				jp		z,.orientacion_p_d_cierra
				cp		2
				jp		z,.orientacion_v_i_cierra
				cp		3
				jp		z,.orientacion_v_d_cierra

.orientacion_p_i_abre:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.abre_p_ns_i
				cp		0
				jp		z,.abre_p_aa_i
				
.orientacion_p_d_abre:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.abre_p_ns_d
				cp		0
				jp		z,.abre_p_aa_d

.orientacion_v_i_abre:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.abre_v_ns_i
				cp		0
				jp		z,.abre_v_aa_i

.orientacion_v_d_abre:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.abre_v_ns_d
				cp		0
				jp		z,.abre_v_aa_d

.orientacion_p_i_cierra:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.cierra_p_ns_i
				cp		0
				jp		z,.cierra_p_aa_i

.orientacion_p_d_cierra:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.cierra_p_ns_d
				cp		0
				jp		z,.cierra_p_aa_d

.orientacion_v_i_cierra:

				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.cierra_v_ns_i
				cp		0
				jp		z,.cierra_v_aa_i

.orientacion_v_d_cierra:


				ld		a,(ix+2)
				and		10000000B
				rlc		a
				cp		1
				jp		z,.cierra_v_ns_d
				cp		0
				jp		z,.cierra_v_aa_d

.abre_p_ns_i:
						
.abre_v_ns_i:
			
.abre_pv_ns_i:
				
				ld		a,(CAPA_A_REPETIR)
				cp		1
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,01000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.abre_pv_ns_i_sigue

				call	.ix_mas_44
				
.abre_pv_ns_i_sigue:
				
				pop		af
				ld		b,(ix)
				ld		(ix),a
				ld		(ix-1),b

				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		de,2663
				call	DCOMPR
				jp		nz,.final
				
				ld		ix,MAPA_DE_VARIABLES
				ld		de,2663+44
				add		ix,de
				ld		a,8
				ld		(ix),a
												
				jp		.final
				
.abre_p_ns_d:

.abre_v_ns_d:
				
.abre_pv_ns_d:

				ld		a,(CAPA_A_REPETIR)
				cp		1
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,01000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.abre_pv_ns_d_sigue

				call	.ix_mas_44
				
.abre_pv_ns_d_sigue:
				
				pop		af				
				ld		b,(ix)
				ld		(ix),a
				ld		(ix+1),b

				jp		.final
				
.abre_p_aa_i:

.abre_v_aa_i:
			
.abre_pv_aa_i:

				ld		a,(CAPA_A_REPETIR)
				cp		2
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,01000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.abre_pv_aa_i_sigue
				call	.ix_mas_1

.abre_pv_aa_i_sigue:
				
				pop		af
				ld		b,(ix)
				ld		(ix),a
				ld		(ix+44),b
				jp		.final
				
.abre_p_aa_d:

.abre_v_aa_d:
				
.abre_pv_aa_d:

				ld		a,(CAPA_A_REPETIR)
				cp		2
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,01000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.abre_pv_aa_d_sigue
				call	.ix_mas_1

.abre_pv_aa_d_sigue:
				
				pop		af
				ld		b,(ix)
				ld		(ix),a
				ld		(ix-44),b
				jp		.final

.cierra_p_ns_i:

.cierra_v_ns_i:
			
.cierra_pv_ns_i:

				ld		a,(CAPA_A_REPETIR)
				cp		1
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,10000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.cierra_pv_ns_i_sigue
				call	.ix_mas_44

.cierra_pv_ns_i_sigue:
				
				pop		af
				ld		b,(ix-1)
				ld		(ix-1),a
				ld		(ix),b

				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		de,2663
				call	DCOMPR
				jp		nz,.final
				
				ld		ix,MAPA_DE_VARIABLES
				ld		de,2663+44
				add		ix,de
				ld		a,97
				ld		(ix),a
								
				jp		.final
				
.cierra_p_ns_d:

.cierra_v_ns_d:
				
.cierra_pv_ns_d:

				ld		a,(CAPA_A_REPETIR)
				cp		1
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,10000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.cierra_pv_ns_d_sigue
				call	.ix_mas_44

.cierra_pv_ns_d_sigue:
				
				pop		af
				ld		b,(ix+1)
				ld		(ix+1),a
				ld		(ix),b

				jp		.final
												
.cierra_p_aa_i:


.cierra_v_aa_i:


				
.cierra_pv_aa_i:

				ld		a,(CAPA_A_REPETIR)
				cp		2
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,10000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.cierra_pv_aa_i_sigue
				call	.ix_mas_1

.cierra_pv_aa_i_sigue:
				
				pop		af
				ld		b,(ix+44)
				ld		(ix+44),a
				ld		(ix),b
				jp		.final
				
.cierra_p_aa_d:

.cierra_v_aa_d:
				
.cierra_pv_aa_d:

				ld		a,(CAPA_A_REPETIR)
				cp		2
				jp		z,.imposible
				ld		a,(ix)
				and		00111111B
				ld		b,10000000B
				call	.rutina_comun
				push	af
				call	.por_delante
				call	.por_delante
				ld		a,(PUERTA_LEJANA)
				or		a
				jp		z,.cierra_pv_aa_d_sigue
				call	.ix_mas_1

.cierra_pv_aa_d_sigue:
				
				pop		af
				ld		b,(ix-44)
				ld		(ix-44),a
				ld		(ix),b
				jp		.final

.ix_mas_44:

				ld		de,44
				add		ix,de
				ret
				
.ix_mas_1:

				ld		de,1
				add		ix,de
				ret
				
.rutina_comun:
				
				add		b
				ld		(ix),a
				
				ld		ix,MAPA_DE_VARIABLES
				ld		de,(SEGUIMIENTO_CASILLA)
				
				ld		hl,2663
				call	DCOMPR
				jp		nz,.rutina_comun_2

				ld		de,1250
				
.rutina_comun_2:
				
				add		ix,de
				ld		a,8
				ret				
.imposible:

				call	RUTINA_FRASE_INTERROGANTE
									
				pop		ix
				pop		af
				jp		ACCIONES_POSIBLES

				
.por_delante:

				ld		a,(CAPA_A_REPETIR)
				or		a
				ret		z
				
				ld		a,1
				ld		(PUERTA_LEJANA),a
				ret
				
.final:
				
				pop		ix
				
				xor		a
				ld		(FLECHA_SI_NO),a
			
				call	PINTAMOS_MAPA_DE_B
				
				ld		a,30
				ld		[#7000],a
				
				call	CIRCUNSTANCIAL_DE_B
				G9kWaitVsync

				call	PINTAMOS_MAPA_DE_A

				ld		a,30
				ld		[#7000],a
				
				call	CIRCUNSTANCIAL_DE_A
				G9kWaitVsync	
				call	REVISAMOS_FUEGOS
				call	CAMBIA_PAGINA

				or		a
				jp		z,.dos

.uno:			

				G9kWriteReg 18,#00										; scroll
				G9kWriteReg 22,#00										; scroll

				jp		.SEGUIMOS

.dos:
				
				G9kWriteReg 18,#81										; scroll
				G9kWriteReg 22,#01										; scroll
				
.SEGUIMOS:								
				ld		a,(DADO_DEL_JUGADOR)
				dec		a
				ld		(DADO_DEL_JUGADOR),a
				or		a
				call	z,PINTAMOS_RESTO_DADO.cambio_de_personaje
				
				ld		a,(ACCIONES_LIBRES)
				dec		a
				ld		(ACCIONES_LIBRES),a
								
				call	DATOS_SIEMPRE_VISIBLES

				pop		af				
				jp		ACCIONES_POSIBLES

SIN_ACCIONES_LIBRES:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
				
				pop		af
				jp		ACCIONES_POSIBLES
				
NO_DESDE_ESTE_LADO:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
			
				pop		af
				jp		ACCIONES_POSIBLES
