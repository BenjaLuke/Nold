CIRCUNSTANCIAL_DE_A:

				ld		a,1
				ld		(CIRCUNSTANCIAL_A_O_B),a
				
				ld		a,(PAGE_MAPA)
				dec		a
				ld		de,LISTA_DIRECCIONES_CIRCUNSTANCIAL_DE_A
				jp		LISTA_DE_OPCIONES

CIRCUNSTANCIAL_1_A:

				ld		bc,6564											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1417)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ABAJO_LARGA_A
				cp		1
				call	z,ABRE_PUERTA_AA_ABAJO_LARGA_A
				cp		3
				call	z,REFUERZA_PUERTA_AA_ABAJO_LARGA_A_DENTRO				

				ld		bc,5856											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1329)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA_A_DENTRO				

				ld		bc,5500											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1285)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA_A_DENTRO
				
				ld		bc,4448											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_977)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA_A_DENTRO

				ld		bc,4092											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_933)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA_A_DENTRO
				
				ld		bc,3772											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_672)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_DENTRO
				
				ld		bc,4144											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_675)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_A_DENTRO
									
				ld		bc,4508											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_676)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_LARGA_A_DENTRO
												
				ld		bc,5612											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_683)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_DENTRO
			
				ld		bc,5984											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_686)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_A_DENTRO
								
				ld		bc,6348											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_687)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_LARGA_A_DENTRO
				
				ld		a,1
				ld		(FURGONETA_EXISTE),a
				
				ld		bc,9066											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9068											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9070											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9072											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix	

				ld		bc,9074											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix
																								
				ld		bc,9076											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9078											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9080											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9082											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix	

				ld		bc,9084											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
				xor		a
				ld		(FURGONETA_EXISTE),a			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix
																												
				ret
				
CIRCUNSTANCIAL_2_A:

				ld		bc,5196											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_939)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_LARGA_A
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_PUERTA_AA_ARRIBA_LARGA_A

				ld		bc,5538											; Casilla del mapa en que se empieza a pintar la estantería
				ld		a,(E_1024)
				ld		iy,E_1024
				ld		de,36*3
				add		iy,de
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_ESTANTERIA_CORTA_A_A
				cp		3
				call	z,ROMPE_ESTANTERIA_LARGA_A_A
				
				ld		bc,5216											; Casilla del mapa en que se empieza a pintar la cama
				ld		a,(C_720)
				ld		iy,C_720
				ld		de,36*3
				add		iy,de
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_CAMA_HACIA_IZQUIERDA_A
				cp		3
				call	z,ROMPE_CAMA_HACIA_IZQUIERDA_A
																
				ret

CIRCUNSTANCIAL_3_A:

				ld		bc,8144											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_911)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_LARGA_A				
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA_A
				
				ld		bc,7788											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_867)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA_A
				
				ld		bc,8492											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1043)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_LARGA_A				
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_PUERTA_AA_ARRIBA_LARGA_A
								
				ld		bc,7392											; Casilla del mapa en que se empieza a pintar la puerta
				ld		a,(P_993)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A
				
				push	iy
				ld		bc,7406											; Casilla del mapa en que se empieza a pintar el armario
				ld		a,(A_861)
				ld		iy,A_861
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ARMARIO_AA_A
				cp		1
				call	z,ABRE_ARMARIO_AA_A
				cp		3
				call	z,ROMPE_ARMARIO_AA_A

				ld		bc,9198										; Casilla del mapa en que se empieza a pintar la estantería
				ld		a,(E_1174)
				ld		iy,E_1174
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_ESTANTERIA_CORTA_A_A
				cp		3
				call	z,ROMPE_ESTANTERIA_CORTA_A_A

				ld		bc,6304											; Casilla del mapa en que se empieza a pintar la estantería
				ld		a,(C_723)
				ld		iy,C_723
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_CAMA_HACIA_DERECHA_A
				cp		3
				call	z,ROMPE_CAMA_HACIA_DERECHA_A
				
				pop		iy
													
				ret

CIRCUNSTANCIAL_4_A:

				ld		bc,6252											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1202)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				
				ld		bc,5936											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_943)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA_A
				
				ld		bc,6300											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_944)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO_A

				ld		bc,7392											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_993)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_AA_ARRIBA_CORTA_SOBRE_MADERA_A
	
				ld		bc,8456											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1213)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A	
	
				ret

CIRCUNSTANCIAL_5_A:

				push	iy
				
				ld		bc,7360											; Casilla del mapa en que se empieza a pintar la CAMA
				ld		a,(C_987)
				ld		iy,C_987
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_CAMA_HACIA_DERECHA_A
				cp		3
				call	z,ROMPE_CAMA_HACIA_DERECHA_A
				
				pop		iy
				
				ret

CIRCUNSTANCIAL_6_A:

				ld		bc,7292											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1551)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_CORTA_A
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_CORTA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_CORTA_A
				
				ld		bc,7656											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1552)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_CORTA_A
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_CORTA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_CORTA_A

				ld		bc,6956											; Casilla del mapa en que se empieza a pintar la mesa
				ld		a,(M_1334)
				ld		iy,M_1334
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_MESA
				cp		3
				call	z,ROMPE_MESA

				ld		bc,7670											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_1422)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA

				ld		bc,5870											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_1197)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA
								
				ret
				
CIRCUNSTANCIAL_7_A:

				ld		bc,8764											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1560)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_IZQUIERDA_CORTA_A
				
				ld		bc,9128											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1561)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_CORTA_A
				
				ld		bc,9872											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1567)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_A

				ld		bc,10236										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1568)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_LARGA_A
				cp		3
				call	Z,REFUERZA_VENTANA_ID_DERECHA_LARGA_A

				ld		bc,10256										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1439)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA_A

				ld		bc,9900											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1395)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA_A

				ld		bc,9548											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1307)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_LARGA_A
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_LARGA_A
				cp		3
				call	z,REFUERZA_PUERTA_AA_ARRIBA_LARGA_A	

				ld		bc,10606										; Casilla del mapa en que se empieza a pintar la estantería
				ld		a,(E_1526)
				ld		iy,E_1526
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ESTANTERIA_CORTA_A_A
				cp		3
				call	z,ROMPE_ESTANTERIA_CORTA_A_A

				ld		bc,8804											; Casilla del mapa en que se empieza a pintar la mesa
				ld		a,(M_1301)
				ld		iy,M_1301
				ld		de,36*3
				add		iy,de				
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_MESA
				cp		3
				call	z,ROMPE_MESA

				ld		bc,8438											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_1254)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA

				ld		bc,8070											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_1252)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA
																						
				ret
				
CIRCUNSTANCIAL_8_A:

				ld		bc,9856											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1609)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_CORTA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_CORTA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_CORTA_A

				ld		bc,10212										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1653)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_CORTA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_CORTA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_CORTA_A
				
				
				ld		bc,9468											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1736)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_IZQUIERDA_CORTA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_IZQUIERDA_CORTA_A
				
				ld		bc,9832											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1737)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA_A
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_CORTA_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_CORTA_A

				ret
				
CIRCUNSTANCIAL_9_A:
			
				ld		a,(QUIEN_JUEGA)
				or		a
				ret		nz				
				
				ld		a,1
				ld		(FURGONETA_EXISTE),a
				
				ld		bc,9066											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9068											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9070											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9072											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix	

				ld		bc,9074											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix
																								
				ld		bc,9076											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9078											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9080											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix

				ld		bc,9082											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
		
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix	

				ld		bc,9084											; Casilla del mapa en que se empieza a pintar la ventana
				call	CALCULAMOS_POSICION_DE_OBJETO
				xor		a
				ld		(FURGONETA_EXISTE),a			
				
				push	ix												; Salvamos IX para recuperarlo después
				ld		ix,BORRA_FURGONETA								; IX vale los tiles que se han de pintar
				call	PINTAMOS_EL_OBJETO
				pop		ix
						
				ret
				
CIRCUNSTANCIAL_10_A:

				ld		bc,4486											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_2162)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA
				
				ld		bc,4138											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_2030)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_DERECHA

				ld		bc,5916											; Casilla del mapa en que se empieza a pintar la cama
				ld		a,(C_2386)
				ld		iy,C_2386
				ld		de,36*3
				add		iy,de
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_CAMA_HACIA_IZQUIERDA_CON_VENTANA_A
				cp		3
				call	z,ROMPE_CAMA_HACIA_IZQUIERDA_CON_VENTANA_A
								
				ret
				
CIRCUNSTANCIAL_11_A:

				ld		bc,7344											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1250)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		1
				call	z,ABRE_PUERTA_ID_SOTANO_A
				cp		3
				call	z,REFUERZA_PUERTA_ID_SOTANO_A
								
				ret
				
CIRCUNSTANCIAL_12_A:

				ld		bc,8814										; Casilla del mapa en que se empieza a pintar la estantería
				ld		a,(E_2535)
				ld		iy,E_2535
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_ESTANTERIA_CORTA_A_A
				cp		3
				call	z,ROMPE_ESTANTERIA_CORTA_A_A
				
				ld		bc,5934											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_2130)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA
				
				ld		bc,7034											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_2135)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_DERECHA
				
				ld		bc,6274											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_2260)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_DERECHA

				
				ld		bc,8462											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(S_2402)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_SILLA_IZQUIERDA
				cp		3
				call	z,ROMPE_SILLA_IZQUIERDA

				ld		bc,6660											; Casilla del mapa en que se empieza a pintar la silla
				ld		a,(KAREN)
				cp		1
				call	z,MESA_MANCHADA

				push	iy
				
				ld		bc,7680											; Casilla del mapa en que se empieza a pintar la CAMA
				ld		a,(C_2524)
				ld		iy,C_2524
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		0
				call	z,BORRA_CAMA_HACIA_DERECHA_A
				cp		3
				call	z,ROMPE_CAMA_HACIA_DERECHA_A
				
				pop		iy
																				
				ret

CIRCUNSTANCIAL_13_A:
				
				ret

CIRCUNSTANCIAL_14_A:

				ld		bc,8740										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1645)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_CORTA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_CORTA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_CORTA_A
				
				ld		bc,8384											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1601)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_CORTA_A
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_CORTA_A
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_CORTA_A
				
				ret
				
REVISAMOS_FUEGOS:

				ld		a,1
				ld		(CIRCUNSTANCIAL_A_O_B),a
				
				push	ix
				ld		ix,FUEGO_DATOS
				
				
				ld		b,20
				
.bucle:	
	
				push	bc
			
				ld		a,(ix)
				ld		b,a
				ld		a,(PAGE_MAPA)
				dec		a
				cp		b
				jp		nz,.saltamos_este_fuego
				
				ld		a,(ix+3)
				ld		(POSICION_FUEGO),a
				
				ld		c,(ix+1)
				ld		b,(ix+2)

				call	ENCIENDE_FUEGO

.saltamos_este_fuego:
				
				pop		bc
				
				ld		de,4
				add		ix,de
				
				djnz	.bucle

.final:
				
				pop ix
				
				ret				
