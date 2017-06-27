*!*	SELE A AS CODIGO, B AS NOMBRE, E AS RUC, F AS CIUDAD, iif(empty(i),G,i) AS DIRECCION, l as telefono ;
*!*	FROM proveedores_G ;
*!*	WHERE (!empty(e) or !empty(b)) and A<>'CODIGO' INTO TABLE proveedores_G1


if !dg('CIUD')
	WAIT 'ERROR EN CIUDADES' WIND NOWAIT
	RETURN
ENDIF

if !dg('TICL')
	WAIT 'ERROR EN TIPOS DE proveedores' WIND NOWAIT
	RETURN
ENDIF

IF !USED('proveedores_g1')
	USE proveedores_g1.dbf IN 0 SHARED
ENDIF

SELE proveedores_g1
replace all telefono with strtran(telefono,'-','')

replace all nombre    with strtran(nombre,"'","")
replace all nombre    with strtran(nombre,'"',"")

GO TOP
SCAN
	ncodigo=0
	q1="select max(scode)::int4 as coda from sujetos "
	if sqli(q1,'coda')
		sele coda
		ncodigo=iif(isnull(coda.coda),1,coda.coda+1)
	endif
	
	cate=1190
	
	ciud=0
	
	sele ciudades
	go top
	locate for alltrim(valorda)=alltrim(proveedores_g1.ciudad)
	if found()
		ciud=ciudades.iddato
	else
		ciud=3892
	endif
		
	sele proveedores_g1

	r=iif(len(alltrim(ruc))=10,"scedula="+alup(ruc),;
	  iif(len(alltrim(ruc))=13,"sruc="+alup(ruc),;
	  	  alup(.t.)))

	q1="select scode from sujetos where "+r+" or sname like '%"+alltrim(upper(nombre))+"%' or ssri like '%"+alltrim(upper(nombre))+"%'"
	if sqli(q1,'sujeto')
		if reccount('sujeto')=0
			sele proveedores_g1
			q1="insert into sujetos ( scode, isempleado, isproveedor, isproductor, iscliente, issocio, sname, ssri, "+;
						" saddr, stelf, smoney, sprov, sciudad, stag, numord, tipcli, scedula, sruc) values "+;
						pal(ncodigo) +al(.f.) +al(.t.) +al(.f.) +al(.f.) +al(.f.) +;
						al(alltrim(nombre)) + al(NOMBRE) + al(direccion) +al(SUBSTR(telefono,1,15))+ ;
						 +al(2) +al(19) +al(ciud) +al(CODIGO) +al(1) +al(cate)+;
						al(iif(len(alltrim(ruc))=10,alltrim(ruc),''))+ual(iif(len(alltrim(ruc))=13,alltrim(ruc),''))
			if sqli(q1)
				wait 'Registrado...' wind nowait
			endif
		endif
	else
		wait 'error' wind nowait
	endif
		
	sele proveedores_g1
ENDSCAN

wait 'Proceso concluido...' wind nowait
