*       *********************************************************
*       *                                                         
*       * 23/03/2016            MENUINV.PRG             11:28:29  
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

DEFINE PAD _4lf0oley0 OF _MSYSMENU PROMPT "Opc. Generales" COLOR SCHEME 3 ;
	KEY ALT+O, ""
DEFINE PAD _4lf0oley1 OF _MSYSMENU PROMPT "Producción" COLOR SCHEME 3 ;
	KEY ALT+P, ""
DEFINE PAD _4lf0oley2 OF _MSYSMENU PROMPT "Ingresos-Egresos" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _4lf0oley3 OF _MSYSMENU PROMPT "Ajustes" COLOR SCHEME 3 ;
	KEY ALT+A, ""
DEFINE PAD _4lf0oley4 OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _4lf0oley5 OF _MSYSMENU PROMPT "Entrega Ventas" COLOR SCHEME 3 ;
	KEY ALT+E, ""
DEFINE PAD _4lf0oley6 OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _4lf0oley7 OF _MSYSMENU PROMPT "Impresión Documentos" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _4lf0oley8 OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _4lf0oley0 OF _MSYSMENU ACTIVATE POPUP opcgeneral
ON PAD _4lf0oley1 OF _MSYSMENU ACTIVATE POPUP _1w70rn3yl
ON PAD _4lf0oley2 OF _MSYSMENU ACTIVATE POPUP ingresoseg
ON PAD _4lf0oley3 OF _MSYSMENU ACTIVATE POPUP ajustes
ON PAD _4lf0oley4 OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _4lf0oley5 OF _MSYSMENU ACTIVATE POPUP _29217hc9u
ON PAD _4lf0oley6 OF _MSYSMENU ACTIVATE POPUP nuevoeleme
ON PAD _4lf0oley7 OF _MSYSMENU ACTIVATE POPUP _1wy1d6g9y
ON PAD _4lf0oley8 OF _MSYSMENU ACTIVATE POPUP salir

DEFINE POPUP opcgeneral MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF opcgeneral PROMPT "Mantenimiento del Inventario"
DEFINE BAR 2 OF opcgeneral PROMPT "Unificar Items"
DEFINE BAR 3 OF opcgeneral PROMPT "Conversiones"
DEFINE BAR 4 OF opcgeneral PROMPT "Captura Fotografica"
DEFINE BAR 5 OF opcgeneral PROMPT "\-"
DEFINE BAR 6 OF opcgeneral PROMPT "Listas de Precios"
DEFINE BAR 7 OF opcgeneral PROMPT "Lista Precios Proveedores"
ON SELECTION BAR 1 OF opcgeneral do form inv0101
ON SELECTION BAR 2 OF opcgeneral do form uneitem
ON SELECTION BAR 3 OF opcgeneral do form inv0108
ON SELECTION BAR 4 OF opcgeneral do form frmfoto2
ON BAR 6 OF opcgeneral ACTIVATE POPUP listasdepr
ON SELECTION BAR 7 OF opcgeneral do form inv0109c

DEFINE POPUP listasdepr MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF listasdepr PROMPT "5 Listas"
DEFINE BAR 2 OF listasdepr PROMPT "individual"
ON SELECTION BAR 1 OF listasdepr do form inv0109a
ON SELECTION BAR 2 OF listasdepr do form inv0109e

DEFINE POPUP _1w70rn3yl MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _1w70rn3yl PROMPT "Componentes"
DEFINE BAR 2 OF _1w70rn3yl PROMPT "\-"
DEFINE BAR 3 OF _1w70rn3yl PROMPT "Orden de Producción"
DEFINE BAR 4 OF _1w70rn3yl PROMPT "Consulta de Ordenes"
DEFINE BAR 5 OF _1w70rn3yl PROMPT "Anulacion de Ordenes de Producción"
DEFINE BAR 6 OF _1w70rn3yl PROMPT "\-"
DEFINE BAR 7 OF _1w70rn3yl PROMPT "Generacion de Documentos"
ON SELECTION BAR 1 OF _1w70rn3yl do form inv0111
ON SELECTION BAR 3 OF _1w70rn3yl do form inv0112
ON SELECTION BAR 4 OF _1w70rn3yl do form inv0113
ON SELECTION BAR 5 OF _1w70rn3yl do form inv0114
ON SELECTION BAR 7 OF _1w70rn3yl do form inv0115

DEFINE POPUP ingresoseg MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ingresoseg PROMPT "Ingresos-Egresos"
DEFINE BAR 2 OF ingresoseg PROMPT "Segun Doc. Inicial"
DEFINE BAR 3 OF ingresoseg PROMPT "Despacho de Pedidos"
DEFINE BAR 4 OF ingresoseg PROMPT "\-"
DEFINE BAR 5 OF ingresoseg PROMPT "Transferencia de Mercaderia"
DEFINE BAR 6 OF ingresoseg PROMPT "\-"
DEFINE BAR 7 OF ingresoseg PROMPT "Ingresos-Egresos por Bodega"
ON SELECTION BAR 1 OF ingresoseg do form inv0401
ON SELECTION BAR 2 OF ingresoseg do form inv0401a
ON SELECTION BAR 3 OF ingresoseg do form inv0403
ON SELECTION BAR 5 OF ingresoseg do form inv0118
ON SELECTION BAR 7 OF ingresoseg do form inv0404

DEFINE POPUP ajustes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ajustes PROMPT "Saldos Iniciales"
DEFINE BAR 2 OF ajustes PROMPT "\-"
DEFINE BAR 3 OF ajustes PROMPT "Costos y Saldos de Stock General"
DEFINE BAR 4 OF ajustes PROMPT "Recalculo de Transferencias"
DEFINE BAR 5 OF ajustes PROMPT "Actualizar Costos en Adquisiciones"
DEFINE BAR 6 OF ajustes PROMPT "Recalculo de Costos en Ventas desde 2015"
DEFINE BAR 7 OF ajustes PROMPT "\-"
DEFINE BAR 8 OF ajustes PROMPT "Ultima Fecha de costeo"
DEFINE BAR 9 OF ajustes PROMPT "Cargo o Descargo de la Cta Inventario"
DEFINE BAR 10 OF ajustes PROMPT "\-"
DEFINE BAR 11 OF ajustes PROMPT "Conteo Físico"
DEFINE BAR 12 OF ajustes PROMPT "\-"
DEFINE BAR 13 OF ajustes PROMPT "Generar Saldos Por Periodos"
DEFINE BAR 14 OF ajustes PROMPT "Generar Saldos Por Periodos Varios meses"
DEFINE BAR 15 OF ajustes PROMPT "Actualizacion de costos de Proveedor"
DEFINE BAR 16 OF ajustes PROMPT "Recalculo de costos No ventas"
DEFINE BAR 17 OF ajustes PROMPT "Recalculo de Cargo/Descargo Inventario"
DEFINE BAR 18 OF ajustes PROMPT "\-"
DEFINE BAR 19 OF ajustes PROMPT "Borrar Saldos Mensuales"
ON BAR 1 OF ajustes ACTIVATE POPUP saldosinic
ON SELECTION BAR 3 OF ajustes do form inv0207
ON SELECTION BAR 4 OF ajustes do form recalcost
ON SELECTION BAR 5 OF ajustes do form inv0214
ON SELECTION BAR 6 OF ajustes do form inv0208a
ON SELECTION BAR 8 OF ajustes do form inv0407
ON SELECTION BAR 9 OF ajustes do form inv0209a
ON SELECTION BAR 11 OF ajustes do form inv0211
ON SELECTION BAR 13 OF ajustes do form inv0212a
ON SELECTION BAR 14 OF ajustes do form inv0212b
ON SELECTION BAR 15 OF ajustes do form inv0213
ON SELECTION BAR 16 OF ajustes do form recalcost
ON SELECTION BAR 17 OF ajustes do form recaldes
ON SELECTION BAR 19 OF ajustes do form inv0212c

DEFINE POPUP saldosinic MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF saldosinic PROMPT "Generar Saldos"
DEFINE BAR 2 OF saldosinic PROMPT "Importar Saldos"
DEFINE BAR 3 OF saldosinic PROMPT "\-"
DEFINE BAR 4 OF saldosinic PROMPT "Edicion de Saldos por Bodega"
DEFINE BAR 5 OF saldosinic PROMPT "Edición de Item"
DEFINE BAR 6 OF saldosinic PROMPT "\-"
DEFINE BAR 7 OF saldosinic PROMPT "Contabilización"
DEFINE BAR 8 OF saldosinic PROMPT "Unificacion de Valores de Kardex y contabilidad"
ON SELECTION BAR 1 OF saldosinic do form inv0205
ON SELECTION BAR 2 OF saldosinic do form inv0205a
ON SELECTION BAR 4 OF saldosinic do form inv0206a
ON SELECTION BAR 5 OF saldosinic do form inv0206
ON SELECTION BAR 7 OF saldosinic do form inv0210
ON SELECTION BAR 8 OF saldosinic do form inv0205c

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Movimiento Historico de Items"
DEFINE BAR 2 OF reportes PROMPT "Movimiento Historico de Items por Sujetos"
DEFINE BAR 3 OF reportes PROMPT "Resumen por Sujeto"
DEFINE BAR 4 OF reportes PROMPT "Resumen Por Tipo"
DEFINE BAR 5 OF reportes PROMPT "Resumen Saldos Items"
DEFINE BAR 6 OF reportes PROMPT "Egresos de Bodega"
DEFINE BAR 7 OF reportes PROMPT "Saldos Mensuales"
DEFINE BAR 8 OF reportes PROMPT "Por vencimiento"
DEFINE BAR 9 OF reportes PROMPT "Secuencial de Ordenes"
DEFINE BAR 10 OF reportes PROMPT "Varias Listas de Precios"
DEFINE BAR 11 OF reportes PROMPT "1 Lista de Precios"
DEFINE BAR 12 OF reportes PROMPT "Lista de Items"
DEFINE BAR 13 OF reportes PROMPT "Utilidad por ITEM"
DEFINE BAR 14 OF reportes PROMPT "Montos Totales"
DEFINE BAR 15 OF reportes PROMPT "Montos Totales (Grupos Doc)"
DEFINE BAR 16 OF reportes PROMPT "Egresos de Producción"
DEFINE BAR 17 OF reportes PROMPT "Doc. Generados y No Generados"
DEFINE BAR 18 OF reportes PROMPT "Doc. Sin Entrega de Articulos"
DEFINE BAR 19 OF reportes PROMPT "Listado Conteo Fisico"
DEFINE BAR 20 OF reportes PROMPT "Detalle de Items por documento"
DEFINE BAR 21 OF reportes PROMPT "Movimiento Historico (Anulados)"
DEFINE BAR 22 OF reportes PROMPT "Items sin costo"
DEFINE BAR 23 OF reportes PROMPT "Comparacion de Kardex y Contabilidad"
DEFINE BAR 24 OF reportes PROMPT "Etiquetas Cod. Barra"
DEFINE BAR 25 OF reportes PROMPT "Etiquetas Cod. Barra por Adquisicion"
DEFINE BAR 26 OF reportes PROMPT "\-"
DEFINE BAR 27 OF reportes PROMPT "Reposicion Mercaderia"
ON SELECTION BAR 1 OF reportes do form inv0601c
ON SELECTION BAR 2 OF reportes do form inv0602
ON SELECTION BAR 3 OF reportes do form inv0612
ON SELECTION BAR 4 OF reportes do form inv0603
ON SELECTION BAR 5 OF reportes do form inv0603b
ON SELECTION BAR 6 OF reportes do form inv0611
ON SELECTION BAR 7 OF reportes do form impsalitem
ON SELECTION BAR 8 OF reportes do form inv0610
ON SELECTION BAR 9 OF reportes do form fac0307
ON SELECTION BAR 10 OF reportes do form listapre
ON SELECTION BAR 11 OF reportes do form listapre1
ON SELECTION BAR 12 OF reportes do form impitem
ON SELECTION BAR 13 OF reportes do form fac0317
ON SELECTION BAR 14 OF reportes do form fac0303
ON SELECTION BAR 15 OF reportes do form fac0303a
ON SELECTION BAR 16 OF reportes do form inv0605
ON SELECTION BAR 17 OF reportes do form inv0606
ON SELECTION BAR 18 OF reportes do form inv0607
ON SELECTION BAR 19 OF reportes do form inv0603a
ON SELECTION BAR 20 OF reportes do form inv0609
ON SELECTION BAR 21 OF reportes do form inv0601a
ON SELECTION BAR 22 OF reportes do form inv0613
ON SELECTION BAR 23 OF reportes do form inv0601b
ON BAR 24 OF reportes ACTIVATE POPUP etiquetasc
ON SELECTION BAR 25 OF reportes do form gencodbarr3
ON SELECTION BAR 27 OF reportes do form inv0315

DEFINE POPUP etiquetasc MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF etiquetasc PROMPT "Codigo de Barras 3 Etiquetas"
DEFINE BAR 2 OF etiquetasc PROMPT "\-"
DEFINE BAR 3 OF etiquetasc PROMPT "Codigo de Barras 2 Etiquetas"
ON SELECTION BAR 1 OF etiquetasc do form gencodbarr
ON SELECTION BAR 3 OF etiquetasc do form gencodbarrb

DEFINE POPUP _29217hc9u MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _29217hc9u PROMPT "Entrega Productos Contado"
DEFINE BAR 2 OF _29217hc9u PROMPT "Entrega Productos Credito"
DEFINE BAR 3 OF _29217hc9u PROMPT "\-"
DEFINE BAR 4 OF _29217hc9u PROMPT "Confirmaión por Grupo"
ON SELECTION BAR 1 OF _29217hc9u do form inv0701
ON SELECTION BAR 2 OF _29217hc9u do form inv0701b
ON SELECTION BAR 4 OF _29217hc9u do form inv0701c

DEFINE POPUP nuevoeleme MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF nuevoeleme PROMPT "Desbloqueo"
DEFINE BAR 2 OF nuevoeleme PROMPT "Autorización"
DEFINE BAR 3 OF nuevoeleme PROMPT "\-"
DEFINE BAR 4 OF nuevoeleme PROMPT "Cerrar doc - Forma de Pago"
DEFINE BAR 5 OF nuevoeleme PROMPT "Documento Bancario"
DEFINE BAR 6 OF nuevoeleme PROMPT "Contabilización"
DEFINE BAR 7 OF nuevoeleme PROMPT "\-"
DEFINE BAR 8 OF nuevoeleme PROMPT "Autorización"
DEFINE BAR 9 OF nuevoeleme PROMPT "Anulación"
DEFINE BAR 10 OF nuevoeleme PROMPT "Cambiar Items"
DEFINE BAR 11 OF nuevoeleme PROMPT "\-"
DEFINE BAR 12 OF nuevoeleme PROMPT "Cargar Imagen"
DEFINE BAR 13 OF nuevoeleme PROMPT "Tomar Fotografia"
DEFINE BAR 14 OF nuevoeleme PROMPT "\-"
DEFINE BAR 15 OF nuevoeleme PROMPT "Consulta"
ON SELECTION BAR 1 OF nuevoeleme do form adq0708
ON SELECTION BAR 2 OF nuevoeleme do form adq0707
ON SELECTION BAR 4 OF nuevoeleme do form adq0701b
ON SELECTION BAR 5 OF nuevoeleme do form adq0702b
ON SELECTION BAR 6 OF nuevoeleme do form adq0703b
ON SELECTION BAR 8 OF nuevoeleme do form adq0707
ON SELECTION BAR 9 OF nuevoeleme do form adq0704
ON SELECTION BAR 10 OF nuevoeleme do form moditems
ON SELECTION BAR 12 OF nuevoeleme do form frmfoto3
ON SELECTION BAR 13 OF nuevoeleme do form frmfoto2
ON SELECTION BAR 15 OF nuevoeleme do form adq0705b

DEFINE POPUP _1wy1d6g9y MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _1wy1d6g9y PROMPT "Activar Impresión de Documentos"
DEFINE BAR 2 OF _1wy1d6g9y PROMPT "Desactivar Impresión"
ON SELECTION BAR 1 OF _1wy1d6g9y do form actimpdoc
ON SELECTION BAR 2 OF _1wy1d6g9y ;
	DO _4lf0oleyg ;
	IN LOCFILE("PROG\MENUINV" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUINV?")

DEFINE POPUP salir MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF salir PROMPT "Regresar al Menú Princ."
DEFINE BAR 2 OF salir PROMPT "Abandonar el Sistema"
ON SELECTION BAR 1 OF salir ;
	DO _4lf0oleyh ;
	IN LOCFILE("PROG\MENUINV" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUINV?")
ON SELECTION BAR 2 OF salir ;
	DO _4lf0oleyi ;
	IN LOCFILE("PROG\MENUINV" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUINV?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _4LF0OLEYG  ON SELECTION BAR 2 OF POPUP _1wy1d6g9y      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUINV.PRG,            Record:  138        
*       * Called By:  ON SELECTION BAR 2 OF POPUP _1wy1d6g9y      
*       * Prompt:     Desactivar Impresión                        
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _4lf0oleyg
if type('_screen.objimp')='O'
	_screen.removeobject('objimp')
endif


*       *********************************************************
*       *                                                         
*       * _4LF0OLEYH  ON SELECTION BAR 1 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUINV.PRG,            Record:  141        
*       * Called By:  ON SELECTION BAR 1 OF POPUP salir           
*       * Prompt:     Regresar al Menú Princ.                     
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _4lf0oleyh
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
*       * _4LF0OLEYI  ON SELECTION BAR 2 OF POPUP salir           
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUINV.PRG,            Record:  142        
*       * Called By:  ON SELECTION BAR 2 OF POPUP salir           
*       * Prompt:     Abandonar el Sistema                        
*       * Snippet:    3                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _4lf0oleyi
deactivate menu _msysmenu
clea even
clea read
final=1
return

