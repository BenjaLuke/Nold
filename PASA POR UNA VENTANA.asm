PASA_VENTANA:

				push	ix
				ld		hl,(SEGUIMIENTO_CASILLA)
				ld		a,(QUE_SE_HA_PULSADO)
				cp		1
				jp		z,.paso_ventana_1
				cp		7
				jp		z,.paso_ventana_1
				cp		3
				jp		z,.variacion_a_derecha 
				
.variacion_abajo:

				ld		de,44
				or		a
				adc		hl,de
				jp		.paso_ventana_1
						
.variacion_a_derecha:

				ld		de,1
				or		a
				adc		hl,de
								
.paso_ventana_1:
				
				ld		ix,P_672
				ld		b,36

.bucle_1:

				ld		e,(ix+1)
				ld		a,(ix+2)
				and		00011111b
				ld		d,a
				call	DCOMPR
				jp		nz,.siguiente

.vemos_si_es_ventana:

				ld		a,(ix+2)
				and		01100000B
[3]				rlc		a
				cp		2
				jp		c,.final
				ld		a,(ix+2)
				and		10000000B
				rlc		a
				or		a
				jp		z,.compatible_ns

.compatible_aa:

				ld		a,(QUE_SE_HA_PULSADO)
				cp		1
				jp		z,.vemos_si_tiene_dado
				cp		5
				jp		z,.vemos_si_tiene_dado
				jp		.final

.compatible_ns:

				ld		a,(QUE_SE_HA_PULSADO)
				cp		3
				jp		z,.vemos_si_tiene_dado
				cp		7
				jp		z,.vemos_si_tiene_dado
				jp		.final
								
.vemos_si_tiene_dado:

				ld		a,(DADO_DEL_JUGADOR)
				cp		2
				jp		nc,.atraviesa_la_ventana
				
				call	RUTINA_FRASE_NO_FUNCIONA_LA_ACCION

				pop		ix
				ld		a,1
				ret

.atraviesa_la_ventana:

				dec		a
				ld		(DADO_DEL_JUGADOR),a
				jp		.final
				
.siguiente:

				ld		de,3
				add		ix,de
				djnz	.bucle_1

.final:

				xor		a
				pop		ix
				ret
