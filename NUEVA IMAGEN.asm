NUEVA_IMAGEN:

				push	ix
				push	bc
				push	de
				push	iy
				
				ld		ix,OBJETO_EN_MANO
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				add		ix,de
				
				ld		a,1
				ld		(VUELTA),a
				
				ld		a,(ix)
				push	af
				ld		a,(TURNO)
				ld		b,a
				pop		af
[11]			add		a,b				

				add		1
				ld		de,LISTA_DE_IMAGEN
				jp		LISTA_DE_OPCIONES				
				
PINTAMOS_NUEVA_IMAGEN:

				ld		b,2
				
.bucle_de_repintado:
				
				ld		l,(ix)
				ld		h,(ix+1)
				ld		e,#01
				call	G9kSetVramWrite

				push	bc
				ld		b,(ix+3)
				
.semi_bucle_vertical:				

				push	bc
				ld		b,(ix+2)

.semi_bucle_horizontal:
				
				ld		l,(iy)
				ld		h,(iy+1)
				call	OUT_ESCRIBE_UN_BYTE
				ld		de,2
				add		iy,de
				djnz	.semi_bucle_horizontal	
				
				ld		a,(VUELTA)
				ld		e,a
				ld		d,0
				ld		l,(ix)
				ld		h,(ix+1)
				or		a
				call	SECUENCIA_DE_COPIADO
				ld		e,#01
				call	G9kSetVramWrite
				ld		a,(VUELTA)
				inc		a
				ld		(VUELTA),a
				
				pop		bc
				djnz	.semi_bucle_vertical
				
				
				ld		de,4
				add		ix,de
				pop		bc
				
				ld		a,1
				ld		(VUELTA),a
				
				djnz	.bucle_de_repintado
				
REGRESAMOS:
				
				pop		iy
				pop		de
				pop		bc
				pop		ix
				
				ret

SECUENCIA_DE_COPIADO:

[128]			adc		hl,de
				ret
				
BARBARA_NORMAL:

				ld		ix,DATA_BARBARA_NORMAL
				ld		iy,BARBARA_N
				JP		PINTAMOS_NUEVA_IMAGEN
				
BARBARA_ANTORCHA_APAGADA:

				ld		ix,DATA_BARBARA_ANTORCHA_APAGADA
				ld		iy,BAR_N_AN_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
BARBARA_ANTORCHA_ENCENDIDA:

				ld		ix,DATA_BARBARA_ANTORCHA_ENCENDIDA
				ld		iy,BAR_N_AN_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				BARBARA_COCTEL_APAGADO:

				ld		ix,DATA_BARBARA_COCTEL_APAGADO
				ld		iy,BAR_N_CO_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				BARBARA_COCTEL_ENCENDIDO:

				ld		ix,DATA_BARBARA_COCTEL_ENCENDIDO
				ld		iy,BAR_N_CO_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				BARBARA_PALETA:

				ld		ix,DATA_BARBARA_PALETA
				ld		iy,BAR_N_CU
				JP		PINTAMOS_NUEVA_IMAGEN
				BARBARA_MARTILLO:

				ld		ix,DATA_BARBARA_MARTILLO
				ld		iy,BAR_N_MA
				JP		PINTAMOS_NUEVA_IMAGEN
				BARBARA_PICO:

				ld		ix,DATA_BARBARA_PICO
				ld		iy,BAR_N_PI
				JP		PINTAMOS_NUEVA_IMAGEN
				
BARBARA_ESCOPETA:

				ld		ix,DATA_BARBARA_ESCOPETA
				ld		iy,BAR_N_ES
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_NORMAL:

				ld		ix,DATA_BEN_NORMAL
				ld		iy,BEN_N
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_ANTORCHA_APAGADA:

				ld		ix,DATA_BEN_ANTORCHA_APAGADA
				ld		iy,BEN_N_AN_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_ANTORCHA_ENCENDIDA:

				ld		ix,DATA_BEN_ANTORCHA_ENCENDIDA
				ld		iy,BEN_N_AN_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_COCTEL_APAGADO:

				ld		ix,DATA_BEN_COCTEL_APAGADO
				ld		iy,BEN_N_CO_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_COCTEL_ENCENDIDO:

				ld		ix,DATA_BEN_COCTEL_ENCENDIDO
				ld		iy,BEN_N_CO_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_PALETA:

				ld		ix,DATA_BEN_PALETA
				ld		iy,BEN_N_CU
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_MARTILLO:

				ld		ix,DATA_BEN_MARTILLO
				ld		iy,BEN_N_MA
				JP		PINTAMOS_NUEVA_IMAGEN
				
BEN_PICO:

				ld		ix,DATA_BEN_PICO
				ld		iy,BEN_N_PI
				JP		PINTAMOS_NUEVA_IMAGEN
				

BEN_ESCOPETA:

				ld		ix,DATA_BEN_ESCOPETA
				ld		iy,BEN_N_ES
				JP		PINTAMOS_NUEVA_IMAGEN
				HARRY_NORMAL:

				ld		ix,DATA_HARRY_NORMAL
				ld		iy,HARRY_N
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_ANTORCHA_APAGADA:

				ld		ix,DATA_HARRY_ANTORCHA_APAGADA
				ld		iy,HAR_N_AN_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_ANTORCHA_ENCENDIDA:

				ld		ix,DATA_HARRY_ANTORCHA_ENCENDIDA
				ld		iy,HAR_N_AN_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_COCTEL_APAGADO:

				ld		ix,DATA_HARRY_COCTEL_APAGADO
				ld		iy,HAR_N_CO_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_COCTEL_ENCENDIDO:

				ld		ix,DATA_HARRY_COCTEL_ENCENDIDO
				ld		iy,HAR_N_CO_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_PALETA:

				ld		ix,DATA_HARRY_PALETA
				ld		iy,HAR_N_CU
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_MARTILLO:

				ld		ix,DATA_HARRY_MARTILLO
				ld		iy,HAR_N_MA
				JP		PINTAMOS_NUEVA_IMAGEN
				
HARRY_PICO:

				ld		ix,DATA_HARRY_PICO
				ld		iy,HAR_N_PI
				JP		PINTAMOS_NUEVA_IMAGEN
				

HARRY_ESCOPETA:

				ld		ix,DATA_HARRY_ESCOPETA
				ld		iy,HAR_N_ES
				JP		PINTAMOS_NUEVA_IMAGEN
				HELLEN_NORMAL:

				ld		ix,DATA_HELLEN_NORMAL
				ld		iy,HELLEN_N
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_ANTORCHA_APAGADA:

				ld		ix,DATA_HELLEN_ANTORCHA_APAGADA
				ld		iy,HEL_N_AN_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_ANTORCHA_ENCENDIDA:

				ld		ix,DATA_HELLEN_ANTORCHA_ENCENDIDA
				ld		iy,HEL_N_AN_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_COCTEL_APAGADO:

				ld		ix,DATA_HELLEN_COCTEL_APAGADO
				ld		iy,HEL_N_CO_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_COCTEL_ENCENDIDO:

				ld		ix,DATA_HELLEN_COCTEL_ENCENDIDO
				ld		iy,HEL_N_CO_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_PALETA:

				ld		ix,DATA_HELLEN_PALETA
				ld		iy,HEL_N_CU
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_MARTILLO:

				ld		ix,DATA_HELLEN_MARTILLO
				ld		iy,HEL_N_MA
				JP		PINTAMOS_NUEVA_IMAGEN
				
HELLEN_PICO:

				ld		ix,DATA_HELLEN_PICO
				ld		iy,HEL_N_PI
				JP		PINTAMOS_NUEVA_IMAGEN
				

HELLEN_ESCOPETA:

				ld		ix,DATA_HELLEN_ESCOPETA
				ld		iy,HEL_N_ES
				JP		PINTAMOS_NUEVA_IMAGEN
				TOM_NORMAL:

				ld		ix,DATA_TOM_NORMAL
				ld		iy,TOM_N
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_ANTORCHA_APAGADA:

				ld		ix,DATA_TOM_ANTORCHA_APAGADA
				ld		iy,TOM_N_AN_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_ANTORCHA_ENCENDIDA:

				ld		ix,DATA_TOM_ANTORCHA_ENCENDIDA
				ld		iy,TOM_N_AN_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_COCTEL_APAGADO:

				ld		ix,DATA_TOM_COCTEL_APAGADO
				ld		iy,TOM_N_CO_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_COCTEL_ENCENDIDO:

				ld		ix,DATA_TOM_COCTEL_ENCENDIDO
				ld		iy,TOM_N_CO_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_PALETA:

				ld		ix,DATA_TOM_PALETA
				ld		iy,TOM_N_CU
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_MARTILLO:

				ld		ix,DATA_TOM_MARTILLO
				ld		iy,TOM_N_MA
				JP		PINTAMOS_NUEVA_IMAGEN
				
TOM_PICO:

				ld		ix,DATA_TOM_PICO
				ld		iy,TOM_N_PI
				JP		PINTAMOS_NUEVA_IMAGEN
				

TOM_ESCOPETA:

				ld		ix,DATA_TOM_ESCOPETA
				ld		iy,TOM_N_ES
				JP		PINTAMOS_NUEVA_IMAGEN
				JUDY_NORMAL:

				ld		ix,DATA_JUDY_NORMAL
				ld		iy,JUDY_N
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_ANTORCHA_APAGADA:

				ld		ix,DATA_JUDY_ANTORCHA_APAGADA
				ld		iy,JUD_N_AN_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_ANTORCHA_ENCENDIDA:

				ld		ix,DATA_JUDY_ANTORCHA_ENCENDIDA
				ld		iy,JUD_N_AN_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_COCTEL_APAGADO:

				ld		ix,DATA_JUDY_COCTEL_APAGADO
				ld		iy,JUD_N_CO_AP
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_COCTEL_ENCENDIDO:

				ld		ix,DATA_JUDY_COCTEL_ENCENDIDO
				ld		iy,JUD_N_CO_EN
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_PALETA:

				ld		ix,DATA_JUDY_PALETA
				ld		iy,JUD_N_CU
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_MARTILLO:

				ld		ix,DATA_JUDY_MARTILLO
				ld		iy,JUD_N_MA
				JP		PINTAMOS_NUEVA_IMAGEN
				
JUDY_PICO:

				ld		ix,DATA_JUDY_PICO
				ld		iy,JUD_N_PI
				JP		PINTAMOS_NUEVA_IMAGEN
				

JUDY_ESCOPETA:

				ld		ix,DATA_JUDY_ESCOPETA
				ld		iy,JUD_N_ES
				JP		PINTAMOS_NUEVA_IMAGEN

;	Los DATA tienen los siguientes datos:
;		DIRECCION MEMORIA VRAM V9990 A EMPEZAR A PINTAR NORTE (4 últimas cifras de la dirección), CANTIDAD DE PIXELES POR LINEA/4, CANTIDAD DE LINEAS,
;		DIRECCION MEMORIA VRAM V9990 A EMPEZAR A PINTAR ESTE (4 últimas cifras de la dirección), CANTIDAD DE PIXELES POR LINEA/4, CANTIDAD DE LINEAS

;	CÁLCULO DE LA POSICION DE MEMORIA VRAM (#10000 = BARBARA , #10020 = BEN , 10040 = HARRY , 10060 = HELLEN , 11000 = TOM , 11020 = JUDY)+(VALOR SEGUN POSICION N = 16 E = 8) +((1º-1)/2)+((2º-1)*128) 

DATA_BARBARA_NORMAL:													

				dw	#0010
				db	4,32
				dw	#0008
				db	4,32
				
DATA_BARBARA_ANTORCHA_APAGADA:

				dw	#0895
				db	2,7
				dw	#0909
				db	2,7
				
DATA_BARBARA_ANTORCHA_ENCENDIDA:

				dw	#0815
				db	2,8
				dw	#0889
				db	2,8
				
DATA_BARBARA_COCTEL_APAGADO:

				dw	#0914
				db	2,5
				dw	#098A
				db	2,5
				
DATA_BARBARA_COCTEL_ENCENDIDO:

				dw	#0814
				db	2,7
				dw	#088A
				db	2,7
				
DATA_BARBARA_PALETA:

				dw	#0914
				db	2,5
				dw	#0989
				db	2,5
				
DATA_BARBARA_MARTILLO:
DATA_BARBARA_PICO:

				dw	#0914
				db	2,12
				dw	#0988
				db	2,12
				
DATA_BARBARA_ESCOPETA:

				dw	#0314
				db	2,18
				dw	#0408
				db	2,18
				
DATA_BEN_NORMAL:													

				dw	#0030
				db	4,32
				dw	#0028
				db	4,32
				
DATA_BEN_ANTORCHA_APAGADA:													

				dw	#0834
				db	2,8
				dw	#0A28
				db	2,6
				
DATA_BEN_ANTORCHA_ENCENDIDA:													

				dw	#0834
				db	2,9
				dw	#09A8
				db	2,7
				
DATA_BEN_COCTEL_APAGADO:

				dw	#0A34
				db	2,5
				dw	#0AA8
				db	3,5
				
DATA_BEN_COCTEL_ENCENDIDO:

				dw	#0934
				db	2,7
				dw	#09A9
				db	2,7
				
DATA_BEN_PALETA:

				dw	#09B4
				db	2,4
				dw	#0A2A
				db	2,4
		
DATA_BEN_MARTILLO:
DATA_BEN_PICO:

				dw	#08B4
				db	2,12
				dw	#0929
				db	2,12
		
DATA_BEN_ESCOPETA:

				dw	#0334
				db	2,18
				dw	#04A8
				db	2,18
		
DATA_HARRY_NORMAL:													

				dw	#0050
				db	4,32
				dw	#0048
				db	4,32
				
DATA_HARRY_ANTORCHA_APAGADA:													

				dw	#0954
				db	2,7
				dw	#09CA
				db	2,6
				
DATA_HARRY_ANTORCHA_ENCENDIDA:													

				dw	#0854
				db	2,9
				dw	#08CA
				db	2,8
	
DATA_HARRY_COCTEL_APAGADO:													

				dw	#09D4
				db	2,5
				dw	#0A4A
				db	2,5
	
DATA_HARRY_COCTEL_ENCENDIDO:													

				dw	#0854
				db	2,8
				dw	#08CA
				db	2,8
	
DATA_HARRY_PALETA:													

				dw	#09D4
				db	2,4
				dw	#0A48
				db	2,4
	
DATA_HARRY_MARTILLO:
DATA_HARRY_PICO:													

				dw	#08D4
				db	2,12
				dw	#0949
				db	2,12
	
DATA_HARRY_ESCOPETA:													

				dw	#03D3
				db	2,20
				dw	#0548
				db	2,19
	
DATA_HELLEN_NORMAL:													

				dw	#0070
				db	4,32
				dw	#0068
				db	4,32
				

DATA_HELLEN_ANTORCHA_APAGADA:													

				dw	#09F4
				db	2,7
				dw	#09E9
				db	2,6
				
DATA_HELLEN_ANTORCHA_ENCENDIDA:													

				dw	#0974
				db	2,9
				dw	#0969
				db	2,7
				
DATA_HELLEN_COCTEL_APAGADO:													

				dw	#0A74
				db	2,5
				dw	#0A69
				db	2,6
				
DATA_HELLEN_COCTEL_ENCENDIDO:													

				dw	#0974
				db	2,7
				dw	#096A
				db	2,7
				
DATA_HELLEN_PALETA:													

				dw	#0A74
				db	2,3
				dw	#0A68
				db	2,4
				
DATA_HELLEN_MARTILLO:
DATA_HELLEN_PICO:													

				dw	#08F4
				db	2,12
				dw	#08E9
				db	2,13
				
DATA_HELLEN_ESCOPETA:													

				dw	#0474
				db	2,18
				dw	#0468
				db	2,18
				
DATA_TOM_NORMAL:													

				dw	#1010
				db	4,32
				dw	#1008
				db	4,32
				
DATA_TOM_ANTORCHA_APAGADA:													

				dw	#1914
				db	2,7
				dw	#1988
				db	2,6
				
DATA_TOM_ANTORCHA_ENCENDIDA:													

				dw	#1894
				db	2,8
				dw	#1908
				db	2,7
				
DATA_TOM_COCTEL_APAGADO:													

				dw	#1994
				db	2,5
				dw	#1A09
				db	2,6
				
DATA_TOM_COCTEL_ENCENDIDO:													

				dw	#1894
				db	2,6
				dw	#1909
				db	2,8
				
DATA_TOM_PALETA:													

				dw	#1914
				db	2,5
				dw	#1988
				db	2,5
								
DATA_TOM_MARTILLO:
DATA_TOM_PICO:													

				dw	#1914
				db	2,12
				dw	#1988
				db	2,12
				
DATA_TOM_ESCOPETA:													

				dw	#1394
				db	2,18
				dw	#1389
				db	2,18
				
DATA_JUDY_NORMAL:													

				dw	#1030
				db	4,32
				dw	#1028
				db	4,32
				
DATA_JUDY_ANTORCHA_APAGADA:													

				dw	#13B4
				db	2,9
				dw	#18A8
				db	2,9
				
DATA_JUDY_ANTORCHA_ENCENDIDA:											

				dw	#13B4
				db	2,9
				dw	#18A8
				db	2,9
				
DATA_JUDY_COCTEL_APAGADO:											

				dw	#13B4
				db	2,9
				dw	#18A9
				db	2,9
				
DATA_JUDY_COCTEL_ENCENDIDO:											

				dw	#13B4
				db	2,9
				dw	#18A9
				db	2,9
				
DATA_JUDY_PALETA:											

				dw	#1A34
				db	2,4
				dw	#1A29
				db	2,4
				
DATA_JUDY_MARTILLO:
DATA_JUDY_PICO:											

				dw	#1934
				db	2,12
				dw	#1929
				db	2,12
				
DATA_JUDY_ESCOPETA:

				dw	#13B4
				db	2,18
				dw	#1428
				db	2,18
								
LISTA_DE_IMAGEN:

				dw		BARBARA_NORMAL
				dw		BARBARA_ANTORCHA_APAGADA
				dw		BARBARA_ANTORCHA_ENCENDIDA
				dw		BARBARA_COCTEL_APAGADO
				dw		BARBARA_COCTEL_ENCENDIDO
				dw		BARBARA_PALETA
				dw		BARBARA_PALETA
				dw		BARBARA_MARTILLO
				dw		BARBARA_MARTILLO
				dw		BARBARA_PICO
				dw		BARBARA_ESCOPETA
				dw		BEN_NORMAL
				dw		BEN_ANTORCHA_APAGADA
				dw		BEN_ANTORCHA_ENCENDIDA
				dw		BEN_COCTEL_APAGADO
				dw		BEN_COCTEL_ENCENDIDO
				dw		BEN_PALETA
				dw		BEN_PALETA
				dw		BEN_MARTILLO
				dw		BEN_MARTILLO
				dw		BEN_PICO
				dw		BEN_ESCOPETA
				dw		HARRY_NORMAL
				dw		HARRY_ANTORCHA_APAGADA
				dw		HARRY_ANTORCHA_ENCENDIDA
				dw		HARRY_COCTEL_APAGADO
				dw		HARRY_COCTEL_ENCENDIDO
				dw		HARRY_PALETA
				dw		HARRY_PALETA
				dw		HARRY_MARTILLO
				dw		HARRY_MARTILLO
				dw		HARRY_PICO
				dw		HARRY_ESCOPETA
				dw		HELLEN_NORMAL
				dw		HELLEN_ANTORCHA_APAGADA
				dw		HELLEN_ANTORCHA_ENCENDIDA
				dw		HELLEN_COCTEL_APAGADO
				dw		HELLEN_COCTEL_ENCENDIDO
				dw		HELLEN_PALETA
				dw		HELLEN_PALETA
				dw		HELLEN_MARTILLO
				dw		HELLEN_MARTILLO
				dw		HELLEN_PICO
				dw		HELLEN_ESCOPETA
				dw		TOM_NORMAL
				dw		TOM_ANTORCHA_APAGADA
				dw		TOM_ANTORCHA_ENCENDIDA
				dw		TOM_COCTEL_APAGADO
				dw		TOM_COCTEL_ENCENDIDO
				dw		TOM_PALETA
				dw		TOM_PALETA
				dw		TOM_MARTILLO
				dw		TOM_MARTILLO
				dw		TOM_PICO
				dw		TOM_ESCOPETA
				dw		JUDY_NORMAL
				dw		JUDY_ANTORCHA_APAGADA
				dw		JUDY_ANTORCHA_ENCENDIDA
				dw		JUDY_COCTEL_APAGADO
				dw		JUDY_COCTEL_ENCENDIDO
				dw		JUDY_PALETA
				dw		JUDY_PALETA
				dw		JUDY_MARTILLO
				dw		JUDY_MARTILLO
				dw		JUDY_PICO
				dw		JUDY_ESCOPETA																

