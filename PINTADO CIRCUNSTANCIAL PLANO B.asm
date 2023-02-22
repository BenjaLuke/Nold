CIRCUNSTANCIAL_DE_B:

				xor		a
				ld		(CIRCUNSTANCIAL_A_O_B),a


				ld		a,(PAGE_MAPA)
				dec		a
				ld		de,LISTA_DIRECCIONES_CIRCUNSTANCIAL_DE_B
				jp		LISTA_DE_OPCIONES

CIRCUNSTANCIAL_1_B:				

				ret
			
CIRCUNSTANCIAL_2_B:

				ld		bc,4448											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_977)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_LARGA_CAMPO				
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA_DENTRO
				
				ld		bc,4092											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_933)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA_DENTRO
				
				ld		bc,3772											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_672)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO
				
				ld		bc,4144											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_675)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_POR_DENTRO
								
				ld		bc,4508											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_676)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_LARGA_POR_DENTRO
				
				push	iy
				ld		bc,3760											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(A_669)
				ld		iy,A_669
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ARMARIO_AA_ESQUINA
				cp		1
				call	z,ABRE_ARMARIO_AA
				cp		3
				call	z,ROMPE_ARMARIO_AA	

				ld		bc,3754											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(E_713)
				ld		iy,E_713
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ESTANTERIA_LL_SIN
				cp		3
				call	z,ROMPE_ESTANTERIA_LARGA_SIN	
				pop		iy				
				ret
			
CIRCUNSTANCIAL_3_B:

				ld		bc,5612											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_683)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_CAMPO
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO
				
				ld		bc,5984											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_686)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_LARGA_POR_DENTRO
				
				ld		bc,6348										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_687)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_LARGA_POR_DENTRO
				
				push	iy
				ld		bc,7438											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_689)
				ld		iy,B_689
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_NS
				cp		1
				call	z,ABRE_BAUL_NS
				cp		3
				call	z,ROMPE_BAUL_NS
				pop		iy
				ret
			
CIRCUNSTANCIAL_4_B:

				ld		bc,5196											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_939)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_LARGA_SOBRE_MADERA
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_LARGA_SOBRE_MADERA
				cp		3
				call	z,REFUERZA_PUERTA_AA_ABAJO_LARGA

				push	iy
				ld		bc,5902											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_1025)
				ld		iy,B_1025
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_NS_ESQUINA
				cp		1
				call	z,ABRE_BAUL_NS
				cp		3
				call	z,ROMPE_BAUL_NS
				pop		iy				
				ret

CIRCUNSTANCIAL_5_B:

				ld		bc,5936											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_943)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA
				cp		1
				call	z,ABRE_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA
				cp		3
				call	z,REFUERZA_PUERTA_ID_IZQUIERDA_LARGA_SOBRE_MADERA
				
				ld		bc,6300											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_944)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO
				cp		3
				call	z,REFUERZA_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA_A_PASILLO
				
				push	iy
				ld		bc,6288											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(A_941)
				ld		iy,A_941
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ARMARIO_AA_ESQUINA
				cp		1
				call	z,ABRE_ARMARIO_AA
				cp		3
				call	z,ROMPE_ARMARIO_AA	
				
				ld		bc,6634											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(E_1073)
				ld		iy,E_1073
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ESTANTERIA_LL
				cp		3
				call	z,ROMPE_ESTANTERIA_LARGA							
				pop		iy
				ret
				
CIRCUNSTANCIAL_6_B:

				ld		bc,6564											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1417)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ABAJO_LARGA
				cp		1
				call	z,ABRE_PUERTA_AA_ABAJO_LARGA
				cp		3
				call	z,REFUERZA_PUERTA_AA_ABAJO_LARGA

				ld		bc,5856											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1329)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA_CAMPO_BAUL
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA_DENTRO

				ld		bc,5500											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1285)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA_DENTRO

				ld		bc,6252											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1202)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_LARGA_SOBRE_MADERA
				
				ld		a,(V_1329)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		1
				jp		nz,.baul_abierto_con_ventana_cerrada

.baul_abierto_con_ventana_abierta:

				push	iy
				ld		bc,6928											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_1417)
				ld		iy,B_1417
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_AA_VENTANA
				cp		1
				call	z,ABRE_BAUL_NS_CON_SEMIVENTANA_ABIERTA
				cp		3
				call	z,ROMPE_BAUL_AA_VENTANA
				pop		iy
				
				ret
				
.baul_abierto_con_ventana_cerrada:												

				push	iy
				ld		bc,6928											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_1417)
				ld		iy,B_1417
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_AA
				cp		1
				call	z,ABRE_BAUL_NS_CON_SEMIVENTANA_CERRADA
				cp		3
				call	z,ROMPE_BAUL_AA
				pop		iy
								
				ret
				
CIRCUNSTANCIAL_7_B:

				
				ld		bc,7344											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1250)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				cp		1
				call	z,ABRE_PUERTA_ID_SOTANO

				ld		bc,8456											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1213)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA

				push	iy
				ld		bc,7694											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(A_1293)
				ld		iy,A_1293
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ARMARIO_AA 
				cp		1
				call	z,ABRE_ARMARIO_AA
				cp		3
				call	z,ROMPE_ARMARIO_AA

				
				ld		bc,9550											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_1217)
				ld		iy,B_1217
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_NS 				
				cp		1
				call	z,ABRE_BAUL_NS
				cp		3
				call	z,ROMPE_BAUL_NS

				ld		bc,7686											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(E_1381)
				ld		iy,E_1381
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ESTANTERIA_AA 				
				cp		3
				call	z,ROMPE_ESTANTERIA_CORTA
				pop		iy																							
				ret
				
CIRCUNSTANCIAL_8_B:

				ld		bc,8740										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1645)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_CORTA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_CORTA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_CORTA_CAMPO
				
				ld		bc,8384											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1601)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_CORTA_CAMPO
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_CORTA_CAMPO
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_CORTA_CAMPO
				
				ld		bc,8764											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1560)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA
				cp		1
				call	z,ABRE_PUERTA_ID_IZQUIERDA_CORTA_SOBRE_MADERA

				ld		bc,9128											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1561)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_CORTA_SOBRE_MADERA
													
				ret
			
CIRCUNSTANCIAL_9_B:

				ld		bc,7292											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1551)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_CORTA
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_CORTA
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_CORTA
								
				ld		bc,7656											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1552)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_CORTADA_SIN_TECHO
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_CORTADA
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_CORTADA
								
				ld		bc,9872											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1567)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_LARGA
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_LARGA
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_LARGA

				ld		bc,10236										; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1568)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_LARGA
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_LARGA
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_LARGA
				
				ld		bc,9856											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1609)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_CORTA
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_CORTA
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_CORTA
				
				ld		bc,10212											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1653)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ABAJO_CORTA
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_CORTA
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_CORTA
				
				ld		bc,10256											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1439)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_CORTA
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA
				
				ld		bc,9900											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1395)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA
				
				ld		bc,8144											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_911)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_CORTA
				cp		1
				call	z,ABRE_VENTANA_AA_ABAJO_LARGA
				cp		3
				call	z,REFUERZA_VENTANA_AA_ABAJO_LARGA
				
				ld		bc,7788											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_867)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_AA_ARRIBA_LARGA
				cp		1
				call	z,ABRE_VENTANA_AA_ARRIBA_LARGA
				cp		3
				call	z,REFUERZA_VENTANA_AA_ARRIBA_LARGA
								
				ld		bc,9548											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1307)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_LARGA
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_LARGA

				ld		bc,8492											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1043)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_AA_ARRIBA_LARGA
				cp		1
				call	z,ABRE_PUERTA_AA_ARRIBA_LARGA_sala_3

				ld		hl,(SEGUIMIENTO_CASILLA)						; PARCHE
				ld		de,1847											; Aunque está controlado que no pinte nada de su plano que no esté en pantalla,
				call	DCOMPR											; Las últimas puertas (las de la entrada principal) se siguen pintando en estas
				ret		z												; casillas. Así que hago un salto para que no pinte esas puertas si está en estas				
				ld		de,1889											; casillas. Es un parche ya que no he encontrado el verdadero bugg.
				call	DCOMPR											
				ret		z												
				ld		de,1890											 
				call	DCOMPR											 
				ret		z				
				ld		de,1891
				call	DCOMPR
				ret		z				
				ld		de,1844
				call	DCOMPR
				ret		z				
				ld		de,1845
				call	DCOMPR
				ret		z				
				ld		de,1846
				call	DCOMPR
				ret		z				
				ld		de,1801
				call	DCOMPR
				ret		z				
				ld		de,1802
				call	DCOMPR
				ret		z				
				ld		de,1803
				call	DCOMPR
				ret		z				
				ld		de,1759
				call	DCOMPR
				ret		z				
				
				ld		bc,9468											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1736)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_IZQUIERDA_CORTA
				cp		1
				call	z,ABRE_PUERTA_ID_IZQUIERDA_CORTA

				ld		bc,9832											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(P_1737)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_PUERTA_ID_DERECHA_CORTA
				cp		1
				call	z,ABRE_PUERTA_ID_DERECHA_CORTA
																												
				ret
				
CIRCUNSTANCIAL_10_B:

				push	iy
				ld		bc,3406											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(A_2027)
				ld		iy,A_2027
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ARMARIO_AA_ESQUINA_ARRIBA
				cp		1
				call	z,ABRE_ARMARIO_AA
				cp		3
				call	z,ROMPE_ARMARIO_AA

				ld		bc,4464											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_2247)
				ld		iy,B_2247
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_AA
				cp		1
				call	z,ABRE_BAUL_NS_CON_VENTANA
				cp		3
				call	z,ROMPE_BAUL_AA
				pop		iy
				
				ret
				
CIRCUNSTANCIAL_11_B:
				
				ret
				
CIRCUNSTANCIAL_12_B:

				push	iy
				ld		bc,5214											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(A_2040)
				ld		iy,A_2040
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_ARMARIO_AA_ESQUINA
				cp		1
				call	z,ABRE_ARMARIO_AA
				cp		3
				call	z,ROMPE_ARMARIO_AA

				ld		bc,5950											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(B_2044)
				ld		iy,B_2044
				ld		de,36*3
				add		iy,de					
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,BORRA_BAUL_NS
				cp		1
				call	z,ABRE_BAUL_NS
				cp		3
				call	z,ROMPE_BAUL_NS
				pop		iy
												
				ret

CIRCUNSTANCIAL_13_B:

				ret

CIRCUNSTANCIAL_14_B:

				ld		bc,7292											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1551)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_IZQUIERDA_CORTA
				cp		1
				call	z,ABRE_VENTANA_ID_IZQUIERDA_CORTA
				cp		3
				call	z,REFUERZA_VENTANA_ID_IZQUIERDA_CORTA
								
				ld		bc,7656											; Casilla del mapa en que se empieza a pintar la ventana
				ld		a,(V_1552)
				call	AISLA_ESTADO_DE_OBJETO_A_MIRAR
				or		a
				call	z,ROMPE_VENTANA_ID_DERECHA_CORTADA_SIN_TECHO
				cp		1
				call	z,ABRE_VENTANA_ID_DERECHA_CORTA
				cp		3
				call	z,REFUERZA_VENTANA_ID_DERECHA_CORTADA
				
				ret
				
