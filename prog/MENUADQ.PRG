*       *********************************************************
*       *                                                         
*       * 09/05/2011            MENUADQ.PRG             12:19:22  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2011 Nombre de compa��a                   
*       * Direcci�n                                               
*       * Ciudad,     C�digo pos                                  
*       * Pa�s                                              
*       *                                                         
*       * Descripci�n:                                            
*       * Este PROGRAMA lo ha generado autom�ticamente GENMENU.    
*       *                                                         
*       *********************************************************


*       *********************************************************
*       *                                                         
*       *                    Definici�n de men�                   
*       *                                                         
*       *********************************************************
*

SET SYSMENU TO
SET SYSMENU AUTOMATIC

DEFINE PAD _37q0qeue9 OF _MSYSMENU PROMPT "Compras" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _37q0qeuea OF _MSYSMENU PROMPT "N/C y N/D" COLOR SCHEME 3 ;
	KEY ALT+N, ""
DEFINE PAD _37q0qeueb OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _37q0qeuec OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _37q0qeued OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _37q0qeue9 OF _MSYSMENU ACTIVATE POPUP compras
ON PAD _37q0qeuea OF _MSYSMENU ACTIVATE POPUP _1u30wnxsd
ON PAD _37q0qeueb OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _37q0qeuec OF _MSYSMENU ACTIVATE POPUP nuevoeleme
ON PAD _37q0qeued OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP compras MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF compras PROMPT "Articulos - Items"
DEFINE BAR 2 OF compras PROMPT "Activos Fijos"
DEFINE BAR 3 OF compras PROMPT "Varios (Detalle de Items)"
DEFINE BAR 4 OF compras PROMPT "Gastos (No deducibles)"
DEFINE BAR 5 OF compras PROMPT "Gastos (Deducibles)"
DEFINE BAR 6 OF compras PROMPT "Tarjeta Credito"
DEFINE BAR 7 OF compras PROMPT "Articulos - Items Segun Doc. Inic"
DEFINE BAR 8 OF compras PROMPT "\-"
DEFINE BAR 9 OF compras PROMPT "Importaciones"
DEFINE BAR 10 OF compras PROMPT "\-"
DEFINE BAR 11 OF compras PROMPT "Adquicion de Mercaderia (Incluye Gastos)"
DEFINE BAR 12 OF compras PROMPT "\-"
DEFINE BAR 13 OF compras PROMPT "Proveedores"
DEFINE BAR 14 OF compras PROMPT "Anticipo a Proveedores"
DEFINE BAR 15 OF compras PROMPT "Cancelacion de ctas x pagar"
DEFINE BAR 16 OF compras PROMPT "Servicios"
DEFINE BAR 17 OF compras PROMPT "\-"
DEFINE BAR 18 OF compras PROMPT "Liquidaciones"
ON SELECTION BAR 1 OF compras do form adq0101
ON SELECTION BAR 2 OF compras do form adq0102
ON SELECTION BAR 3 OF compras do form adq0104
ON SELECTION BAR 4 OF compras do form adq0103
ON SELECTION BAR 5 OF compras do form adq0105
ON SELECTION BAR 6 OF compras do form adq0111
ON SELECTION BAR 7 OF compras do form adq0106
ON BAR 9 OF compras ACTIVATE POPUP _1xb0kqjg3
ON BAR 11 OF compras ACTIVATE POPUP adquiciond
ON SELECTION BAR 13 OF compras do form adm0303
ON SELECTION BAR 14 OF compras do form adq0107
ON SELECTION BAR 15 OF compras do form ban0202
ON SELECTION BAR 16 OF compras do form adq0109
ON SELECTION BAR 18 OF compras do form fac0112

DEFINE POPUP _1xb0kqjg3 MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _1xb0kqjg3 PROMPT "Adquisici�n Import."
DEFINE BAR 2 OF _1xb0kqjg3 PROMPT "Anticipos - Gastos"
DEFINE BAR 3 OF _1xb0kqjg3 PROMPT "Liquidacion de Aduana"
DEFINE BAR 4 OF _1xb0kqjg3 PROMPT "Calculo de Costos"
DEFINE BAR 5 OF _1xb0kqjg3 PROMPT "\-"
DEFINE BAR 6 OF _1xb0kqjg3 PROMPT "Contenedore"
ON SELECTION BAR 1 OF _1xb0kqjg3 do form adq0108a
ON SELECTION BAR 2 OF _1xb0kqjg3 do form adq0108b
ON SELECTION BAR 3 OF _1xb0kqjg3 do form adq0108d
ON SELECTION BAR 4 OF _1xb0kqjg3 do form adq0108c
ON SELECTION BAR 6 OF _1xb0kqjg3 do form adq0108e

DEFINE POPUP adquiciond MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF adquiciond PROMPT "Anticipos - Gastos"
DEFINE BAR 2 OF adquiciond PROMPT "Calculo de Costos"
DEFINE BAR 3 OF adquiciond PROMPT "Factura-Ingreso de Mercaderia"
ON SELECTION BAR 1 OF adquiciond do form adq0110b
ON SELECTION BAR 2 OF adquiciond do form adq0110c
ON SELECTION BAR 3 OF adquiciond do form adq0110a

DEFINE POPUP _1u30wnxsd MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _1u30wnxsd PROMPT "Notas de Credito o Debito (Proveedor Detalle)"
DEFINE BAR 2 OF _1u30wnxsd PROMPT "Notas de Credito o Debito (Proveedor)"
DEFINE BAR 3 OF _1u30wnxsd PROMPT "\-"
DEFINE BAR 4 OF _1u30wnxsd PROMPT "Notas de Credito o Debito (Proveedor Detalle Sis. Ant.)"
DEFINE BAR 5 OF _1u30wnxsd PROMPT "Notas de Credito o Debito (Proveedor Sis. Ant)"
ON SELECTION BAR 1 OF _1u30wnxsd do form adq0301
ON SELECTION BAR 2 OF _1u30wnxsd do form adq0302
ON SELECTION BAR 4 OF _1u30wnxsd do form adq0301a
ON SELECTION BAR 5 OF _1u30wnxsd do form adq0302a

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Documento por Proveedor"
DEFINE BAR 2 OF reportes PROMPT "Por tipo de Documento"
DEFINE BAR 3 OF reportes PROMPT "Estado de Cta Proveedor"
DEFINE BAR 4 OF reportes PROMPT "Montos Totales"
DEFINE BAR 5 OF reportes PROMPT "Montos Totales (Grupos Doc)"
DEFINE BAR 6 OF reportes PROMPT "Secuencial de Documentos"
DEFINE BAR 7 OF reportes PROMPT "Adquisiciones por (linea producto)"
DEFINE BAR 8 OF reportes PROMPT "Por Peso"
DEFINE BAR 9 OF reportes PROMPT "\-"
DEFINE BAR 10 OF reportes PROMPT "Importaciones"
DEFINE BAR 11 OF reportes PROMPT "Adquisiciones Con Gastos"
DEFINE BAR 12 OF reportes PROMPT "\-"
DEFINE BAR 13 OF reportes PROMPT "Retenciones"
DEFINE BAR 14 OF reportes PROMPT "\-"
DEFINE BAR 15 OF reportes PROMPT "Caja Chica"
DEFINE BAR 16 OF reportes PROMPT "\-"
DEFINE BAR 17 OF reportes PROMPT "Configuraci�n de Reporte"
ON SELECTION BAR 1 OF reportes do form fac0301
ON SELECTION BAR 2 OF reportes do form fac0305
ON SELECTION BAR 3 OF reportes do form adq0201
ON SELECTION BAR 4 OF reportes do form fac0303
ON SELECTION BAR 5 OF reportes do form fac0303a
ON SELECTION BAR 6 OF reportes do form fac0307
ON SELECTION BAR 7 OF reportes do form adq0204
ON SELECTION BAR 8 OF reportes do form adq0203
ON BAR 10 OF reportes ACTIVATE POPUP _211109wmu
ON BAR 11 OF reportes ACTIVATE POPUP adquisicio
ON BAR 13 OF reportes ACTIVATE POPUP retencione
ON SELECTION BAR 15 OF reportes do form adq0304
ON SELECTION BAR 17 OF reportes do form fac0308

DEFINE POPUP _211109wmu MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _211109wmu PROMPT "No Incluidos en Calculos"
DEFINE BAR 2 OF _211109wmu PROMPT "Calculos"
DEFINE BAR 3 OF _211109wmu PROMPT "\-"
DEFINE BAR 4 OF _211109wmu PROMPT "Lista de Empaque"
DEFINE BAR 5 OF _211109wmu PROMPT "Items Facturados en Importaci�n"
DEFINE BAR 6 OF _211109wmu PROMPT "Items Rotos y Notas de Credito"
DEFINE BAR 7 OF _211109wmu PROMPT "Detalle de Facturacion"
DEFINE BAR 8 OF _211109wmu PROMPT "Detalle de Bajas"
DEFINE BAR 9 OF _211109wmu PROMPT "Detalle de Facturacion Valorado"
ON SELECTION BAR 1 OF _211109wmu do form adq0307
ON SELECTION BAR 2 OF _211109wmu do form adq0308
ON SELECTION BAR 4 OF _211109wmu do form adq0309
ON SELECTION BAR 5 OF _211109wmu do form adq0310
ON SELECTION BAR 6 OF _211109wmu do form adq0311
ON SELECTION BAR 7 OF _211109wmu do form adq0312
ON SELECTION BAR 8 OF _211109wmu do form adq0313
ON SELECTION BAR 9 OF _211109wmu do form adq0314

DEFINE POPUP adquisicio MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF adquisicio PROMPT "Documentos incluidos en Calculos"
DEFINE BAR 2 OF adquisicio PROMPT "Calculos"
ON SELECTION BAR 1 OF adquisicio do form adq0305
ON SELECTION BAR 2 OF adquisicio do form adq0306

DEFINE POPUP retencione MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF retencione PROMPT "Comprobante de Retencion"
DEFINE BAR 2 OF retencione PROMPT "Retenciones por Registrar"
DEFINE BAR 3 OF retencione PROMPT "Retenciones sin codigo de Imp. Renta"
DEFINE BAR 4 OF retencione PROMPT "Retenciones Emitidas"
DEFINE BAR 5 OF retencione PROMPT "Por Tipo de Retencion"
ON SELECTION BAR 1 OF retencione do form sri0203
ON SELECTION BAR 2 OF retencione do form sri0305
ON SELECTION BAR 3 OF retencione do form sri0305b
ON SELECTION BAR 4 OF retencione do form sri0306
ON SELECTION BAR 5 OF retencione do form sri0307

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "Cerrar Doc - Forma de Pago"
DEFINE BAR 2 OF nuevoeleme PROMPT "Cancelaci�n Saldos Iniciales"
DEFINE BAR 3 OF nuevoeleme PROMPT "Gen. Documento bancario"
DEFINE BAR 4 OF nuevoeleme PROMPT "Consulta Doc. Bancarios"
DEFINE BAR 5 OF nuevoeleme PROMPT "Contabilizaci�n"
DEFINE BAR 6 OF nuevoeleme PROMPT "\-"
DEFINE BAR 7 OF nuevoeleme PROMPT "Anulacion Cheques"
DEFINE BAR 8 OF nuevoeleme PROMPT "Cambio de Cheque"
DEFINE BAR 9 OF nuevoeleme PROMPT "\-"
DEFINE BAR 10 OF nuevoeleme PROMPT "Correccion"
DEFINE BAR 11 OF nuevoeleme PROMPT "Autorizaci�n"
DEFINE BAR 12 OF nuevoeleme PROMPT "Anulaci�n"
DEFINE BAR 13 OF nuevoeleme PROMPT "Consulta"
ON SELECTION BAR 1 OF nuevoeleme do form adq0701b
ON SELECTION BAR 2 OF nuevoeleme do form saldoini
ON SELECTION BAR 3 OF nuevoeleme do form adq0702b
ON SELECTION BAR 4 OF nuevoeleme do form ban0604
ON SELECTION BAR 5 OF nuevoeleme do form adq0703b
ON SELECTION BAR 7 OF nuevoeleme do form ban0606
ON SELECTION BAR 8 OF nuevoeleme do form ban0607
ON SELECTION BAR 10 OF nuevoeleme do form adq0706
ON SELECTION BAR 11 OF nuevoeleme do form adq0707
ON SELECTION BAR 12 OF nuevoeleme do form adq0704
ON SELECTION BAR 13 OF nuevoeleme do form adq0705b

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Men� Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el siatema"
ON SELECTION BAR 1 OF salir ;
	DO _37q0qeueo ;
	IN LOCFILE("PROG\MENUADQ" ,"MPX;MPR|FXP;PRG" ,"D�NDE est� MENUADQ?")
ON SELECTION BAR 2 OF salir ;
	DO _37q0qeuep ;
	IN LOCFILE("PROG\MENUADQ" ,"MPX;MPR|FXP;PRG" ,"D�NDE est� MENUADQ?")


*       *********************************************************
*       *                                                         
*       *              Limpiar C�digo y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _37Q0QEUEO  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUADQ.PRG,            Record:  109        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Men� Princ.                     
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _37q0qeueo
do while type('_screen.activeform')='O'
	_screen.activeform.release
enddo	

if used('ACCESOS') then
	sele accesos
	use
endif

deactivate menu _msysmenu
clea even
clea read
return


*       *********************************************************
*       *                                                         
*       * _37Q0QEUEP  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUADQ.PRG,            Record:  110        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el siatema                        
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _37q0qeuep
deactivate menu _msysmenu
clea even
clea read
final=1
return

