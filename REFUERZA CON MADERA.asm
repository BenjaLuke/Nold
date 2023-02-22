REFUERZA_CON_MADERA:

				ld		a,1
				ld		(ARRASTRA_STRIG),a

				ld		a,(ACCIONES_LIBRES)
				or		a
				jp		z,SIN_ACCIONES_LIBRES
																			
				push	ix
				push	iy
				
				ld		a,(DADO_DEL_JUGADOR)
				cp		2
				jp		c,.falta_puntos_de_dado	
				
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+9)
				or		a
				jp		z,.no_tiene
				
				ld		a,(ix++2)
				or		a
				jp		z,.no_tiene
							
				ld		ix,MADERA_ADQUIRIDA								; Si el personaje no tiene madera, se avisa y se sale
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,(ix)
				or		a
				jp		z,.no_tiene

				ld		hl,(SEGUIMIENTO_CASILLA)						; Si está frente a la puerta del sótano, esto es un atajo
				ld		de,2663
				call	DCOMPR
				jp		nz,.hacia_el_bucle
				ld		iy,P_1250
				jp		.hay_ventana_puerta_veamos_si_existe

.hacia_el_bucle:
				
				ld		iy,P_672
				
				ld		b,36

.bucle_de_revision:

				ld		a,(iy+2)
				and		00011111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				jp		z,.hay_ventana_puerta_veamos_si_existe
				
				ld		de,1
				or		a
				adc		hl,de
				
				ld		a,(iy+2)
				and		00011111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				or		a
				jp		z,.hay_ventana_puerta_veamos_si_existe		
				
				ld		de,43
				or		a
				adc		hl,de
				
				ld		a,(iy+2)
				and		00011111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				or		a
				jp		z,.hay_ventana_puerta_veamos_si_existe
				
				ld		de,44
				or		a
				sbc		hl,de
				
				ld		de,3
				add		iy,de
				
				djnz	.bucle_de_revision

.no_hay_ventana_puerta:

				call	RUTINA_FRASE_INTERROGANTE
														
				jp		.final

.hay_ventana_puerta_veamos_si_existe:

				ld		a,(iy)
				and		11000000B
[2]				rlc		a
				cp		2
				jp		c,.no_puedes

.tira_el_dado:

				push	ix
				push	iy
				ld		iy,FRASE_VACIA
				call	PACK_FRASE
				pop		iy
				call	DADO_ALEATORIO_MADERA
				pop		ix
				
				ld		a,(MADERA_DEL_JUGADOR)
				or		a
				jp		z,.ha_salido_mal
				
.comparamos_lo_que_puede_con_lo_que_hay:

				ld		a,(ix)
				ld		b,a
				ld		a,(MADERA_DEL_JUGADOR)
				cp		b
				jp		c,.restamos_madera_a_personaje_restamos_clavos
				
.se_resta_lo_que_tiene:

				ld		a,b
				
.restamos_madera_a_personaje_restamos_clavos:
				
				push	af
				push	bc
				push	ix
				
				ld		b,a
				
				ld		ix,FRASE
				
.bucle_escritura_maderas:

				ld		hl,460
				ld		(ix),l
				ld		(ix+1),h
				ld		de,2
				add		ix,de
				djnz	.bucle_escritura_maderas
				
				ld		hl,991
				ld		(ix),l
				ld		(ix+1),h
				
				ld		a,31
				ld		[#7000],a
				call	PINTA_DIBUJOS

				pop		ix
				pop		bc
				pop		af

			
				ld		b,a
				ld		a,(ix)
				sub		b
				ld		(ix),a
				
				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+2)
				sub		b
				ld		(ix+2),a
				cp		240
				jp		c,.desgaste_de_martillo
				
				xor		a
				ld		(ix+2),a

.desgaste_de_martillo:

				ld		a,(ix+9)
				dec		a
				ld		(ix+9),a
				
.agregamos_refuerzos:
					
				ld		a,(iy)
				and		00111111B
				add		b
				and		00111111B
				ld		b,a
				ld		a,(iy)
				and		11000000B
				add		b
				ld		(iy),a
			
							
.estado_de_puerta_ventana:

				ld		a,(iy)
[2]				rlc		a
				and		11111100B
				add		3
[2]				rrc		a
				ld		(iy),a
				
.restamos_la_accion:
				
				ld		a,(ACCIONES_LIBRES)
				dec		a
				ld		(ACCIONES_LIBRES),a
				
				ld		a,(DADO_DEL_JUGADOR)
				sub		2
				ld		(DADO_DEL_JUGADOR),a
				
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
								
				call	DATOS_SIEMPRE_VISIBLES
								
				jp		.final

.falta_puntos_de_dado:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
				
				jp		.final
				
.ha_salido_mal:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
				
				jp		.restamos_la_accion
								
.no_puedes:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
			
				jp		.final
								
.no_tiene:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION

							
.final:



				
				ld		a,(DADO_DEL_JUGADOR)
				or		a
				call	z,PINTAMOS_RESTO_DADO.cambio_de_personaje
												
				pop		iy
				pop		ix
				xor		a
				ret

