APARECEN_ZOMBIS:
		
		ld		a,r														; Número aleatorio de zombis a añadir
		
		and		00000111B												; Nunca mayour que 7
		or		a
		jp		nz,.punto_con_cantidad_de_zombis_ya_seleccionados		; nunca 0
		inc		a
		
.punto_con_cantidad_de_zombis_ya_seleccionados:

		push	ix
		push	iy
		push	af
		ld		ix,FRASE
		ld		b,a
		
.ciclo_para_mensaje_zombis:

		ld		hl,743
		ld		(ix),l
		ld		(ix+1),h
		ld		de,2
		add		ix,de
		djnz	.ciclo_para_mensaje_zombis

		ld		hl,991
		ld		(ix),l
		ld		(ix+1),h

		ld		a,31
		ld		[#7000],a
		call	PINTA_DIBUJOS


		pop		af

		ld		b,a														; Aumentamos el margen nuevo de zombis como posibles sprites a pintar
		ld		a,(SPRITES_EN_PANTALLA)
		add		b
		cp		200
		jp		nc,.fin
		ld		(SPRITES_EN_PANTALLA),a
		

		ld		ix,PERSONAJE_1											; IX está en la posicion del primer personaje
		ld		iy,ATRIBUTOS_1
		ld		e,a														; DE vale la cantidad de sprites que hay en juego
		ld		d,0
		ld		hl,0
		or		a
[8]		adc		hl,de													; HL vale la cantidad de bytes que hay en total sobre sprites activos
		ld		e,b														; DE vale la cantidad de sprites nuevos añadidos
		ld		d,0
		or		a
[8]		sbc		hl,de													; Le restamos a HL la cantidad de bytes de los nuevos sprites y HL está ahora en la posición del último sprite antes de haber añadido nuevos
		ex		de,hl
		add		ix,de
		add		iy,de
		
.bucle_nuevas_coordenadas:

		ld		de,8													; Ahora le añadimos 8 bytes a HL para que esté apuntando al sprite nuevo sobre el que trabajar
		add		ix,de													;Ahora IX apunta a ese nuevo sprite
		add		iy,de
		
.decidimos_pared_en_la_que_aparece:
			
		ld		a,r
		and		00000011B
		or		a
 		jp		z,.norte
		cp		1
		jp		z,.sur
		cp		2
 		jp		z,.este
		cp		3
		jp		z,.oeste

.asigna_casilla:

		ld		(ix),l
		ld		(ix+1),h
		ld		(ix+5),c
		
.final_de_bucle:
		
		djnz	.bucle_nuevas_coordenadas

.fin:

		call	PINTAMOS_MAPA_DE_SPRITES
		pop		iy
		pop		ix
		ret
				
.norte:

		call	ELIGE_ZOMBI
		
		call	DEAMBULAR.que_zombi_es_sur

		ld		a,r
		
.norte_encaja:

		cp		44
		jp		c,.revision
		sub		44
		jp		.norte_encaja

.revision:
		
		ld		l,a
		ld		h,0
		cp		31
		jp		c,.plano1

.plano9:
		
		ld		c,9
		jp		.final_norte
		
.plano1:
		
		ld		c,1
		
.final_norte:

		ld		a,2
		ld		(TIPO_QUIEBRE_ZOMBI),a
		ld		(COMPARATIVA),hl
		
		call	ON_SPRITE_DE_APARICION_ZOMBIS
		ld		hl,(COMPARATIVA)
		jp		.asigna_casilla
		
.sur:

		call	ELIGE_ZOMBI

		call	DEAMBULAR.que_zombi_es_norte
		
		ld		a,r

.sur_encaja:
		
		cp		44
		jp		c,.sur_asigna_casilla
		sub		44
		jp		.sur_encaja

.sur_asigna_casilla:
		
		ld		hl,44*45
		ld		e,a
		ld		d,0
		or		a
		adc		hl,de

		cp		9
		jp		c,.plano1_sur

.plano9_sur:
		
		ld		c,9
		jp		.final_sur
		
.plano1_sur:
		
		ld		c,1

.final_sur:

		xor		a
		ld		(TIPO_QUIEBRE_ZOMBI),a
		ld		(COMPARATIVA),hl
		
		call	ON_SPRITE_DE_APARICION_ZOMBIS
		ld		hl,(COMPARATIVA)
		jp		.asigna_casilla

.oeste:

		call	ELIGE_ZOMBI

		call	DEAMBULAR.que_zombi_es_este
		
		ld		a,r

.oeste_encaja:

		cp		47
		jp		c,.oeste_asigna_casilla
		sub		47
		jp		.oeste_encaja

.oeste_asigna_casilla:				

		ld		hl,0
		ld		e,a
		ld		d,0
		or		a
		call	.bucle_repeticion_hl
		ld		c,1 

		ld		a,2
		ld		(TIPO_QUIEBRE_ZOMBI),a
		ld		(COMPARATIVA),hl
		
		call	ON_SPRITE_DE_APARICION_ZOMBIS
		ld		hl,(COMPARATIVA)
				
		jp		.asigna_casilla
		
.este:

		call	ELIGE_ZOMBI
		
		call	DEAMBULAR.que_zombi_es_oeste
		
		ld		a,r

.este_encaja:

		cp		47
		jp		c,.este_asigna_casilla
		sub		47
		jp		.este_encaja

.este_asigna_casilla:				

		ld		hl,0
		ld		e,a
		ld		d,0
		or		a
		call	.bucle_repeticion_hl
		ld		de,43
		or		a
		adc		hl,de
		ld		c,9
		
		ld		a,3
		ld		(TIPO_QUIEBRE_ZOMBI),a
		ld		(COMPARATIVA),hl
		
		call	ON_SPRITE_DE_APARICION_ZOMBIS
		ld		hl,(COMPARATIVA)
				
		jp		.asigna_casilla
				
.bucle_repeticion_hl:

[44]	adc		hl,de

		ret

ELIGE_ZOMBI:

		ld		a,r
		and		00001111B
		cp		1
		jp		z,ELIGE_ZOMBI
		cp		11
		jp		nc,ELIGE_ZOMBI
		ld		(ix+7),a
		
		ret
		
ON_SPRITE_DE_APARICION_ZOMBIS:

				push	ix
				push	bc
				xor		a
				ld		(SPRITE_BLOQUE_A_PINT),a						; Empezamos un bucle que empieza en 0

.repetimos_el_bucle:

				ld		hl,0											; Situamos ix en el primer byte de PERSONAJE_X
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
				ld		de,(COMPARATIVA)								; Si la casilla coincide con comparativa, significa que hay en esa casilla un personaje y no lo tenemos en cuenta
				call	DCOMPR
				jp		nz,.seguimos_bucle
				
				ld		a,(TIPO_QUIEBRE_ZOMBI)
				or		a
				jp		z,.derecha
				cp		1
				jp		z,.izquierda
				cp		2
				jp		z,.arriba
				cp		3
				jp		z,.abajo
				
.derecha:

				ld		hl,(COMPARATIVA)
				ld		de,1
				or		a
				adc		hl,de
				ld		(COMPARATIVA),hl
				ld		a,(SPRITE_BLOQUE_A_PINT)
				jp		.repetimos_el_bucle		
				
.izquierda:

				ld		hl,(COMPARATIVA)
				ld		de,1
				or		a
				sbc		hl,de
				ld		(COMPARATIVA),hl
				jp		.repetimos_el_bucle		
				
.arriba:

				ld		hl,(COMPARATIVA)
				ld		de,44
				or		a
				sbc		hl,de
				ld		(COMPARATIVA),hl
				jp		.repetimos_el_bucle		
				
.abajo:

				ld		hl,(COMPARATIVA)
				ld		de,44
				or		a
				adc		hl,de
				ld		(COMPARATIVA),hl
				jp		.repetimos_el_bucle		
										
.seguimos_bucle:
				
				ld		a,(SPRITES_EN_PANTALLA)							; El bucle se repetirá con todos los sprites activos en el momento
				inc		a
				ld		b,a
				ld		a,(SPRITE_BLOQUE_A_PINT)
				inc		a
				ld		(SPRITE_BLOQUE_A_PINT),a
				cp		b
				jp		nz,.repetimos_el_bucle
				xor		a

.terminamos:

				pop		bc
				pop		ix
				ret
