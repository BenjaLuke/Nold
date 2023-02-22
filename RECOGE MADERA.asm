RECOGE_MADERA:

				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				ld		a,(ACCIONES_LIBRES)								; Necesita una acción libre para poder
				or		a
				jp		z,SIN_ACCIONES_LIBRES
																			
				push	ix
				push	iy
				
				ld		a,(DADO_DEL_JUGADOR)							; Necesita 2 puntos en el dado para poder
				cp		2
				jp		c,REFUERZA_CON_MADERA.falta_puntos_de_dado

				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de

				ld		a,(ix+8)										; Si no tiene el hacha no podrá
				or		a
				jp		z,REFUERZA_CON_MADERA.no_tiene

				ld		hl,(SEGUIMIENTO_CASILLA)						; Si está frente a la puerta del sótano, esto es un atajo

.las_trampas_de_las_camas:


				ld		de,1173
				call	DCOMPR
				jp		z,.e_1174
				
				ld		de,#2A8
				call	DCOMPR
				jp		z,.c_723

				ld		de,#2D5
				call	DCOMPR
				jp		z,.c_723

				ld		de,#301
				call	DCOMPR
				jp		z,.c_723

				ld		de,#32D
				call	DCOMPR
				jp		z,.c_723	

				ld		de,#2FB
				call	DCOMPR
				jp		z,.c_720

				ld		de,#328
				call	DCOMPR
				jp		z,.c_720

				ld		de,#329
				call	DCOMPR
				jp		z,.c_720

				ld		de,#32A
				call	DCOMPR
				jp		z,.c_720

				ld		de,#2A5
				call	DCOMPR
				jp		z,.c_720

				ld		de,#2A6
				call	DCOMPR
				jp		z,.c_720

				ld		de,#435
				call	DCOMPR
				jp		z,.c_987

				ld		de,#409
				call	DCOMPR
				jp		z,.c_987

				ld		de,#3DD
				call	DCOMPR
				jp		z,.c_987

				ld		de,#3B0
				call	DCOMPR
				jp		z,.c_987

				ld		de,#406
				call	DCOMPR
				jp		z,.c_987

				ld		de,#97D
				call	DCOMPR
				jp		z,.c_2386
	
				ld		de,#927
				call	DCOMPR
				jp		z,.c_2386
	
				ld		de,#928
				call	DCOMPR
				jp		z,.c_2386

				ld		de,#9B1
				call	DCOMPR
				jp		z,.c_2524

				ld		de,#9DE
				call	DCOMPR
				jp		z,.c_2524

				ld		de,#A0A
				call	DCOMPR
				jp		z,.c_2524

				ld		de,#A36
				call	DCOMPR
				jp		z,.c_2524
					
				jp		.bucle

.e_1174:

				ld		iy,E_1174
				jp		.hay_algo_veamos_si_existe
				
.c_720:

				ld		iy,C_720
				jp		.hay_algo_veamos_si_existe
				
.c_723:

				ld		iy,C_723
				jp		.hay_algo_veamos_si_existe

.c_987:

				ld		iy,C_987
				jp		.hay_algo_veamos_si_existe

.c_2386:

				ld		iy,C_2386
				jp		.hay_algo_veamos_si_existe

.c_2524:

				ld		iy,C_2524
				jp		.hay_algo_veamos_si_existe
																
.bucle:				

				ld		de,44
				or		a
				sbc		hl,de
				
.hacia_el_bucle:
				
				ld		iy,A_669
							
				ld		b,36

.bucle_de_revision:

				ld		a,(iy+2)
				and		00001111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				jp		z,.hay_algo_veamos_si_existe
				
				ld		de,43
				or		a
				adc		hl,de
				
				ld		a,(iy+2)
				and		00001111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				or		a
				jp		z,.hay_algo_veamos_si_existe		
				
				ld		de,2
				or		a
				adc		hl,de
				
				ld		a,(iy+2)
				and		00001111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				or		a
				jp		z,.hay_algo_veamos_si_existe

				ld		de,43
				or		a
				adc		hl,de
				
				ld		a,(iy+2)
				and		00001111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				
				call	DCOMPR
				or		a
				jp		z,.hay_algo_veamos_si_existe
								
				ld		de,88
				or		a
				sbc		hl,de
				
				ld		de,3
				add		iy,de
				
				djnz	.bucle_de_revision								

.no_hay_objeto:

				call	RUTINA_FRASE_INTERROGANTE
														
				jp		.final
				
.hay_algo_veamos_si_existe:

				ld		a,(iy)
				and		11000000B
[2]				rlc		a				
				or		a
				jp		z,.no_hay_objeto

.veamos_si_ese_algo_tiene_utensilios:

				ld		a,(iy+2)
				and		00110000B
[4]				rlc		a
				or		a
				jp		z,.vamos_a_lanzar_el_dado
				
.aun_no_puedes_porque_quedan_utensilios_dentro_o_encima_del_objeto:

				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION
											
				jp		.final				

.vamos_a_lanzar_el_dado:

				push	ix
				push	iy
				ld		iy,FRASE_VACIA
				call	PACK_FRASE
				pop		iy
				call	DADO_ALEATORIO_MADERA_COGER
				pop		ix

				ld		a,(MADERA_DEL_JUGADOR)
				or		a
				jp		z,REFUERZA_CON_MADERA.ha_salido_mal

				
.Resto_la_madera_al_objeto:

				ld		b,a
				
				ld		a,1												; Cargamos un uno para indicar que se está desmantelando
				ld		(iy+36*3),1
				
				ld		a,b
				ld		a,(iy)
				and		0011111B
				sub		b
				cp		200
				jp		c,.proceso_normal
				
				xor		a
				ld		(iy),a											; Dejamos el objeto en estado destrozado y sin puntos de madera
				
				ld		ix,MAPA_DE_VARIABLES							; Vamos a borrar el objeto en el mapa de variables
				ld		a,(iy+2)
				and		00001111B
				ld		d,a
				ld		a,(iy+1)
				ld		e,a
				add		ix,de
				ld		a,8
				ld		(ix),a
				
				call	BORRADO_EXTRA_EN_CASO_DE_CAMAS
				
				jp		.suma_la_madera_al_personaje
				
.proceso_normal
				
				add		192
				ld		(iy),a
				
.suma_la_madera_al_personaje:

				ld		ix,MADERA_ADQUIRIDA
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,(ix)
				add		b
				ld		(ix),a

.desgaste_de_martillo:
				
				ld		ix,UTENSILIOS_PERSONAJE_1
				LD		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				ld		a,(ix+8)
				dec		a
				ld		(ix+8),a
				
				ld		ix,FRASE								
.bucle_escritura_maderas:

				ld		hl,458
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
					
				jp		REFUERZA_CON_MADERA.restamos_la_accion
				
.final:

				pop		iy
				pop		ix
				
				ret

BORRADO_EXTRA_EN_CASO_DE_CAMAS:

				; IY = EL OBJETO
				; IX = A LA POSICIÓN DEL OBJETO
				push	iy
				pop		hl

.C_720:

				ld		de,C_720
				call	DCOMPR
				jp		nz,.C_723

.suma_larga:

				ld		a,8
				ld		(ix+1),a
				ld		(ix+2),a
				ld		(ix+44),a
				ld		(ix+45),a
				ld		(ix+46),a
				
				ret

.C_723:

				ld		de,C_723
				call	DCOMPR
				jp		nz,.C_987

.suma_ancha:
				
				ld		a,8
				ld		(ix+1),a
				ld		(ix+44),a
				ld		(ix+45),a
				ld		(ix+88),a
				ld		(ix+89),a
				
				ret
.C_987:

				ld		de,C_987
				call	DCOMPR
				jp		nz,.C_2386
				
				jp		.suma_ancha
				
.C_2386:

				ld		de,C_2386
				call	DCOMPR
				jp		nz,.C_2524
				
				jp		.suma_larga

.C_2524:			

				ld		de,C_2524
				call	DCOMPR
				ret		nz
								
				jp		.suma_ancha
			
