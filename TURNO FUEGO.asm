TURNO_FUEGO:
		
		ld			a,r
		and		00011111B
		
.bucle_para_reducir_el_valor:							; Aleatoriamente miramos uno de los 21. 
		
		cp			20
		jp			c,.seguimos
		dec		a
		jp			.bucle_para_reducir_el_valor
		
.seguimos:

		push	ix
		push	de
		push	bc
		
		ld			ix,FUEGO_DATOS							; Colocamos el puntero en el fuego aleatorio
		ld			e,a
		ld			d,0
[4]	add		ix,de

		xor		a
		ld			(variable_circunstanc_4),a
		
.comprobamos_si_existe:
		
		ld			a,(ix+3)
		or			a
		jp			nz,.propagamos_el_fuego

.gancho_para_pasar_al_siguiente_en_la_lista:
		
		ld			a,(ix+4)
		cp			255
		jp			z,.reinicia_la_lectura
		
.pasamos_al_siguiente:
		
		ld			a,(variable_circunstanc_4)
		inc		a
		ld			(variable_circunstanc_4),a
		cp			21
		jp			z,.saliendo
		
		ld			de,4
		add		ix,de
		jp			.comprobamos_si_existe
		
.reinicia_la_lectura:

		ld			a,(variable_circunstanc_4)
		inc		a
		ld			(variable_circunstanc_4),a
		cp			21
		jp			z,.saliendo
		
		ld			ix,FUEGO_DATOS
		jp			.comprobamos_si_existe

.propagamos_el_fuego:										; Aleatoriamente N, S, E, O comparamos esa posición con todos

		xor		a
		ld		(variable_circunstanc_2),a
		
		ld			a,r
		and		00000011B
		ld			(variable_circunstanc_3),a
		
.gancho_de_salto_posiciones_cardenales:

		ld			l,(ix+1)
		ld			h,(ix+2)
		call		DEVOLVER_POSICION_OBJETIVO_FUEGO	;Nos devolverá la posición objetivo en HL y en A continua la decisión tomada
		push	ix
		ld			ix,FUEGO_DATOS
		
		ld			b,20

.bucle_a_ver_si_ya_existe:									; Si esa posición de fuego ya existe, volveremos a buscar la siguiente posición cardinal

		push	hl
		ld			l,(ix+1)
		ld			h,(ix+2)
		ex		de,hl
		pop		hl
		call		DCOMPR
		jp			z,.volvemos_a_revisar
		ld			de,4
		add		ix,de
		djnz		.bucle_a_ver_si_ya_existe
		jp			.se_puede_pintar
		
.volvemos_a_revisar:											 ; si todos están pillados volvemos paso anterior


		pop		ix
		ld			a,(variable_circunstanc_3)
		inc		a
		and		00000011B
		ld			(variable_circunstanc_3),a
		push	af
		ld			a,(variable_circunstanc_2)
		inc		a
		ld			(variable_circunstanc_2),a
		cp			4
		pop		af
		jp			z,.gancho_para_pasar_al_siguiente_en_la_lista
		jp			.gancho_de_salto_posiciones_cardenales
		
.se_puede_pintar:												; Si libre lo pintamos con fuego en la siguiente posición vacía
		
		pop		ix
		push	hl
		push	bc
		call		DEVOLVEMOS_L_CON_LA_SALA_ADECUADA
		pop		bc
		ld		h,c
		
.adjudicamos_datos:
	
		push	hl
		ld		ix,FUEGO_DATOS

.buscamos_el_libre:
		
		ld		a,(ix)
		or		a
		jp		z,.escribimos_los_datos

		ld		de,4
		add		ix,de
		jp		.buscamos_el_libre
		
.escribimos_los_datos:

		pop		hl
		ld		(ix),l
		ld		(ix+3),h
		pop		hl
		ld		(ix+1),l
		ld		(ix+2),h
		
		ld		a,(ix+4)
		cp		255
		jp		nz,.adecuamos_ix

.reiniciamos_la_linea:

		ld		ix,FUEGO_DATOS

.por_fin_pintamos_los_datos:

		xor		a
		ld		(ix),a
		ld		(ix+1),a
		ld		(ix+2),a
		ld		(ix+3),a
		jp		.quemamos_lo_que_sea
		
.adecuamos_ix:
				
		ld		de,4
		add		ix,de
		jp		.por_fin_pintamos_los_datos
		
.quemamos_lo_que_sea:

		push	iy
		
		ld		iy,P_672
		
		ld		b,72
		
.revisa_objeto_por_objeto:

		ld		a,(iy+2)
		and		00011111B
		ld		h,a
		ld		l,(iy+1)
		
		call	DEVOLVEMOS_HL_COMO_3D
		push	ix
		pop		de
		call	DCOMPR
		jp		z,.revisamos_uno_en_concreto
		
		ld		de,3
		add		iy,de
		djnz	.revisa_objeto_por_objeto
		jp		.saliendo
		
.revisamos_uno_en_concreto:

		xor		a
		ld		(iy),a

		ld		a,(iy+2)
		and		00001111B
		ld		h,a
		ld		l,(iy+1)
		ld		ix,MAPA_DE_VARIABLES
		push	hl
		pop		de
		add		ix,de
		ld		a,8
		ld		(ix),a
		
.saliendo:
		
		pop		iy
		pop		bc
		pop		de
		pop		ix
		ret
