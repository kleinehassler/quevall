*!*	select alltrim(a)+alltrim(b)+alltrim(c) as codigo, alltrim(d)+alltrim(e)+alltrim(f) as cuenta, j as nivel ;
*!*	from plan_cta_mul ;
*!*	into table plancta_m

*!*	replace codigo with substr(codigo,1,6)+substr(codigo,8,2) for val(nivel)=5
*!*	replace all cuenta with upper(cuenta)

if !dg('CUCO')
	return
endif

if used('plancta_m')
	sele plancta_m
else
	sele 0
	use plancta_m
endif

x=0
sele plancta_m
go top
if !sqli("begin;")
	return
endif

q1="delete from plancuenta ;"
if !sqli(q1)
	return
endif

do while !eof()
	l=len(alltrim(CODIGO))
	c=substr(alltrim('0'+substr(codigo,1,1)+'0'+substr(codigo,2,1)+substr(codigo,3,14))+'00000000000000000000',1,20)

	sele ctasctbs
	go top
	locate for alltrim(descripda)=alltrim(plancta_m.cuenta)
	if found()
		sele plancta_m
		q1="insert into plancuenta (plancod, idcuenta, plannivel, plantype, auxcode, pdocode) values "+;
			pal(c)+al(ctasctbs.iddato)+al( 	iif(l=1,1,iif(l=2,2,iif(l=4,3,iif(l=6,4,iif(l=8,5,6) )))))+ ;
			al(iif(val(nivel)=5,'M','G'))+;
			al(iif(val(nivel)=5,'S',null))+ual(54)
		=sqli(q1)
		*wait q1 wind
		
	else
		idd=0
		q1="select 	nextsecu('detagru_iddato_seq'::text, 'DETAGRU'::text) as idd"
		if	sqli(q1,'nit')
			sele nit
			if reccount('nit')>0
				idd=nit.idd
			endif
		endif
		
		sele plancta_m
		q1="insert into detagru (iddato, descripda, idgrupo) values "+;
			pal(idd)+al(cuenta)+ual(21)
		=sqli(q1)

		q1="insert into plancuenta (plancod, idcuenta, plannivel, plantype, auxcode, pdocode) values "+;
			pal(c)+al(idd)+al( 	iif(l=1,1,iif(l=2,2,iif(l=4,3,iif(l=6,4,iif(l=8,5,6) )))))+ ;
			al(iif(val(nivel)=5,'M','G'))+;
			al(iif(val(nivel)=5,'S',null))+ual(54)
		=sqli(q1)
		*wait q1 wind
		if !dg('CUCO')
			x=1
			exit
		endif
	endif
	sele plancta_m
	skip
enddo

do fintrans