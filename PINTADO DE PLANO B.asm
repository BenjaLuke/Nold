PINTAMOS_MAPA_DE_B:

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
				
				ld		[#7000],a										; Banco 2, pagina (entre 2 y ?) del MEGAROM.
				
				ld		a,(PUNT_X_FINAL_MAPA)
				ld		(SEGUIMIENTO_PUNT_X),a
				ld		a,(PUNT_Y_FINAL_MAPA)
				ld		(SEGUIMIENTO_PUNT_Y),a				
				
				ld		a,(QUE_PAGINA_TOCA)
				cp		0
				jp		nz,.pagina2
				
.pagina1:
				
				ld		hl,#E000
				jp		.tras_paginar
				
.pagina2:		
				
				ld		hl,#f000
				
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
				ld		a,75
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
