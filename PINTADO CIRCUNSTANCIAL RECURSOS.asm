ROMPE_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_AA_ARRIBA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ARRIBA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_AA_ARRIBA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ARRIBA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ARRIBA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_VENTANA_AA_ARRIBA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ARRIBA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ABAJO_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ABAJO_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_VENTANA_AA_ABAJO_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_ID_IZQUIERDA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_IZQUIERDA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_IZQUIERDA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_IZQUIERDA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_DERECHA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_DERECHA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_DERECHA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret	
							
ABRE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_DERECHA_CORTA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_IZQUIERDA_LARGA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_IZQUIERDA_LARGA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_ID_IZQUIERDA_LARGA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_IZQUIERDA_LARGA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_A_DENTRO:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_IZQUIERDA_LARGA_A_DENTRO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_IZQUIERDA_LARGA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_DERECHA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_DERECHA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																
ABRE_VENTANA_ID_DERECHA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_DERECHA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_LARGA_A_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_DERECHA_LARGA_A_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
REFUERZA_VENTANA_ID_DERECHA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_DERECHA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ARRIBA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ARRIBA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_AA_ARRIBA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ARRIBA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ARRIBA_LARGA_A_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_LARGA_A_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
REFUERZA_VENTANA_AA_ARRIBA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ABAJO_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ABAJO_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_AA_ABAJO_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ABAJO_LARGA_A_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				

				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_LARGA_A_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_ESTANTERIA_CORTA_A_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_ROTA_CORTA_A						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_ESTANTERIA_LARGA_A_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_ROTA_LARGA_A						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_CAMA_HACIA_DERECHA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,CAMA_ROTA_HACIA_DERECHA_A					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ROMPE_CAMA_HACIA_IZQUIERDA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,140											; Le sumamos 6 porque hay que pintar cama rota
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,CAMA_ROTA_HACIA_IZQUIERDA_A					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_CAMA_HACIA_IZQUIERDA_CON_VENTANA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,140											; Le sumamos 6 porque hay que pintar cama rota
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,CAMA_ROTA_HACIA_IZQUIERDA_CON_VENTANA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ROMPE_MESA:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,MESA_ROTA									; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_SILLA_IZQUIERDA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,SILLA_ROTA_IZQUIERDA									; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

MESA_MANCHADA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,MESA_MANCHADA_DE_SANGRE							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ROMPE_SILLA_DERECHA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,SILLA_ROTA_DERECHA									; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
BORRA_ESTANTERIA_CORTA_A_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_BORRADA_CORTA_A					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_CAMA_HACIA_DERECHA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
					
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,CAMA_BORRADA_HACIA_IZQUIERDA_A					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
BORRA_CAMA_HACIA_IZQUIERDA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le sumamos 6 porque hay que pintar cama rota
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,CAMA_BORRADA_HACIA_IZQUIERDA_A					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_CAMA_HACIA_IZQUIERDA_CON_VENTANA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le sumamos 6 porque hay que pintar cama rota
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,CAMA_BORRADA_HACIA_IZQUIERDA_CON_VENTANA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
BORRA_MESA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,MESA_BORRADA									; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_SILLA_IZQUIERDA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,SILLA_BORRADA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																								
REFUERZA_VENTANA_AA_ABAJO_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_AA_ARRIBA_LARGA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_AA_ARRIBA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_PUERTA_AA_ARRIBA_LARGA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ARRIBA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_AA_ARRIBA_LARGA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_AA_ARRIBA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_IZQUIERDA_CORTA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_IZQUIERDA_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_ID_IZQUIERDA_CORTA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_IZQUIERDA_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_IZQUIERDA_CORTA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_IZQUIERDA_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_DERECHA_CORTA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_DERECHA_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_ID_DERECHA_CORTA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_DERECHA_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_CORTA_A:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_DERECHA_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_SOTANO_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_SOTANO_A			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_SOTANO_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_SOTANO_A			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_AA_ABAJO_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_AA_ABAJO_LARGA_A			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_AA_ABAJO_LARGA_A:


				call	CALCULAMOS_POSICION_DE_OBJETO
	
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
							
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ABAJO_LARGA_A			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_AA_ABAJO_LARGA_A_DENTRO:


				call	CALCULAMOS_POSICION_DE_OBJETO
							
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_AA_ABAJO_LARGA_A_DENTRO			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_ID_DERECHA_LARGA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_LARGA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ABRE_ARMARIO_AA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_ABIERTO_ID_A							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_ARMARIO_AA_A:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_ROTO_ID_A							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_ARMARIO_AA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,130											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_BORRADO_ID_A							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
REFUERZA_VENTANA_AA_ARRIBA_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_CORTA_A		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ABAJO_CORTA_A:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_CORTA_A	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_IZQUIERDA_CORTA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_IZQUIERDA_CORTA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																																																																				
ABRE_VENTANA_ID_IZQUIERDA_CORTA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_IZQUIERDA_CORTA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_IZQUIERDA_CORTA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_IZQUIERDA_CORTA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_DERECHA_CORTA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_DERECHA_CORTA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_ID_DERECHA_CORTA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_DERECHA_CORTA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_CORTA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_DERECHA_CORTA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_IZQUIERDA_LARGA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_IZQUIERDA_LARGA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_VENTANA_ID_IZQUIERDA_LARGA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_IZQUIERDA_LARGA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_IZQUIERDA_LARGA:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_IZQUIERDA_LARGA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_POR_DENTRO:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_IZQUIERDA_LARGA_POR_DENTRO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_IZQUIERDA_LARGA_CAMPO:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_IZQUIERDA_LARGA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_VENTANA_ID_IZQUIERDA_LARGA_CAMPO:
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_IZQUIERDA_LARGA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_DERECHA_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_DERECHA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																
ABRE_VENTANA_ID_DERECHA_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_DERECHA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_DERECHA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_LARGA_POR_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_DI_DERECHA_LARGA_POR_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_DERECHA_LARGA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_DI_DERECHA_LARGA_CAMPO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_VENTANA_ID_DERECHA_LARGA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_DI_DERECHA_LARGA_CAMPO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_ID_DERECHA_CORTADA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_CORTADA_DI_DERECHA			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_CORTADA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_CORTADA_DI_DERECHA			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_ID_DERECHA_CORTADA_SIN_TECHO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_CORTADA_SIN_TECHO_DI_DERECHA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_ID_DERECHA_CORTADA_SIN_TECHO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_CORTADA_SIN_TECHO_DI_DERECHA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_ID_DERECHA_CORTADA_SIN_TECHO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_CORTADA_SIN_TECHO_DI_DERECHA	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ROMPE_VENTANA_AA_ARRIBA_CORTA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ARRIBA_CORTA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_AA_ARRIBA_CORTA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ARRIBA_CORTA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ARRIBA_CORTA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_CORTA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ARRIBA_LARGA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ARRIBA_LARGA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_AA_ARRIBA_LARGA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ARRIBA_LARGA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ABAJO_CORTA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ABAJO_CORTA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_AA_ABAJO_CORTA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_CORTA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ABAJO_CORTA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_CORTA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_VENTANA_AA_ABAJO_CORTA_CAMPO_BAUL:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_CORTA_CAMPO_BAUL	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ABAJO_LARGA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ABAJO_LARGA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_VENTANA_AA_ABAJO_LARGA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_LARGA_CAMPO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_VENTANA_AA_ABAJO_LARGA_CAMPO_BAUL:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_LARGA_CAMPO_BAUL	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ARRIBA_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ARRIBA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																								
ABRE_VENTANA_AA_ARRIBA_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ARRIBA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ARRIBA_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_VENTANA_AA_ARRIBA_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ABAJO_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
				
				ret
				
ROMPE_VENTANA_AA_ABAJO_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ROTA_NORMAL_AA_ABAJO_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
				
				ret
								
ABRE_VENTANA_AA_ABAJO_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
				
				ret

REFUERZA_VENTANA_AA_ABAJO_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_ID_SOTANO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_SOTANO				; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_IZQUIERDA_CORTA:
				
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_IZQUIERDA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_PUERTA_ID_IZQUIERDA_CORTA:
				
				
				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_IZQUIERDA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_DERECHA_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_DERECHA_CORTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_CORTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_IZQUIERDA_CORTA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_IZQUIERDA_CORTA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_IZQUIERDA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_IZQUIERDA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_IZQUIERDA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO	; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_ID_DERECHA_CORTA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																								
ABRE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_ID_DERECHA_CORTA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_AA_ARRIBA_LARGA:


				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_AA_ARRIBA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_PUERTA_AA_ARRIBA_LARGA:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ARRIBA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ABRE_PUERTA_AA_ARRIBA_LARGA_sala_3:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ARRIBA_LARGA_sala_3		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ROMPE_PUERTA_AA_ARRIBA_LARGA_SOBRE_MADERA:


				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_AA_ARRIBA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_PUERTA_AA_ARRIBA_LARGA_SOBRE_MADERA:


				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ARRIBA_LARGA_SOBRE_MADERA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_PUERTA_AA_ABAJO_LARGA:


				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ROTA_NORMAL_AA_ABAJO_LARGA			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
												
ABRE_PUERTA_AA_ABAJO_LARGA:


				call	CALCULAMOS_POSICION_DE_OBJETO
	
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
							
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_ABIERTA_NORMAL_AA_ABAJO_LARGA			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_PUERTA_AA_ABAJO_LARGA:


				call	CALCULAMOS_POSICION_DE_OBJETO
												
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,PUERTA_REFORZADA_NORMAL_AA_ABAJO_LARGA			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
																
ABRE_VENTANA_AA_ARRIBA_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ARRIBA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ARRIBA_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ARRIBA_LARGA_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,128											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ARRIBA_LARGA_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_VENTANA_AA_ABAJO_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				ld		de,4											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				sbc		hl,de
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_ABIERTA_NORMAL_AA_ABAJO_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ABAJO_LARGA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_LARGA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

REFUERZA_VENTANA_AA_ABAJO_LARGA_DENTRO:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,VENTANA_REFORZADA_NORMAL_AA_ABAJO_LARGA_DENTRO		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
ABRE_ARMARIO_AA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_ABIERTO_ID							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_ARMARIO_AA:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_ROTO_ID							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_ARMARIO_AA:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,130											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				SBC		hl,de	
											
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_BORRADO_ID							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_ARMARIO_AA_ESQUINA:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,130											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				SBC		hl,de	
											
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_BORRADO_ID_ESQUINA					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_ARMARIO_AA_ESQUINA_ARRIBA:

				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,130											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				SBC		hl,de	
											
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ARMAIRO_BORRADO_ID_ESQUINA_ARRIBA					; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
					
																	
ABRE_BAUL_NS:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ABIERTO_NS								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_BAUL_NS:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO

				ld		de,130											; Le restamos 4 porque hay que pintar la ventana abierta
				or		a
				adc		hl,de
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ROTO_NS								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_BAUL_AA:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ROTO_AA									; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_BAUL_AA_VENTANA:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ROTO_AA_VENTANA							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
BORRA_BAUL_NS:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_BORRADO_NS								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

BORRA_BAUL_AA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_BORRADO_AA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
BORRA_BAUL_AA_VENTANA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_BORRADO_AA_VENTANA						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
BORRA_BAUL_NS_ESQUINA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_BORRADO_NS_ESQUINA						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret	
							
ROMPE_ESTANTERIA_CORTA:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_ROTA_CORTA						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_ESTANTERIA_LARGA:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_ROTA_LARGA						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ROMPE_ESTANTERIA_LARGA_SIN:

				ld		a,(iy)
				or		a
				ret		z
				
				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_ROTA_LARGA_SIN						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
								
BORRA_ESTANTERIA_AA:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_BORRADA_CORTA_AA						; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret	
				
BORRA_ESTANTERIA_LL:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_BORRADA_LARGA_AA_2				; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret	

BORRA_ESTANTERIA_LL_SIN:

				call	CALCULAMOS_POSICION_DE_OBJETO
								
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,ESTANTERIA_BORRADA_LARGA_AA_SIN_LINEA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret	
																				
ABRE_BAUL_NS_CON_SEMIVENTANA_ABIERTA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ABIERTO_NS_CON_SEMIVENTANA_ABIERTA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

ABRE_BAUL_NS_CON_SEMIVENTANA_CERRADA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ABIERTO_NS_CON_SEMIVENTANA_CERRADA		; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
ABRE_BAUL_NS_CON_VENTANA:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BAUL_ABIERTO_NS_CON_VENTANA		 			; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
				ret	

ENCIENDE_FUEGO:

				call	CALCULAMOS_POSICION_DE_OBJETO
				
				push	iy
				push	bc
				push	de
				push	hl
								
				ld		l,(ix+1)
				ld		h,(ix+2)
				ld		c,(ix)
				ld		de,360
				or		a
				sbc		hl,de
				
.rutina_para_ver_si_hay_fuego_encima:
								
				ld		iy,FUEGO_DATOS
				
				ld		b,20
.bucle_1:

				ld		a,(iy)
				cp		c
				jp		nz,.bucle_1_2
				
				ld		e,(iy+1)
				ld		d,(iy+2)
				call	DCOMPR
				jp		z,.si_lo_hay__rutina_fuego_abajo

.bucle_1_2:

				ld		de,4
				add		iy,de
				djnz	.bucle_1
				
				jp		.no_lo_hay__rutina_fuego_abajo
				
.si_lo_hay__rutina_fuego_abajo:
				
				ld		iy,FUEGO_DATOS
				
				ld		de,720
				or		a
				adc		hl,de
								
				ld		b,20
.bucle_2:
					
				ld		a,(iy)
				cp		c
				jp		nz,.bucle_2_2
				
				ld		e,(iy+1)
				ld		d,(iy+2)
				call	DCOMPR
				jp		z,.pintamos_montado_doble

.bucle_2_2:

				ld		de,4
				add		iy,de
				djnz	.bucle_2
				jp		.pintamos_montado_arriba
				
.pintamos_montado_doble:

				pop		hl
				pop		de
				pop		bc
				pop		iy		
				push	ix												; Salvamos IX para recuperarlo después
				
				ld		a,(POSICION_FUEGO)
				cp		2
				jp		z,.pintamos_montado_doble_pos2
				ld		ix,FUEGO_MONTADO_POR_ARRIBA_Y_ABAJO_pos1				; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
				
.pintamos_montado_doble_pos2:

				ld		ix,FUEGO_MONTADO_POR_ARRIBA_Y_ABAJO_pos2				; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO	
				pop		ix												; Recuperamos IX
												
				ret
															
.pintamos_montado_arriba:
				
				pop		hl
				pop		de
				pop		bc
				pop		iy		
				push	ix												; Salvamos IX para recuperarlo después

				ld		a,(POSICION_FUEGO)
				cp		2
				jp		z,.pintamos_montado_arriba_pos2
				
				ld		ix,FUEGO_MONTADO_ARRIBA_pos1							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

.pintamos_montado_arriba_pos2:

				ld		ix,FUEGO_MONTADO_ARRIBA_pos2							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
													
.no_lo_hay__rutina_fuego_abajo:
					
				ld		iy,FUEGO_DATOS
				
				ld		de,720
				or		a
				adc		hl,de
								
				ld		b,20
.bucle_3:

				ld		a,(iy)
				cp		c
				jp		nz,.bucle_3_2
								
				ld		e,(iy+1)
				ld		d,(iy+2)
				call	DCOMPR
				jp		z,.pintamos_montado_abajo

.bucle_3_2:

				ld		de,4
				or		a
				add	iy,de
				djnz	.bucle_3
				
				jp		.pintamos_sin_montar
				
.pintamos_montado_abajo:

				pop		hl
				pop		de
				pop		bc
				pop		iy		
				push	ix												; Salvamos IX para recuperarlo después

				ld		a,(POSICION_FUEGO)
				cp		2
				jp		z,.pintamos_montado_abajo_pos2
				
				ld		ix,FUEGO_MONTADO_ABAJO_pos1							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

.pintamos_montado_abajo_pos2:				

				ld		ix,FUEGO_MONTADO_ABAJO_pos2							; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

.pintamos_sin_montar:				
				
				pop		hl
				pop		de
				pop		bc
				pop		iy		
				push	ix												; Salvamos IX para recuperarlo después

				ld		a,(POSICION_FUEGO)
				cp		2
				jp		z,.pintamos_sin_montar_pos2
				
				ld		ix,FUEGO_PINTADO_pos1								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret

.pintamos_sin_montar_pos2:

				ld		ix,FUEGO_PINTADO_pos2								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix												; Recuperamos IX
												
				ret
