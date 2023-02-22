POR_DELANTE_O_DETRAS_COSAS:

.primero_todo_entre_planos:

				ld		a,(SPRITE_BLOQUE_A_PINT)						; Vemos el sprite que estamos mirando

				ld		d,0
				ld		e,a
				ld		hl,0
				
				or		a												; Se lo sumamos a HL (que vale 0)  multiplicado por 8
[8]				add		hl,de
				
				push 	hl												; Convertimos HL en DE
				pop		de
				
				push	ix
				ld		ix,ATRIBUTOS_1									;Primero ponemos los 2 sprites entre planos
				add		ix,de											; Ahora IX apunta exáctamente al primer byte de los atributos del sprite en cuestión

				ld		de,48
				call	DCOMPR
				jp		nc,.paleta_zombi
				
.paleta_personaje:
				
				ld		a,00100000b
				ld		(ix+3),a
				ld		(ix+7),a
				jp		.todo_entre_planos_seguimos

.paleta_zombi:

				ld		a,11100000b
				ld		(ix+3),a
				ld		(ix+7),a
				
.todo_entre_planos_seguimos:
												
				push	iy												; Nos guardamos el valor de IX para recuperarlo después
				ld		iy,MAPA_DE_VARIABLES							; IX vale ahora el principio del mapa de variables
				push	ix
				ld		ix,PERSONAJE_1
				ld		a,(SPRITE_BLOQUE_A_PINT)						; DE vale ahora la casilla en la que estamos	
				ld		hl,0
				ld		e,a
				ld		d,0
				or		a						
[8]				adc		hl,de
				ex		de,hl
				add		ix,de
				ld		l,(ix)
				ld		h,(ix+1)
				pop		ix
				push	hl
				ex		de,hl
				add		iy,de											; IY ahora está en la casilla que nos representa
				
.controlamos_por_fuego:

				push	ix
				push	bc
				push	hl
				
				ld		ix,FUEGO_DATOS
				
				ld		b,20
				
.bucle_del_fuego:

				ld		a,(ix)
				inc		a
				push	bc
				ld		b,a
				ld		a,(PAGE_MAPA)
				cp		b
				jp		nz,.terminando_el_ciclo
				

				ld		hl,(SEGUIMIENTO_CASILLA)
				
				ld		de,45
				or		a
				sbc		hl,de
		
				call	TRANSFORMA_VALOR_2D_EN_3D
				
				push	hl
				ld		l,(ix+1)
				ld		h,(ix+2)
				pop		de
				call	DCOMPR
				
				jp		z,.sprites_1_2_por_detras_fuego
				
				ld		hl,(SEGUIMIENTO_CASILLA)
				
				ld		de,90
				or		a
				sbc		hl,de				

				call	TRANSFORMA_VALOR_2D_EN_3D

				push	hl
				ld		l,(ix+1)
				ld		h,(ix+2)
				pop		de
				call	DCOMPR
				
				jp		z,.sprites_1_por_detras_fuego
				
.terminando_el_ciclo:
				
				ld		de,4
				add		ix,de
				
				pop		bc
				
				djnz	.bucle_del_fuego			
				
				pop		hl
				pop		bc
				pop		ix
				
				jp		.vamos_a_las_especialidades
				
.sprites_1_por_detras_fuego:

				pop		bc
				pop		hl
				pop		bc
				pop		ix
				pop		hl
				pop		iy
				pop		ix
				
				ld		a,(ix+3)
				and		11000000B
				ld		(ix+3),a
				ret

.sprites_1_2_por_detras_fuego:

				pop		bc
				pop		hl
				pop		bc
				pop		ix
				pop		hl
				pop		iy
				pop		ix
								
				ld		a,(ix+3)
				and		11000000B
				ld		(ix+3),a
				ld		a,(ix+7)
				and		11000000B
				ld		(ix+7),a
				ret				
				
.vamos_a_las_especialidades:
								
				ld		a,(PAGE_MAPA)				
				inc		a
				ld		de,LISTA_DE_PRIORIDADES_POR_SALAS
				jp		LISTA_DE_OPCIONES					

.especial_de_1:

				pop		hl												; HL vale la casilla en la que está
				ld		de,#7C1											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#794											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#767											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#792											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#765											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#6E2											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#6B5											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#70F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				jp		.fin

.especial_de_2:

				pop		hl												; HL vale la casilla en la que está

				ld		de,#328											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#329											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#32A											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
												
				jp		.fin
								
.especial_de_3:

				pop		hl												; HL vale la casilla en la que está

				ld		de,#3E1											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#3B5											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#40D											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#43A											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#467											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#43B											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#40F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#40E											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#3E2											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#3B6											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#389											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#3E3											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades

				ld		de,#3E4											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
								
				ld		de,#3B7											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#38A											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#32E				;Hay que poner sprite puerta; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades	
				
				ld		de,#32F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades	
								
				ld		de,#302											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#2D5											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#301											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#32D											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades	
								
				jp		.fin

.especial_de_4:

				pop		hl												; HL vale la casilla en la que está

				ld		de,991											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,1035											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,1036											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				jp		.fin
								
.especial_de_5:

				pop		hl												; HL vale la casilla en la que está

				ld		de,#3DD											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#409											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#40A											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#435											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#436											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
								
				jp		.fin

.especial_de_6:


				pop		hl												; HL vale la casilla en la que está

				ld		de,#507											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#4DA											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#534											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#562											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades

				jp		.fin
				
.especial_de_7:

				pop		hl												; HL vale la casilla en la que está

				ld		de,#59B											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#59C											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#570											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#56F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#56E											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#541											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#542											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#543											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#516											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#56D											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#540											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#513											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#511											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#53E											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#56B											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades											
				
				jp		.fin

.especial_de_9:

				pop		hl												; HL vale la casilla en la que está

				ld		de,1865											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras						; Si es Zero hacemos cambios en las prioridades
				
				ld		de,1910											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,1955											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,1999											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				jp		.fin
							
.especial_de_10:

				pop		hl												; HL vale la casilla en la que está

				ld		de,#89F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8CC											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades

				ld		de,#8F9											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
								
				ld		de,#875											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#848											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#81B											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades

				jp		.fin
				
.especial_de_12:

				pop		hl												; HL vale la casilla en la que está

				ld		de,#8ae											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8ad											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades

				ld		de,#8AC											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
								
				ld		de,#8da											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8DB											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8AF											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8DC											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#908											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#907											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#882											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#9AC											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#87F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8D9											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#A38											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades

				ld		de,#A36											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
								
				ld		de,#A37											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#A0A											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#A0B											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#9DE											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#98F											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#901											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#92E											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#95B											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#884											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_2_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8B1											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
				
				ld		de,#8DE											; DE vale la casilla que queremos corroborar
				call	DCOMPR											; Comparamos								
				jp		z,.sprites_1_por_detras							; Si es Zero hacemos cambios en las prioridades
								
				jp		.fin

.especial_de_13:

				pop		hl												; HL vale la casilla en la que está

				jp		.sprites_1_2_por_detras
				
.otras_posibilidades:

				pop		hl
				jp		.fin
				
.pack_return:
	
				pop		iy
				pop		ix
				ret

.sprites_1_por_detras:

				ld		a,(ix+3)
				and		11000000B
				ld		(ix+3),a
				jp		.pack_return

.sprites_2_por_detras:

				ld		a,(ix+7)
				and		11000000B
				ld		(ix+7),a
				jp		.pack_return


.sprites_1_2_por_detras:

				ld		a,(ix+3)
				and		11000000B
				ld		(ix+3),a
				ld		(ix+7),a
				jp		.pack_return
																											
.fin:
				pop		iy
				pop		ix												; Devolvemos a IX su antiguo valor
				ret
