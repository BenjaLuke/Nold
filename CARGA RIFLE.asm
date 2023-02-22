CARGA_RIFLE:

				exx

				ld		a,(DADO_DEL_JUGADOR)
				cp		1
				jp		c,.no_se_puede
				ld		a,(ACCIONES_LIBRES)
				cp		1
				jp		c,.no_se_puede
								
				ld		b,2

				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		iy,ESCOPETA_CARGADA
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
[15]			add		ix,de
				add		iy,de

				ld		a,(ix+5)
				or		a
				jp		z,.no_se_puede

				ld		a,(ix+1)
				or		a
				jp		z,.no_se_puede
				cp		2
				jp		nc,.dos_balas
				
.solo_una_bala:

				ld		b,1

.dos_balas:	

				ld		a,(iy)
				cp		2
				jp		z,.no_se_puede
				or		a
				jp		z,.cargamos

.solo_entra_una:

				ld		b,1
				
.cargamos:		

				add		b
				ld		(iy),a
				
				ld		a,(ix+1)
				sub		b
				ld		(ix+1),a
				
				ld		a,(DADO_DEL_JUGADOR)
				dec		a
				ld		(DADO_DEL_JUGADOR),a
				
				ld		a,(ACCIONES_LIBRES)
				dec		a
				ld		(ACCIONES_LIBRES),a
								
.pintamos_los_cambios:
				
				call	PINTAMOS_TODO_PG1
				ld		a,1
				ld		(ARRASTRA_STRIG),a
				
				push	ix
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,10
				ld		(ix),a
				pop		ix
				call	DANDO_IMAGEN_AL_SPRITE
															
				jp		.fin
				
.no_se_puede:

				ld		iy,FRASE_NO_FUNCIONA_LA_ACCION
				call	CARGA_RIFLE_PG1_1

				ld		a,1
				ld		(ARRASTRA_STRIG),a		
																
.fin:

				ld		a,4												; Rutina especial pulsando M				
				call	SNSMAT
				bit		2,a
				jp		z,.fin
				
				exx
				jp		RUTINA_ESPECIAL_FINAL_DATOS_EXTRA_VISIBLES.rutina_de_acciones
