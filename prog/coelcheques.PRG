*!*	select ctod(a) as emitido, c as cliente, e as numche, f as cuenta, ctod(g) as fecven, val(h) as valor, l as banco, k as comprobante ;
*!*	from cheques_g ;
*!*	where !empty(c) and !empty(a) into table cheques_g1

if !used('cheques_g1')
	sele 0
	use cheques_g1
endif

sele distinc banco from cheques_g1 into cursor lisban

sele lisban
GO TOP
do while !eof()
	if !empty(banco)
		q1="insert into detagru ( descripda, idgrupo) values "+;
				pal(banco)+ual(32)
					
		=sqli(q1)
	endif	
	sele lisban
	skip
enddo

if !dg('BANC')
	return
endif

*!*	sele cheques 
*!*	go top
*!*	do while !eof()
*!*		q1="select scode from sujetos where sname like "+alup('%'+chrtran(cliente,"'",' ')+'%')
*!*		if sqli(q1,'sujeto')
*!*			if reccount('sujeto')=1
*!*				replace cheques.scode with sujeto.scode
*!*			endif
*!*		endif
*!*		sele bancos
*!*		go top
*!*		locate for alltrim(descripda)=alltrim(cheques.banco)
*!*		if found()
*!*			replace cheques.idbanco with bancos.iddato
*!*		endif
*!*		sele cheques
*!*		skip
*!*	enddo

x=0
q1='begin'

if !sqli(q1)
	return
endif

=sqli('delete from cheques')

sele cheques_g1
go top
do while !eof()
	ncod=0
	q1="select idsujeto from sujetos where sname="+alup(cliente)
	if sqli(q1,'suj')
		ncod=suj.idsujeto
	endif
	
	sele cheques_g1
	
	idbanco=0
	
	sele bancos
	go top
	locate for alltrim(descripda)=alltrim(cheques_g1.banco)
	if found()
		idbanco=bancos.iddato
	endif
  	
  	sele cheques_g1
	q1="insert into cheques (code, fecheque, banco, numcta, observa, numche, valor, cliente, fecha ) values "+;
				pal(0)+al(fecven)+al(idbanco)+al(cuenta)+al(comprobant)+;
				al(numche)+al(valor)+al(ncod)+ual(emitido)
	=sqli(q1)
	
	sele cheques_g1
	skip
enddo

do fintrans