PINTAMOS_MAPA_DE_A:

				ld		a,(PAGE_MAPA)

.primera_revision:

				cp		14
				jp		nz,.segunda_revision
				ld		a,11
				
.segunda_revision:

				cp		15
				jp		nz,.cambiando_pagina
				ld		a,14
								
.cambiando_pagina:
							
				add		15
				ld		[#7000],a										; Banco 2, pagina (entre 2 y ?) del MEGAROM.
				
				ld		a,(PUNT_X_FINAL_MAPA)
				ld		(SEGUIMIENTO_PUNT_X),a
				ld		a,(PUNT_Y_FINAL_MAPA)
				ld		(SEGUIMIENTO_PUNT_Y),a				
				
				ld		a,(QUE_PAGINA_TOCA)
				cp		0
				jp		nz,.pagina2
				
.pagina1:
				
				ld		hl,#C000
				jp		.tras_paginar
				
.pagina2:		
				
				ld		hl,#D000
				
.tras_paginar:

				ld		(CONTROL_PUNTERO_WRITE),hl
				ld		e,#07
				call	G9kSetVramWrite
				
				ld		ix,PNT_BASE_1
				ld		de,(PUNTERO_MAPA)
				add		ix,de				
				ld		b,27


.BUCLE_1:				
				push	bc
				ld		b,33

.BUCLE_2:
				ld		a,(PAGE_MAPA)
				cp		11
				jp		nz,.seguimiento_normal

				ld		a,(SEGUIMIENTO_PUNT_Y)
				cp		10
				jp		c,.no_se_pasan_datos
				
.seguimiento_normal:

				ld		a,(SEGUIMIENTO_PUNT_Y)
				cp		46
				jp		nc,.no_se_pasan_datos

				ld		a,(SEGUIMIENTO_PUNT_X)
				cp		180
				jp		c,.se_pasan_datos

.no_se_pasan_datos:

				xor		a
				ld		h,a
				ld		a,31
				ld		l,a
				jp		.se_escriben_datos
				
.se_pasan_datos:
				
				ld		h,(ix+1)
				ld		l,(ix)

.se_escriben_datos:

				call	OUT_ESCRIBE_UN_BYTE
					
				ld		de,2
				add		ix,de
				
				ld		a,(SEGUIMIENTO_PUNT_X)
				add		1
				ld		(SEGUIMIENTO_PUNT_X),a
			
				
				
				djnz	.BUCLE_2
				
				ld		a,(SEGUIMIENTO_PUNT_Y)
				inc		a
				ld		(SEGUIMIENTO_PUNT_Y),a
				ld		a,(PUNT_X_FINAL_MAPA)
				ld		(SEGUIMIENTO_PUNT_X),a		
											
				ld		hl,(CONTROL_PUNTERO_WRITE)
				ld		de,#80
				add		hl,de
				ld		(CONTROL_PUNTERO_WRITE),hl
				ld		e,#07
				call	G9kSetVramWrite
			
				pop		bc
				ld		de,294
				add		ix,de

				djnz	.BUCLE_1
				
				ret
				
ON_SPRITE_POSIBLES:

				ld		a,(QUIEN_JUEGA)									; Si aun sólo juega Barbara, evitamos la casilla de Ben
				or		a
				jp		nz,.empezamos
				
.preespecial1:

				ld		de,#74b
				call	DCOMPR
				ret		z

.empezamos:

				ld		hl,(COMPARATIVA)
				
.especial_1:
				
				ld		de,2621											; Subiendo escaleras del sótano 1
				call	DCOMPR
				jp		nz,.especial_2
				ld		hl,2619
				ld		(COMPARATIVA),hl
				jp		.pasado_especial

.especial_2:

				ld		de,2577											; Subiendo escaleras del sótano 2
				call	DCOMPR
				jp		nz,.especial_3
				ld		hl,2619
				ld		(COMPARATIVA),hl
				jp		.pasado_especial

.especial_3:

				ld		de,2620											; bajando escaleras sotano 1
				call	DCOMPR
				jp		nz,.especial_4
				ld		hl,2622
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
				
.especial_4:

				ld		de,2576											; bajando escaleras sotano 2
				call	DCOMPR
				jp		nz,.especial_5
				ld		hl,2622
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_5:

				ld		de,2707											; saliendo del sotano
				call	DCOMPR
				jp		nz,.especial_6
				ld		hl,1250
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_6:

				ld		de,1206											; entrando al sotano
				call	DCOMPR
				jp		nz,.especial_7
				ld		hl,2663
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_7:

				ld		de,2599											; subiendo al altillo 1
				call	DCOMPR
				jp		nz,.especial_8
				ld		hl,2423
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_8:

				ld		de,2600											; subiendo al altillo 2
				call	DCOMPR
				jp		nz,.especial_9
				ld		hl,2424
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_9:

				ld		de,2467											; bajando del altillo 1
				call	DCOMPR
				jp		nz,.especial_10
				ld		hl,2643
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_10:

				ld		de,2468											; bajando del altillo 2
				call	DCOMPR
				jp		nz,.especial_11
				ld		hl,2644
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_11:

				ld		de,1468											; entrando a zona escaleras
				call	DCOMPR
				jp		nz,.especial_12
				ld		hl,2644
				ld		(COMPARATIVA),hl
				jp		.pasado_especial
.especial_12:

				ld		de,2645											; saliendo de zona escaleras
				call	DCOMPR
				jp		nz,.pasado_especial
				ld		hl,1469
				ld		(COMPARATIVA),hl
				jp		.pasado_especial	
						
.pasado_especial:
				
				push	ix
				
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
				
				ld		a,1												; Si salimos de aquí con valor 1 en A no se moverá nada
				jp		.terminamos
				
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

				pop		ix
				ret
