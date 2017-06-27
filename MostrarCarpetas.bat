@ECHO OFF
ECHO ========================================================================
ECHO ESTOY TRABAJANDO PARA RECUPERAR TU INFORMACION. NO CIERRES LA VENTANA...
ECHO ========================================================================
ATTRIB -R -S -H /S /D *.*
ATTRIB +R +S +H AUTORUN.INF
DEL *.LNK
DEL z??
