DIBUJAMOS_EL_RASTRO:

				push	ix
				push	de
				
				ld		ix,RASTRO_1
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[22]			add		ix,de											; Colocamos IX señalando al primer par de bytes del rastro del personaje en cuestión

				jp		.bucle_tras_aumento
				
.bucle:

				ld		de,2
				add		ix,de
				
.bucle_tras_aumento:
				
				ld		l,(ix)
				ld		h,(ix+1)
				
				ld		de,#FFFF
				call	DCOMPR
				jp		nz,.bucle
				
				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		(ix),l
				ld		(ix+1),h
				
				ld		de,2
				add		ix,de
				
.revisa_final_1:

				push	ix
				pop		hl
				ld		de,RASTRO_2
				call	DCOMPR
				jp		nz,.revisa_final_2
				ld		ix,RASTRO_1
				jp		.final_de_carrera
				
.revisa_final_2:

				push	ix
				pop		hl
				ld		de,RASTRO_3
				call	DCOMPR
				jp		nz,.revisa_final_3
				ld		ix,RASTRO_2
				jp		.final_de_carrera

.revisa_final_3:

				push	ix
				pop		hl
				ld		de,RASTRO_4
				call	DCOMPR
				jp		nz,.revisa_final_4
				ld		ix,RASTRO_3
				jp		.final_de_carrera

.revisa_final_4:

				push	ix
				pop		hl
				ld		de,RASTRO_5
				call	DCOMPR
				jp		nz,.revisa_final_5
				ld		ix,RASTRO_4
				jp		.final_de_carrera

.revisa_final_5:

				push	ix
				pop		hl
				ld		de,RASTRO_6
				call	DCOMPR
				jp		nz,.revisa_final_6
				ld		ix,RASTRO_5
				jp		.final_de_carrera

.revisa_final_6:

				push	ix
				pop		hl
				ld		de,FINAL_DE_RASTROS
				call	DCOMPR
				jp		nz,.final_de_carrera
				ld		ix,RASTRO_6

				ld		de,2
				add		ix,de
												
.final_de_carrera:			
				
				ld		a,#FF
				ld		(ix),a
				ld		(ix+1),a
				
				pop		de
				pop		ix
				
				ret	
