*!*	select a as itag, '' as tipo, B as iname, e as marca,  'UNIDAD' as presenta, ;
*!*		round(val(F) ,2) as qty, VAL(g) as costo, 6619 as bodega ;
*!*		from inv_galpon_1   WHERE A<>'CODIGO' into table g1_galarza

if used('g1_galarza')
	sele g1_galarza
else
	sele 0
	use g1_galarza
endif

sele * from g1_galarza where !empty(alltrim(iname)) into cursor invini

*select * from items2 where substr(alltrim(itag),1,7)<>'Categor' into cursor invini

select distinct tipo from g1_galarza into cursor grupos
select distinct marca from g1_galarza into cursor marcas
select distinct '' from g1_galarza where .f. into cursor unidades

x=0

=sqli("begin;")

sele invini
go top

q1="delete from saldosib where bodega="+alup(bodega)
=sqli(q1)

if !fintransq()
	wait 'error' wind nowait
	return
endif

wait 'importanto Tipos' wind at 2,2 nowait

sele grupos
GO TOP
do while !eof()
	if !empty(tipo)
		q1="insert into detagru (valorda, descripda, idgrupo) values "+;
				pal('PT')+al(TIPO)+ual(44)
					
		=sqli(q1)
	endif	
	sele grupos
	skip
enddo

wait 'importanto Marcas' wind at 2,2 nowait

sele marcas
go top
do while !eof()
	if !empty(marca)
		q1="insert into detagru (descripda, idgrupo) values "+;
				pal(marca)+ual(43)
		=sqli(q1)
	endif
	sele marcas
	skip
enddo

wait 'importanto Unidades' wind at 2,2 nowait

sele unidades
go top
do while !eof()
	if !empty(presenta)
		q1="insert into detagru (descripda, idgrupo) values "+;
				pal(presenta)+ual(9)
		=sqli(q1)
	endif
	sele unidades
	skip
enddo


IF !dg('MAIT')
	RETURN
ENDIF

IF !dg('TIAR')
	RETURN
ENDIF

IF !dg('MEDI')
	RETURN
ENDIF

icde=0
sele invini
go top
do while !eof() 
	
	wait 'importanto '+alltrim(iname) wind at 2,2 nowait
	
	ICODE=0
	q1="select max(icode)+1::int2 as maxcod from items ;"
	if sqli(q1,'numcod') then
		sele numcod
		icode=iif(isnull(maxcod),1,maxcod)
	endif
	
	idi=0
	q1="select 	nextsecu('auxiliarescon_seq'::text, 'ITEMS'::text) as idi"
	if	sqli(q1,'nit')
		sele nit
		if reccount('nit')>0
			idi=nit.idi
		endif
	endif

	ntip=2912
	sele TIPART
	go top
	locate for alltrim(DESCRIPDA)=alltrim(invini.tipo)
	if found()
		ntip=tipart.iddato
	endif

	marc=4836
	sele marcasit
	go top
	locate for alltrim(descripda)=alltrim(invini.marca)
	if found()
		marc=marcasit.iddato
	endif	
	
	uni=38
*!*		sele unidades
*!*		go top
*!*		locate for alltrim(descripda)=alltrim(invini.presenta)
*!*		if found()
*!*			uni=unidades.iddato
*!*		endif	
	
	sele invini
	
	q1="select iditem, artmarca, artgrupo "+;
		"from items "+;
		"where itag="+alup(itag)+" or iname="+alup(iname)
		
	if sqli(q1,'items')
		if reccount('items')=0
			
			sele invini
			q1="insert into items (artgrupo, artmarca, issell, isbuy, isreturn, itipo, iname, iunidad, iunidad2, "+;
					" isiva, itag, icode, stockmin, stockmax, imoney, artpeso, costopro, artcosto, isdesc, "+;
					" iditem) values "+;
					pal(ntip)+al(marc)+al(.t.)+al(.t.)+al(.f.)+al(1)+al(iname)+al(38)+al(uni)+;
					al(.t.)+al(itag)+al(ICODE)+al(0)+al(0)+al(2)+;
					al(0)+al(COSTO)+al(costo)+al(.t.)+  Ual(idi)
			
			if !sqli(q1)
				=messagebox('error en articulo: '+alltrim(invini.iname),0,empresa)
			endif

			q1="select nextval('saldosi_idsaldosi_seq'::text)::int4 as secu ;"
			if sqli(q1,'secuen')
				idsi=secuen.secu
			endif
			
			sele invini
			
			q1="insert into saldosi ( idsaldosi,  pdocode,  iditem, inicial, precio, cospro, fecsaldo) "+;
				"values "+pal(idsi)+al(iprd)+al(idi)+al(qty)+;
				al(costo)+al(costo)+ual(date(2011,1,1))
				
			=sqli(q1)
				
			q1="insert into saldosib (idsaldosi, bodega, qtypen, qtyini) values "+;
							pal(idsi)+ al(bodega) + al(0) + ual(qty)
			=sqli(q1)
		else

			wait 'actualizando: '+alltrim(invini.iname) wind nowait
			
			if ntip<>2912
				q1="update items set artgrupo="+alup(ntip)+;
					" where iditem="+alup(items.iditem)
				=sqli(q1)
			endif
			
			if marc<>4836
				q1="update items set artmarca="+alup(marc)+;
					" where iditem="+alup(items.iditem)
				=sqli(q1)
			endif
						
			idsi=0
			
			q1="select idsaldosi from saldosi where iditem="+alup(items.iditem)
			
			if sqli(q1,'secuen')
				idsi=secuen.idsaldosi
			endif
			
			sele invini
			
			q1="insert into saldosib (idsaldosi, bodega, qtypen, qtyini) values "+;
							pal(idsi)+ al(bodega) + al(0) + ual(qty)
			=sqli(q1)
		
		endif
	endif
	sele invini
	skip
enddo

