************************************************************
*	Definir localhost en computador local sin estaciones de
*   Trabajo
************************************************************
local h, f, b, p
DisplayStatus([Configurando la base de datos...])

CLOSE DATA ALL

if !director(sys(2003)) then
	b=sys(2003)
	mkdir &b
endif
	
b=sys(2003)+'\'+alltrim(nombdd)+'.dbc'
CREATE DATABASE &b

*DisplayStatus([Creando conexión PRINCIPAL...])

sele 0
use configura exclu
pack
if type('puerto')='U'
	alter table configura add puerto c(4)
	replace all puerto with '5432'
	p='5432'
endif

if reccount()>1 then
	=messagebox('Escoja uno de los Origenes de datos',0)
	SET SHADOW ON
	DEFINE POPUP GridPopup ;
		FROM MROW(), MCOL() ;
		MARGIN ;
		promp fiel configura.host ;
		SHORTCUT 
	on selection popup gridpopup deactivate popup gridpopup
	ACTIVATE POPUP GridPopup
	i=host
	? i
	RELEASE POPUP GridPopup
	
endif

h=host
p=puerto

MakeConn_PRINCIPAL(host,base,puerto)
use

*DisplayStatus([Creando vista EMPRESAS...])
MakeView_EMPRESAS()

sele 0
use empresas
go top
do while !eof()
	DisplayStatus([Creando conexión BDD...])
	if !empty(bdd) and !isnull(bdd) then
		MakeConn(alltrim(bdd), alltrim(iif(h='localhost',h,empresas.host)),p)
	endif
	skip
enddo
CLOSE DATA ALL
open data &b shared

DisplayStatus([Base de Datos Configurada.])

*************************************************************************************
*************************************************************************************
FUNCTION MakeConn_PRINCIPAL
para h,b,p
private f
*DSN=PostgreSQL;DATABASE=BDD;SERVER=localhost;PORT=5432;UID=postgres;PWD=postgres;A6=;A7=100;A8=4096;B0=254;B1=8190;BI=0;C2=dd_;;CX=1b3a3


f="DSN=PostgreSQL;DATABASE="+alltrim(b)+";SERVER="+alltrim(h)+";PORT="+alltrim(p)+";UID=postgres;PWD=postgres;A0=0;A1=6.4;A2=0;A3=0;A4=0;A5=0;A6=;A7=100;A8=4096;A9=0;B0=254;B1=8190;B2=0;B3=0;B4=1;B5=1;B6=0;B7=0;B8=0;B9=0;C0=0;C1=0;C2=dd_;"


*	 Definiciones de conexiones PRINCIPAL ***************
CREATE CONNECTION PRINCIPAL ; 
   CONNSTRING &f
****
DBSetProp('PRINCIPAL', 'Connection', 'Asynchronous', .F.)
DBSetProp('PRINCIPAL', 'Connection', 'BatchMode', .T.)
DBSetProp('PRINCIPAL', 'Connection', 'Comment', '')
DBSetProp('PRINCIPAL', 'Connection', 'DispLogin', 1)
DBSetProp('PRINCIPAL', 'Connection', 'ConnectTimeOut', 15)
DBSetProp('PRINCIPAL', 'Connection', 'DispWarnings', .F.)
DBSetProp('PRINCIPAL', 'Connection', 'IdleTimeOut', 0)
DBSetProp('PRINCIPAL', 'Connection', 'QueryTimeOut', 0)
DBSetProp('PRINCIPAL', 'Connection', 'Transactions', 1)
DBSetProp('PRINCIPAL', 'Connection', 'Database', '')

ENDFUNC

*************************************************************************************
*	Definicion de las conexiones para cada BDD
************************************************************************************* 
FUNCTION MakeConn
para bd,ht,pt
private b,f,h,p
h=ht 
b=bd
p=pt

f="DSN=PostgreSQL;DATABASE="+alltrim(b)+";SERVER="+alltrim(h)+";PORT="+alltrim(p)+";UID=postgres;PWD=postgres;A0=0;A1=6.4;A2=0;A3=0;A4=0;A5=0;A6=;A7=100;A8=4096;A9=0;B0=254;B1=8190;B2=0;B3=0;B4=1;B5=1;B6=0;B7=0;B8=0;B9=0;C0=0;C1=0;C2=dd_;"


CREATE CONNECTION &b ; 
   CONNSTRING &f
****
DBSetProp(b, 'Connection', 'Asynchronous', .F.)
DBSetProp(b, 'Connection', 'BatchMode', .T.)
DBSetProp(b, 'Connection', 'Comment', '')
DBSetProp(b, 'Connection', 'DispLogin', 1)
DBSetProp(b, 'Connection', 'ConnectTimeOut', 15)
DBSetProp(b, 'Connection', 'DispWarnings', .F.)
DBSetProp(b, 'Connection', 'IdleTimeOut', 0)
DBSetProp(b, 'Connection', 'QueryTimeOut', 0)
DBSetProp(b, 'Connection', 'Transactions', 1)
DBSetProp(b, 'Connection', 'Database', '')

ENDFUNC

*************************************************************************************
*	Vista de las empresas
************************************************************************************* 
FUNCTION MakeView_EMPRESAS
*	Ver la configuración para EMPRESAS 
CREATE SQL VIEW "EMPRESAS" ; 
   REMOTE CONNECT "PRINCIPAL" ; 
   AS SELECT * FROM empresas Empresas

DBSetProp('EMPRESAS', 'View', 'UpdateType', 1)
DBSetProp('EMPRESAS', 'View', 'WhereType', 3)
DBSetProp('EMPRESAS', 'View', 'FetchMemo', .T.)
DBSetProp('EMPRESAS', 'View', 'SendUpdates', .T.)
DBSetProp('EMPRESAS', 'View', 'UseMemoSize', 255)
DBSetProp('EMPRESAS', 'View', 'FetchSize', 100)
DBSetProp('EMPRESAS', 'View', 'MaxRecords', -1)
DBSetProp('EMPRESAS', 'View', 'Tables', 'empresas')
DBSetProp('EMPRESAS', 'View', 'Prepared', .F.)
DBSetProp('EMPRESAS', 'View', 'CompareMemo', .T.)
DBSetProp('EMPRESAS', 'View', 'FetchAsNeeded', .F.)
DBSetProp('EMPRESAS', 'View', 'FetchSize', 100)
DBSetProp('EMPRESAS', 'View', 'Comment', "")
DBSetProp('EMPRESAS', 'View', 'BatchUpdateCount', 1)
DBSetProp('EMPRESAS', 'View', 'ShareConnection', .F.)

*!* Field Level Properties for EMPRESAS
* Props for the EMPRESAS.idemp field.
DBSetProp('EMPRESAS.idemp', 'Field', 'KeyField', .T.)
DBSetProp('EMPRESAS.idemp', 'Field', 'Updatable', .F.)
DBSetProp('EMPRESAS.idemp', 'Field', 'UpdateName', 'empresas.idemp')
DBSetProp('EMPRESAS.idemp', 'Field', 'DataType', "I")
* Props for the EMPRESAS.ssri field.
DBSetProp('EMPRESAS.ssri', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.ssri', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.ssri', 'Field', 'UpdateName', 'empresas.ssri')
DBSetProp('EMPRESAS.ssri', 'Field', 'DataType', "C(60)")
* Props for the EMPRESAS.sruc field.
DBSetProp('EMPRESAS.sruc', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.sruc', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.sruc', 'Field', 'UpdateName', 'empresas.sruc')
DBSetProp('EMPRESAS.sruc', 'Field', 'DataType', "C(13)")
* Props for the EMPRESAS.host field.
DBSetProp('EMPRESAS.host', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.host', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.host', 'Field', 'UpdateName', 'empresas.host')
DBSetProp('EMPRESAS.host', 'Field', 'DataType', "C(15)")
* Props for the EMPRESAS.bdd field.
DBSetProp('EMPRESAS.bdd', 'Field', 'KeyField', .F.)
DBSetProp('EMPRESAS.bdd', 'Field', 'Updatable', .T.)
DBSetProp('EMPRESAS.bdd', 'Field', 'UpdateName', 'empresas.bdd')
DBSetProp('EMPRESAS.bdd', 'Field', 'DataType', "C(20)")
ENDFUNC
 
*************************************************************************************
*************************************************************************************
FUNCTION DisplayStatus(lcMessage)
WAIT WINDOW NOWAIT lcMessage
ENDFUNC
