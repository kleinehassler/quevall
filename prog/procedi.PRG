function solonl
para cadena
local  a, i, cf
cf=''
a=cadena
lc=len(alltrim(a))
if lc<1
	return ''
endif
for i=1 to lc
	if between(asc(substr(a,i,1)),48,57) or between(asc(substr(a,i,1)),97,122) or between(asc(substr(a,i,1)),65,90) or substr(a,i,1)=' ' or substr(a,i,1)='@' or substr(a,i,1)='.'
		cf=cf+substr(a,i,1)
	endif
endfor
return cf


function creadsn

DECLARE Short SQLConfigDataSource IN ODBCCP32 Long hwndParent, Integer fRequest, String @lpszDriver, String @lpszAttributes
# DEFINE ODBC_ADD_DSN 4 && Agrega un Data Sourceln

Resp = SQLConfigDataSource( 0, ODBC_ADD_DSN, "PostgreSQL", ;
		"DSN=" + "PostgreSQL" + CHR(0) + ;
		"Database=" + "empresas" + CHR(0) + ;
		"Servername=" + "localhost" + CHR(0) + ;
		"Port=" + "5432" + CHR(0) + ;
		"UID=" + "postgres" + CHR(0) + ;
		"PWD=" + "postgres" + CHR(0) + ;
		"Protocol=" + "6.4" + CHR(0) + ;
		"TrueIsMinus1=" + "0" + CHR(0) + ;
		"BoolsAsChar=" + "0" + CHR(0) + ;
		"A7=" + "100" + CHR(0) + ;
		"A8=" + "4096" + CHR(0) + ;
		"B0=" + "254" + CHR(0) + ;
		"B1=" + "8190" + CHR(0) + ;
		"BI=" + "0" + CHR(0) + ;
		"C2=" + "dd_" + CHR(0) + ;
		"CX=" + "1b3a3" + CHR(0)  )

return resp=1

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql
************************************************
function alup
para x
do case
	case isnull(x)
		return 'NULL'
	case type('x')='N'
		if int(x)=x then
			return alltrim(str(int(x)))
		else
			return alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return "'"+alltrim(bsto2bs(x))+"'"
	case type('x')='L'		
		if x then
			return "'true'"
		else
			return "'false'"
		endif
	case type('x')='D'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return "'"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'"
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return "'"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"'"
		endif
endcase	

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql, pero incluye la coma al final de la 
*	cadena
************************************************
function al
para x
do case
	case isnull(x)
		return ', NULL'
	case type('x')='N'
		if int(x)=x then
			return ', '+alltrim(str(int(x)))
		else
			return ', '+alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return ", '"+alltrim(bsto2bs(x))+"'"
	case type('x')='L'		
		if x then
			return ", 'true' "
		else
			return ", 'false' "
		endif
	case type('x')='D'		
		if empty(x) or isnull(x) then		
			return ', null'
		else
			return ", '"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'"
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return ', null'
		else
			return ", '"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"'"
		endif
endcase	

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql, pero incluye al principio un parentesis
************************************************
function pal
para x
do case
	case isnull(x)
		return '( NULL'
	case type('x')='N'
		if int(x)=x then
			return '('+alltrim(str(int(x)))
		else
			return '( '+alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return "('"+alltrim(bsto2bs(x))+"'"
	case type('x')='L'		
		if x then
			return "('true'"
		else
			return "('false'"
		endif
	case type('x')='D'		
		if empty(x) or isnull(x) then		
			return '(null'
		else
			return "('"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'"
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return '( null'
		else
			return "('"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"'"
		endif

endcase	

************************************************
*	Conversion de una variale a una cadena 
*	de caracteres para enviarlo en una sentencia
*	sql, pero incluye al final un parentesis
*	cadena
************************************************
function ual
para x
do case
	case isnull(x)
		return ', NULL );'
	case type('x')='N'
		if int(x)=x then
			return ', '+alltrim(str(int(x)))+');'
		else
			return ', '+alltrim(str(x,18,6))+');'
		endif
	case type('x')='C'		
		return ", '"+alltrim(bsto2bs(x))+"');"
	case type('x')='L'		
		if x then
			return ", 'true'"+');'
		else
			return ", 'false'"+');'
		endif
	case type('x')='D'		
		if empty(x) or isnull(x) then		
			return ', null)'
		else
			return ", '"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+"'); "
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return 'null);'
		else
			return "'"+alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)+"');"
		endif

endcase	


function achar
para x
do case
	case isnull(x)
		return 'NULL'
	case type('x')='N' or type('x')='Y'
		if int(x)=x then
			return alltrim(str(int(x)))
		else
			return alltrim(str(x,18,6))
		endif
	case type('x')='C'		
		return alltrim(x)
	case type('x')='L'		
		if x then
			return 'true'
		else
			return 'false'
		endif
	case type('x')='D'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))
		endif
	case type('x')='T'
		if empty(x) or isnull(x) then		
			return 'null'
		else
			return alltrim(str(year(x)))  + '-' + ;
			alltrim(str(month(x))) + '-' + ;
			alltrim(str(day(x)))+' '+time(x)
		endif
endcase	

******************************************************
*	Conversion de \ a \\ en una cadena de caractere
*	
******************************************************
function bsto2bs
para l
local i, j, a, b

j=len(alltrim(l)) 
if empty(l) then
	return l
endif
i=1
b=''
do while i<=j
	if substr(l,i,1)='\' then
		a=substr(l,1,i)+'\'
		b=substr(l,i+1,len(l))
		l=alltrim(a)+alltrim(b)
		i=i+1
		j=j+1
		if i=j then
			exit
		endif
	endif
	i=i+1
enddo
return l


******************************************************
*	Transformacion de fecha a letras
*	Formatos de Salida depende del parametro Tip:
*		Sin tip ==> dd de MMMMMMMMMMMMMM de YYYY
*		1 		==> DD de MMM de YYYY
*		2 		==> MMM-YYYY
*		3 		==> AAAAMMDD
*		4 		==> DD-MMM-YY
*		5 		==> DD-MMM-YYYY
*		6 		==> AAAA-MM-DD
******************************************************
function devfeclet
	parame pfechax, tip
	
	if empty(pfechax) or isnull(pfechax)
		return ''
	endif

	local mm, mms	
	mm=month(pfechax)
	mms=''
	do case
	case mm=1
		mms='Enero'
	case mm=2
		mms='Febrero'
	case mm=3
		mms='Marzo'
	case mm=4
		mms='Abril'
	case mm=5
		mms='Mayo'
	case mm=6
		mms='Junio'
	case mm=7
		mms='Julio'
	case mm=8
		mms='Agosto'
	case mm=9
		mms='Septiembre'
	case mm=10
		mms='Octubre'
	case mm=11
		mms='Noviembre'
	case mm=12
		mms='Diciembre'
	endcase
	if empty(tip) or isnull(tip) then	

		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+' de '+mms+iif(year(pfechax)>=2000,' del ',' de ')+;
				alltrim(str(year(pfechax)))

	endif
	do case 
	case tip=1 
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'-'+substr(mms,1,3)+'-'+alltrim(str(year(pfechax)))
	case tip=2
		return substr(mms,1,3)+'-'+alltrim(str(year(pfechax)))
	case tip=3
		return alltrim(str(year(pfechax)))+;
			   iif(month(pfechax)<10,'0','')+alltrim(str(month(pfechax)))+;
			   iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))
	case tip=4
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'-'+;
				substr(mms,1,3)+'-'+;
				alltrim(iif(mod(year(pfechax),100)<10,'0','')+alltrim(str(mod(year(pfechax),100))))
	case tip=5
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'-'+;
				substr(mms,1,3)+'-'+;
				alltrim(str(year(pfechax)))
	case tip=6
		return alltrim(str(year(pfechax)))+'-'+;
			   iif(month(pfechax)<10,'0','')+alltrim(str(month(pfechax)))+'-'+;
			   iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))
	case tip=7
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+'/'+;
				iif(month(pfechax)<10,'0','')+alltrim(str(month(pfechax)))+'/'+;
				alltrim(str(year(pfechax)))

	case tip=8
		return iif(day(pfechax)<10,'0','')+alltrim(str(day(pfechax)))+;
			   iif(month(pfechax)<10,'0','')+alltrim(str(month(pfechax)))+;
			   alltrim(str(year(pfechax)))

	endcase

******************************************************
*	Transformacion de fecha a formato DD-MMM-AA
******************************************************
function fecdma
	parame fecha
	local dia
	dia=day(fecha)
	frase=iif(dia<10,"0"+alltrim(str(dia)),alltrim(str(dia)))+'-'+;
	      substr(cmonth(fecha),1,3)+'-'+;
	      substr(alltrim(str(year(fecha))),3,2)
	return frase
	
******************************************************
*	Transformacion de fecha a formato DD-MMM-AAAA
******************************************************
function fecdmaa
	parame fecha
	local dia
	dia=day(fecha)
	frase=iif(dia<10,"0"+alltrim(str(dia)),alltrim(str(dia)))+'-'+;
	      substr(cmonth(fecha),1,3)+'-'+;
	      alltrim(str(year(fecha)))
	return frase

******************************************************
*	Codigo Contable en formato XX.XX.XX.XX.XXXX
******************************************************
function CCCPUNTO
	parame cuenta,auxiliar
	local g1, g2, g3, g4, g5, aux
	g1=" "
	g2=" "
	g3=" "
	g4=" "
	g5=" "
	aux=" "
	g1=alltrim(substr(cuenta,2,2))
	g2=alltrim(substr(cuenta,4,2))
	g3=alltrim(substr(cuenta,6,2))
	g4=alltrim(substr(cuenta,8,2))
	g5=alltrim(substr(cuenta,10,2))
	aux=alltrim(auxiliar)
	
	fraspc=g1
	if val(g2)!=0 then
		fraspc=fraspc+"."+g2
	endif
	if val(g3)!=0 then
		fraspc=fraspc+"."+g3
	endif
	if val(g4)!=0 then
		fraspc=fraspc+"."+g4
	endif
	if val(g5)!=0 then
		fraspc=fraspc+"."+g5
	endif
	if val(aux)!=0 then
		fraspc=fraspc+"."+aux
	endif
	return frase

******************************************************
*	Transformacion de Numeros a Letras
******************************************************
function devnumlet
	para numero	
	local num2, cnum, pos1, exp3, exp4, sw, sw1, digito, digant, digsig, digsi2, exp1
	num2=numero-int(numero)
	num2=num2*100
	cnum=alltrim(str(int(numero)))
	long=len(cnum)
	pos1=long
	exp3=" "
	do while pos1>0
	    sw=.f.
	    sw1=.f.
	    digito=substr(cnum,long-pos1+1,1)
	    if long-pos1> 0 then
	        digant=substr(cnum,long-pos1,1)
	    else 
	        digant="*"
	    endif
	    
		if pos1 > 1 then
			digsig=substr(cnum,long-pos1+2,1)
		else 
		    digsig="*"
		endif
		if pos1 > 2 then
			digsi2=substr(cnum,long-pos1+3,1)
	    else
	        digsi2="*"
	    endif
	    if digsig!="0" and (pos1=2 or pos1=5 or pos1=8) and digito!="1" and digito!='0' and digito!="2" then
			   exp2="y"
		else
			   exp2=" "
		endif
		do case
		   case digito="0"
		        exp1=""
		   case digito="1"
		   	    do case
		   	       case pos1=3 or pos1=6 or pos1=9
		   	            if (digsig="0") and (digsi2="0") then
		   	               sw1=.t.
		   	               exp1="cien"
		   	            else
		   	               exp1="ciento"
		   	            endif
		   	       case pos1=2 or pos1=5 or pos1=8
		   	            sw=.t.
		   	            do case
		   	               case digsig="0"
		   	                    exp1="diez"
		   	               case digsig="1"	
		   	                    exp1="once"
		   	               case digsig="2"	
		   	                    exp1="doce"
		   	               case digsig="3"	
		   	                    exp1="trece"
		   	               case digsig="4"	
		   	                    exp1="catorce"
		   	               case digsig="5"	
		   	                    exp1="quince"
		   	               case digsig="6"	
		   	                    exp1="dieciseis"
		   	               case digsig="7"	
		   	                    exp1="diecisiete"
		   	               case digsig="8"	
		   	                    exp1="dieciocho"
		   	               case digsig="9"	
		   	                    exp1="diecinueve"
		   	            endcase   
		   	       case pos1=1 or pos1=4 or pos1=7
		   	       		if pos1=1 then
		   	            	exp1="uno"
		   	            else
		   	            	if pos1=7 then
		   	            		exp1="un"
		   	            	else
		   	            		exp1=""
		   	            	endif
		   	            endif
		   	   endcase    
		   case digito="2"
		   	        do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="dos cientos"
		   	           case pos1=2 or pos1=5 or pos1=8 
		   	   *             exp1="veinte"
			   	            sw=.t.
			   	            do case
			   	               case digsig="0"
			   	                    exp1="veinte"
			   	               case digsig="1"	
			   	                    exp1="veintiuno"
			   	               case digsig="2"	
			   	                    exp1="veintidos"
			   	               case digsig="3"	
			   	                    exp1="veintitres"
			   	               case digsig="4"	
			   	                    exp1="veinticuatro"
			   	               case digsig="5"	
			   	                    exp1="veinticinco"
			   	               case digsig="6"	
			   	                    exp1="veintiseis"
			   	               case digsig="7"	
			   	                    exp1="vientisiete"
			   	               case digsig="8"	
			   	                    exp1="veintiocho"
			   	               case digsig="9"	
			   	                    exp1="veintinueve"
			   	            endcase   
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="dos"
		   	        endcase
		   case digito="3"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="tres cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="treinta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="tres"
		   	        endcase
		   case digito="4"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="cuatro cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="cuarenta "
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="cuatro"
		   	        endcase
		   case digito="5"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="quinientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="cincuenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="cinco"
		   	        endcase
		   case digito="6"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="seis cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="sesenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="seis"
		   	        endcase
		   case digito="7"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="setecientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="setenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="siete"
		   	        endcase
		   case digito="8"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="ocho cientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="ochenta"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="ocho"
		   	        endcase
		   case digito="9"    
			   	    do case
		   	           case pos1=3 or pos1=6 or pos1=9
    		   	       		if (digsig="0") and (digsi2="0") then
		   	               		sw1=.t.
		   	               	endif
		   	                exp1="novecientos"
		   	           case pos1=2 or pos1=5 or pos1=8
		   	                exp1="noventa"
		   	           case pos1=1 or pos1=4 or pos1=7
		   	                exp1="nueve"
		   	        endcase   
		endcase
		exp4=" "

		if pos1=7 and digant!="1" then
	   		exp4="millones"
		endif
		if pos1=8 or (pos1=9 and digsig="0" and digsi2="0") then
	   		exp4="millones"
		endif
		if pos1=7 and digito="1" then
		   exp4="millon"
		endif
		
		if ((pos1=5 and sw)  or (pos1=6 and digsig='0' and digsi2='0' and digito!='0') or ;
			(pos1=5 and digsig='0' and digito!='0') or (pos1=4 and digito!='0')) then
		   exp4="mil"
		endif
		       
		if sw then
		   pos1=pos1-2
		else
		   if sw1 then
		      pos1=pos1-3
		   else
		      pos1=pos1-1
		   endif
		endif
		if exp4!=" " then
			exp3=alltrim(exp3)+" "+alltrim(exp1)+" "+exp4+" "+exp2
		else
		    exp3=alltrim(exp3)+" "+alltrim(exp1)+" "+exp2
		endif
	enddo	  
	if num2>0 then
		exp3=alltrim(exp3)+", "+iif(num2<10,'0','')+alltrim(str(num2))+"/100"
	else
	    exp3=alltrim(exp3)+", "+"00/100"
	endif
    return exp3


***********************************************
* CONTROL DE ACCESO A UN PROGRAMA
***********************************************
function acceso
para keyprog
if !programas() then
	return .f.
endif
locate for idprograma=keyprog
if found() and estapro='1' then
	if !accesos() then
		return .f.
	endif
	locate for idprograma=keyprog and idusuario=ide
	if found() then
		return .t.	
	else
		return .f.
	endif
else
	wait 'Este programa está inactivo' wind nowait
	return .f.
endif

***********************************************
*	CONTROLA SI UN CAMPO ESTA VACIO
***********************************************
function isvacio
para x
if isnull(x) then
	return .t.
else
	if empty(x) then
		return .t.
	else
		return .f.
	endif
endif	

******************************************************
*	Determinar La lista de rubros
******************************************************
function lista 
para frasx
local l,swl,frase1,i
FRASx=ALLTRIM(FRASx)
L=LEN(ALLTRIM(FRASx))
SWL=.f.
FRASE1=''
FOR I=1 TO L 
	IF SUBSTR(FRASx,I,1)='[' THEN
			SWL=.t.
	ENDIF	
	IF SWL THEN
		FRASE1=FRASE1+SUBSTR(FRASx,I,1)
	ENDIF
	IF SUBSTR(FRASx,I,1)=']' THEN
			SWL=.f.
	ENDIF	
ENDFOR
FRASE1=CHRTRAN(FRASE1,']',',')
FRASE1=CHRTRAN(FRASE1,'[()./*+-','')
L=LEN(ALLTRIM(FRASE1))
IF SUBSTR(FRASE1,L,1)=',' THEN
	FRASE1=SUBSTR(FRASE1,1,L-1)
ENDIF
return FRASE1

******************************************************
*	Determinar la formula del rubro
******************************************************
function formula
para frse
local  l, frse1, i, c, frse2
FRSE=ALLTRIM(FRSE)
L=LEN(ALLTRIM(FRSE))
FRSE1=''
FOR I=1 TO L 
	c=SUBSTR(FRSE,I,1)
	IF c='[' THEN
		FRSE1 = FRSE1 + c + 'v'
	else 
		FRSE1 = FRSE1 + c
	ENDIF	
ENDFOR
L=LEN(ALLTRIM(FRSE1))
frse2=''
FOR I=1 TO L 
	c=SUBSTR(FRSE1,I,1)
	IF c!='[' and c!=']' THEN
		FRSE2 = FRSE2 + c
	ENDIF	
ENDFOR
return FRSE2

************************************************
*	Calculo de Rubros
************************************************
function calculorub
	para formu, area
	local k, m, campo, r
	k = lista(formu)
	m = formula(formu)
	

	select * from &area where rubcode in(&k) into cursor adj
	sele adj
	go top
	do while !eof() 
		campo='v'+alltrim(str(rubcode))
		&campo=valor
		skip
	enddo
	sele adj
	use
	if !empty(area) then
		select &area
	endif
	select &area
	r = 0
	r = iif(type(m)='U',0,&m)
	return r
		
**************************************	
* VALIDACIONDE LA CEDULA
**************************************	
function valcedu
para x
local c, prov, terd, t, i, j, u

	if empty(x) then
		wait 'Sin Cedula' wind nowait
		return .f.
	endif
	if type('x')='N' then
		if x=9999999999 then
			return .t.
		endif
		if len(alltrim(str(x)))<9 then
			wait 'Numero incompleto' wind  nowait
			return .f.
		else
			if len(alltrim(str(x)))=9 then
				c='0'+alltrim(str(x))
			else
				if len(alltrim(str(x)))=10 then
					c=alltrim(str(x))
				else
					wait 'Cedula errada' wind  nowait
					return .f.
				endif
			endif
		endif
	else
		if type('x')='C' then
			if x='9999999999' then
				return .t.
			endif
			c=alltrim(x)
		else
			wait 'Tipo incorrecto' wind nowait
			return .f.
		endif
	endif

**************************
* Codigo Provincia
**************************
	prov=val(substr(c,1,2))
	if prov<1 or prov>22 then
		return .f.
	endif
**************************
*   Tercer Digito
**************************
	terd=val(substr(c,3,1))
	if terd>5 then
		return .f.
	endif

**************************

	t=0
	for i=1 to 9 step 2
		d=substr(c,i,1)
		do case
			case d='1'
				t=t+2
			case d='2'
				t=t+4
			case d='3'
				t=t+6
			case d='4'
				t=t+8
			case d='5'
				t=t+1
			case d='6'
				t=t+3
			case d='7'
				t=t+5
			case d='8'
				t=t+7
			case d='9'
				t=t+9
		endcase
	endfor
	for i=2 to 8 step 2
		j=val(substr(c,i,1))
		t=t+j
	endfor
	u=val(substr(c,10,1))
	if (mod(t,10)+u)=10 or (mod(t,10)+u)=0 then
		return .t.
	else
		return .f.
	endif
		
**********************************
* Validacion del RUC
**********************************
function valruc
para pcedula

local suma, residuo, natural, juridica, publica, numprovincias, todocorrecto

Suma=0
Residuo=0
Natural=.f.
Juridica=.f.
Publica=.f.

NumProvincias = 22
todocorrecto="N"
    
    If Len(alltrim(Pcedula)) >= 10 Then
        c1 = val(substr(Pcedula, 1, 1))
        c2 = val(substr(Pcedula, 2, 1))
        c3 = val(substr(Pcedula, 3, 1))
        c4 = val(substr(Pcedula, 4, 1))
        c5 = val(substr(Pcedula, 5, 1))
        c6 = val(substr(Pcedula, 6, 1))
        c7 = val(substr(Pcedula, 7, 1))
        c8 = val(substr(Pcedula, 8, 1))
        c9 = val(substr(Pcedula, 9, 1))
        C10 =val(substr(Pcedula, 10, 1))
        
        do case 
            Case c3 < 6
                Natural = .t.
            Case c3 = 6
                Publica = .t.
            Case c3 = 9
                Juridica = .t.
        Endcase
            
        If Natural = .t. Then
            If val(substr(Pcedula, 1, 2)) > 0 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
                p1 = c1 * 2
                p2 = c2 * 1
                p3 = c3 * 2
                p4 = c4 * 1
                p5 = c5 * 2
                p6 = c6 * 1
                p7 = c7 * 2
                p8 = c8 * 1
                p9 = c9 * 2
                P10 = C10 * 1
                If p1 >= 10 Then
                     p1 = p1 - 9
                endif
                If p2 >= 10 Then
                     p2 = p2 - 9
                endif
                If p3 >= 10 Then
                     p3 = p3 - 9
                endif
                If p4 >= 10 Then
                     p4 = p4 - 9
                endif
                If p5 >= 10 Then
                     p5 = p5 - 9
                endif
                If p6 >= 10 Then
                     p6 = p6 - 9
                endif
                If p7 >= 10 Then
                     p7 = p7 - 9
                endif
                If p8 >= 10 Then
                     p8 = p8 - 9
                endif
                If p9 >= 10 Then
                     p9 = p9 - 9
                endif
                If P10 >= 10 Then
                     P10 = P10 - 9
                endif
                Suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + P10
                Residuo = mod(Suma,10)
            
                
                If Len(alltrim(Pcedula)) = 10 Then
                    If Residuo = 0 Then
						wait "La cedula es valida." wind nowait
                         Todocorrecto = "S"
                    Else
                         wait "La cedula no es valida." wind nowait
                         Todocorrecto = "N"
                    endif
                Else
	                If Len(alltrim(Pcedula)) > 10 Then
	                    If Residuo = 0 Then
	                         If val(substr(Pcedula, 11, 3)) = 1 And Len(substr(Pcedula, 11, 3)) = 3 Then
	                            If Len(alltrim(substr(Pcedula, 11, 3))) = Len(substr(Pcedula, 11, 3)) Then
	                                wait "El ruc es valido." wind nowait
	                                Todocorrecto = "S"
	                            Else
	                                wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                                Todocorrecto = "N"
	                            endif
	                         Else
	                             wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                            Todocorrecto = "N"
	                         endif
	                    Else
	                       * 'If val(substr(Pcedula, 11, 3)) = 1 And Len(substr(Pcedula, 11, 3)) = 3 And val(substr(Pcedula, 1, 2)) >= 1 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
	                       * 'OJO SE AUMENTA ESTA LÍNEA
	                        If Residuo = 0 Then
	                            If Len(alltrim(substr(Pcedula, 11, 3))) = Len(substr(Pcedula, 11, 3)) Then
	                                wait "El ruc es valido." wind nowait
	                                Todocorrecto = "S"
	                            Else
	                                wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                                Todocorrecto = "N"
	                            endif
	                         Else
	                            wait "Número de Ruc correspondiente a Persona Natural es incorrecta, por favor verificar" wind nowait
	                            Todocorrecto = "N"
	                         endif
	                    
	                    endif
 					endif               
                endif 
                
            Else
                Todocorrecto = "N"
                wait "Ruc de Persona Natural incorrecto, por favor verificar los digitos correspondientes a la Provincia" wind nowait
            endif
        endif 
        
        If Juridica = .t. Then
            If val(substr(Pcedula, 1, 2)) > 0 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
                If Len(alltrim(Pcedula)) = 13 Then
                    p1 = c1 * 4
                    p2 = c2 * 3
                    p3 = c3 * 2
                    p4 = c4 * 7
                    p5 = c5 * 6
                    p6 = c6 * 5
                    p7 = c7 * 4
                    p8 = c8 * 3
                    p9 = c9 * 2
                    Suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9
                    
                    ValDivision = Int(Suma / 11)
                    ValMultiplicacion = ValDivision * 11
                    VALRESTA = Suma - ValMultiplicacion 
                    
                    If VALRESTA = 0 Then
                        digitoverificador = 0
                    Else
                        digitoverificador = 11 - VALRESTA
                    endif
                 
                    If digitoverificador = C10 And val(substr(Pcedula, 11, 3)) = 1 Then
                       Todocorrecto = "S"
                       wait "Número de Ruc correcto" wind nowait
                    Else
                        Todocorrecto = "N"
                        wait "Número de Ruc correspondiente a Persona Jurídica es incorrecta, por favor verificar" wind nowait
                    endif
                endif
            Else
                Todocorrecto = "N"
                wait "Ruc de Persona Jurídica incorrecto, por favor verificar los digitos correspondientes a la Provincia" wind nowait 
            endif
        endif
        
        If Publica = .t. Then
            If val(substr(Pcedula, 1, 2)) > 0 And val(substr(Pcedula, 1, 2)) <= NumProvincias Then
                If Len(alltrim(Pcedula)) = 13 Then
                    p1 = c1 * 3
                    p2 = c2 * 2
                    p3 = c3 * 7
                    p4 = c4 * 6
                    p5 = c5 * 5
                    p6 = c6 * 4
                    p7 = c7 * 3
                    p8 = c8 * 2
                    Suma = p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8
                    ValDivision = Int(Suma / 11)
                    ValMultiplicacion = ValDivision * 11
                    VALRESTA = Suma - ValMultiplicacion
                    digitoverificador = 11 - VALRESTA
                    If c9 = digitoverificador And val(substr(Pcedula, 10, 4)) > 0 And val(substr(Pcedula, 11, 3)) = 1 Or VALRESTA = 0 Then
                       Todocorrecto = "S"
                    Else
                        wait "Número de Ruc correspondiente a Empresas del Sector Público es incorrecta, por favor verificar" wind nowait
                        
                        Todocorrecto = "N"
                    endif
                endif
            Else
                Todocorrecto = "N"
                wait "Ruc de Empresas del Sector Público incorrecto, por favor verificar los digitos correspondientes a la Provincia" wind nowait
            endif
        endif
    Else
        wait "Numero de Documento no válido." wind nowait
        Todocorrecto = "N"
    endif
	
***********************************************
*	Tipo de Letra a ser Utilizado
***********************************************
function tipolet
para f
local lon, u, i
	f=alltrim(f)
	lon=len(f)
	if lon > 0 then
		u=0
		for i=1 to lon
			if substr(f,i,1) = ',' then
				u=i-1
				exit
			endif
		endfor
		if u=0 then
			return f
		else
			return substr(f,1,u)
		endif
	else
		return 'Times New Roman'
	endif
		
***********************************************
*	Formato del codigo contable
***********************************************
function fcodcon
para c,n
local i, k, frcp
c=alltrim(c)
if isnull(c) then
	return .f.
endif
if empty(c) then
	return .f.
endif

k=val(alltrim(substr(c,1,2)))
if k=0 then
	return .f.
endif

frcp=alltrim(str(k))

if iif(!empty(n),n=2,.f.) and k=1 then
	frcp=frcp+alltrim(str(val(alltrim(substr(c,3,2)))))
else
	frcp=frcp+iif(val(alltrim(substr(c,3,2)))=0 ,' ',alltrim(str(val(alltrim(substr(c,3,2))))))
endif

for i=2 to 6
	k=val(alltrim(substr(c,i*2+1,2)))
	if k>0 then
		frcp=frcp+'.'+iif(k<10,'0'+alltrim(str(k)),alltrim(str(k)))
	else
		frcp=frcp+'  '
	endif
endfor
return frcp

***********************************************
*	Validacion de la fecha comprendida 
*	en el periodo contable
***********************************************
function valfec
para f
wait devfeclet(f) wind nowait
return f<=ffinp and f>=finip

***********************************************
*	Devolver la abreviacion de una frase
***********************************************
function abrevia
para f, d
local i, l, esw, fr, k, m, e
e=iif(empty(d) or isnull(d),4,d)
if type('f')!='C' then
	return ''
endif
i=1
l=len(alltrim(f))
esw=.t.
fr=''
do while i<l
	if esw then
		if i+e>l then
			k=(l-i)+1
		else
			for m=0 to e-1 
				if substr(f,i+m,1)=' ' or substr(f,i+m,1)='.' then
					exit
				endif
			endfor
			k=m
		endif
		fr=fr+substr(f,i,k)+' '
		i=i+k
		esw=.f.
	else
		i=i+1
	endif
	if substr(f,i,1)=' ' or substr(f,i,1)='.' then
		i=i+1
		esw=.t.
	endif
enddo
return fr

***********************************************
*	DIAS DEL MES
***********************************************
FUNCTION DIASMES
PARA NMESP,NAÑOP
IF NMESP=0 OR NMESP>12 THEN
	RETURN 0
ENDIF
IF NAÑOP<1993 OR NAÑOP>2019 THEN
	RETURN 0
ENDIF

DO CASE 
CASE NMESP=1 OR NMESP=3 OR NMESP=5 OR NMESP=7 OR NMESP=8 OR NMESP=10 OR NMESP=12
	RETURN 31
CASE NMESP=4 OR NMESP=6 OR NMESP=9 OR NMESP=11
	RETURN 30
CASE NAÑOP=1996 OR NAÑOP=2000 OR NAÑOP=2004 OR NAÑOP=2008 OR NAÑOP=2012 OR NAÑOP=2016
	RETURN 29
OTHER
	RETURN 28
ENDCASE
************************************************************************************
*	Devuelve un Nombre unico de 8 caracteres
************************************************************************************	
function nomunico
local eq
eq=''
eq=substr(sys(0),1,1)
if eq=' ' then
	eq=substr(sys(2015),6,4)
endif
return	alltrim(eq)+alltrim(substr(sys(2015),3,8))

***********************************************
*	MANEJO DE ERRORES EN LA PROGRAMACION
***********************************************
procedure manejo_err

x=1
=fintransq() && si se esta ejecuntando alguna transaccion, cancelarla.

merror	= ERROR( )
mess	= MESSAGE( )
mprog	= PROGRAM( )
mlineno	= LINENO( )

*? 'Número de línea del error: ' + mlineno
*? 'Programa con error: ' + mprog

=messagebox('Error : ' + mess,0,empresa)
do regerrbd
if type('_screen.activeform')#'U' then
	_screen.activeform.release
endif
if type('tbrdesktop')='O' and !isnull(tbrdesktop) then
	= tbrDesktop.cancelar1.click()
endif

***********************************************
*	REGISTRO DE ERRORES ODBC
***********************************************
procedure regerrbd
local cm
if used('errorbd') then
	sele errorbd
else
	sele 0
	use errorbd  share
endif
appen blank
e=sys(2018)
replace user with usuario
replace fecha   with datetime()
replace comandosql 	with iif(empty(e),MESSAGE( ),e)
replace ws	with equipo
replace q2 	with substr(q1,1,200)
replace q3 	with substr(q1,201,400)
replace q4 	with substr(q1,401,600)
replace q5 	with substr(q1,601,800)
replace progmaes with sys(16,1)
return

***********************************************
*	Borra registros duplicados en una tabla 
*	temporal, recibe como parametro:
*	- Nombre de la tabla
*	- Nombre del campo a verificarse
***********************************************
procedure borreg
parame nt, kt
local p, cod, fe, numrub, nomt, keyt, f

nomt=nt
keyt=kt
numrub=0
f=nomt+'.'+keyt

if &f#0 then
	_screen.activeform.grid1.recordsource=''
	sele &nomt

	cod=&f
	f=f+"=cod"
	count for &f to numrub

	if numrub>1 then
		go top
		f=keyt+'=cod'
		locate for &f
		_screen.activeform.gridremoveitem()
	endif
	
	sele &nomt
	go top
	locate for &f
	if !found() then
		go bott
	endif
	_screen.activeform.grid1.recordsource=nomt
endif
_screen.activeform.grid1.DoScroll(0)
_screen.activeform.grid1.refresh()
return

***********************************************
*	Procedimiento q no hace nada
***********************************************
procedure nada
return

***********************************************
*	Define algunas configuraciones del entorno
***********************************************
procedure ambiente
SET DATE TO DMY
SET CENTURY ON
SET SAFE OFF
set exclu off
set talk off
set dele on
set point to '.'
set separator to ',' 
set decimal to 8
SET COMPATIBLE OFF

***********************************************
*	Funcion q devuelve un numero rellenados con
*	ceros a la izquierda, recibe dos parametros
*	- La longuitud de la expresion q veduelve
*	- El numero q va a ser rellenado con ceros
*	La expresion devuelta es de tipo character
***********************************************
Function Nconcero
para l, nxf
local n
if empty(nxf) or isnull(nxf) then
	n=0
endif
do case 
case type('nxf')='C'
	n=int(val(nxf))
case type('nxf')='N' 
	n=nxf
case type('nxf')='D' 
	n=day(nxf)*1000000+month(nxf)*10000+year(nxf)
other 
	n=0
endcase


return padl(ltrim(str(n)),l,'0') && substr(repli('0',l),1,l-len(alltrim(str(n,20))))+alltrim(str(n,20))

*****************************************************************************************
*	Formar el Numero del Documento 
*****************************************************************************************
function fnumdoc
para n,f,t
do case
case t=1
	return nconcero(7,n)
case t=2
	return alltrim(str(year(f))) + '-'+ nconcero(5,n)
case t=3 
	return iif(mod(year(f),100)<10,'0','') + alltrim(str(mod(year(f),100))) + iif(month(f)<10,'0','') + alltrim(str(month(f))) + '-' + nconcero(5,n)
other
	return nconcero(7,n)
endcase

*****************************************************************************************
*	Ver los errores ocurridos
*****************************************************************************************
procedure verror
if used('errorbd') then
	sele errorbd
else
	sele 0
	use errorbd
endif

set filter to
set filter to ttod(fecha)=date()
=ireport('errorbd')

*****************************************************************************************
*	Impresion de reportes
*	Parametros:
*		xrep => Nompre del reporte
*		xres => Resumen? (.t.)
*****************************************************************************************
function ireport

parameter pxrep, pxres, palias, pdocu

if printofil 
	do form reportefrx WITH pxrep, pxres, palias
else
	local i, d, r
	i=0
	d=0

	if empty(pxrep) then
		return .f.
	endif

	if type('pxres')#'L' then
		pxres=.f.
	endif

	if reccount()=0 then
		wait 'No existen Registros' wind nowait
		return .t.
	endif

	if pxres then
		r='summary'
	else
		r=''
	endif
	
	if pdocu and !confimp
		if !empty(impresora) and !isnull(impresora)
			SET PRINTER TO NAME alltrim(impresora)
			report form &pxrep nowait to printer nocons &r
			set printer to default
		else
			report form &pxrep nowait to printer promp nocons &r
		endif
	else
		do while i<>6
			d=messagebox('Lo Envia a Pantalla?',35,empresa)
			do case
			case d=6
				wait 'Espere un momento...' wind nowait
				report form &pxrep preview nocons &r
			case d=7
				wait 'Espere un momento...' wind nowait
				report form &pxrep nowait to printer prompt nocons &r
			endcase
			if d=2 then
				i=6
			else
				i=messagebox('Imprimió correctamente',36)
			endif
		enddo
	endif
endif

***********************************************************************************
*	Encriptacion
***********************************************************************************
function conversion
para f
na=rand()*100-1
c3=iif(na<10,'0','')+ALLTRIM(str(na))+alltrim(str(mod(mod(mod(DAY(F),30),20),10)))
nd=mod(mod(mod(mod(DAY(F),30),20),10),2)
IF nd=1 THEN
	aa=alltrim(str(year(f)))
	mm=iif(month(f)<10,'0','') + alltrim(str(month(f)))
	dd=iif(day(f)<10,'0','') + alltrim(str(day(f)))
	l=aa+mm+dd
	RETURN c3+chrtran(l,'1234567890','DANIEL.XYZ')
ELSE
	aa=alltrim(str(year(f)))
	mm=iif(month(f)<10,'0','') + alltrim(str(month(f)))
	dd=iif(day(f)<10,'0','') + alltrim(str(day(f)))
	l=mm+dd+aa
	RETURN c3+chrtran(l,'1234567890','PARDO.TUVW')
ENDIF

***********************************************************************************
*	Desifrado de Enpcriptacion
***********************************************************************************
function reversion
para j
nd=int(val(substr(j,3,1)))
IF MOD(nd,2)=1 THEN
	m=chrtran(substr(J,4,8),'DANIEL.XYZ','1234567890')
	aa=int(val(substr(m,1,4)))
	mm=int(val(substr(m,5,2)))
	dd=int(val(substr(m,7,2)))
else
	m=chrtran(substr(J,4,8),'PARDO.TUVW','1234567890')
	mm=int(val(substr(m,1,2)))
	dd=int(val(substr(m,3,2)))
	aa=int(val(substr(m,5,4)))
endif
return date(aa,mm,dd)

***********************************************************************************
*	Verificar Licencia
***********************************************************************************
function verilicen
para fl, c

return .t.

IF !FILE('licen.dbf')
	=messagebox('Su liencia a expirado, por favor contacte al proveedor',0)
	return .f.
ENDIF

if !used('licen') then
	sele 0
	use licen
endif
sele licen
if reccount()=0 then
	=messagebox('Su liencia a expirado, por favor contacte al preveedor',0)
	return .f.
endif

SELE MAX(REVERSION(dato)) AS FC FROM licen INTO CURSOR ULTF

IF FC<fl THEN
	=messagebox('Su liencia a expirado, por favor contacte al preveedor',0)
	return .f.
ENDIF

SELE ULTF
USE
SELE LICEN
USE
return .t.

*****************************************************************************************
*	Rellenar los valores del debe y el haber, un parametro opcional, como para saldo
*	Parametro el nombre de la tabla que se requiere rellenar, devuelve el nombre del 
*	cursor, con los campos rellenados
*****************************************************************************************
function rellenadh
para t, c1, c2, c3
local m, n, ct1, ct2, ct3, na, nx

m=nomunico()
n=nomunico()
o=nomunico()
if empty(t) or isnull(t) or empty(c1) or isnull(c1) or empty(c2) or isnull(c2) then
	wait 'No existen nombre de tabla o campos que acumular' wind nowait
	return .f.
endif

if !used(t) then
	return .f.
endif
sele &t
if reccount()=0 then
	return .f.
endif
sele * from &t ;
	into table &m ;
	order by plannivel desc
 
sw=.t.
sele max(plannivel) as nivel from &t into cursor tx
sele tx
if reccount()=0
	use
	return .f.
else
	nx=nivel
	use
endif
sele &m
go top
p=recno()
na=plannivel
do while !eof()
	if isnull(idaux) then
		sele &m
		cp=alltrim(plancod)
		if empty(c3) or isnull(c3) then
			sele sum(&c1) as &c1, sum(&c2) as &c2 ;
				from &m ;
				where plannivel=na+1 and like(cp+'*',plancod) ;
				into cursor  &n
			sele &n

			ct1=&c1
			ct2=&c2

			sele &m
			go top
			go p
			replace &c1 with iif(isnull(ct1),0,ct1)
			replace &c2 with iif(isnull(ct2),0,ct2)
		else
			sele sum(&c1) as &c1, sum(&c2) as &c2, sum(&c3) as &c3 ;
				from &m ;
				where plannivel=na+1 and like(cp+'*',plancod) ;
				into cursor  &n
			sele &n

			ct1=&c1
			ct2=&c2
			ct3=&c3

			sele &m
			go top
			go p
			replace &c1 with iif(isnull(ct1),0,ct1)
			replace &c2 with iif(isnull(ct2),0,ct2)
			replace &c3 with iif(isnull(ct3),0,ct3)
	
		endif
	else
		if isnull(&c1) then
			replace &c1 with 0
		endif
		if isnull(&c2) then
			replace &c2 with 0
		endif
		if !(empty(c3) or isnull(c3)) then
			if isnull(&c3) then
				replace &c3 with 0
			endif
		endif
	endif
	sele &m
	skip
	p=recno()
	na=plannivel
enddo

sele &n
use
sele * from &m order by plancod into cursor &o
sele &m
use

return o

function swadmin
local a
a=.f.
do form claveadm to a
return a

**********************************************************************

function diastrab
para fech, feci, fecs
local i, f, a

if empty(fecs) or isnull(fecs)
	fecs=fech
endif

if (fech=date(2008,02,29) and feci=date(2008,02,01)) or (fech=date(2012,02,29) and feci=date(2012,02,01))
	return 30
endif

if (feci<=fech - DAY(fech )+ 1) and (isnull(fecs) or empty(fecs)) 
	return 30
endif


if fecs<feci
	return 0
endif
if fecs=feci
	return 1
endif

if feci>fech-DAY(fech )+ 1
	i=feci
else
	i=fech - DAY(fech )+ 1

endif

if fecs< GOMONTH((fech - DAY(fech ) + 1),1)
	f=fecs
else
	f=GOMONTH((fech - DAY(fech ) + 1),1)
endif

a=0

do case
case month(fech)=2
	a=3
case month(fech)=3 or month(fech)=4 or month(fech)=6 or month(fech)=9 or month(fech)=11
	a=1
case month(fech)=1 or month(fech)=5 or month(fech)=7 or month(fech)=8 or month(fech)=10 or month(fech)=12
	a=0
endcase

if fecs<GOMONTH((fech - DAY(fech ) + 1),1)-1
	a=1
endif
	
return iif(f-i+a=0,1,iif(f-i+a=31,30,f-i+a))

***************************************************************************************
function abreviacta
para nomcta

nomctares=nomcta

nomctares=STRTRAN(nomctares, ' POR ', ' X ')
nomctares=STRTRAN(nomctares, ' DE ', ' ')
nomctares=STRTRAN(nomctares, 'CUENTA ', 'CTA ')
nomctares=STRTRAN(nomctares, 'CUENTAS ', 'CTAS ')
nomctares=STRTRAN(nomctares, 'DOCUMENTO', 'DOC')
nomctares=STRTRAN(nomctares, 'DESCUENTO', 'DSCTO')
nomctares=STRTRAN(nomctares, 'CONSIGNACION', 'CONSIG')
nomctares=STRTRAN(nomctares, 'PENDIENTE', 'PENDTE')
nomctares=STRTRAN(nomctares, 'CHEQUE', 'CHQ')
nomctares=STRTRAN(nomctares, 'IMPUESTO ', 'IMP ')
nomctares=STRTRAN(nomctares, 'RETENCION ', 'RET ')
nomctares=STRTRAN(nomctares, 'FUENTE ', 'FTE ')
nomctares=STRTRAN(nomctares, 'GASTOS ', 'GTOS ')
return nomctares

Function RestarHoras
Parameter chora1,chora2
m.hora1 = SUBSTR(chora1,1,2)+":"+SUBSTR(chora1,3,2)
m.hora2 = SUBSTR(chora2,1,2)+":"+SUBSTR(chora2,3,2)

Horas1 = Val(Substr(m.hora1,1,2)) * 60
Minutos1 = Val(Substr(m.hora1,4,2)) * 60
Segundos1 = Val(Substr(m.hora1,7,2)) * 60
Horas2 = Val(Substr(m.hora2,1,2)) * 60
Minutos2 = Val(Substr(m.hora2,4,2)) * 60
Segundos2 = Val(Substr(m.hora2,7,2)) * 60
Horas3 = (Horas1 - Horas2)/60
Minutos3 = (Minutos1 - Minutos2)/60
Segundos3 = (Segundos1 - Segundos2)/60
If Segundos3 < 0
	Minutos3 = Minutos3 - 1
	Segundos3 = Segundos3 + 60
Endif
If Minutos3 < 0
	Horas3 = Horas3 - 1
	Minutos3 = Minutos3 + 60
Endif
If Horas3 < 0
	Horas3 = 0
Endif
m.HoraFin = Padl(Alltrim(Str(Horas3)),2,'0') + ':' + ;
		PADL(Alltrim(Str(Minutos3)),2,'0') + ':' + ;
		PADL(Alltrim(Str(Segundos3)),2,'0')
Return m.HoraFin
 
*********************************************************************************
* =HorasNumeros(4.25)
* Retorna ... ('04:15:00')
Function NumeroHoras
Parameter pNumero
pNumero = Round((pNumero/100),2)
Entero = Int(pNumero)
Decimales = ((60*(pNumero - Int(pNumero))* 100))/100
m.HoraFin = Padl(Alltrim(Str(Entero)),2,'0') + ':' + ;
 			PADL(Alltrim(Str(Decimales)),2,'0') + ':00'
Return m.HoraFin

*********************************************************************************
* =HorasNumeros('04:15:00')
* Retorna ... (4.25)
Function HorasNumeros
Parameter pHora
m.HoraFin = (Val(Substr(pHora,1,2)) + (Val(Substr(pHora,4,2))/60))*100
Return m.HoraFin
****

FUNCTION dhora
PARAMETERS hmayor, hmenor

RETURN PADL(ALLTRIM(STR(INT((CTOT(hmayor)-CTOT(hmenor))/3600))),2,"0") + ":" + PADL(ALLTRIM(STR(INT((CTOT(hmayor)-CTOT(hmenor))%3600)/60)),2,"0")
*

**********************************************************************
*!*  Funcion que permite determinar la suma de 2 Horas con intervalo de tiempo
*!*	    chorae = "09:05:00"
*!*	    cHoraSC= "13:05:00"
*!*	    cHoraEC= "13:30:00"
*!*	    CHORAS = "17:30:00"
*!*	    clear
*!*	    ? suma_Horas( ctot( choraE ),ctot(cHoraSC),ctot( cHoraEC) , ctot( choraS ) )
* Kleine
**********************************************************************

Function Suma_Horas( _dtE,_dtSC,_dtEC,_dtS )
    nRet = ""
    Store 0 to H1, H2, H3, H4, M1, M2, M3, M4
    
    If !ISNULL( _dtE )
	    H1 = hour( _dtE )
	    M1 = Minute( _dtE )
    EndIf
    If !ISNULL( _dtSC )
	    H2 = hour( _dtSC )
	    M2 = Minute( _dtSC )
    EndIf
    If !ISNULL( _dtEC )
	    H3 = hour( _dtEC )
	    M3 = Minute( _dtEC )
    EndIf
    If !ISNULL( _dtS )
	    H4 = hour( _dtS )
	    M4 = Minute( _dtS )
    EndIf
    
	nH1 = 0 && horas del primer tiempo
    nM1 = 0 && minutos del primer tiempo
    nH2 = 0 && Horas despues de comer
    nM2 = 0 &&' Minutos despues de comer
    
    If h1>0 and H2>0 and h3>0 and h4>0 && se trata de un horario con comida
	    If M2 - M1 >= 0 && '' hora cubierta
	    	nH1 = H2 - H1
	      	nM1 = ABS( M2 - M1 )
	    Else
	    	nH1 = H2 - H1 - 1
	      	If M2 <> M1
	       		nM1 = 60 - ABS( M1 - M2  )
	      	Else
	       		nM1=0
	      	EndIf
	    EndIf
		 **AHORA CON EL SEGUDNO HORARIO nM2, nH2
	   	If M4 - M3 >= 0 &&HORA CUBIERTA
		    nH2 = H4-H3
		    nM2 = ABS( M4 - M3 ) 
	    Else
		    nH2 = H4 - H3 - 1
		    If M4 <> M3
			    nM2 = 60- ABS( M4 - M3 )
		    Else
			    nM2 = 0
		    EndIf
	    EndIf
    EndIf
    
    If ( H1> 0 .AND. H2 = 0 .AND. H4> 0 )  &&no tiene comida 
	    *? "ENTRO3"
	    If M4 - M1 >= 0 && ES HORA CUMPLIDA
		    nH1 = H4 - H1
		    nM1 = ABS( M4 - M1 )
	    Else  && NO ES HORA CUMPLIDA, DEPENDE DE LOS MIN AVANSADOS.
		    nH1 = H4 - H1 - 1
		    If M1 <> M4
	    		nM1 = 60 - ABS( M1 - M4 )
		    Else
			    nM1 = 0
		    EndIf
	    EndIf
    EndIf   
    *!* ? nh1
    *!* ? nm1
    *!* ? nh2
    *!* ? nm2
    
    If nH2>0 and nH1>0 && SE SUMAN LAS DOS HORAS PROCESADAS,  CON Y SIN COMIDA
    *? "ENTRO AMBAS"
		nH1 = nH1 + nH2
     	If nM2 + nM1 >= 60 && SE COMPLETO LA OTRA HORA
			nH1 = nH1 + 1
		    nM1 = ABS( 60 - ( nM1 + nM2 ) )
		Else
      		nM1 = abs(nM2 - nM1)
     	EndIf
    EndIf
    *? "Horas = " + str( nH1 ) + " Min = " + str( nM1 )
    If nM1 >= 45
    	nH1 = nH1 +1
    EndIf  
   	nM1 = 0
    cValor = str( nH1,2) + "." + str( nM1,2 )
    nRet = val( cValor )
    RETURN nRet

*********************************************************************************
* =sumarhoras('01:15:02', '01:15:02')
* Retorna ... ('02:30:04')
Function sumarhoras
Parameter chora1,chora2
nhoras = 0
nmin = 0
nseg = Val(Substr(chora1,7,2)) + Val(Substr(chora2,7,2))
Do While nseg >= 60
	nmin = nmin + 1
	nseg = nseg - 60
Enddo
nmin = nmin + Val(Substr(chora1,4,2)) + Val(Substr(chora2,4,2))
Do While nmin >= 60
	nhoras = nhoras + 1
	nmin = nmin - 60
Enddo
nhoras = nhoras + Val(Substr(chora1,1,2)) + Val(Substr(chora2,1,2))
m.HoraFin = Padl(Ltrim(Str(nhoras)),2,'0')+ ':' + ;
	Padl(Ltrim(Str(nmin)),2,'0')+ ':' + ;
	Padl(Ltrim(Str(nseg)),2,'0')
Return m.HoraFin

*------------------------------------------------------
* FUNCTION _StrTo128C(tcString) * CODIGO 128C
*------------------------------------------------------
* Convierte un string para ser impreso con
* fuente True Type "PF Barcode 128"
* Solo caracteres numéricos
* USO: _StrTo128C('1234567890')
* RETORNA: Caracter
*------------------------------------------------------
FUNCTION _StrTo128C(tcString)
  LOCAL lcStart, lcStop, lcRet, lcCheck, lcCar, ;
    lnLong, lnI, lnCheckSum, lnAsc
  lcStart = CHR(105 + 32)
  lcStop = CHR(106 + 32)
  lnCheckSum = ASC(lcStart) - 32
  lcRet = ALLTRIM(tcString)
  lnLong = LEN(lcRet)
  *--- La longitud debe ser par
  IF MOD(lnLong,2) # 0
    lcRet = '0' + lcRet
    lnLong = LEN(lcRet)
  ENDIF
  *--- Convierto los pares a caracteres
  lcCar = ''
  FOR lnI = 1 TO lnLong STEP 2
    lcCar = lcCar + CHR(VAL(SUBS(lcRet,lnI,2)) + 32)
  ENDFOR
  lcRet = lcCar
  lnLong = LEN(lcRet)
  FOR lnI = 1 TO lnLong
    lnAsc = ASC(SUBS(lcRet,lnI,1)) - 32
    lnCheckSum = lnCheckSum + (lnAsc * lnI)
  ENDFOR
  lcCheck = CHR(MOD(lnCheckSum,103) + 32)
  lcRet = lcStart + lcRet + lcCheck + lcStop
  *--- Esto es para cambiar los espacios y caracteres invalidos
  lcRet = STRTRAN(lcRet,CHR(32),CHR(232))
  lcRet = STRTRAN(lcRet,CHR(127),CHR(192))
  lcRet = STRTRAN(lcRet,CHR(128),CHR(193))
  RETURN lcRet
ENDFUNC

*********************************************************************************
* 
*********************************************************************************
function numtxt
para nin, lon
local l
l=len(alltrim(str(nin,14,2)))
nt=iif(l>6,substr(alltrim(str(nin,14,2)),1,l-6)+','+substr(alltrim(str(nin,14,2)),l-5,l),alltrim(str(nin,14,2)))
if empty(lon) or isnull(lon)
	return nt
else
	return iif(len(nt)<lon,replicate(' ',lon-len(nt))+nt,nt)	
endif

*********************************************************************************
* 	impresion de autoimpresores con autorizacion
*********************************************************************************
procedure ticket

local fila, arch, ni, columnas, ndoc, lnfile, fi

columnas=40

set echo off
set talk off

arch=alltrim(nomunico())+'.txt'

lnFile=FCreate(arch)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(arch)
	If lnFile<0
		Messagebox("Error al Crear Archivo de impresion "+chr(13)+cFILE,0,empresa)
		Return(.f.)
	EndIf	
EndIf

if used('documents')
	sele documents
	go top
else
	return
endif

fila=2
ni=0

do case
case like('*FACTURA*',nomdoc)
	ndoc='FACTURA'
case like('*NOTA DE VENTA*',nomdoc)
	ndoc='NOTA DE VENTA'
other
	ndoc=nomdoc
endcase	
*fputs(lnFile,'No Factura: _______ T. Pagar:________ ')
fputs(lnFile,' ')
*fputs(lnFile,space((columnas-len(alltrim(achar(empresa))))/2)+achar(empresa))
fputs(lnFile,space((columnas-len(alltrim(achar(empresa2))))/2)+achar(empresa2))
fputs(lnFile,space((columnas-len(alltrim(achar(diremp))))/2)+achar(diremp))
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim(achar("NOTA DE PEDIDO y DESPACHO"))))/2)+achar("NOTA DE PEDIDO y DESPACHO"))
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim(ndoc)))/2)+alltrim(ndoc))
fputs(lnFile,'Cod. Trans: '+nconcero(6,code))
*fputs(lnFile,'  Cliente: CONSUMIDOR FINAL')
fputs(lnFile,'Cliente:   '+substr(Alltrim(sname),1,22))
fputs(lnFile,'Direccion: '+substr(Alltrim(saddr),1,22))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'FECHA:      '+substr(achar(fecgra),1,len(achar(fecgra))-6))
fputs(lnFile,'VENDEDOR:   '+substr(VENDEDOR,1,22))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'CANT   UNI      UNITARIO      VALOR   ')
fputs(lnFile,'--------------------------------------')

do while !eof()
	fputs(lnFile,str(icode,7,0)+' '+substr(iname,1,38)+'  '+str(qty,6,2)+' '+substr(unidad,1,1)+;
			' '+STR(iif(isiva,round(punitario*(1+iva/100),6),round(punitario,6)),10,4)+;
			' '+numtxt(iif(isiva,round(punitario*qty*(1+iva/100),2),round(punitario*qty,2)),10)+;
			' '+iif(isiva,'*',''))
	ni=ni+1
	skip
enddo
go top

fputs(lnFile,'--------------------------------------')
fputs(lnFile,'# Items: '+str(ni,3))
fputs(lnFile,'DESCUENTO: '+numtxt(descuconiva+descusiniva,8))
fputs(lnFile,'TOTAL: '+numtxt(montototal,8))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,' '+alltrim(fc1))
fputs(lnFile,' '+alltrim(fc2))
fputs(lnFile,' '+alltrim(fc3))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim('**GRACIAS POR SU COMPRA**')))/2)+'**GRACIAS POR SU COMPRA**')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')

fClose(lnFile)

* fi='type '+sys(2003)+'\'+arch+' >prn'
fi='type '+sys(2003)+'\'+arch+' > lpt3'

! &fi

fi=sys(2003)+'\'+arch
delete file &fi
****
*********************************************************************************
* 	impresion de tabla de amortizacion
*********************************************************************************
procedure tablamort

local fila, arch, ni, columnas, ndoc, lnfile, fi, tota

total=0
columnas=40

set echo off
set talk off

arch=alltrim(nomunico())+'.txt'

lnFile=FCreate(arch)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(arch)
	If lnFile<0
		Messagebox("Error al Crear Archivo de impresion "+chr(13)+cFILE,0,empresa)
		Return(.f.)
	EndIf	
EndIf


fila=2
ni=0

fputs(lnFile,space((columnas-len(alltrim(achar("BAZAR Y JOYERIA QUEZADA HNOS."))))/2)+achar(empresa))
fputs(lnFile,space((columnas-len(alltrim(achar("DETALLE DE PAGOS"))))/2)+;
		achar("DETALLE DE PAGOS"))
fputs(lnFile,' ')
fputs(lnFile,'Cod.Factura: '+nconcero(6,codeo))
fputs(lnFile,'FECHA:       '+fecha)
fputs(lnFile,'Cliente:     '+substr(Alltrim(sname),1,22))
*fputs(lnFile,'Empresa:     '+substr(Alltrim(principal),1,22))
fputs(lnFile,'# cuotas:    '+str(numcuota,2))
fputs(lnFile,' ')
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'#   Codigo   fec. Venc.       VALOR   ')
fputs(lnFile,'--------------------------------------')
do while !eof()
	ni=ni+1
	fputs(lnFile,nconcero(2,ni)+' '+nconcero(7,code)+'  '+devfeclet(fechav,5)+' '+STR(valor,10,2))
	total=total+valor
	skip
enddo
go top

fputs(lnFile,'--------------------------------------')
fputs(lnFile,'                 TOTAL: '+numtxt(total,10))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim('**GRACIAS POR SU COMPRA**')))/2)+'**GRACIAS POR SU COMPRA**')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')

fClose(lnFile)

* fi='type '+sys(2003)+'\'+arch+' >prn'
fi='type '+sys(2003)+'\'+arch+' > lpt3'

! &fi

fi=sys(2003)+'\'+arch
delete file &fi

**********************************************************************************
* FUNCTION GetFileX(tcRuta, tcExtension, tcLeyenda, tcBoton, tnBoton, tcTitulo)
********************************************************************************
* Función GetFile eXtendida. Al igual que la función GetFile muestra un cuadro
* de diálogo Abrir y retorna el nombre del archivo seleccionado. Si no se
* selecciona ningun archivo retorna una cadena vacia. La diferencia con
* GetFile() es que se puede especificar con el primer parámetro la carpeta
* donde se abre el cuadro de dialogo.
*
* RETORNA:
*   Caracter
* PARAMETROS:
*   tcRuta: Ruta inicial
*   tcExtension: Extension de los archivos que se muestran
*   tcLeyenda: Título del cuadro de texto "Nombre de archivo"
*   tcBoton: Título del botón "Aceptar"
*   tnBoton: Tipo y número de botones [0, 1 ó 2]
*   tcTitulo: Título de la ventana Abrir
* USO:
*   ? GetFileX("C:\Dat\","DBF","Nombre tabla:", "Abrir tabla", 0, "Busca tabla")
*-- Ejemplo de GetFileX()
*!*	? GetFileX()
*!*	? GetFileX(HOME(1)+ "Tools\GenDBC\","PRG")
*!*	? GetFileX("C:\Datos\","DBF","Nombre tabla:", "Abrir tabla", 0, "Busca tabla")
********************************************************************************
FUNCTION GetFileX(tcRuta, tcExtension, tcLeyenda, tcBoton, tnBoton, tcTitulo)
  LOCAL lcDirAnt, lcGetPict
  * IIF(!EMPTY(tcRuta) and DIRECTORY(tcRuta,1)), tcRuta, "")
  tcRuta = IIF(!EMPTY(tcRuta), tcRuta, "")
  tcExtension = IIF(EMPTY(tcExtension), "", tcExtension)
  tcLeyenda = IIF(EMPTY(tcLeyenda), "", tcLeyenda)
  tcBoton = IIF(EMPTY(tcBoton), "", tcBoton)
  tnBoton = IIF(EMPTY(tnBoton), 0, tnBoton)
  tcTitulo = IIF(EMPTY(tcTitulo), "", tcTitulo)
  lcDirAnt = FULLPATH("")
  SET DEFAULT TO (tcRuta)
  lcGetPict = GETFILE(tcExtension, tcLeyenda, tcBoton, tnBoton, tcTitulo)
  SET DEFAULT TO (lcDirAnt)
  RETURN lcGetPict
ENDFUNC

********************************************************************************
* FUNCTION GetPictX(tcRuta, tcExtension, tcLeyenda, tcBoton)
********************************************************************************
* Función GetPict eXtendida. Al igual que la función GetPict muestra un cuadro
* de diálogo Abrir imagen y retorna el nombre del archivo de imagen
* seleccionado. Si no se selecciona ningun archivo retorna una cadena vacia.
* La diferencia con GetPict() es que se puede especificar con el primer
* parámetro la carpeta donde se abre el cuadro de dialogo.
*
* RETORNA:
*   Caracter
* PARAMETROS:
*   tcRuta: Ruta inicial
*   tcExtension: Extension de los archivos de imagen que se muestra
*   tcLeyenda: Título del cuadro de texto "Nombre de archivo"
*   tcBoton:  Título del botón "Aceptar"
* USO:
*   ? GetPictX("C:\Imagenes\","JPG","Foto:", "Abrir foto")
*!*	*-- Ejemplo de GetPictX()
*!*	? GetPictX()
*!*	? GetPictX(HOME(2) + "Solution", "BMP")
*!*	? GetPictX("C:\Fotografias\","","Foto:", "Abrir foto")
********************************************************************************
FUNCTION GetPictX(tcRuta, tcExtension, tcLeyenda, tcBoton)
  LOCAL lcDirAnt, lcGetPict
  tcRuta = IIF(NOT EMPTY(tcRuta), tcRuta, "")
  tcExtension = IIF(EMPTY(tcExtension), "", tcExtension)
  tcLeyenda = IIF(EMPTY(tcLeyenda), "", tcLeyenda)
  tcBoton = IIF(EMPTY(tcBoton), "", tcBoton)
  lcDirAnt = FULLPATH("")
  SET DEFAULT TO (tcRuta)
  lcGetPict = GETPICT(tcExtension, tcLeyenda, tcBoton)
  SET DEFAULT TO (lcDirAnt)
  RETURN lcGetPict
ENDFUNC

********************************************************************************
* Funcion devuelve si es un Sujeto es Socio Registrado en el SISCON
******************************************************************************
FUNCTION isSujetoSocio(idsjto)
Local idsjto1
q1="Select idsujeto from sujetos where issocio "
If !sqli(q1,"") then
	Return
EndIf
Return 
ENDFUNC


*****************
** VALIDA EMAIL
*****************
FUNCTION VALEMAIL(email1)
local valido

*!*	IF VARTYPE(email) # "C"
*!*		RETURN .F.
*!*	ENDIF
*	
loRegExp = CreateObject("VBScript.RegExp")
loRegExp.IgnoreCase = .T.
loRegExp.Pattern =  '^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)­*)\.([A-Za-z]{2,})$'
valido = loRegExp.Test(ALLTRIM(email1))
RELEASE loRegExp
RETURN valido
ENDFUNC

************************************
* Funcion Generar Clave de Acceso de Documents
************************************
FUNCTION genclaveacceso
LPARAMETERS clavexcode
local tmpclavea, numrucemp, tmpclaveb, sumclaveb, codclaveb, digclaveb, dv, veces, dv11, dv12

tmpclavea=""

local tamb
q1="select tipoemi from periodos;"
IF !sqli(q1,'cTipoemi') then
	RETURN .f.
ENDIF
select cTipoemi
go top

IF cTipoemi.tipoemi=1 

	local temi
	* Tipo de Emision
	*q1="select 
	temi=1 && Emision Normal
	* temi=2  && Emision Contingencia


	q1="select code, fecha, dtag, serie, num, tipoambi "+;
	" from vdocxml1 "+;
	" where code="+alup(clavexcode)+";"

	IF !sqli(q1,'curclaveacc1') then
		RETURN
	ENDIF
	
	tamb=tipoambi
	
	select code, fecha, dtag, tamb as tipamb, nconcero(6,serie) as serie, ;
		nconcero(9,num) as num, nconcero(8,code) as codinum, ;
		temi as tipemi ;
	 from curclaveacc1 ;
	 into cursor curclaveacc

	select curclaveacc
	go top
	if RecCount("curclaveacc")>0 then
		* fecha
		tmpclavea=tmpclavea+devfeclet(curclaveacc.fecha,8)
		* Tipo Comprobante
		DO Case 
			Case substr(curclaveacc.dtag,1,3)='FAC'
				tmpclavea=tmpclavea+"01"	
			Case substr(curclaveacc.dtag,1,2)='NC'
				tmpclavea=tmpclavea+"04"
			Case substr(curclaveacc.dtag,1,2)='ND'
				tmpclavea=tmpclavea+"05"
			Case substr(curclaveacc.dtag,1,4)='REMI'
				tmpclavea=tmpclavea+"06"
			Case substr(curclaveacc.dtag,1,4)='COMP'
				tmpclavea=tmpclavea+"07"
			otherwise
				tmpclavea=tmpclavea+"00"
		EndCase
		* Numero RUC Empresa
			tmpclavea=tmpclavea+rucemp
		* Tipo Ambiente
			tmpclavea=tmpclavea+alltrim(str(curclaveacc.tipamb))
		* Serie
			tmpclavea=tmpclavea+alltrim((serie))
		* Numero Secuencia
			tmpclavea=tmpclavea+alltrim((curclaveacc.num))
		* Codigo Numerico
			tmpclavea=tmpclavea+"12345678" &&alltrim(str(curclaveacc.codinum))
		* Tipo de Emision
			tmpclavea=tmpclavea+alltrim(str(curclaveacc.tipemi))
		
		* Digito Verificador
		tmpclaveb=" "
		sumclaveb=0
		codclaveb=7
		digclaveb=" "
		veces=0
	*!*		for veces=48 to 1 step -1
	*!*			tmpclaveb=alltrim(tmpclaveb)+substr(tmpclavea,veces,1)
	*!*		endfor
		tmpclaveb=tmpclavea
		veces=0
		for veces=1 to 48
			digclaveb=substr(tmpclaveb,veces,1)
			if codclaveb=1
				codclaveb=7
			endif
			sumclaveb=sumclaveb+(val(digclaveb)*codclaveb)
			codclaveb=codclaveb-1
		endfor
		dv=0
		dv11=0
		dv12=0
		dv=11-dv
		dv11=(sumclaveb/11)-int((sumclaveb/11))
		dv12=dv11*11
		dv=11-dv12
		do case 
			case dv=11
				dv=0
			case dv=10
				dv=1
		endcase
				
		tmpclavea=tmpclavea+alltrim(str(dv))
		
		if used("cTipoAmbi")
			select cTipoAmbi
			use
		endif
		
		if used("curclaveacc")
			select curclaveacc
			use
		endif
		
		if used("curclaveacc1")
			select curclaveacc1
			use
		endif

		if used("empr")
			select empr
			use
		endif
		
		return 	tmpclavea
		
	else
*!*			Messagebox("No Existe CODE",0+64,"SISCON")
*!*			tmpclavea=""
*!*			return .f.
		wait windows "No Existe CODE "+str(clavexcode,10,0)+" " nowait
		tmpclavea=""
		return tmpclavea
	endif
ELSE
	* 	Clave de Contingencia
	q1="select clave from facelec_k where code=0 order by clave limit 1;"
	IF !sqli(q1,'cClaveConti') then
		RETURN .f.
	ENDIF

	If RecCount('cClaveConti')>0 then
		Select cClaveConti.clave
		go top
		tmpclavea=cClaveConti.clave
		return 	tmpclavea
	endif
ENDIF
ENDFUNC

************************************
* Funcion Generar Clave de Acceso de Retenciones OK
************************************
FUNCTION genclaveaccesoret
LPARAMETERS clavexcode
local tmpclavea, numrucemp, tmpclaveb, sumclaveb, codclaveb, digclaveb, dv, veces, dv11, dv12

tmpclavea=""

local tamb, temi

q1="select tipoemi from periodos;"
IF !sqli(q1,'cTipoEmi') then
	RETURN
ENDIF
select cTipoEmi
go top
* Tipo de Ambieente de Produccion
temi=cTipoEmi.tipoemi

IF temi=1 THEN

	q1="select code, fecha, 'COMPRETE' as dtag, serieret as serie, secueret as num, tipoambi "+;
	" from vdocxml2 "+;
	" where code="+alup(clavexcode)+";"

	IF !sqli(q1,'curclaveacc1') then
		RETURN
	ENDIF

	tamb=curclaveacc1.tipoambi
	
	select code, fecha, dtag, tamb as tipamb, nconcero(6,serie) as serie, ;
		nconcero(9,num) as num, nconcero(8,code) as codinum, ;
		temi as tipemi ;
	 from curclaveacc1 ;
	 into cursor curclaveacc

	select curclaveacc
	go top
	if RecCount("curclaveacc")>0 then
		* fecha
		tmpclavea=tmpclavea+devfeclet(curclaveacc.fecha,8)
		tmpclavea=tmpclavea+"07"
		* Numero RUC Empresa
			tmpclavea=tmpclavea+rucemp
		* Tipo Ambiente
			tmpclavea=tmpclavea+alltrim(str(curclaveacc.tipamb))
		* Serie
			tmpclavea=tmpclavea+alltrim((serie))
		* Numero Secuencia
			tmpclavea=tmpclavea+alltrim((curclaveacc.num))
		* Codigo Numerico
			tmpclavea=tmpclavea+"12345678" &&alltrim(str(curclaveacc.codinum))
		* Tipo de Emision
			tmpclavea=tmpclavea+alltrim(str(curclaveacc.tipemi))
		* Digito Verificador
		tmpclaveb=" "
		sumclaveb=0
		codclaveb=7
		digclaveb=" "
		veces=0
		tmpclaveb=tmpclavea
		veces=0
		for veces=1 to 48
			digclaveb=substr(tmpclaveb,veces,1)
			if codclaveb=1
				codclaveb=7
			endif
			sumclaveb=sumclaveb+(val(digclaveb)*codclaveb)
			codclaveb=codclaveb-1
		endfor
		dv=0
		dv11=0
		dv12=0
		dv=11-dv
		dv11=(sumclaveb/11)-int((sumclaveb/11))
		dv12=dv11*11
		dv=11-dv12
		do case 
			case dv=11
				dv=0
			case dv=10
				dv=1
		endcase

		tmpclavea=tmpclavea+alltrim(str(dv))
		
		if used("cTipoAmbi")
			select cTipoAmbi
			use
		endif
		
		if used("cTipoEmi")
			select cTipoEmi
			use
		endif
		
		if used("curclaveacc")
			select curclaveacc
			use
		endif
		
		if used("curclaveacc1")
			select curclaveacc1
			use
		endif

		if used("empr")
			select empr
			use
		endif
		
		return 	tmpclavea
		
	else
		Messagebox("No Existe CODE",0+64,"SISCON")
		tmpclavea=""
		return .f.
	endif
ELSE
	* 	Clave de Contingencia
	q1="select clave from facelec_k where code=0 order by clave limit 1;"
	IF !sqli(q1,'cClaveConti') then
		RETURN
	ENDIF

	If RecCount('cClaveConti')>0 then
		Select cClaveConti.clave
		go top
		tmpclavea=cClaveConti.clave
		return 	tmpclavea
	endif
ENDIF
ENDFUNC


*************************
** Factura Electronica
*************************
FUNCTION genxmlfac
LPARAMETERS xgencode

LOCAL lnFile, cFILE, xmlclavacc 

CREATE CURSOR encxml (code n(10), ;
	ambiente n(1),;
	emision n(1),;
	clavacc c(50),;
	coddoc c(2),;
	estab c(3),;
	ptoemi c(3),;
	secuen c(10),;
	dirmat c(250),;
	fecemi d(8),;
	direstab c(250),;
	conespec c(5),;
	obligcnt c(2),;
	tiposuj c(2),;
	gremisi c(15),;
	rsocial c(250),;
	numidec c(13),;
	subtot n(10,2),;
	tdescu n(10,2),;
	impcod1 n(1),;
	impporc1 n(1),;
	impbasi1 n(10,2),;
	impval1 n(10,2),;
	impcod2 n(1),;
	impporc2 n(1),;
	impbasi2 n(10,2),;
	impval2 n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icebasi n(10,2),;
	iceval n(10,2),;
	propina n(10,2),;
	impototal n(10,2),;
	moneda c(15),;
	stelf c(10) null,;
	dirsuj c(250),;
	emailsuj c(250), ;
	porivax n(2) defa 0 )


CREATE CURSOR detxml (code n(10),;
	codpri n(10),;
	codaux n(10),;
	descrip c(250),;
	canti n(18,6),;
	punit n(10,2),;
	descu n(10,2),;
	precimp n(10,2),;
	impcod n(1),;
	imppor n(1),;
	imptarf n(2),;
	impbase n(10,2),;
	impval n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icetarf n(2),;
	icebasi n(10,2),;
	iceval n(10,2) )
	
CREATE CURSOR retxml (code n(10),;
	codret n(2),;
	codpor n(2),;
	codtarf n(2),;
	valor N(10,2) )

q1="select * from periodos;"
if !sqli(q1,'empperi') then
	return
endif

select empperi
go top


q1="select distinct sruc, ssri, stelf, sfax, smail::char(60), saddr, siderepleg, srepleg, sruccontador, nrores, numestb from empresas ;"

if !sqli(q1,'rucempre') then
	return
endif

select 	substr(sruc,1,13) as sruc, ;
		substr(ssri,1,60) as ssri, ;
		nconcero(9,stelf) as stelf, ;
		nconcero(9,sfax) as sfax, ;
		substr(smail,1,60) as smail1, ;
		substr(saddr,1,60) as saddr, ;
		substr(siderepleg,1,1) as siderepleg, ;
		substr(srepleg,1,13) as srepleg, ;
		nconcero(3,numestb) as numestb, ;
		nrores, ;
		substr(sruccontador,1,13) as sruccontador ;
	from rucempre into cursor empresas
	
	
cFILE="FACELE_"+alltrim(str(xgencode))+".xml"

xmlclavacc = genclaveacceso(xgencode)

If len(Alltrim(xmlclavacc))<>49 then
	wait windows 'Clave Mal Formada...' nowait
	Return .f.
EndIf

** Llenado Cursor Encabezado XML
q1="select * from vdocxml1 where code="+alup(xgencode)+";"
IF !sqli(q1,'curxmle') then
	RETURN
ENDIF

SELECT curxmle
GO top
SCAN
	SELECT encxml 
	APPEND BLANK

	Replace encxml.code 	WITH xgencode
	Replace encxml.ambiente WITH curxmle.tipoambi    && 1 pruebas 2 produccion
	Replace encxml.emision 	WITH empperi.tipoemi   && 1 emision normal   2 indiponiblidad del sistema
	Replace encxml.clavacc 	WITH xmlclavacc  && generar clave de acceso 
	Replace encxml.coddoc 	WITH "01"  && 01 fact 04 nc   05  nd  06 gremision 07  retencion
	Replace encxml.estab 	WITH SUBSTR(nconcero(6,curxmle.serie),1,3)
	Replace encxml.ptoemi 	WITH SUBSTR(nconcero(6,curxmle.serie),4,3)
	Replace encxml.secuen 	WITH nconcero(9,curxmle.num)
	*Replace encxml.dirmat 	WITH curxmle.
	Replace encxml.fecemi 	WITH curxmle.fecha
	*Replace encxml.direstab WITH curxmle.
	
	Replace encxml.conespec WITH nconcero(5,empresas.nrores)   && debemos almacenar en datos de la empresa
	Replace encxml.obligcnt WITH "SI" && debemos almacenar en datos de la empresa obligcnt
	Replace encxml.tiposuj 	WITH IIF(ALLTRIM(curxmle.sname)="CONSUMIDOR FINAL","07",IIF(LEN(ALLTRIM(curxmle.sruc))=13,"04",IIF(LEN(ALLTRIM(curxmle.scedula))=10,"05","06")))
*	Replace encxml.gremisi 	WITH curxmle.
	Replace encxml.rsocial 	WITH ALLTRIM(solonl(curxmle.sname))
	Replace encxml.numidec 	WITH IIF(ALLTRIM(curxmle.sname)="CONSUMIDOR FINAL","9999999999999",IIF(LEN(ALLTRIM(curxmle.sruc))=13,ALLTRIM(curxmle.sruc),IIF(LEN(ALLTRIM(curxmle.scedula))=10,ALLTRIM(curxmle.scedula),ALLTRIM(curxmle.spasaporte))))
	Replace encxml.dirsuj   WITH ALLTRIM(solonl(curxmle.saddr))
	Replace encxml.emailsuj WITH iif(isnull(curxmle.smail) or len(alltrim(curxmle.smail))=0,LOWER(ALLTRIM(empresas.smail1)),LOWER(ALLTRIM(curxmle.smail)) )
	Replace encxml.subtot 	WITH curxmle.subtotal-(curxmle.descuconiva+curxmle.descusiniva)
	Replace encxml.tdescu 	WITH curxmle.descuconiva+curxmle.descusiniva
	replace encxml.porivax 	with curxmle.poriva
	
	Replace encxml.impcod1 	WITH 2 && Codigo de IVA
	
	if encxml.porivax=12
		Replace encxml.impporc1	WITH 2  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
	else
		Replace encxml.impporc1	WITH 3
	endif
	Replace encxml.impbasi1	WITH curxmle.subconiva-curxmle.descuconiva
	Replace encxml.impval1 	WITH curxmle.ivavalor
	
	Replace encxml.impcod2 	WITH 2
	Replace encxml.impporc2	WITH 0 && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
	Replace encxml.impbasi2	WITH curxmle.subsiniva-curxmle.descusiniva
	Replace encxml.impval2	WITH 0


	IF curxmle.icevalor>0.00 then
		Replace encxml.icecod 	WITH 0
		Replace encxml.icepor 	WITH 0
		Replace encxml.icebasi 	WITH 0
		Replace encxml.iceval 	WITH 0
	ELSE
		Replace encxml.icecod 	WITH 0
		Replace encxml.icepor 	WITH 0
		Replace encxml.icebasi 	WITH 0
		Replace encxml.iceval 	WITH 0
	endif	
	Replace encxml.propina 	WITH 0.00
	Replace encxml.impototal WITH curxmle.montototal
	Replace encxml.moneda 	WITH "DOLAR"
	*Replace encxml.stelf 	WITH iif(len(alltrim(curxmle.stelf))=0,iif(len(alltrim(curxmle.scel))=0,empresas.stelf,curxmle.scel),curxmle.stelf)
	Replace encxml.stelf 	WITH iif(isnull(curxmle.stelf),"0000000000",iif(len(alltrim(curxmle.stelf))=0,iif(len(alltrim(curxmle.scel))=0,empresas.stelf,curxmle.scel),curxmle.stelf))

	if len(alltrim(encxml.stelf))=0 then
		Replace encxml.stelf 	WITH "000000000"
	endif
	
	if len(alltrim(encxml.dirsuj))=0 then
		Replace encxml.dirsuj   WITH "MACHALA"
	endif
	
	SELECT curxmle

ENDSCAN

sele curxmle
go top

** llenado de Cursor de Detalle de XML
q1="select * from vdocui where code="+alup(xgencode)+";"
IF !sqli(q1,'curxmld') then
	RETURN
ENDIF

SELECT curxmld
GO top
SCAN
	SELECT detxml 
	APPEND BLANK
	
	Replace detxml.code 	WITH xgencode
	Replace detxml.codpri 	WITH curxmld.iditem
	Replace detxml.codaux 	WITH curxmld.icode
	Replace detxml.descrip 	WITH solonl(curxmld.iname)
	Replace detxml.canti 	WITH curxmld.qty
	Replace detxml.punit 	WITH curxmld.punitario
	Replace detxml.descu 	WITH curxmld.descuento
	Replace detxml.precimp 	WITH curxmld.valconiva
	IF curxmld.isiva=.t. THEN
		Replace detxml.impcod 	WITH 2 && Codigo de IVA
		if encxml.porivax=12
			Replace detxml.imppor 	WITH 2  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
		else
			Replace detxml.imppor	WITH 3
		endif

		Replace detxml.imptarf 	WITH encxml.porivax
		Replace detxml.impbase 	WITH curxmld.subtot-curxmld.descuento
		Replace detxml.impval 	WITH curxmld.valconiva
	ELSE
		Replace detxml.impcod 	WITH 2 && Codigo de IVA
		Replace detxml.imppor 	WITH 0  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
		Replace detxml.imptarf 	WITH 0  
		Replace detxml.impbase 	WITH curxmld.subtot-curxmld.descuento
		Replace detxml.impval 	WITH 0.00
	endif
	Replace detxml.icecod 	WITH 0
	Replace detxml.icepor 	WITH 0
	Replace detxml.icetarf 	WITH 0
	Replace detxml.icebasi 	WITH 0
	Replace detxml.iceval	WITH 0
	
	SELECT curxmld
	
ENDSCAN

lnFile=FCreate(cFILE)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(cFILE)
	If lnFile<0
		Messagebox("Error al Crear Archivo XML",0,empresa)
		Return(.f.)
	EndIf	
EndIf
*fputs(lnFile,'<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?>')
fputs(lnFile,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
fputs(lnFile,'<factura id="comprobante" version="1.0.0">')
fputs(lnFile,"	<infoTributaria>")
fputs(lnFile,"		<ambiente>"+alltrim(str(encxml.ambiente,5,0))+"</ambiente>")																	&&
fputs(lnFile,"		<tipoEmision>"+alltrim(str(encxml.emision,5,0))+"</tipoEmision>")																&&
fputs(lnFile,"		<razonSocial>"+alltrim(empresas.ssri)+"</razonSocial>")
fputs(lnFile,"		<nombreComercial>"+alltrim(empresas.ssri)+"</nombreComercial>")
fputs(lnFile,"		<ruc>"+alltrim(empresas.sruc)+"</ruc>")
fputs(lnFile,"		<claveAcceso>"+alltrim(encxml.clavacc)+"</claveAcceso>")			
fputs(lnFile,"		<codDoc>"+alltrim(encxml.coddoc)+"</codDoc>") 
fputs(lnFile,"		<estab>"+alltrim(encxml.estab)+"</estab>") 
fputs(lnFile,"		<ptoEmi>"+alltrim(encxml.ptoemi)+"</ptoEmi>") 
fputs(lnFile,"		<secuencial>"+alltrim(encxml.secuen)+"</secuencial>") 
fputs(lnFile,"		<dirMatriz>"+alltrim(empresas.saddr)+"</dirMatriz>")
fputs(lnFile,"	</infoTributaria>")
fputs(lnFile,"    <infoFactura>")
fputs(lnFile,"    	<fechaEmision>"+devfeclet(encxml.fecemi,7)+"</fechaEmision>")
fputs(lnFile,"    	<dirEstablecimiento>"+alltrim(empresas.saddr)+"</dirEstablecimiento>")
fputs(lnFile,"    	<contribuyenteEspecial>"+alltrim(empresas.nrores)+"</contribuyenteEspecial>")
fputs(lnFile,"    	<obligadoContabilidad>"+alltrim(encxml.obligcnt)+"</obligadoContabilidad>")   
fputs(lnFile,"    	<tipoIdentificacionComprador>"+alltrim(encxml.tiposuj)+"</tipoIdentificacionComprador>")  &&&
fputs(lnFile,"    	<razonSocialComprador>"+alltrim(encxml.rsocial)+"</razonSocialComprador>")
fputs(lnFile,"    	<identificacionComprador>"+alltrim(encxml.numidec)+"</identificacionComprador>")
fputs(lnFile,"    	<totalSinImpuestos>"+alltrim(STR(encxml.subtot,10,2))+"</totalSinImpuestos>")
fputs(lnFile,"    	<totalDescuento>"+alltrim(STR(encxml.tdescu,10,2))+"</totalDescuento>")
fputs(lnFile,"    	<totalConImpuestos>")
IF encxml.impbasi1>0 then
	fputs(lnFile,"	    	<totalImpuesto>")
	fputs(lnFile,"	    		<codigo>"+ALLTRIM(STR(encxml.impcod1,5,0))+"</codigo>")
	fputs(lnFile,"	    		<codigoPorcentaje>"+ALLTRIM(STR(encxml.impporc1,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"	    		<baseImponible>"+ALLTRIM(STR(encxml.impbasi1,10,2))+"</baseImponible>")
	fputs(lnFile,"	    		<valor>"+ALLTRIM(STR(encxml.impval1,10,2))+"</valor>")
	fputs(lnFile,"	    	</totalImpuesto>")
ENDIF
IF encxml.impbasi2>0 then
	fputs(lnFile,"	    	<totalImpuesto>")
	fputs(lnFile,"	    		<codigo>"+ALLTRIM(STR(encxml.impcod2,5,0))+"</codigo>")
	fputs(lnFile,"	    		<codigoPorcentaje>"+ALLTRIM(STR(encxml.impporc2,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"	    		<baseImponible>"+ALLTRIM(STR(encxml.impbasi2,10,2))+"</baseImponible>")
	fputs(lnFile,"	    		<valor>"+ALLTRIM(STR(encxml.impval2,10,2))+"</valor>")
	fputs(lnFile,"	    	</totalImpuesto>")
ENDIF
fputs(lnFile,"    	</totalConImpuestos>")
fputs(lnFile,"    	<propina>0.00</propina>")
fputs(lnFile,"    	<importeTotal>"+ALLTRIM(STR(encxml.impototal,10,2))+"</importeTotal>")
fputs(lnFile,"    	<moneda>DOLAR</moneda>")
fputs(lnFile,"   	</infoFactura>")
fputs(lnFile,"   	<detalles>")
SELECT detxml
GO top
SCAN
fputs(lnFile,"   		<detalle>")
fputs(lnFile,"   			<codigoPrincipal>"+ALLTRIM(STR(detxml.codpri,10,0))+"</codigoPrincipal>")
fputs(lnFile,"   			<codigoAuxiliar>"+ALLTRIM(STR(detxml.codaux,10,0))+"</codigoAuxiliar>")
fputs(lnFile,"   			<descripcion>"+ALLTRIM(detxml.descrip)+"</descripcion>")
fputs(lnFile,"   			<cantidad>"+ALLTRIM(STR(detxml.canti,10,2))+"</cantidad>")
fputs(lnFile,"   			<precioUnitario>"+ALLTRIM(STR(detxml.punit,10,2))+"</precioUnitario>")
fputs(lnFile,"   			<descuento>"+ALLTRIM(STR(detxml.descu,10,2))+"</descuento>")
fputs(lnFile,"   			<precioTotalSinImpuesto>"+ALLTRIM(STR(detxml.impbase,10,2))+"</precioTotalSinImpuesto>")
fputs(lnFile,"   			<impuestos>")
fputs(lnFile,"   				<impuesto>")
fputs(lnFile,"   					<codigo>"+ALLTRIM(STR(detxml.impcod,5,0))+"</codigo>")
fputs(lnFile,"   					<codigoPorcentaje>"+ALLTRIM(STR(detxml.imppor,5,0))+"</codigoPorcentaje>")
fputs(lnFile,"   					<tarifa>"+ALLTRIM(STR(detxml.imptarf,10,2))+"</tarifa>")
fputs(lnFile,"   					<baseImponible>"+ALLTRIM(STR(detxml.impbase,10,2))+"</baseImponible>")
fputs(lnFile,"   					<valor>"+ALLTRIM(STR(detxml.impval,10,2))+"</valor>")
fputs(lnFile,"   				</impuesto>")
fputs(lnFile,"   			</impuestos>")
fputs(lnFile,"   		</detalle>")
ENDSCAN
fputs(lnFile,"   	</detalles>")
fputs(lnFile,"<infoAdicional>")
fputs(lnFile,'    <campoAdicional nombre="Direccion">'+alltrim(encxml.dirsuj)+'</campoAdicional>')
fputs(lnFile,'    <campoAdicional nombre="Telefono">'+alltrim(encxml.stelf)+'</campoAdicional>')
fputs(lnFile,'    <campoAdicional nombre="Email">'+alltrim(encxml.emailsuj)+'</campoAdicional>')
fputs(lnFile,'</infoAdicional>')
fputs(lnFile,"</factura>")
fClose(lnFile)
Wait Window "Creando Archivo de Factura Electronica XML......." NoWait 

if used("encxml")
	select encxml
	use
endif
if used("detxml")
	select detxml
	use
endif
if used("retxml")
	select retxml
	use
endif
if used("rucempre")
	select rucempre
	use
endif
if used("empresas")
	select empresas
	use
endif
if used("curxmld")
	select curxmld
	use
endif
if used("curxmle")
	select curxmle
	use
endif
if used("empr")
	select empr
	use
endif
if used("cClaveConti")
	select cClaveConti
	use
endif
if used("empperi")
	select empperi
	use
endif


RETURN .t.
ENDFUNC

*****************
** VALIDA EMAIL
*****************
FUNCTION VALEMAIL(email1)
local valido

*!*	IF VARTYPE(email) # "C"
*!*		RETURN .F.
*!*	ENDIF
*	
loRegExp = CreateObject("VBScript.RegExp")
loRegExp.IgnoreCase = .T.
loRegExp.Pattern =  '^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)­*)\.([A-Za-z]{2,})$'
valido = loRegExp.Test(ALLTRIM(email1))
RELEASE loRegExp
RETURN valido
ENDFUNC


***********************************************
*	REGISTRO DE ERRORES ODBC
***********************************************
procedure regerrfe
local cm
if used('errorfe') then
	sele errorfe
else
	sele 0
	use errorfe  share
endif
appen blank
e=sys(2018)
replace user 		with usuario
replace fecha   	with datetime()
replace code 		with faceletmp.code
*replace docele 		with ""
replace nivelerr 	with eNivelerr
replace descrip1	with cfdi_error(h)
replace claacce		with lclaveacceso
return

******************
* Generacion de Documento Nota de Credito Cliente
******************
FUNCTION genxmlncc
LPARAMETERS xgencode

LOCAL lnFile, cFILE, xmlclavacc 
CREATE CURSOR encxml (code n(10), ;
	ambiente n(1),;
	emision n(1),;
	clavacc c(50),;
	coddoc c(2),;
	estab c(3),;
	ptoemi c(3),;
	secuen c(10),;
	dirmat c(250),;
	fecemi d(8),;
	direstab c(250),;
	conespec c(5),;
	obligcnt c(2),;
	tiposuj c(2),;
	gremisi c(15),;
	rsocial c(250),;
	numidec c(13),;
	subtot n(10,2),;
	tdescu n(10,2),;
	impcod1 n(1),;
	impporc1 n(1),;
	impbasi1 n(10,2),;
	impval1 n(10,2),;
	impcod2 n(1),;
	impporc2 n(1),;
	impbasi2 n(10,2),;
	impval2 n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icebasi n(10,2),;
	iceval n(10,2),;
	propina n(10,2),;
	impototal n(10,2),;
	moneda c(15),;
	dirsuj c(250),;
	emailsuj c(250),;
	stelf c(10) null,;
	mcoddoc c(2),;
	mnumdoc c(20),;
	mfecha d(8),;
	motivo c(30), ;
	porivax n(2) defa 0 )


CREATE CURSOR detxml (code n(10),;
	codpri n(10),;
	codaux n(10),;
	descrip c(250),;
	canti n(18,6),;
	punit n(18,6),;
	descu n(10,2),;
	precimp n(10,2),;
	impcod n(1),;
	imppor n(1),;
	imptarf n(2),;
	impbase n(10,2),;
	impval n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icetarf n(2),;
	icebasi n(10,2),;
	iceval n(10,2) )
	

q1="select * from periodos;"
if !sqli(q1,'empperi') then
	return
endif

select empperi
go top

q1="select distinct sruc, ssri, stelf, sfax, smail::char(60), saddr, siderepleg, srepleg, sruccontador, nrores, numestb from empresas ;"

if !sqli(q1,'rucempre') then
	return
endif

select 	substr(sruc,1,13) as sruc, ;
		substr(ssri,1,60) as ssri, ;
		nconcero(9,stelf) as stelf, ;
		nconcero(9,sfax) as sfax, ;
		substr(smail,1,60) as smail1, ;
		substr(saddr,1,60) as saddr, ;
		substr(siderepleg,1,1) as siderepleg, ;
		substr(srepleg,1,13) as srepleg, ;
		nconcero(3,numestb) as numestb, ;
		nrores, ;
		substr(sruccontador,1,13) as sruccontador ;
	from rucempre into cursor empresas
	
	
cFILE="NCCELE_"+alltrim(str(xgencode))+".xml"

xmlclavacc = genclaveacceso(xgencode)

** Llenado Cursor Encabezado XML
q1="select d.* "+;
"from vdocxml1 d "+;
"where d.code="+alup(xgencode)+";"

IF !sqli(q1,'curxmle1') then
	RETURN
ENDIF

if linkdoc>0
	q1="select code, serie as numserie2, num as numsecue2, fecha as fecha2,  "+;
			"to_char((c.codigo::int2)::int4,'FM09') as docmodificado "+;
		" from  vdocusmall d left join sritabla c on (d.idsritabla=c.idsritabla) "+;
		" where code="+alup(linkdoc)
	if sqli(q1,'refer')
		select c.*,  numserie2, numsecue2, fecha2, idsritabla, docmodificado  ;
		from curxmle1 c left join refer r on (c.linkdoc=r.code) ;
		into cursor curxmle
	else
		wait 'Error en referencia de N/C' wind time 1
		return .f.
	endif
else
	q1="select code, serie as numserie2, num as numsecue2, fecha as fecha2,  "+;
			"to_char((c.codigo::int2)::int4,'FM09') as docmodificado "+;
		" from  vdocusmall d left join sritabla c on (d.idsritabla=c.idsritabla) "+;
		" where d.cliente="+alup(curxmle1.cliente)+" and substr(d.dtag,1,3)='FAC' and not isanulado "+;
			" and isaccount and fecha<="+alup(curxmle1.fecha)+;
		" limit 1"
	if sqli(q1,'refer')
		if reccount('refer')=0
			wait 'No puede generar xml N/C, no existe referencia' wind time 1
			return .f.
		else
			sele refer
			go top
			ns=numserie2
			nc=numsecue2
			fc=fecha2
			dm=docmodificado
			select c.*, ns as numserie2, nc as numsecue2, fc as fecha2, dm as docmodificado  ;
			from curxmle1 c  ;
			into cursor curxmle
		endif
	else
		wait 'Error en referencia de N/C' wind time 1
		return .f.
	endif
endif


SELECT curxmle
GO top
SCAN
	SELECT encxml 
	APPEND BLANK

	Replace encxml.code 	WITH xgencode
	Replace encxml.ambiente WITH curxmle.tipoambi    && 1 pruebas 2 produccion
	Replace encxml.emision 	WITH empperi.tipoemi   && 1 emision normal   2 indiponiblidad del sistema
	Replace encxml.clavacc 	WITH xmlclavacc  && generar clave de acceso 
	Replace encxml.coddoc 	WITH "04"  && 01 fact 04 nc   05  nd  06 gremision 07  retencion
	Replace encxml.estab 	WITH SUBSTR(nconcero(6,curxmle.serie),1,3)
	Replace encxml.ptoemi 	WITH SUBSTR(nconcero(6,curxmle.serie),4,3)
	Replace encxml.secuen 	WITH nconcero(9,curxmle.num)
	*Replace encxml.dirmat 	WITH curxmle.
	Replace encxml.fecemi 	WITH curxmle.fecha
	*Replace encxml.direstab WITH curxmle.
	
	Replace encxml.conespec WITH nconcero(5,empresas.nrores)  && debemos almacenar en datos de la empresa
	Replace encxml.obligcnt WITH "SI" && debemos almacenar en datos de la empresa obligcnt
	Replace encxml.tiposuj 	WITH IIF(ALLTRIM(curxmle.sname)="CONSUMIDOR FINAL","07",IIF(LEN(ALLTRIM(curxmle.sruc))=13,"04",IIF(LEN(ALLTRIM(curxmle.scedula))=10,"05","06")))
*	Replace encxml.gremisi 	WITH curxmle.
	Replace encxml.rsocial 	WITH ALLTRIM(solonl(curxmle.sname))
	Replace encxml.numidec 	WITH IIF(ALLTRIM(curxmle.sname)="CONSUMIDOR FINAL","9999999999999",IIF(LEN(ALLTRIM(curxmle.sruc))=13,ALLTRIM(curxmle.sruc),IIF(LEN(ALLTRIM(curxmle.scedula))=10,ALLTRIM(curxmle.scedula),ALLTRIM(curxmle.spasaporte))))
	Replace encxml.dirsuj   WITH ALLTRIM(solonl(curxmle.saddr))
	Replace encxml.emailsuj WITH iif(isnull(curxmle.smail) or len(alltrim(curxmle.smail))=0,LOWER(ALLTRIM(empresas.smail1)),LOWER(ALLTRIM(curxmle.smail)) )
	Replace encxml.subtot 	WITH curxmle.subtotal-(curxmle.descuconiva+curxmle.descusiniva)
	Replace encxml.tdescu 	WITH curxmle.descuconiva+curxmle.descusiniva
	replace encxml.porivax 	with curxmle.poriva

	Replace encxml.impcod1 	WITH 2 && Codigo de IVA
	
	if encxml.porivax=12
		Replace encxml.impporc1	WITH 2  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
	else
		Replace encxml.impporc1	WITH 3
	endif
	Replace encxml.impbasi1	WITH curxmle.subconiva-curxmle.descuconiva
	Replace encxml.impval1 	WITH curxmle.ivavalor
	
	Replace encxml.impcod2 	WITH 2
	Replace encxml.impporc2	WITH 0 && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
	Replace encxml.impbasi2	WITH curxmle.subsiniva-curxmle.descusiniva
	Replace encxml.impval2	WITH 0


	IF curxmle.icevalor>0.00 then
		Replace encxml.icecod 	WITH 0
		Replace encxml.icepor 	WITH 0
		Replace encxml.icebasi 	WITH 0
		Replace encxml.iceval 	WITH 0
	ELSE
		Replace encxml.icecod 	WITH 0
		Replace encxml.icepor 	WITH 0
		Replace encxml.icebasi 	WITH 0
		Replace encxml.iceval 	WITH 0
	endif	
	Replace encxml.propina 	WITH 0.00
	Replace encxml.impototal WITH curxmle.montototal
	Replace encxml.moneda 	WITH "DOLAR"
	Replace encxml.mcoddoc 	WITH curxmle.docmodificado
	Replace encxml.mnumdoc 	WITH SUBSTR(nconcero(6,curxmle.numserie2),1,3)+"-"+SUBSTR(nconcero(6,curxmle.numserie2),4,3)+"-"+nconcero(9,curxmle.numsecue2)
	Replace encxml.mfecha 	WITH curxmle.fecha2
	Replace encxml.motivo 	WITH iif(len(alltrim(curxmle.concepto))=0, "DEVOLUCION CLIENTE", solonl(substr(Alltrim(curxmle.concepto),1,30)) )
	Replace encxml.stelf 	WITH iif(isnull(curxmle.stelf),"0000000000",iif(len(alltrim(curxmle.stelf))=0,iif(len(alltrim(curxmle.scel))=0,empresas.stelf,curxmle.scel),curxmle.stelf))

	if len(alltrim(encxml.stelf))=0 or isnull(encxml.stelf)
		Replace encxml.stelf 	WITH "000000000"
	endif
	
	if len(alltrim(encxml.dirsuj))=0 then
		Replace encxml.dirsuj   WITH "MACHALA"
	endif


	SELECT curxmle

ENDSCAN

sele curxmle
go top

** llenado de Cursor de Detalle de XML
q1="select * from vdocui where code="+alup(xgencode)+";"
IF !sqli(q1,'curxmld') then
	RETURN
ENDIF

SELECT curxmld
GO top
SCAN
	SELECT detxml 
	APPEND BLANK
	
	Replace detxml.code 	WITH xgencode
	Replace detxml.codpri 	WITH curxmld.iditem
	Replace detxml.codaux 	WITH curxmld.icode
	Replace detxml.descrip 	WITH  ALLTRIM(solonl(curxmld.iname))
	Replace detxml.canti 	WITH curxmld.qty
	Replace detxml.punit 	WITH curxmld.punitario
	Replace detxml.descu 	WITH curxmld.descuento
	Replace detxml.precimp 	WITH curxmld.valconiva
	IF curxmld.isiva=.t. THEN
		Replace detxml.impcod 	WITH 2 && Codigo de IVA
		if encxml.porivax=12
			Replace detxml.imppor 	WITH 2  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
		else
			Replace detxml.imppor	WITH 3
		endif

		Replace detxml.imptarf 	WITH encxml.porivax  
		Replace detxml.impbase 	WITH curxmld.subtot-curxmld.descuento
		Replace detxml.impval 	WITH curxmld.valconiva
	ELSE
		Replace detxml.impcod 	WITH 2 && Codigo de IVA
		Replace detxml.imppor 	WITH 0  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
		Replace detxml.imptarf 	WITH 0  
		Replace detxml.impbase 	WITH curxmld.subtot-curxmld.descuento
		Replace detxml.impval 	WITH 0.00
	endif
	Replace detxml.icecod 	WITH 0
	Replace detxml.icepor 	WITH 0
	Replace detxml.icetarf 	WITH 0
	Replace detxml.icebasi 	WITH 0
	Replace detxml.iceval	WITH 0
	
	SELECT curxmld
	
ENDSCAN

lnFile=FCreate(cFILE)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(cFILE)
	If lnFile<0
		Messagebox("Error al Crear Archivo XML",0,empresa)
		Return(.f.)
	EndIf	
EndIf
fputs(lnFile,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
fputs(lnFile,'<notaCredito id="comprobante" version="1.1.0">')
fputs(lnFile,"	<infoTributaria>")
fputs(lnFile,"		<ambiente>"+alltrim(str(encxml.ambiente))+"</ambiente>")																	&&
fputs(lnFile,"		<tipoEmision>"+alltrim(str(encxml.emision))+"</tipoEmision>")																&&
fputs(lnFile,"		<razonSocial>"+alltrim(empresas.ssri)+"</razonSocial>")
fputs(lnFile,"		<nombreComercial>"+alltrim(empresas.ssri)+"</nombreComercial>")
fputs(lnFile,"		<ruc>"+alltrim(empresas.sruc)+"</ruc>")
fputs(lnFile,"		<claveAcceso>"+alltrim(encxml.clavacc)+"</claveAcceso>")			
fputs(lnFile,"		<codDoc>"+alltrim(encxml.coddoc)+"</codDoc>") 
fputs(lnFile,"		<estab>"+alltrim(encxml.estab)+"</estab>") 
fputs(lnFile,"		<ptoEmi>"+alltrim(encxml.ptoemi)+"</ptoEmi>") 
fputs(lnFile,"		<secuencial>"+alltrim(encxml.secuen)+"</secuencial>") 
fputs(lnFile,"		<dirMatriz>"+alltrim(empresas.saddr)+"</dirMatriz>")
fputs(lnFile,"	</infoTributaria>")
fputs(lnFile,"    <infoNotaCredito>")
fputs(lnFile,"    	<fechaEmision>"+devfeclet(encxml.fecemi,7)+"</fechaEmision>")
fputs(lnFile,"    	<dirEstablecimiento>"+alltrim(empresas.saddr)+"</dirEstablecimiento>")
fputs(lnFile,"    	<tipoIdentificacionComprador>"+alltrim(encxml.tiposuj)+"</tipoIdentificacionComprador>")  &&&
fputs(lnFile,"    	<razonSocialComprador>"+alltrim(encxml.rsocial)+"</razonSocialComprador>")
fputs(lnFile,"    	<identificacionComprador>"+alltrim(encxml.numidec)+"</identificacionComprador>")
fputs(lnFile,"    	<contribuyenteEspecial>"+alltrim(empresas.nrores)+"</contribuyenteEspecial>")
fputs(lnFile,"    	<obligadoContabilidad>"+alltrim(encxml.obligcnt)+"</obligadoContabilidad>")   
fputs(lnFile,"    	<codDocModificado>"+alltrim(encxml.mcoddoc)+"</codDocModificado>")
fputs(lnFile,"    	<numDocModificado>"+alltrim(encxml.mnumdoc)+"</numDocModificado>")
fputs(lnFile,"    	<fechaEmisionDocSustento>"+devfeclet(encxml.mfecha,7)+"</fechaEmisionDocSustento>")
fputs(lnFile,"    	<totalSinImpuestos>"+alltrim(STR(encxml.subtot,10,2))+"</totalSinImpuestos>")
fputs(lnFile,"    	<valorModificacion>"+alltrim(STR(encxml.impototal,10,2))+"</valorModificacion>")
fputs(lnFile,"    	<moneda>DOLAR</moneda>")
fputs(lnFile,"    	<totalConImpuestos>")
IF encxml.impbasi1>0 then
	fputs(lnFile,"	    	<totalImpuesto>")
	fputs(lnFile,"	    		<codigo>"+ALLTRIM(STR(encxml.impcod1,5,0))+"</codigo>")
	fputs(lnFile,"	    		<codigoPorcentaje>"+ALLTRIM(STR(encxml.impporc1,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"	    		<baseImponible>"+ALLTRIM(STR(encxml.impbasi1,10,2))+"</baseImponible>")
	fputs(lnFile,"	    		<valor>"+ALLTRIM(STR(encxml.impval1,10,2))+"</valor>")
	fputs(lnFile,"	    	</totalImpuesto>")
ENDIF
IF encxml.impbasi2>0 then
	fputs(lnFile,"	    	<totalImpuesto>")
	fputs(lnFile,"	    		<codigo>"+ALLTRIM(STR(encxml.impcod2,5,0))+"</codigo>")
	fputs(lnFile,"	    		<codigoPorcentaje>"+ALLTRIM(STR(encxml.impporc2,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"	    		<baseImponible>"+ALLTRIM(STR(encxml.impbasi2,10,2))+"</baseImponible>")
	fputs(lnFile,"	    		<valor>"+ALLTRIM(STR(encxml.impval2,10,2))+"</valor>")
	fputs(lnFile,"	    	</totalImpuesto>")
ENDIF
fputs(lnFile,"    	</totalConImpuestos>")
fputs(lnFile,"    	<motivo>"+ALLTRIM(encxml.motivo)+"</motivo>")
fputs(lnFile,"   	</infoNotaCredito>")
fputs(lnFile,"   	<detalles>")

if reccount('detxml')>0
	SELECT detxml
	GO top
	SCAN
	fputs(lnFile,"   		<detalle>")
	fputs(lnFile,"   			<codigoInterno>"+ALLTRIM(STR(detxml.codpri,10,0))+"</codigoInterno>")
	fputs(lnFile,"   			<codigoAdicional>"+ALLTRIM(STR(detxml.codaux,10,0))+"</codigoAdicional>")
	fputs(lnFile,"   			<descripcion>"+ALLTRIM(detxml.descrip)+"</descripcion>")
	fputs(lnFile,"   			<cantidad>"+ALLTRIM(STR(detxml.canti,18,6))+"</cantidad>")
	fputs(lnFile,"   			<precioUnitario>"+ALLTRIM(STR(detxml.punit,18,6))+"</precioUnitario>")
	fputs(lnFile,"   			<descuento>"+ALLTRIM(STR(detxml.descu,10,2))+"</descuento>")
	fputs(lnFile,"   			<precioTotalSinImpuesto>"+ALLTRIM(STR(detxml.impbase,10,2))+"</precioTotalSinImpuesto>")
	fputs(lnFile,"   			<impuestos>")
	fputs(lnFile,"   				<impuesto>")
	fputs(lnFile,"   					<codigo>"+ALLTRIM(STR(detxml.impcod,5,0))+"</codigo>")
	fputs(lnFile,"   					<codigoPorcentaje>"+ALLTRIM(STR(detxml.imppor,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"   					<tarifa>"+ALLTRIM(STR(detxml.imptarf,10,2))+"</tarifa>")
	fputs(lnFile,"   					<baseImponible>"+ALLTRIM(STR(detxml.impbase,10,2))+"</baseImponible>")
	fputs(lnFile,"   					<valor>"+ALLTRIM(STR(detxml.impval,10,2))+"</valor>")
	fputs(lnFile,"   				</impuesto>")
	fputs(lnFile,"   			</impuestos>")
	fputs(lnFile,"   		</detalle>")
	ENDSCAN
else
	fputs(lnFile,"   		<detalle>")

	fputs(lnFile,"   			<codigoInterno>"+ALLTRIM('99999')+"</codigoInterno>")
	fputs(lnFile,"   			<codigoAdicional>"+ALLTRIM('99999')+"</codigoAdicional>")
	fputs(lnFile,"   			<descripcion>"+ALLTRIM('DESCUENTOS EN VENTAS')+"</descripcion>")
	fputs(lnFile,"   			<cantidad>"+ALLTRIM('1.00')+"</cantidad>")
	fputs(lnFile,"   			<precioUnitario>"+ALLTRIM(STR(encxml.impbasi1+encxml.impbasi2,10,2))+"</precioUnitario>")
	fputs(lnFile,"   			<descuento>"+ALLTRIM(STR(encxml.tdescu,10,2))+"</descuento>")
	fputs(lnFile,"   			<precioTotalSinImpuesto>"+ALLTRIM(STR(encxml.impbasi1+encxml.impbasi2,10,2))+"</precioTotalSinImpuesto>")
	fputs(lnFile,"   			<impuestos>")
	fputs(lnFile,"   				<impuesto>")

	IF encxml.impbasi1>0
		fputs(lnFile,"   					<codigo>"+ALLTRIM(STR(2,5,0))+"</codigo>")
		fputs(lnFile,"   					<codigoPorcentaje>"+iif(encxml.porivax=12,'2','3')+"</codigoPorcentaje>")
		fputs(lnFile,"   					<tarifa>"+ALLTRIM(STR(encxml.porivax,10,2))+"</tarifa>")
		fputs(lnFile,"   					<baseImponible>"+ALLTRIM(STR(encxml.impbasi1,10,2))+"</baseImponible>")
		fputs(lnFile,"   					<valor>"+ALLTRIM(STR(encxml.impval1,10,2))+"</valor>")
	endif
	IF encxml.impbasi2>0
		fputs(lnFile,"   					<codigo>"+ALLTRIM(STR(2,5,0))+"</codigo>")
		fputs(lnFile,"   					<codigoPorcentaje>"+ALLTRIM(STR(0,5,0))+"</codigoPorcentaje>")
		fputs(lnFile,"   					<tarifa>"+ALLTRIM(STR(0,10,2))+"</tarifa>")
		fputs(lnFile,"   					<baseImponible>"+ALLTRIM(STR(encxml.impbasi2,10,2))+"</baseImponible>")
		fputs(lnFile,"   					<valor>"+ALLTRIM(STR(encxml.impval2,10,2))+"</valor>")
	endif

	fputs(lnFile,"   				</impuesto>")
	fputs(lnFile,"   			</impuestos>")
	fputs(lnFile,"   		</detalle>")
endif

fputs(lnFile,"   	</detalles>")
fputs(lnFile,"<infoAdicional>")
fputs(lnFile,'    <campoAdicional nombre="Direccion">'+alltrim(encxml.dirsuj)+'</campoAdicional>')
fputs(lnFile,'<campoAdicional nombre="Telefono">'+alltrim(encxml.stelf)+'</campoAdicional>')
fputs(lnFile,'<campoAdicional nombre="Email">'+alltrim(encxml.emailsuj)+'</campoAdicional>')
fputs(lnFile,'</infoAdicional>')
fputs(lnFile,"</notaCredito>")
fClose(lnFile)
Wait Window "Creando Archivo de Nota de Credito Electronica XML......." NoWait 

if used("encxml")
	select encxml
	use
endif
if used("detxml")
	select detxml
	use
endif
if used("nccxml")
	select nccxml
	use
endif
if used("rucempre")
	select rucempre
	use
endif
if used("empresas")
	select empresas
	use
endif
if used("curxmld")
	select curxmld
	use
endif
if used("curxmle")
	select curxmle
	use
endif
if used("empr")
	select empr
	use
endif
if used("empperi")
	select empperi
	use
endif

RETURN .t.

ENDFUNC


******************
* Generacion de Documento Nota de Debito Cliente
******************
FUNCTION genxmlndc
LPARAMETERS xgencode

LOCAL lnFile, cFILE, xmlclavacc 
CREATE CURSOR encxml (code n(10), ;
	ambiente n(1),;
	emision n(1),;
	clavacc c(50),;
	coddoc c(2),;
	estab c(3),;
	ptoemi c(3),;
	secuen c(10),;
	dirmat c(250),;
	fecemi d(8),;
	direstab c(250),;
	conespec c(5),;
	obligcnt c(2),;
	tiposuj c(2),;
	gremisi c(15),;
	rsocial c(250),;
	numidec c(13),;
	subtot n(10,2),;
	tdescu n(10,2),;
	impcod1 n(1),;
	impporc1 n(1),;
	impbasi1 n(10,2),;
	impval1 n(10,2),;
	impcod2 n(1),;
	impporc2 n(1),;
	impbasi2 n(10,2),;
	impval2 n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icebasi n(10,2),;
	iceval n(10,2),;
	propina n(10,2),;
	impototal n(10,2),;
	moneda c(15),;
	dirsuj c(250),;
	stelf c(10) null,;
	emailsuj c(250),;
	mcoddoc c(2),;
	mnumdoc c(20),;
	mfecha d(8),;
	motivo c(30), ;
	porivax n(2) defa 0 )


CREATE CURSOR detxml (code n(10),;
	codpri n(10),;
	codaux n(10),;
	descrip c(250),;
	canti n(18,6),;
	punit n(10,2),;
	descu n(10,2),;
	precimp n(10,2),;
	impcod n(1),;
	imppor n(1),;
	imptarf n(2),;
	impbase n(10,2),;
	impval n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icetarf n(2),;
	icebasi n(10,2),;
	iceval n(10,2) )
	

q1="select * from periodos;"
if !sqli(q1,'empperi') then
	return
endif

select empperi
go top


q1="select distinct sruc, ssri, stelf, sfax, smail::char(60), saddr, siderepleg, srepleg, sruccontador, nrores, numestb from empresas ;"

if !sqli(q1,'rucempre') then
	return
endif

select 	substr(sruc,1,13) as sruc, ;
		substr(ssri,1,60) as ssri, ;
		nconcero(9,stelf) as stelf, ;
		nconcero(9,sfax) as sfax, ;
		substr(smail,1,60) as smail1, ;
		substr(saddr,1,60) as saddr, ;
		substr(siderepleg,1,1) as siderepleg, ;
		substr(srepleg,1,13) as srepleg, ;
		nconcero(3,numestb) as numestb, ;
		nrores, ;
		substr(sruccontador,1,13) as sruccontador ;
	from rucempre into cursor empresas
	
	
cFILE="NDCELE_"+alltrim(str(xgencode))+".xml"

xmlclavacc = genclaveacceso(xgencode)

** Llenado Cursor Encabezado XML
q1="select d.*,  a.serie as numserie2, a.num as numsecue2, a.fecha as fecha2, a.idsritabla, "+;
"to_char((c.codigo::int2)::int4,'FM09') as docmodificado "+;
"from vdocxml1 d left join  vdocusmall a on (d.linkdoc=a.code) "+;
"left join sritabla c on (a.idsritabla=c.idsritabla) "+;
"where d.code="+alup(xgencode)+";"

IF !sqli(q1,'curxmle') then
	RETURN
ENDIF

SELECT curxmle
GO top
SCAN
	SELECT encxml 
	APPEND BLANK

	Replace encxml.code 	WITH xgencode
	Replace encxml.ambiente WITH curxmle.tipoambi    && 1 pruebas 2 produccion
	Replace encxml.emision 	WITH empperi.tipoemi   && 1 emision normal   2 indiponiblidad del sistema
	Replace encxml.clavacc 	WITH xmlclavacc  && generar clave de acceso 
	Replace encxml.coddoc 	WITH "05"  && 01 fact 04 nc   05  nd  06 gremision 07  retencion
	Replace encxml.estab 	WITH SUBSTR(nconcero(6,curxmle.serie),1,3)
	Replace encxml.ptoemi 	WITH SUBSTR(nconcero(6,curxmle.serie),4,3)
	Replace encxml.secuen 	WITH nconcero(9,curxmle.num)
	*Replace encxml.dirmat 	WITH curxmle.
	Replace encxml.fecemi 	WITH curxmle.fecha
	*Replace encxml.direstab WITH curxmle.
	
	Replace encxml.conespec WITH nconcero(5,empresas.nrores)  && debemos almacenar en datos de la empresa
	Replace encxml.obligcnt WITH "SI" && debemos almacenar en datos de la empresa obligcnt
	Replace encxml.tiposuj 	WITH IIF(ALLTRIM(curxmle.sname)="CONSUMIDOR FINAL","07",IIF(LEN(ALLTRIM(curxmle.sruc))=13,"04",IIF(LEN(ALLTRIM(curxmle.scedula))=10,"05","06")))
*	Replace encxml.gremisi 	WITH curxmle.
	Replace encxml.rsocial 	WITH ALLTRIM(solonl(curxmle.sname))
	Replace encxml.numidec 	WITH IIF(ALLTRIM(curxmle.sname)="CONSUMIDOR FINAL","9999999999999",IIF(LEN(ALLTRIM(curxmle.sruc))=13,ALLTRIM(curxmle.sruc),IIF(LEN(ALLTRIM(curxmle.scedula))=10,ALLTRIM(curxmle.scedula),ALLTRIM(curxmle.spasaporte))))
	Replace encxml.dirsuj   WITH ALLTRIM(solonl(curxmle.saddr))
	Replace encxml.emailsuj WITH iif(isnull(curxmle.smail) or len(alltrim(curxmle.smail))=0,LOWER(ALLTRIM(empresas.smail1)),LOWER(ALLTRIM(curxmle.smail)) )
	Replace encxml.subtot 	WITH curxmle.subtotal
	Replace encxml.tdescu 	WITH curxmle.descuconiva+curxmle.descusiniva
	Replace encxml.porivax	with curxmle.poriva
	
	Replace encxml.impcod1 	WITH 2 && Codigo de IVA

	if encxml.porivax=12
		Replace encxml.impporc1	WITH 2  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
	else
		Replace encxml.impporc1	WITH 3
	endif
	Replace encxml.impbasi1	WITH curxmle.subconiva
	Replace encxml.impval1 	WITH curxmle.ivavalor
	
	Replace encxml.impcod2 	WITH 2
	Replace encxml.impporc2	WITH 0 && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
	Replace encxml.impbasi2	WITH curxmle.subsiniva
	Replace encxml.impval2	WITH 0


	IF curxmle.icevalor>0.00 then
		Replace encxml.icecod 	WITH 0
		Replace encxml.icepor 	WITH 0
		Replace encxml.icebasi 	WITH 0
		Replace encxml.iceval 	WITH 0
	ELSE
		Replace encxml.icecod 	WITH 0
		Replace encxml.icepor 	WITH 0
		Replace encxml.icebasi 	WITH 0
		Replace encxml.iceval 	WITH 0
	endif	
	Replace encxml.propina 	WITH 0.00
	Replace encxml.impototal WITH curxmle.montototal
	Replace encxml.moneda 	WITH "DOLAR"
	Replace encxml.mcoddoc 	WITH curxmle.docmodificado
	Replace encxml.mnumdoc 	WITH SUBSTR(nconcero(6,curxmle.numserie2),1,3)+"-"+SUBSTR(nconcero(6,curxmle.numserie2),4,3)+"-"+nconcero(9,curxmle.numsecue2)
	Replace encxml.mfecha 	WITH curxmle.fecha2
	Replace encxml.motivo 	WITH substr(curxmle.concepto,1,30)

	Replace encxml.stelf 	WITH iif(isnull(curxmle.stelf),"0000000000",iif(len(alltrim(curxmle.stelf))=0,iif(len(alltrim(curxmle.scel))=0,empresas.stelf,curxmle.scel),curxmle.stelf))

	if len(alltrim(encxml.stelf))=0 or isnull(encxml.stelf)
		Replace encxml.stelf 	WITH "000000000"
	endif
	
	if len(alltrim(encxml.dirsuj))=0 then
		Replace encxml.dirsuj   WITH "MACHALA"
	endif

	SELECT curxmle

ENDSCAN

** llenado de Cursor de Detalle de XML
q1="select * from vdocui where code="+alup(xgencode)+";"
IF !sqli(q1,'curxmld') then
	RETURN
ENDIF

SELECT curxmld
GO top
SCAN
	SELECT detxml 
	APPEND BLANK
	
	Replace detxml.code 	WITH xgencode
	Replace detxml.codpri 	WITH curxmld.iditem
	Replace detxml.codaux 	WITH curxmld.icode
	Replace detxml.descrip 	WITH solonl(curxmld.iname)
	Replace detxml.canti 	WITH curxmld.qty
	Replace detxml.punit 	WITH curxmld.punitario
	Replace detxml.descu 	WITH curxmld.descuento
	Replace detxml.precimp 	WITH curxmld.valconiva
	IF curxmld.isiva=.t. THEN
		Replace detxml.impcod 	WITH 2 && Codigo de IVA
		if encxml.porivax=12
			Replace detxml.imppor 	WITH 2  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
		else
			Replace detxml.imppor	WITH 3
		endif

		Replace detxml.imptarf 	WITH encxml.porivax  
		Replace detxml.impbase 	WITH curxmld.subtot
		Replace detxml.impval 	WITH curxmld.valconiva
	ELSE
		Replace detxml.impcod 	WITH 2 && Codigo de IVA
		Replace detxml.imppor 	WITH 0  && cod 0 para 0%  y cod 2 para 12%   codigo 6 para no objeto de impuesto
		Replace detxml.imptarf 	WITH 0  
		Replace detxml.impbase 	WITH curxmld.subtot
		Replace detxml.impval 	WITH 0.00
	endif
	Replace detxml.icecod 	WITH 0
	Replace detxml.icepor 	WITH 0
	Replace detxml.icetarf 	WITH 0
	Replace detxml.icebasi 	WITH 0
	Replace detxml.iceval	WITH 0
	
	SELECT curxmld
	
ENDSCAN

lnFile=FCreate(cFILE)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(cFILE)
	If lnFile<0
		Messagebox("Error al Crear Archivo XML",0,empresa)
		Return(.f.)
	EndIf	
EndIf
fputs(lnFile,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
fputs(lnFile,'<notaDebito id="comprobante" version="1.0.0">')
fputs(lnFile,"	<infoTributaria>")
fputs(lnFile,"		<ambiente>"+alltrim(str(encxml.ambiente))+"</ambiente>")																	&&
fputs(lnFile,"		<tipoEmision>"+alltrim(str(encxml.emision))+"</tipoEmision>")																&&
fputs(lnFile,"		<razonSocial>"+alltrim(empresas.ssri)+"</razonSocial>")
fputs(lnFile,"		<nombreComercial>"+alltrim(empresas.ssri)+"</nombreComercial>")
fputs(lnFile,"		<ruc>"+alltrim(empresas.sruc)+"</ruc>")
fputs(lnFile,"		<claveAcceso>"+alltrim(encxml.clavacc)+"</claveAcceso>")			
fputs(lnFile,"		<codDoc>"+alltrim(encxml.coddoc)+"</codDoc>") 
fputs(lnFile,"		<estab>"+alltrim(encxml.estab)+"</estab>") 
fputs(lnFile,"		<ptoEmi>"+alltrim(encxml.ptoemi)+"</ptoEmi>") 
fputs(lnFile,"		<secuencial>"+alltrim(encxml.secuen)+"</secuencial>") 
fputs(lnFile,"		<dirMatriz>"+alltrim(empresas.saddr)+"</dirMatriz>")
fputs(lnFile,"	</infoTributaria>")
fputs(lnFile,"    <infoNotaDebito>")
fputs(lnFile,"    	<fechaEmision>"+devfeclet(encxml.fecemi,7)+"</fechaEmision>")
fputs(lnFile,"    	<dirEstablecimiento>"+alltrim(empresas.saddr)+"</dirEstablecimiento>")
fputs(lnFile,"    	<tipoIdentificacionComprador>"+alltrim(encxml.tiposuj)+"</tipoIdentificacionComprador>")  &&&
fputs(lnFile,"    	<razonSocialComprador>"+alltrim(encxml.rsocial)+"</razonSocialComprador>")
fputs(lnFile,"    	<identificacionComprador>"+alltrim(encxml.numidec)+"</identificacionComprador>")
fputs(lnFile,"    	<contribuyenteEspecial>"+alltrim(empresas.nrores)+"</contribuyenteEspecial>")
fputs(lnFile,"    	<obligadoContabilidad>"+alltrim(encxml.obligcnt)+"</obligadoContabilidad>")   
fputs(lnFile,"    	<codDocModificado>"+alltrim(encxml.mcoddoc)+"</codDocModificado>")
fputs(lnFile,"    	<numDocModificado>"+alltrim(encxml.mnumdoc)+"</numDocModificado>")
fputs(lnFile,"    	<fechaEmisionDocSustento>"+devfeclet(encxml.mfecha,7)+"</fechaEmisionDocSustento>")
fputs(lnFile,"    	<totalSinImpuestos>"+alltrim(STR(encxml.subtot,10,2))+"</totalSinImpuestos>")
*fputs(lnFile,"    	<valorModificacion>"+alltrim(STR(encxml.impototal,10,2))+"</valorModificacion>")
*fputs(lnFile,"    	<moneda>DOLAR</moneda>")
fputs(lnFile,"    	<impuestos>")
IF encxml.impbasi1>0 then
	fputs(lnFile,"	    	<impuesto>")
	fputs(lnFile,"	    		<codigo>"+ALLTRIM(STR(encxml.impcod1,5,0))+"</codigo>")
	fputs(lnFile,"	    		<codigoPorcentaje>"+ALLTRIM(STR(encxml.impporc1,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"	    		<tarifa>12.00</tarifa>")
	fputs(lnFile,"	    		<baseImponible>"+ALLTRIM(STR(encxml.impbasi1,10,2))+"</baseImponible>")
	fputs(lnFile,"	    		<valor>"+ALLTRIM(STR(encxml.impval1,10,2))+"</valor>")
	fputs(lnFile,"	    	</impuesto>")
ENDIF
IF encxml.impbasi2>0 then
	fputs(lnFile,"	    	<impuesto>")
	fputs(lnFile,"	    		<codigo>"+ALLTRIM(STR(encxml.impcod2,5,0))+"</codigo>")
	fputs(lnFile,"	    		<codigoPorcentaje>"+ALLTRIM(STR(encxml.impporc2,5,0))+"</codigoPorcentaje>")
	fputs(lnFile,"	    		<tarifa>0.00</tarifa>")
	fputs(lnFile,"	    		<baseImponible>"+ALLTRIM(STR(encxml.impbasi2,10,2))+"</baseImponible>")
	fputs(lnFile,"	    		<valor>"+ALLTRIM(STR(encxml.impval2,10,2))+"</valor>")
	fputs(lnFile,"	    	</impuesto>")
ENDIF
fputs(lnFile,"    	</impuestos>")
fputs(lnFile,"    	<valorTotal>"+alltrim(STR(encxml.impototal,10,2))+"</valorTotal>")
fputs(lnFile,"   	</infoNotaDebito>")
fputs(lnFile,"   	<motivos>")
SELECT detxml
GO top
SCAN
	fputs(lnFile,"   		<motivo>")
	fputs(lnFile,"    			<razon>"+ALLTRIM(encxml.motivo)+"</razon>")
	fputs(lnFile,"   			<valor>"+ALLTRIM(STR(detxml.precimp,10,2))+"</valor>")
	fputs(lnFile,"   		</motivo>")
ENDSCAN
fputs(lnFile,"   	</motivos>")
fputs(lnFile,"<infoAdicional>")
fputs(lnFile,'<campoAdicional nombre="Direccion">'+alltrim(encxml.dirsuj)+'</campoAdicional>')
fputs(lnFile,'<campoAdicional nombre="Telefono">'+alltrim(encxml.stelf)+'</campoAdicional>')
fputs(lnFile,'<campoAdicional nombre="Email">'+alltrim(encxml.emailsuj)+'</campoAdicional>')
fputs(lnFile,'</infoAdicional>')
fputs(lnFile,"</notaDebito>")
fClose(lnFile)
Wait Window "Creando Archivo de Nota de Debito Electronica XML......." NoWait 

if used("encxml")
	select encxml
	use
endif
if used("detxml")
	select detxml
	use
endif
if used("nccxml")
	select nccxml
	use
endif
if used("rucempre")
	select rucempre
	use
endif
if used("empresas")
	select empresas
	use
endif
if used("curxmld")
	select curxmld
	use
endif
if used("curxmle")
	select curxmle
	use
endif
if used("empr")
	select empr
	use
endif
if used("empperi")
	select empperi
	use
endif



RETURN .t.


ENDFUNC


***********************************************
* Generacion de Retencion Electronica
***********************************************
FUNCTION genxmlret
LPARAMETERS xgencode

LOCAL lnFile, cFILE, xmlclavacc 

CREATE CURSOR encxml (code n(10), ;
	ambiente n(1),;
	emision n(1),;
	clavacc c(50),;
	coddoc c(2),;
	estab c(3),;
	ptoemi c(3),;
	secuen c(10),;
	dirmat c(250),;
	fecemi d(8),;
	direstab c(250),;
	conespec c(5),;
	obligcnt c(2),;
	tiposuj c(2),;
	gremisi c(15),;
	rsocial c(250),;
	numidec c(13),;
	subtot n(10,2),;
	tdescu n(10,2),;
	impcod1 n(1),;
	impporc1 n(1),;
	impbasi1 n(10,2),;
	impval1 n(10,2),;
	impcod2 n(1),;
	impporc2 n(1),;
	impbasi2 n(10,2),;
	impval2 n(10,2),;
	icecod n(1),;
	icepor n(1),;
	icebasi n(10,2),;
	iceval n(10,2),;
	impototal n(10,2),;
	moneda c(15),;
	dirsuj c(250),;
	stelf c(10) null,;
	emailsuj c(250),;
	coddocsus c(2),;
	numdocsus c(20),;
	fecdocsus d(8), ;
	perifis c(10), ;
	porivax n(2) defa 0 )

q1="select * from periodos;"
if !sqli(q1,'empperi') then
	return
endif

select empperi
go top

CREATE CURSOR retxml (code n(10),;
	codret n(2),;
	baseimp n(10,2),;
	codpor n(2),;
	porret n(10,2),;
	codtarf n(2),;
	valor n(10,2) )

q1="select distinct sruc, ssri, stelf, sfax, smail::char(60), saddr, siderepleg, srepleg, sruccontador, nrores, numestb from empresas ;"

if !sqli(q1,'rucempre') then
	return
endif

select 	substr(sruc,1,13) as sruc, ;
		substr(ssri,1,60) as ssri, ;
		nconcero(9,stelf) as stelf, ;
		nconcero(9,sfax) as sfax, ;
		substr(smail,1,60) as smail1, ;
		substr(saddr,1,60) as saddr, ;
		substr(siderepleg,1,1) as siderepleg, ;
		substr(srepleg,1,13) as srepleg, ;
		nconcero(3,numestb) as numestb, ;
		nrores, ;
		substr(sruccontador,1,13) as sruccontador ;
	from rucempre into cursor empresas
	
cFILE="RETELE_"+alltrim(str(xgencode))+".xml"

xmlclavacc = genclaveaccesoret(xgencode)

** Llenado Cursor Encabezado XML
q1="select * from vdocxml2 where code="+alup(xgencode)+";"

*!*	q1="select a.*, d.cliente, c.cretri, d.sname, d.sruc, d.scedula, x.spasaporte, x.smail "+;
*!*			"from aneiva a left join vdocusmall d on (a.code=d.code) "+;
*!*					     " left join docuse c on (d.iddocu=c.iddocu) "+;
*!*						 " left join vdocxml1 x on (a.code=x.code) "+;
*!*			"where a.code="+alup(xgencode)+";"
*!*			

IF !sqli(q1,'curxmle') then
	RETURN
ENDIF

q1="select * from vdocxml2 where code="+alup(xgencode)+";"
If !sqli(q1,'cRetenc') Then
	Return
EndIf

SELECT curxmle
GO top
SCAN
	SELECT encxml 
	APPEND BLANK
	Replace encxml.code 	WITH xgencode
	Replace encxml.ambiente WITH curxmle.tipoambi    && 1 pruebas 2 produccion
	Replace encxml.emision 	WITH empperi.tipoemi   && 1 emision normal   2 indiponiblidad del sistema
	Replace encxml.clavacc 	WITH xmlclavacc  && generar clave de acceso 
	Replace encxml.coddoc 	WITH "07"  && 01 fact 04 nc   05  nd  06 gremision 07  retencion
	Replace encxml.estab 	WITH SUBSTR(nconcero(6,cRetenc.serieret),1,3)
	Replace encxml.ptoemi 	WITH SUBSTR(nconcero(6,cRetenc.serieret),4,3)
	Replace encxml.secuen 	WITH nconcero(9,cRetenc.secueret)
	Replace encxml.fecemi 	WITH cRetenc.fecha
	Replace encxml.conespec WITH nconcero(5,empresas.nrores)   && debemos almacenar en datos de la empresa
	Replace encxml.obligcnt WITH "SI" && debemos almacenar en datos de la empresa obligcnt
	Replace encxml.tiposuj 	WITH IIF(ALLTRIM(cRetenc.sname)="CONSUMIDOR FINAL","07",IIF(LEN(ALLTRIM(cRetenc.sruc))=13,"04",IIF(LEN(ALLTRIM(cRetenc.scedula))=10,"05","06")))
	Replace encxml.rsocial 	WITH ALLTRIM(solonl(cRetenc.sname))
	Replace encxml.numidec 	WITH IIF(ALLTRIM(cRetenc.sname)="CONSUMIDOR FINAL","9999999999999",IIF(LEN(ALLTRIM(cRetenc.sruc))=13,ALLTRIM(cRetenc.sruc),IIF(LEN(ALLTRIM(cRetenc.scedula))=10,ALLTRIM(cRetenc.scedula),ALLTRIM(cRetenc.spasaporte))))
	Replace encxml.dirsuj   WITH ALLTRIM(solonl(cRetenc.saddr))
	Replace encxml.emailsuj WITH iif(isnull(cRetenc.smail) or len(alltrim(cRetenc.smail))=0,LOWER(ALLTRIM(empresas.smail1)),LOWER(ALLTRIM(cRetenc.smail)) )
	Replace encxml.stelf    WITH ALLTRIM(cRetenc.stelf)

	if len(alltrim(encxml.stelf))=0 or isnull(encxml.stelf) 
		Replace encxml.stelf 	WITH	'0'
	endif

	Replace encxml.moneda 	WITH "DOLAR"
	Replace encxml.perifis 	WITH alltrim(nconcero(2,month(cRetenc.fecha)))+"/"+alltrim(nconcero(4,year(cRetenc.fecha)))
	Replace encxml.stelf 	WITH iif(isnull(curxmle.stelf),"0000000000",iif(len(alltrim(curxmle.stelf))=0,iif(len(alltrim(curxmle.scel))=0,empresas.stelf,curxmle.scel),curxmle.stelf))

	if len(alltrim(encxml.stelf))=0 or isnull(encxml.stelf)
		Replace encxml.stelf 	WITH "000000000"
	endif

	if len(alltrim(encxml.dirsuj))=0 then
		Replace encxml.dirsuj   WITH "MACHALA"
	endif


	SELECT curxmle

ENDSCAN

lnFile=FCreate(cFILE)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(cFILE)
	If lnFile<0
		Messagebox("Error al Crear Archivo XML",0,empresa)
		Return(.f.)
	EndIf	
EndIf
fputs(lnFile,'<?xml version="1.0" encoding="UTF-8" standalone="yes"?>')
fputs(lnFile,'<comprobanteRetencion id="comprobante" version="1.0.0">')
fputs(lnFile,"	<infoTributaria>")
fputs(lnFile,"		<ambiente>"+alltrim(str(encxml.ambiente))+"</ambiente>")																	&&
fputs(lnFile,"		<tipoEmision>"+alltrim(str(encxml.emision))+"</tipoEmision>")																&&
fputs(lnFile,"		<razonSocial>"+alltrim(empresas.ssri)+"</razonSocial>")
fputs(lnFile,"		<nombreComercial>"+alltrim(empresas.ssri)+"</nombreComercial>")
fputs(lnFile,"		<ruc>"+alltrim(empresas.sruc)+"</ruc>")
fputs(lnFile,"		<claveAcceso>"+alltrim(encxml.clavacc)+"</claveAcceso>")			
fputs(lnFile,"		<codDoc>"+alltrim(encxml.coddoc)+"</codDoc>") 
fputs(lnFile,"		<estab>"+alltrim(encxml.estab)+"</estab>") 
fputs(lnFile,"		<ptoEmi>"+alltrim(encxml.ptoemi)+"</ptoEmi>") 
fputs(lnFile,"		<secuencial>"+alltrim(encxml.secuen)+"</secuencial>") 
fputs(lnFile,"		<dirMatriz>"+alltrim(empresas.saddr)+"</dirMatriz>")
fputs(lnFile,"	</infoTributaria>")
fputs(lnFile,"    <infoCompRetencion>")
fputs(lnFile,"    	<fechaEmision>"+devfeclet(encxml.fecemi,7)+"</fechaEmision>")
fputs(lnFile,"    	<dirEstablecimiento>"+alltrim(empresas.saddr)+"</dirEstablecimiento>")
fputs(lnFile,"    	<contribuyenteEspecial>"+alltrim(empresas.nrores)+"</contribuyenteEspecial>")
fputs(lnFile,"    	<obligadoContabilidad>"+alltrim(encxml.obligcnt)+"</obligadoContabilidad>")   
fputs(lnFile,"    	<tipoIdentificacionSujetoRetenido>"+alltrim(encxml.tiposuj)+"</tipoIdentificacionSujetoRetenido>")  &&&
fputs(lnFile,"    	<razonSocialSujetoRetenido>"+alltrim(encxml.rsocial)+"</razonSocialSujetoRetenido>")
fputs(lnFile,"    	<identificacionSujetoRetenido>"+alltrim(encxml.numidec)+"</identificacionSujetoRetenido>")
fputs(lnFile,"    	<periodoFiscal>"+alltrim(encxml.perifis)+"</periodoFiscal>")  && revisa
fputs(lnFile,"   	</infoCompRetencion>")
fputs(lnFile,"   	<impuestos>")
select cRetenc
if RecCount("cRetenc")>0 then
	go top
	scan
		fputs(lnFile,"              <impuesto>")
		if SUBSTR(cRetenc.rubtab,1,4)="RETE"
			fputs(lnFile,"                  <codigo>1</codigo>")
			fputs(lnFile,"                  <codigoRetencion>"+alltrim(cRetenc.codigoret)+"</codigoRetencion>")
			
		else

			fputs(lnFile,"                  <codigo>2</codigo>")
			do case cRetenc.rubtab
			case cRetenc.rubtab2="721" 
				if cRetenc.valcal=0
					fputs(lnFile,"                  <codigoRetencion>7</codigoRetencion>")
				else
					fputs(lnFile,"                  <codigoRetencion>1</codigoRetencion>")				
				endif
			case cRetenc.rubtab2="723"
				if cRetenc.valcal=0
					fputs(lnFile,"                  <codigoRetencion>8</codigoRetencion>")
				else
					fputs(lnFile,"                  <codigoRetencion>2</codigoRetencion>")				
				endif
			case cRetenc.rubtab2="725" 
				fputs(lnFile,"                  <codigoRetencion>3</codigoRetencion>")				
			case cRetenc.rubtab2="727"
				fputs(lnFile,"                  <codigoRetencion>9</codigoRetencion>")				
			case cRetenc.rubtab2="729"
				fputs(lnFile,"                  <codigoRetencion>10</codigoRetencion>")				
			endcase

		endif
		fputs(lnFile,"                  <baseImponible>"+alltrim(STR(cRetenc.monto,10,2))+"</baseImponible>")            
		fputs(lnFile,"                  <porcentajeRetener>"+alltrim(STR(cRetenc.valcal,10,2))+"</porcentajeRetener>")            
		fputs(lnFile,"                  <valorRetenido>"+alltrim(STR(cRetenc.valor,10,2))+"</valorRetenido>")            
		fputs(lnFile,"                  <codDocSustento>"+alltrim(cRetenc.tipdocsustento)+"</codDocSustento>")            
		fputs(lnFile,"                  <numDocSustento>"+nconcero(6,cRetenc.numserie2)+nconcero(9,cRetenc.numsecue2)+"</numDocSustento>")            
		fputs(lnFile,"                  <fechaEmisionDocSustento>"+devfeclet(cRetenc.fecdocadq,7)+"</fechaEmisionDocSustento>")
		fputs(lnFile,"              </impuesto>")
	endscan
endif
fputs(lnFile,"   	</impuestos>")
fputs(lnFile,"<infoAdicional>")
fputs(lnFile,'<campoAdicional nombre="Direccion">'+alltrim(encxml.dirsuj)+'</campoAdicional>')
fputs(lnFile,'<campoAdicional nombre="Telefono">'+alltrim(encxml.stelf)+'</campoAdicional>')
fputs(lnFile,'<campoAdicional nombre="Email">'+alltrim(encxml.emailsuj)+'</campoAdicional>')
fputs(lnFile,'</infoAdicional>')
fputs(lnFile,"</comprobanteRetencion>")
fClose(lnFile)
Wait Window "Creando Archivo de Comprobante de Retencion Electronica XML......." NoWait 

if used("encxml")
	select encxml
	use
endif
if used("detxml")
	select detxml
	use
endif
if used("retxml")
	select retxml
	use
endif
if used("rucempre")
	select rucempre
	use
endif
if used("empresas")
	select empresas
	use
endif
if used("curxmld")
	select curxmld
	use
endif
if used("curxmle")
	select curxmle
	use
endif
if used("empr")
	select empr
	use
endif
if used("cRetenc")
	select cRetenc
	use
endif

if used("empperi")
	select empperi
	use
endif


RETURN .t.


ENDFUNC


*************************************
* TICKET DOCUMENTO ELECTRONICO
*************************************
procedure ticketde
local fila, arch, ni, columnas, ndoc, lnfile, fi
columnas=40
set echo off
set talk off
arch=alltrim(nomunico())+'.txt'
lnFile=FCreate(arch)
If lnFile<0
	fClose(lnFile)
	lnFile=FCreate(arch)
	If lnFile<0
		Messagebox("Error al Crear Archivo de impresion "+chr(13)+cFILE,0,empresa)
		Return(.f.)
	EndIf	
EndIf

if used('documents')
	sele documents
	go top
else
	return
endif

fila=2
ni=0

do case
case like('*FACTURA%ELECTRONICA*',nomdoc)
	ndoc='FACTURA ELECTRONICA'
case like('*NOTA DE VENTA*',nomdoc)
	ndoc='NOTA DE VENTA'
case like('*NOTA DE CREDITO ELECTRONICA*',nomdoc)
	ndoc='NOTA DE CREDITO ELECTRONICA'
case like('*NOTA DE DEBITO ELECTRONICA*',nomdoc)
	ndoc='NOTA DE DEBITO ELECTRONICA'
other
	ndoc=nomdoc
endcase	
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim(achar(empresa2))))/2)+achar(empresa2))
fputs(lnFile,space((columnas-len(alltrim(achar(diremp))))/2)+achar(diremp))
*fputs(lnFile,space((columnas-len(alltrim(achar())))/2)+achar(empresaruc)) RUC EMPRESA EMISORA
fputs(lnFile,' RUC 0790012003001 ')
fputs(lnFile,' ')
fputs(lnFile,' Telefono 072-930118')
fputs(lnFile,' ')
fputs(lnFile,' Contrib.Especial Resolucion Nro.389')
fputs(lnFile,' del 9 de Mayo de 2001.')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim(achar("DOCUMENTO ELECTRONICO"))))/2)+achar("DOCUMENTO ELECTRONICO"))
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim(ndoc)))/2)+alltrim(ndoc))
fputs(lnFile,' ')
fputs(lnFile,' NUMERO: '+nconcero(6,serie)+' '+nconcero(9,num))
fputs(lnFile,' ')
fputs(lnFile,'Cod. Trans: '+nconcero(9,code))
fputs(lnFile,'Clave Acceso: '+alltrim(clave))
*fputs(lnFile,'Autorizacion: '+nconcero(6,code))
*fputs(lnFile,'  Cliente: CONSUMIDOR FINAL')
fputs(lnFile,'Cliente: '+substr(Alltrim(sname),1,30))
fputs(lnFile,'Direccion: '+substr(Alltrim(saddr),1,27))
fputs(lnFile,'eMail: '+substr(Alltrim(smail),1,30))
fputs(lnFile,'RUC: '+substr(Alltrim(sruc),1,22))
fputs(lnFile,'Cedula: '+substr(Alltrim(scedula),1,22))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'FECHA:      '+substr(achar(fecgra),1,len(achar(fecgra))-6))
fputs(lnFile,'VENDEDOR:   '+substr(VENDEDOR,1,22))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'CANT   UNI      UNITARIO      VALOR   ')
fputs(lnFile,'--------------------------------------')
do while !eof()
	fputs(lnFile,str(icode,7,0)+' '+substr(iname,1,38)+'  '+str(qty,6,2)+' '+substr(unidad,1,1)+;
			' '+STR(iif(isiva,round(punitario*(1+iva/100),6),round(punitario,6)),10,4)+;
			' '+numtxt(iif(isiva,round(punitario*qty*(1+iva/100),2),round(punitario*qty,2)),10)+;
			' '+iif(isiva,'*',''))
	ni=ni+1
	skip
enddo
go top
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'# Items: '+str(ni,3))
fputs(lnFile,'SUMATORIA: '+numtxt(subtotal,8))
fputs(lnFile,'DESCUENTO: '+numtxt(descuconiva+descusiniva,8))
fputs(lnFile,'SUBTOTAL: '+numtxt((subtotal-(descuconiva+descusiniva)),8))
fputs(lnFile,'IVA: '+numtxt(valoriva,8))
fputs(lnFile,'TOTAL: '+numtxt(montototal,8))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'FORMA DE PAGO DEL DOCUMENTO')
fputs(lnFile,' '+alltrim(fc1))
fputs(lnFile,' '+alltrim(fc2))
fputs(lnFile,' '+alltrim(fc3))
fputs(lnFile,'--------------------------------------')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,'--------------------------------------')
fputs(lnFile,'FIRMA DE CLIENTE')
fputs(lnFile,' ')
fputs(lnFile,' ')
fputs(lnFile,space((columnas-len(alltrim('**GRACIAS POR SU COMPRA**')))/2)+'**GRACIAS POR SU COMPRA**')
fputs(lnFile,'')
fputs(lnFile,'      email: quevall@yahoo.es       ')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fputs(lnFile,'')
fClose(lnFile)
* fi='type '+sys(2003)+'\'+arch+' >prn'
fi='type '+sys(2003)+'\'+arch+' > lpt3'
! &fi
fi=sys(2003)+'\'+arch
*delete file &fi
*************************************************
* Fin de Generacion del Archivo de Ticketera
*************************************************

*******************************
** Envio de Correo
*******************************
PROCEDURE SendEmail(tcType, tcFrom, tcTo, tcSubject, tcBody, tcFiles)
    LOCAL llEmailStatus, lcErrorHandlerWas, lcType
    lcErrorHandlerWas = ON("ERROR")
    lcType = ""
    WAIT WINDOW "     Espere por favor... Email esta siendo generado y enviando     " NOWAIT
    DO CASE
    CASE tcType = 4
        llEmailStatus = SendViaCDOsys(tcFrom, tcTo, tcSubject, tcBody, @tcFiles)
        lcType = "CDOSYS"
    ENDCASE

    IF !EMPTY(lcErrorHandlerWas)
        ON ERROR &lcErrorHandlerWas
    ELSE
        ON ERROR
    ENDIF

    WAIT CLEAR

    IF llEmailStatus
*     MESSAGEBOX("Your message to " + tcTo + " has been sent.",64,"EMAIL SENT SUCCESSFULLY VIA " + lcType)
		wait 'Enviado RIDE de Documento' window nowait timeout 10
    ELSE
*	    MESSAGEBOX("Your message to " + tcTo + " was not sent.",64,"EMAIL PROBLEM WITH " + lcType)	
	    wait 'Error de Envio de Correo Electronico' window nowait timeout 10
    ENDIF

ENDPROC

FUNCTION SendViaCDOsys(tcFrom, tcTo, tcSubject, tcBody, tcFiles)
    ON ERROR RETURN(.F.)
    Local lcSchema, loConfig, loMsg, loAtt, lnCountAttachments
    lcSchema = "http://schemas.microsoft.com/cdo/configuration/"
    loConfig = CREATEOBJECT("CDO.Configuration")
    WITH loConfig.FIELDS
        .ITEM(lcSchema + "smtpserverport") = 587 && && SMTP Port 465 Poner en tabla Empresas
        .ITEM(lcSchema + "sendusing") = 2 && Send it using port 2
        .ITEM(lcSchema + "smtpserver") = "smtp-mail.outlook.com" &&&& host of smtp server  Poner en tabla Empresas
        .ITEM(lcSchema + "smtpauthenticate") = 1 && Authenticate  1
        .ITEM(lcSchema + "smtpusessl")=1 && 1
*		.ITEM(lcSchema + "sendusername") = "quevall.facele@hotmail.com" && Username  && Poner en Tabla Empresas
*        .ITEM(lcSchema + "sendpassword") = "REGALOS1234" && Password  && poner en tabla Empresas
		.ITEM(lcSchema + "sendusername") = "quevall.facele@hotmail.com" && Username  && Poner en Tabla Empresas
        .ITEM(lcSchema + "sendpassword") = "REGALOS123" && Password  && poner en tabla Empresas

        .UPDATE
    ENDWITH

    loMsg = CREATEOBJECT ("CDO.Message")
    loMsg.Configuration = loConfig
    WITH loMsg
        .TO = tcTo
        .From = tcFrom
        .Subject = tcSubject
        .TextBody = tcBody
       * .AddAttachMent(tcFiles)
*       	IF TYPE("tcFiles",1) = "A"
		    FOR lnCountAttachments = 1 TO ALEN(tcFiles)
	    		 loAtt=.AddAttachment(tcFiles(lnCountAttachments))
	    	ENDFOR
*   		ENDIF
        .SEND()

    ENDWITH
    STORE .NULL. to loConfig, loMsg
    RELEASE loConfig, loMsg
    RETURN .T.
ENDFUNC

*******************************
** Envio de Correo
*******************************
PROCEDURE SendEmail1(tcType, tcFrom, tcTo, tcSubject, tcBody, tcFiles)
    LOCAL llEmailStatus, lcErrorHandlerWas, lcType
    lcErrorHandlerWas = ON("ERROR")
    lcType = ""
    WAIT WINDOW "     Espere por favor... Email esta siendo generado y enviando     " NOWAIT
    DO CASE
    CASE tcType = 4
        llEmailStatus = SendViaCDOsys1(tcFrom, tcTo, tcSubject, tcBody, tcFiles)
        lcType = "CDOSYS"
    ENDCASE

    IF !EMPTY(lcErrorHandlerWas)
        ON ERROR &lcErrorHandlerWas
    ELSE
        ON ERROR
    ENDIF

    WAIT CLEAR

    IF llEmailStatus
		wait 'Doc. enviado...' window nowait 
    ELSE
	    MESSAGEBOX("Su mensaje a " + tcTo + " no se ha enviado!!!",64,"EMAIL PROBLEM WITH " + lcType)	
    ENDIF

ENDPROC

*******************************************************************************************************

FUNCTION SendViaCDOsys1(tcFrom, tcTo, tcSubject, tcBody, tcFiles)
    ON ERROR RETURN(.F.)
    Local lcSchema, loConfig, loMsg, loAtt, lnCountAttachments
    lcSchema = "http://schemas.microsoft.com/cdo/configuration/"
    loConfig = CREATEOBJECT("CDO.Configuration")
    WITH loConfig.FIELDS
        .ITEM(lcSchema + "smtpserverport") = 465 && && SMTP Port 465 Poner en tabla Empresas
        .ITEM(lcSchema + "sendusing") = 2 && Send it using port 2
        .ITEM(lcSchema + "smtpserver") = "smtp.mail.yahoo.com" &&&& host of smtp server  Poner en tabla Empresas
        .ITEM(lcSchema + "smtpauthenticate") = 1 && Authenticate  1
        .ITEM(lcSchema + "smtpusessl")=1 && 1

        .ITEM(lcSchema + "sendusername") = "quevall@yahoo.es" && Username  && Poner en Tabla Empresas

        .ITEM(lcSchema + "sendpassword") = "marzoquezada" && Password  && poner en tabla Empresas
        .UPDATE
    ENDWITH

    loMsg = CREATEOBJECT ("CDO.Message")
    loMsg.Configuration = loConfig
    WITH loMsg
        .TO = tcTo
        .From = tcFrom
        .Subject = tcSubject
        .TextBody = tcBody
        .AddAttachMent(tcFiles)

*        loAtt=.AddAttachment(tcFiles)

        .SEND()
    ENDWITH
    STORE .NULL. to loConfig, loMsg
    RELEASE loConfig, loMsg
    RETURN .T.
ENDFUNC



***********************************
*   Envio de email via OUTLOOK
***********************************
Procedure EMAILO(tcTo, tcSubject, tcBody, tcFiles)

#DEFINE MAILITEM 0
#DEFINE IMPORTANCELOW 0
#DEFINE IMPORTANCENORMAL 1
#DEFINE IMPORTANCEHIGH 2

oOutLookObject = CreateObject("Outlook.Application")
oEmailItem = oOutLookObject.CreateItem(MAILITEM)

WITH oEmailItem
  * .Recipients.Add("kleinehassler@gmail.com") && uses the Recipients collection
   .Recipients.Add(tcTo)
   .Subject = tcSubject
   .Importance = IMPORTANCENORMAL
   .Body = tcBody
   FOR lnCountAttachments = 1 TO ALEN(tcFiles)
        .Attachments.ADD(tcFiles(lnCountAttachments))
   ENDFOR
*   .Attachments.Add(tcFiles) && Note that the fully qualified path and file is required.
   .Send
ENDWITH
RELEASE oEmailItem
RELEASE oOutLookObject

ENDPROC

*************************************
