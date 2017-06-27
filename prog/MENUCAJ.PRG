*       *********************************************************
*       *                                                         
*       * 26/12/2014            MENUCAJ.PRG             11:59:47  
*       *                                                         
*       *********************************************************
*       *                                                         
*       * Nombre del autor                                        
*       *                                                         
*       * Copyright (C) 2014 Nombre de compañía                   
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

DEFINE PAD _48q0ppnwx OF _MSYSMENU PROMPT "Ventas" COLOR SCHEME 3 ;
	KEY ALT+V, ""
DEFINE PAD _48q0ppnwy OF _MSYSMENU PROMPT "Recaudacion" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _48q0ppnwz OF _MSYSMENU PROMPT "Reportes" COLOR SCHEME 3 ;
	KEY ALT+R, ""
DEFINE PAD _48q0ppnx0 OF _MSYSMENU PROMPT "Configuracion" COLOR SCHEME 3 ;
	KEY ALT+C, ""
DEFINE PAD _48q0ppnx1 OF _MSYSMENU PROMPT "Adm.Doc.Electronicos" COLOR SCHEME 3 ;
	KEY ALT+A, ""
DEFINE PAD _48q0ppnx2 OF _MSYSMENU PROMPT "Documentos" COLOR SCHEME 3 ;
	KEY ALT+D, ""
DEFINE PAD _48q0ppnx3 OF _MSYSMENU PROMPT "Impresion" COLOR SCHEME 3 ;
	KEY ALT+I, ""
DEFINE PAD _48q0ppnx4 OF _MSYSMENU PROMPT "Salir" COLOR SCHEME 3 ;
	KEY ALT+S, ""
ON PAD _48q0ppnwx OF _MSYSMENU ACTIVATE POPUP ventas
ON PAD _48q0ppnwy OF _MSYSMENU ACTIVATE POPUP recaudacio
ON PAD _48q0ppnwz OF _MSYSMENU ACTIVATE POPUP reportes
ON PAD _48q0ppnx0 OF _MSYSMENU ACTIVATE POPUP configurac
ON PAD _48q0ppnx1 OF _MSYSMENU ACTIVATE POPUP admdocelec
ON PAD _48q0ppnx2 OF _MSYSMENU ACTIVATE POPUP documentos
ON PAD _48q0ppnx3 OF _MSYSMENU ACTIVATE POPUP _2u51edjuu
ON SELECTION PAD _48q0ppnx4 OF _MSYSMENU ;
	DO _48q0ppnx5 ;
	IN LOCFILE("PROG\MENUCAJ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCAJ?")

DEFINE POPUP ventas MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ventas PROMPT "Doc. Ventas"
DEFINE BAR 2 OF ventas PROMPT "Doc. Ventas x Bodega"
DEFINE BAR 3 OF ventas PROMPT "Cotizaciones"
DEFINE BAR 4 OF ventas PROMPT "Doc Generados"
DEFINE BAR 5 OF ventas PROMPT "Canje de Retenciones"
DEFINE BAR 6 OF ventas PROMPT "\-"
DEFINE BAR 7 OF ventas PROMPT "Devoluciones"
DEFINE BAR 8 OF ventas PROMPT "\-"
DEFINE BAR 9 OF ventas PROMPT "Cheques Ventas"
DEFINE BAR 10 OF ventas PROMPT "\-"
DEFINE BAR 11 OF ventas PROMPT "Consulta de Items"
DEFINE BAR 12 OF ventas PROMPT "Sujetos"
DEFINE BAR 13 OF ventas PROMPT "\-"
DEFINE BAR 14 OF ventas PROMPT "Vales de Caja"
ON SELECTION BAR 1 OF ventas do form fac0101
ON SELECTION BAR 2 OF ventas do form fac0106a
ON SELECTION BAR 3 OF ventas do form fac0103
ON SELECTION BAR 4 OF ventas do form fac0101b
ON SELECTION BAR 5 OF ventas do form  fac0107
ON SELECTION BAR 7 OF ventas do form fac0401
ON SELECTION BAR 9 OF ventas do form  cheques
ON SELECTION BAR 11 OF ventas do form fac0109a
ON SELECTION BAR 12 OF ventas do form adm0303
ON SELECTION BAR 14 OF ventas do form caj0207

DEFINE POPUP recaudacio MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF recaudacio PROMPT "Ctas X Cobrar"
ON SELECTION BAR 1 OF recaudacio do form ban0101

DEFINE POPUP reportes MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF reportes PROMPT "Ingresos - Egresos (Contable)"
DEFINE BAR 2 OF reportes PROMPT "Ingresos - Egresos (det cancelacion)"
DEFINE BAR 3 OF reportes PROMPT "Movimiento Cta. Caja"
DEFINE BAR 4 OF reportes PROMPT "Doc. No Contabilizados"
DEFINE BAR 5 OF reportes PROMPT "Montos Totales"
DEFINE BAR 6 OF reportes PROMPT "Cheques"
ON SELECTION BAR 1 OF reportes do form con0116a
ON SELECTION BAR 2 OF reportes do form fac0311
ON SELECTION BAR 3 OF reportes do form fac0311a
ON SELECTION BAR 4 OF reportes do form con0115
ON SELECTION BAR 5 OF reportes do form fac0303
ON SELECTION BAR 6 OF reportes do form fac0312

DEFINE POPUP configurac MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF configurac PROMPT "Apariencia"
DEFINE BAR 2 OF configurac PROMPT "Cambiar Clave"
ON SELECTION BAR 1 OF configurac do form set0403
ON SELECTION BAR 2 OF configurac do form set0401

DEFINE POPUP admdocelec MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF admdocelec PROMPT "Documentos Seleccion"
DEFINE BAR 2 OF admdocelec PROMPT "Retenciones Seleccion"
ON SELECTION BAR 1 OF admdocelec do form ele0103
ON SELECTION BAR 2 OF admdocelec do form ele0104

DEFINE POPUP documentos MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF documentos PROMPT "Consulta documentos"
DEFINE BAR 2 OF documentos PROMPT "Consulta de Saldos"
DEFINE BAR 3 OF documentos PROMPT "\-"
DEFINE BAR 4 OF documentos PROMPT "Formas de Pago"
DEFINE BAR 5 OF documentos PROMPT "Tabla de Pagos"
DEFINE BAR 6 OF documentos PROMPT "\-"
DEFINE BAR 7 OF documentos PROMPT "Anulacion"
ON SELECTION BAR 1 OF documentos do form adq0705b
ON SELECTION BAR 2 OF documentos do form ban0110
ON SELECTION BAR 4 OF documentos do form adq0701c
ON SELECTION BAR 5 OF documentos do form tablamort
ON SELECTION BAR 7 OF documentos do form adq0704

DEFINE POPUP _2u51edjuu MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF _2u51edjuu PROMPT "Activar Impresión de Documentos"
DEFINE BAR 2 OF _2u51edjuu PROMPT "Desactivar Impresión de Doc. Ventas"
ON SELECTION BAR 1 OF _2u51edjuu do form actimpdoc
ON SELECTION BAR 2 OF _2u51edjuu ;
	DO _48q0ppnxs ;
	IN LOCFILE("PROG\MENUCAJ" ,"MPX;MPR|FXP;PRG" ,"DÓNDE está MENUCAJ?")


*       *********************************************************
*       *                                                         
*       *              Limpiar Código y Procedimientos            
*       *                                                         
*       *********************************************************
*

read event

*       *********************************************************
*       *                                                         
*       * _48Q0PPNX5  ON SELECTION PAD                            
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCAJ.PRG,            Record:   57        
*       * Called By:  ON SELECTION PAD                            
*       * Prompt:     Salir                                       
*       * Snippet:    1                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _48q0ppnx5
*!*	local a
*!*	a=.f.
*!*	do form claveadm to a
*!*	if !a
*!*		return
*!*	endif

deactivate menu _msysmenu
clea even
clea read
final=1
return



*       *********************************************************
*       *                                                         
*       * _48Q0PPNXS  ON SELECTION BAR 2 OF POPUP _2u51edjuu      
*       *                                                         
*       * Procedure Origin:                                       
*       *                                                         
*       * From Menu:  MENUCAJ.PRG,            Record:   56        
*       * Called By:  ON SELECTION BAR 2 OF POPUP _2u51edjuu      
*       * Prompt:     Desactivar Impresión de Doc. Ventas         
*       * Snippet:    2                                           
*       *                                                         
*       *********************************************************
*
PROCEDURE _48q0ppnxs
if type('_screen.objimp')='O'
	_screen.removeobject('objimp')
endif
