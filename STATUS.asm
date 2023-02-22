DATOS_EXTRAS_VISIBLES:
				
				ld		a,(TURNO)
				ld		(DE_QUIEN_STATUS),a
				
				G9kReadReg #08										
				or		01000000b
				ld		b,a
				G9kWriteReg 8,b
         
				xor		a
				ld		(FLECHA_SI_NO),a
				
				call	PAGINANDO_INVERTIDO_A			
				ld		hl,0											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				
				ld		hl,2043

.bucle_limpieza_a:
				
				push	hl		
				ld		hl,31
				call	OUT_ESCRIBE_UN_BYTE
				pop		hl
				ld		de,1
				or		a
				sbc		hl,de
				ld		de,0
				call	DCOMPR
				jp		nz,.bucle_limpieza_a
				
				xor		a
				ld		a,(FLECHA_SI_NO)
				
				ld		a,30											; Datos_básicos
				ld		[#7000],a				
				call	DATOS_SIEMPRE_VISIBLES
																				
				push	ix
								
				call	PINTANDO_TODO
				jp		FINAL_PRIMERA_VEZ

PINTANDO_TODO:

				ld		ix,DATOS_PERSONAJE_1
				ld		a,(DE_QUIEN_STATUS)
				ld		e,a
				ld		d,0
[8]				add		ix,de	
			
turno_de:

				ld		hl,840											; carita
				ld		a,(TURNO)
				ld		e,a
				ld		d,0
				or		a
[2]				adc		hl,de

				push	hl				
				ld		hl,178											
				push	hl
				call	pack_dos_tiles
				
visibilidad_de:
				
				ld		hl,840											; carita
				ld		a,(DE_QUIEN_STATUS)
				ld		e,a
				ld		d,0
				or		a
[2]				adc		hl,de

				push	hl				
				ld		hl,148											
				push	hl
				call	pack_dos_tiles
				
								
conducir:
				ld		a,(ix+4)
				and		10000000B
				rlc		a
				or		a
				jp		z,.no
				
.si:

				ld		hl,185											; volante no
				push	hl				
				ld		hl,2836											
				push	hl
				call	pack_dos_tiles

				jp		coctel

.no:

				ld		hl,249											; volante si
				push	hl				
				ld		hl,2836											
				push	hl
				call	pack_dos_tiles

coctel:

				push	ix
				
				ld		ix,COCTEL_MOLOTOF
				ld		a,(DE_QUIEN_STATUS)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,(ix)
				or		a
				jp		z,.no
				cp		2
				jp		z,.encendida
				
.si:

				ld		hl,456
				push	hl
				ld		hl,2714
				push	hl
				call	pack_dos_tiles
				
				ld		hl,163											; volante no
				push	hl				
				ld		hl,2842											
				push	hl
				call	pack_dos_tiles

				jp		antorcha

.encendida:

				ld		hl,362
				push	hl
				ld		hl,2714
				push	hl
				call	pack_dos_tiles
				
				ld		hl,163											; volante no
				push	hl				
				ld		hl,2842											
				push	hl
				call	pack_dos_tiles

				jp		antorcha
				
.no:

				ld		hl,456
				push	hl
				ld		hl,2714
				push	hl
				call	pack_dos_tiles
				
				ld		hl,761											; volante si
				push	hl				
				ld		hl,2842											
				push	hl
				call	pack_dos_tiles

antorcha:
				
				ld		ix,ANTORCHA
				ld		a,(DE_QUIEN_STATUS)
				ld		e,a
				ld		d,0
				add		ix,de
				ld		a,(ix)
				or		a
				jp		z,.no
				cp		2
				jp		z,.encendida
				
.si:

				ld		hl,280
				push	hl
				ld		hl,2848
				push	hl
				call	pack_un_tile
				
				jp		conseguir_madera

.encendida:

				ld		hl,344
				push	hl
				ld		hl,2848
				push	hl
				call	pack_un_tile
				
				jp		conseguir_madera
				
.no:

				ld		hl,339
				push	hl
				ld		hl,2848
				push	hl
				call	pack_un_tile
				
conseguir_madera:

				pop		ix
				
				ld		hl,458											; madera
				push	hl				
				ld		hl,1332											
				push	hl
				call	pack_dos_tiles

				ld		a,(ix+2)
				call	DATO_NEGATIVO_POSITIVO
				ld		a,(variable_circunstanc_3)
				or		a
				jp		nz,.negativo
				
.positivo:

				ld		hl,687											; +
				push	hl				
				ld		hl,1336											
				push	hl
				call	pack_dos_tiles
				jp		.comun

.negativo:

				ld		hl,689											; -
				push	hl				
				ld		hl,1336											
				push	hl
				call	pack_dos_tiles

.comun:

				call	PAGINANDO_INVERTIDO_A			
				ld		hl,1340											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(BONIFICADOR_REAL)
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,1468											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(BONIFICADOR_REAL)
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
												
reforzar_con_madera:

				ld		hl,191											; parentesis abierto
				push	hl				
				ld		hl,1706											
				push	hl
				call	pack_un_tile

				ld		hl,255											; parentesis abierto
				push	hl				
				ld		hl,1714											
				push	hl
				call	pack_un_tile
								
				push	ix
				ld		ix,MADERA_ADQUIRIDA
				ld		de,(DE_QUIEN_STATUS)
				ld		d,0
				add		ix,de		
				ld		a,(ix)
				pop		ix
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,1708
				push	hl											
				call	TRIPLE_CIFRA
												
				ld		hl,460											; madera puesta
				push	hl				
				ld		hl,1716											
				push	hl
				call	pack_dos_tiles

				ld		a,(ix+3)
				call	DATO_NEGATIVO_POSITIVO
				ld		a,(variable_circunstanc_3)
				or		a
				jp		nz,.negativo
				
.positivo:

				ld		hl,687											; +
				push	hl				
				ld		hl,1720											
				push	hl
				call	pack_dos_tiles
				jp		.comun

.negativo:

				ld		hl,689											; -
				push	hl				
				ld		hl,1720											
				push	hl
				call	pack_dos_tiles

.comun:

				call	PAGINANDO_INVERTIDO_A			
				ld		hl,1724											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(BONIFICADOR_REAL)
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,1852											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(BONIFICADOR_REAL)
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
								
bajar_cuerda:

				ld		hl,127											; cuerda
				push	hl				
				ld		hl,554											
				push	hl
				call	pack_un_tile
				
				call	PAGINANDO_INVERTIDO_A			
				ld		hl,556											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(ix+4)
				and		01110000B
[4]				rrc		a	
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,684											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(ix+4)
				and		00001110B
				rrc		a	
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
								
utensilios_por_turno:

				ld		hl,462											; utensilios
				push	hl				
				ld		hl,560											
				push	hl
				call	pack_dos_tiles

				call	PAGINANDO_INVERTIDO_A			
				ld		hl,564											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(ix+4)
				and		00001110B
				rrc		a	
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,692											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(ix+4)
				and		00001110B
				rrc		a	
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
								
ataque:

				ld		hl,83											; ataque
				push	hl				
				ld		hl,2100											
				push	hl
				call	pack_dos_tiles

				ld		hl,167											; flecha
				push	hl				
				ld		hl,2106											
				push	hl
				call	pack_un_tile
				
				call	PAGINANDO_INVERTIDO_A			
				ld		hl,2108											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(ix+5)
				inc		a
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,2236											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(ix+5)
				inc		a
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
								
defensa:

				ld		hl,464											; defensa
				push	hl				
				ld		hl,2484											
				push	hl
				call	pack_dos_tiles

				ld		hl,167											; flecha
				push	hl				
				ld		hl,2490											
				push	hl
				call	pack_un_tile
				
				call	PAGINANDO_INVERTIDO_A			
				ld		hl,2492											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(ix+6)	
				inc		a
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,2620											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(ix+6)	
				inc		a
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
										
escopeta:

				ld		hl,191											; parentesis abierto
				push	hl				
				ld		hl,2730+128											
				push	hl
				call	pack_un_tile

				ld		hl,255											; parentesis abierto
				push	hl				
				ld		hl,2738+128											
				push	hl
				call	pack_un_tile
								
				push	ix
				ld		ix,ESCOPETA_CARGADA
				ld		de,(DE_QUIEN_STATUS)
				ld		d,0
				add		ix,de		
				ld		a,(ix)
				pop		ix
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS

				ld		hl,2732+128
				push	hl											
				call	TRIPLE_CIFRA
								
				ld		hl,93											; escopeta
				push	hl				
				ld		hl,2868											
				push	hl
				call	pack_dos_tiles						

				ld		hl,167											; flecha
				push	hl				
				ld		hl,2874											
				push	hl
				call	pack_un_tile
				
				call	PAGINANDO_INVERTIDO_A			
				ld		hl,2876											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(ix+7)	
				inc		a
				ld		e,a
				ld		d,0
				or		a
				add		hl,de		
				call	OUT_ESCRIBE_UN_BYTE
				call	PAGINANDO_INVERTIDO_A											
				ld		hl,3004											
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				ld		a,(ix+7)	
				inc		a
				ld		e,a
				ld		d,0
				or		a
				add		hl,de
				call	OUT_ESCRIBE_UN_BYTE
								
AHORA_LOS_UTENSILIOS:

				ld		ix,UTENSILIOS_PERSONAJE_1
				ld		a,(DE_QUIEN_STATUS)
				ld		e,a
				ld		d,0
[15]			add		ix,de

Botellas:

				ld		hl,163											; botella
				push	hl				
				ld		hl,514											
				push	hl
				call	pack_dos_tiles

				ld		a,(ix)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,518
				push	hl											
				call	TRIPLE_CIFRA
								
Cargador:

				ld		hl,165											; cargador
				push	hl				
				ld		hl,898											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+1)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,902
				push	hl											
				call	TRIPLE_CIFRA
				
Clavos:

				ld		hl,19											; clavos
				push	hl				
				ld		hl,1282											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+2)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,1286
				push	hl											
				call	TRIPLE_CIFRA
				
Cuchillos:

				ld		hl,83											; cuchillo
				push	hl				
				ld		hl,1666											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+3)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,1670
				push	hl											
				call	TRIPLE_CIFRA
				
Cuerdas:

				ld		hl,29											; cuerda
				push	hl				
				ld		hl,2050											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+4)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,2054
				push	hl											
				call	TRIPLE_CIFRA
								
Paletas:

				ld		hl,157											; paleta
				push	hl				
				ld		hl,2434											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+6)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,2438
				push	hl											
				call	TRIPLE_CIFRA
				
Gasolinas:

				ld		hl,219											; gasolina
				push	hl				
				ld		hl,526											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+7)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,530
				push	hl											
				call	TRIPLE_CIFRA
				
Hachas:

				ld		hl,101											; hacha
				push	hl				
				ld		hl,910											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+8)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,914
				push	hl											
				call	TRIPLE_CIFRA
				
Martillos:

				ld		hl,221											; martillo
				push	hl				
				ld		hl,1294											
				push	hl
				call	pack_dos_tiles
				
 				ld		a,(ix+9)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,1298
				push	hl											
				call	TRIPLE_CIFRA
				
Zippos:

				ld		hl,283											; zippo
				push	hl				
				ld		hl,1678											
				push	hl
				call	pack_dos_tiles
				
				ld		a,(ix+10)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,1682
				push	hl											
				call	TRIPLE_CIFRA
				
Trapos:

				ld		hl,285											; trapo
				push	hl				
				ld		hl,2062											
				push	hl
				call	pack_dos_tiles

				ld		a,(ix+11)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,2066
				push	hl											
				call	TRIPLE_CIFRA
								
picos:

				ld		hl,99											; pico
				push	hl				
				ld		hl,2446											
				push	hl
				call	pack_dos_tiles

				ld		a,(ix+12)
				
				call	DAME_NUMEROS_DE_VALOR_DE_TRES_CIFRAS
				
				ld		hl,2450
				push	hl											
				call	TRIPLE_CIFRA

Escopetas:

				ld		a,(ix+5)
				or		a
				jp		z,.no
				
.si:			
					
				ld		hl,93											; escopeta no
				push	hl				
				ld		hl,2818											
				push	hl
				call	pack_dos_tiles
				jp		Cubo
				
.no:

				ld		hl,142											; escopeta no
				push	hl				
				ld		hl,2818
				push	hl
				call	pack_dos_tiles
																				 
Cubo:

				ld		a,(ix+14)
				or		a
				jp		z,.no
				
.si:			
				
				ld		hl,342											; cubo si
				push	hl				
				ld		hl,2824											
				push	hl
				call	pack_dos_tiles
				jp		Llave
				
.no:

				ld		hl,16											; cubo no
				push	hl				
				ld		hl,2824											
				push	hl
				call	pack_dos_tiles
											
Llave:

				ld		a,(ix+13)
				or		a
				jp		z,.no
				
.si:

				ld		hl,27											; llave si
				push	hl				
				ld		hl,2830											
				push	hl
				call	pack_dos_tiles
				jp		FINAL_DE_DATOS_EXTRAS_VISIBLES

.no:

				ld		hl,347											; llave no
				push	hl				
				ld		hl,2830											
				push	hl
				call	pack_dos_tiles
				 
FINAL_DE_DATOS_EXTRAS_VISIBLES:

.dado_del_jugador:

				call	PAGINANDO_INVERTIDO_A								
				ld		hl,188											; Colocamos el puntero en el lugar adecuado de page a para pintar pasos
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(DADO_DEL_JUGADOR)
				ld		e,a
				ld		d,0
				or		a
				adc		hl,de
				push	af
				call	OUT_ESCRIBE_UN_BYTE	
							
				call	PAGINANDO_INVERTIDO_A							
				ld		hl,316											; Colocamos el puntero en el lugar adecuado de page a para pintar pasos
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				pop		af
				ld		e,a
				ld		d,0
				or		a
				adc		hl,de
				call	OUT_ESCRIBE_UN_BYTE

.acciones_libres:

				call	PAGINANDO_INVERTIDO_A								
				ld		hl,572											; Colocamos el puntero en el lugar adecuado de page a para pintar acciones
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,672
				ld		a,(ACCIONES_LIBRES)
				ld		e,a
				ld		d,0
				or		a
				adc		hl,de
				push	af
				call	OUT_ESCRIBE_UN_BYTE	
							
				call	PAGINANDO_INVERTIDO_A							
				ld		hl,700											; Colocamos el puntero en el lugar adecuado de page a para pintar acciones
				call	MARCAMOS_POSICION_EN_VRAM_9990_PATRONES
				ld		hl,704
				pop		af
				ld		e,a
				ld		d,0
				or		a
				adc		hl,de
				call	OUT_ESCRIBE_UN_BYTE	
												
				ret
				
FINAL_PRIMERA_VEZ:
				
				call	RUTINA_ESPECIAL_FINAL_DATOS_EXTRA_VISIBLES
				
				pop		ix				
				xor		a
				ret
