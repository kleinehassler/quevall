*       *********************************************************
*       *                                                         
*       * 19/04/2016            MENUFAC.PRG             17:44:47  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2016 Nombre de compañía                   
*       * Dirección                                               
*       * Ciudad,     Código pos                                  
*       * País                                              
*       *                                                         
*       * Descripción:                                            
*       * Este PROGRAMA lo ha generado automáticamente GENMENU.    
*       *                                                         
*       *********************************************************


*       *********************************************************
*       *                                                         
*       *                    Definición de menú                   
*       *                                                         
*       *********************************************************
*

SET SYSMENU TO
SET SYSMENU AUTOMATIC

DEFINE PAD _4m6121bml OF _MSYSMENU PROMPT "Ventas" COLOR SCHEME 3 ;
	KEY ALT+V, ""
DEFINE PAD _4m6121bmm OF _MSYSMENU PROMPT "Clientes" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _4m6121bmn OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _4m6121bmo OF _MSYSMENU PROMPT "N/C y N/D" COLOR SCHEME 3 ;
	KEY ALT+N, ""
DEFINE PAD _4m6121bmp OF _MSYSMENU PROMPT "Impresión Documentos" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _4m6121bmq OF _MSYSMENU PROMPT "Envio de correo" COLOR SCHEME 3 ;
	KEY ALT+E, ""
DEFINE PAD _4m6121bmr OF _MSYSMENU PROMPT "Documentos Electronicos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _4m6121bms OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _4m6121bmt OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _4m6121bml OF _MSYSMENU ACTIVATE POPUP ventas
ON PAD _4m6121bmm OF _MSYSMENU ACTIVATE POPUP nuevoeleme
ON PAD _4m6121bmn OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _4m6121bmo OF _MSYSMENU ACTIVATE POPUP ncynd
ON PAD _4m6121bmp OF _MSYSMENU ACTIVATE POPUP impresiónd
ON PAD _4m6121bmq OF _MSYSMENU ACTIVATE POPUP newitem
ON PAD _4m6121bmr OF _MSYSMENU ACTIVATE POPUP _48q0sare5
ON PAD _4m6121bms OF _MSYSMENU ACTIVATE POPUP documentos
ON PAD _4m6121bmt OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP ventas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ventas PROMPT "Doc. Ventas"
DEFINE BAR 2 OF ventas PROMPT "Proformas - Pedidos"
DEFINE BAR 3 OF ventas PROMPT "Ventas Por Despacho"
DEFINE BAR 4 OF ventas PROMPT "Guias de Remision"
DEFINE BAR 5 OF ventas PROMPT "\-"
DEFINE BAR 6 OF ventas PROMPT "Por Bodegas"
DEFINE BAR 7 OF ventas PROMPT "\-"
DEFINE BAR 8 OF ventas PROMPT "Canje de Retenciones"
DEFINE BAR 9 OF ventas PROMPT "Anticipos Clientes"
DEFINE BAR 10 OF ventas PROMPT "\-"
DEFINE BAR 11 OF ventas PROMPT "liquidacions en Ventas"
DEFINE BAR 12 OF ventas PROMPT "\-"
DEFINE BAR 13 OF ventas PROMPT "Lista de Precios"
ON SELECTION BAR 1 OF ventas do form fac0101
ON SELECTION BAR 2 OF ventas do form fac0103
ON SELECTION BAR 3 OF ventas do form fac0110
ON SELECTION BAR 4 OF ventas do form fac0106
ON BAR 6 OF ventas ACTIVATE POPUP porbodegas
ON SELECTION BAR 8 OF ventas do form  fac0107
ON SELECTION BAR 9 OF ventas do form fac0104
ON SELECTION BAR 11 OF ventas do form fac0113
ON SELECTION BAR 13 OF ventas do form fac0109

DEFINE POPUP porbodegas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF porbodegas PROMPT "Doc. Ventas"
DEFINE BAR 2 OF porbodegas PROMPT "Pedidos de Ventas"
DEFINE BAR 3 OF porbodegas PROMPT "Facturas Credito"
ON SELECTION BAR 1 OF porbodegas do form fac0106a
ON BAR 2 OF porbodegas ACTIVATE POPUP pedidosdev
ON SELECTION BAR 3 OF porbodegas do form fac0106c

DEFINE POPUP pedidosdev MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF pedidosdev PROMPT "Normal"
DEFINE BAR 2 OF pedidosdev PROMPT "Importación"
ON SELECTION BAR 1 OF pedidosdev do form fac0106b
ON SELECTION BAR 2 OF pedidosdev do form fac0106d

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "Cheques Recibidos"
DEFINE BAR 2 OF nuevoeleme PROMPT "Postergacion de Cheques"
DEFINE BAR 3 OF nuevoeleme PROMPT "Confirmacion de Cheques"
DEFINE BAR 4 OF nuevoeleme PROMPT "Cheques de otros periodos"
DEFINE BAR 5 OF nuevoeleme PROMPT "\-"
DEFINE BAR 6 OF nuevoeleme PROMPT "Retenciones Recibidas"
DEFINE BAR 7 OF nuevoeleme PROMPT "\-"
DEFINE BAR 8 OF nuevoeleme PROMPT "Rutas Ventas"
DEFINE BAR 9 OF nuevoeleme PROMPT "Rutas Distribucion"
ON SELECTION BAR 1 OF nuevoeleme do form cheques
ON SELECTION BAR 2 OF nuevoeleme do form poscheques
ON BAR 3 OF nuevoeleme ACTIVATE POPUP confirmaci
ON SELECTION BAR 4 OF nuevoeleme do form chequesind
ON SELECTION BAR 6 OF nuevoeleme do form retenreci
ON SELECTION BAR 8 OF nuevoeleme do form rutas
ON SELECTION BAR 9 OF nuevoeleme do form rutdis

DEFINE POPUP confirmaci MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF confirmaci PROMPT "Individual"
DEFINE BAR 2 OF confirmaci PROMPT "Solo Confirmacion Por fechas"
DEFINE BAR 3 OF confirmaci PROMPT "Conf. o Desconf Por fechas"
ON SELECTION BAR 1 OF confirmaci do form confirche
ON SELECTION BAR 2 OF confirmaci do form confirche2
ON SELECTION BAR 3 OF confirmaci do form confirche3

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Por Cliente"
DEFINE BAR 2 OF reportes PROMPT "\-"
DEFINE BAR 3 OF reportes PROMPT "Caja-Credito"
DEFINE BAR 4 OF reportes PROMPT "\-"
DEFINE BAR 5 OF reportes PROMPT "Por Items"
DEFINE BAR 6 OF reportes PROMPT "\-"
DEFINE BAR 7 OF reportes PROMPT "Por Transacción"
DEFINE BAR 8 OF reportes PROMPT "\-"
DEFINE BAR 9 OF reportes PROMPT "Ventas por Vendedor"
DEFINE BAR 10 OF reportes PROMPT "\-"
DEFINE BAR 11 OF reportes PROMPT "Configuracion de  Reportes"
ON BAR 1 OF reportes ACTIVATE POPUP porcliente
ON BAR 3 OF reportes ACTIVATE POPUP cajacredit
ON BAR 5 OF reportes ACTIVATE POPUP poritems
ON BAR 7 OF reportes ACTIVATE POPUP portransac
ON BAR 9 OF reportes ACTIVATE POPUP ventasporv
ON SELECTION BAR 11 OF reportes do form fac0308

DEFINE POPUP porcliente MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF porcliente PROMPT "Principales"
DEFINE BAR 2 OF porcliente PROMPT "Ventas"
DEFINE BAR 3 OF porcliente PROMPT "Historico"
DEFINE BAR 4 OF porcliente PROMPT "Estado de Cuenta"
DEFINE BAR 5 OF porcliente PROMPT "Cheques No registrados"
DEFINE BAR 6 OF porcliente PROMPT "Cheques"
DEFINE BAR 7 OF porcliente PROMPT "Cheques Depositados"
DEFINE BAR 8 OF porcliente PROMPT "Cheques por Vecimiento"
DEFINE BAR 9 OF porcliente PROMPT "Ultimas Transacciones"
DEFINE BAR 10 OF porcliente PROMPT "Por Documento"
DEFINE BAR 11 OF porcliente PROMPT "Saldos con Intereses"
DEFINE BAR 12 OF porcliente PROMPT "Saldos Iniciales"
DEFINE BAR 13 OF porcliente PROMPT "Por Montos"
ON SELECTION BAR 1 OF porcliente do form impprin
ON SELECTION BAR 2 OF porcliente do form fac0301
ON SELECTION BAR 3 OF porcliente do form fac0304
ON SELECTION BAR 4 OF porcliente do form con0111
ON SELECTION BAR 5 OF porcliente do form fac0312a
ON SELECTION BAR 6 OF porcliente do form fac0312
ON SELECTION BAR 7 OF porcliente do form chedepo
ON SELECTION BAR 8 OF porcliente do form checliven
ON SELECTION BAR 9 OF porcliente do form fac0320
ON SELECTION BAR 10 OF porcliente do form fac0305
ON SELECTION BAR 11 OF porcliente do form fac0322
ON SELECTION BAR 12 OF porcliente do form fac0324
ON SELECTION BAR 13 OF porcliente do form fac0326

DEFINE POPUP cajacredit MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF cajacredit PROMPT "Ingresos-Egresos (det canc)"
DEFINE BAR 2 OF cajacredit PROMPT "Ingresos y Egresos (Caja)"
DEFINE BAR 3 OF cajacredit PROMPT "Rubros de Cancelacion"
DEFINE BAR 4 OF cajacredit PROMPT "Detalle de Pagos Grupo"
DEFINE BAR 5 OF cajacredit PROMPT "Ingresos y Egresos Resumen Caja"
DEFINE BAR 6 OF cajacredit PROMPT "\-"
DEFINE BAR 7 OF cajacredit PROMPT "Pagos Descuadrados"
ON SELECTION BAR 1 OF cajacredit do form fac0311
ON SELECTION BAR 2 OF cajacredit do form fac0311a
ON SELECTION BAR 3 OF cajacredit do form  fac0311b
ON SELECTION BAR 4 OF cajacredit do form  fac0319
ON SELECTION BAR 5 OF cajacredit do form fac0311a2
ON SELECTION BAR 7 OF cajacredit do form fac0323

DEFINE POPUP poritems MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF poritems PROMPT "Documentos Por Items"
DEFINE BAR 2 OF poritems PROMPT "Ventas por Items"
DEFINE BAR 3 OF poritems PROMPT "Rentabilidad"
DEFINE BAR 4 OF poritems PROMPT "Por Grupos y Supgrupos"
DEFINE BAR 5 OF poritems PROMPT "Articulos No Registrados"
ON SELECTION BAR 1 OF poritems do form fac0302
ON SELECTION BAR 2 OF poritems do form fac0315
ON SELECTION BAR 3 OF poritems do form fac0317
ON SELECTION BAR 4 OF poritems do form fac0701
ON SELECTION BAR 5 OF poritems do form fac0327

DEFINE POPUP portransac MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF portransac PROMPT "Secuencial"
DEFINE BAR 2 OF portransac PROMPT "Montos Totales"
DEFINE BAR 3 OF portransac PROMPT "Montos Totales (Grupos Doc)"
DEFINE BAR 4 OF portransac PROMPT "Montos Totales Recaudacion"
DEFINE BAR 5 OF portransac PROMPT "Montos Totales Recaudacion por Cta"
DEFINE BAR 6 OF portransac PROMPT "Montos Totales Recaudacion Varios Clientes"
DEFINE BAR 7 OF portransac PROMPT "Resumen Por Mes"
DEFINE BAR 8 OF portransac PROMPT "Retenciones Recibidas"
DEFINE BAR 9 OF portransac PROMPT "Control Doc.Ventas"
DEFINE BAR 10 OF portransac PROMPT "Por Vencimiento"
ON SELECTION BAR 1 OF portransac do form fac0307
ON SELECTION BAR 2 OF portransac do form fac0303
ON SELECTION BAR 3 OF portransac do form fac0303a
ON SELECTION BAR 4 OF portransac do form fac0303c
ON SELECTION BAR 5 OF portransac do form fac0303e
ON BAR 6 OF portransac ACTIVATE POPUP montostota
ON SELECTION BAR 7 OF portransac do form fac0316
ON SELECTION BAR 8 OF portransac do form retenfac
ON SELECTION BAR 9 OF portransac do form fac0330
ON BAR 10 OF portransac ACTIVATE POPUP porfechade

DEFINE POPUP montostota MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF montostota PROMPT "Normal"
DEFINE BAR 2 OF montostota PROMPT "Inicial y actual"
ON SELECTION BAR 1 OF montostota do form fac0303f
ON SELECTION BAR 2 OF montostota do form fac0303g

DEFINE POPUP porfechade MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF porfechade PROMPT "Por Fechas"
DEFINE BAR 2 OF porfechade PROMPT "Varias Cuentas"
DEFINE BAR 3 OF porfechade PROMPT "Resumen"
DEFINE BAR 4 OF porfechade PROMPT "Cuadro de Vencidos"
DEFINE BAR 5 OF porfechade PROMPT "Vencidos y Por Vencer"
DEFINE BAR 6 OF porfechade PROMPT "Planilla Cartera"
ON SELECTION BAR 1 OF porfechade do form fac0310
ON SELECTION BAR 2 OF porfechade do form fac0310a
ON SELECTION BAR 3 OF porfechade do form fac0310b
ON SELECTION BAR 4 OF porfechade do form fac0310e
ON SELECTION BAR 5 OF porfechade do form fac0310c
ON SELECTION BAR 6 OF porfechade do form fac0310d

DEFINE POPUP ventasporv MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ventasporv PROMPT "Por Ventas"
DEFINE BAR 2 OF ventasporv PROMPT "Por Recaudacion"
DEFINE BAR 3 OF ventasporv PROMPT "Por Linea"
DEFINE BAR 4 OF ventasporv PROMPT "Comisiones"
DEFINE BAR 5 OF ventasporv PROMPT "\-"
DEFINE BAR 6 OF ventasporv PROMPT "Guias"
DEFINE BAR 7 OF ventasporv PROMPT "Documentos"
DEFINE BAR 8 OF ventasporv PROMPT "\-"
DEFINE BAR 9 OF ventasporv PROMPT "Vendedores por Rutas"
DEFINE BAR 10 OF ventasporv PROMPT "Rutas de Venta No Asignadas"
DEFINE BAR 11 OF ventasporv PROMPT "\-"
DEFINE BAR 12 OF ventasporv PROMPT "Rutas de Distribucion"
DEFINE BAR 13 OF ventasporv PROMPT "Rutas de Dist. No asignadas"
ON SELECTION BAR 1 OF ventasporv do form fac0309
ON SELECTION BAR 2 OF ventasporv do form fac0309e
ON SELECTION BAR 3 OF ventasporv do form fac0309d
ON SELECTION BAR 4 OF ventasporv do form fac0311d
ON SELECTION BAR 6 OF ventasporv do form inv0602b
ON SELECTION BAR 7 OF ventasporv do form fac0309g
ON SELECTION BAR 9 OF ventasporv do form fac0309f
ON SELECTION BAR 10 OF ventasporv do form fac0309j
ON SELECTION BAR 12 OF ventasporv do form fac0309h
ON SELECTION BAR 13 OF ventasporv do form fac0309i

DEFINE POPUP ncynd MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ncynd PROMPT "Nota de Credito o Debito (Clientes Devoluciones)"
DEFINE BAR 2 OF ncynd PROMPT "Nota de Credito o Debito (Descuentos)"
DEFINE BAR 3 OF ncynd PROMPT "\-"
DEFINE BAR 4 OF ncynd PROMPT "Nota de Credito o Debito (Clientes Devoluciones SR"
DEFINE BAR 5 OF ncynd PROMPT "Nota de Credito o Debito (Descuentos SR.)"
ON SELECTION BAR 1 OF ncynd do form fac0401
ON SELECTION BAR 2 OF ncynd do form fac0402
ON SELECTION BAR 4 OF ncynd do form fac0401a
ON SELECTION BAR 5 OF ncynd do form fac0402a

DEFINE POPUP impresiónd MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF impresiónd PROMPT "Activar Impresión de Documentos"
DEFINE BAR 2 OF impresiónd PROMPT "Desactivar Impresión de Doc. Ventas"
ON SELECTION BAR 1 OF impresiónd do form actimpdoc
ON SELECTION BAR 2 OF impresiónd ;
	DO _4m6121bn0 ;
	IN LOCFILE("PROG\MENUFAC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUFAC?")

DEFINE POPUP newitem MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF newitem PROMPT "Envio publicidad"
ON SELECTION BAR 1 OF newitem do form fac0801

DEFINE POPUP _48q0sare5 MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _48q0sare5 PROMPT "Documentos Seleccion"
DEFINE BAR 2 OF _48q0sare5 PROMPT "Retenciones Seleccion"
DEFINE BAR 3 OF _48q0sare5 PROMPT "Retenciones / RIDE / Correo"
DEFINE BAR 4 OF _48q0sare5 PROMPT "\-"
DEFINE BAR 5 OF _48q0sare5 PROMPT "Autorizaciones Doc Elec"
DEFINE BAR 6 OF _48q0sare5 PROMPT "Autorizaciones Retenciones"
DEFINE BAR 7 OF _48q0sare5 PROMPT "\-"
DEFINE BAR 8 OF _48q0sare5 PROMPT "DocElec. Act. Autoriza Automatica"
DEFINE BAR 9 OF _48q0sare5 PROMPT "Retencion Act. Autoriza Automatica"
DEFINE BAR 10 OF _48q0sare5 PROMPT "\-"
DEFINE BAR 11 OF _48q0sare5 PROMPT "Generar Visualizar RIDE"
DEFINE BAR 12 OF _48q0sare5 PROMPT "Envio RIDE Docs.Elec"
DEFINE BAR 13 OF _48q0sare5 PROMPT "Envio RIDE Retenciones"
DEFINE BAR 14 OF _48q0sare5 PROMPT "\-"
DEFINE BAR 15 OF _48q0sare5 PROMPT "Actualizar Autorizacion Doc.Elec"
DEFINE BAR 16 OF _48q0sare5 PROMPT "Actualizar Clave de Acceso"
DEFINE BAR 17 OF _48q0sare5 PROMPT "Reporte Docs.Electronicos"
DEFINE BAR 18 OF _48q0sare5 PROMPT "Reporte Retenciones"
DEFINE BAR 19 OF _48q0sare5 PROMPT "\-"
DEFINE BAR 20 OF _48q0sare5 PROMPT "Visualizar XML"
ON SELECTION BAR 1 OF _48q0sare5 do form ele0103
ON SELECTION BAR 2 OF _48q0sare5 do form ele0104
ON SELECTION BAR 3 OF _48q0sare5 do form ele0104a
ON SELECTION BAR 5 OF _48q0sare5 do form ele0111
ON SELECTION BAR 6 OF _48q0sare5 do form ele0112
ON SELECTION BAR 8 OF _48q0sare5 do form actautdoc
ON SELECTION BAR 9 OF _48q0sare5 do form actautret
ON SELECTION BAR 11 OF _48q0sare5 do form ele0105
ON SELECTION BAR 12 OF _48q0sare5 do form ele0106
ON SELECTION BAR 13 OF _48q0sare5 do form ele0107
ON SELECTION BAR 15 OF _48q0sare5 do form ele0108
ON SELECTION BAR 16 OF _48q0sare5 do form ele0109
ON SELECTION BAR 17 OF _48q0sare5 do form fac0307a
ON SELECTION BAR 18 OF _48q0sare5 do form ele0110
ON SELECTION BAR 20 OF _48q0sare5 do form xml0101

DEFINE POPUP documentos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF documentos PROMPT "Cancelación"
DEFINE BAR 2 OF documentos PROMPT "Generacion de Pagares"
DEFINE BAR 3 OF documentos PROMPT "Cancelación Saldos Iniciales"
DEFINE BAR 4 OF documentos PROMPT "Documento Bancario"
DEFINE BAR 5 OF documentos PROMPT "Contabilización"
DEFINE BAR 6 OF documentos PROMPT "\-"
DEFINE BAR 7 OF documentos PROMPT "Autorización"
DEFINE BAR 8 OF documentos PROMPT "Anulación"
DEFINE BAR 9 OF documentos PROMPT "Anulacion Pagares"
DEFINE BAR 10 OF documentos PROMPT "\-"
DEFINE BAR 11 OF documentos PROMPT "Consulta"
DEFINE BAR 12 OF documentos PROMPT "Historial"
DEFINE BAR 13 OF documentos PROMPT "\-"
DEFINE BAR 14 OF documentos PROMPT "Corrección"
DEFINE BAR 15 OF documentos PROMPT "Costos de Ventas"
DEFINE BAR 16 OF documentos PROMPT "\-"
DEFINE BAR 17 OF documentos PROMPT "Captura Fotografica"
DEFINE BAR 18 OF documentos PROMPT "\-"
DEFINE BAR 19 OF documentos PROMPT "Avisos"
DEFINE BAR 20 OF documentos PROMPT "Envio de Correo"
DEFINE BAR 21 OF documentos PROMPT "Sujetos"
DEFINE BAR 22 OF documentos PROMPT "Autorizacion Credito"
DEFINE BAR 23 OF documentos PROMPT "Consulta de Saldos"
DEFINE BAR 24 OF documentos PROMPT "\-"
DEFINE BAR 25 OF documentos PROMPT "Facturacion Electronica"
ON SELECTION BAR 1 OF documentos do form adq0701b
ON SELECTION BAR 2 OF documentos do form tablamort
ON SELECTION BAR 3 OF documentos do form saldoini
ON SELECTION BAR 4 OF documentos do form adq0702b
ON SELECTION BAR 5 OF documentos do form adq0703b
ON SELECTION BAR 7 OF documentos do form adq0707
ON SELECTION BAR 8 OF documentos do form adq0704
ON SELECTION BAR 9 OF documentos do form anutablamort
ON SELECTION BAR 11 OF documentos do form adq0705b
ON SELECTION BAR 12 OF documentos do form historial
ON SELECTION BAR 14 OF documentos do form adq0706
ON SELECTION BAR 15 OF documentos do form costoven
ON SELECTION BAR 17 OF documentos do form frmfoto1
ON SELECTION BAR 19 OF documentos do form regaviso
ON SELECTION BAR 20 OF documentos do form correo
ON SELECTION BAR 21 OF documentos do form adm0303
ON SELECTION BAR 22 OF documentos do form set0108
ON SELECTION BAR 23 OF documentos do form ban0110
ON SELECTION BAR 25 OF documentos do form ele0101

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el Sistema"
ON SELECTION BAR 1 OF salir ;
	DO _4m6121bn1 ;
	IN LOCFILE("PROG\MENUFAC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUFAC?")
ON SELECTION BAR 2 OF salir ;
	DO _4m6121bng ;
	IN LOCFILE("PROG\MENUFAC" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUFAC?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _4M6121BN0  ON SELECTION BAR 2 OF POPUP impresiónd      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUFAC.PRG,            Record:  142        
*       * Called By:  ON SELECTION BAR 2 OF POPUP impresiónd      
*       * Prompt:     Desactivar Impresión de Doc. Ventas         
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _4m6121bn0
if type('_screen.objimp')='O'
	_screen.removeobject('objimp')
endif


*       *********************************************************
*       *                                                         
*       * _4M6121BN1  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUFAC.PRG,            Record:  205        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _4m6121bn1
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
*       * _4M6121BNG  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUFAC.PRG,            Record:  206        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el Sistema                        
*       * Snippet:    3                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _4m6121bng
deactivate menu _msysmenu
clea even
clea read
final=1
return

