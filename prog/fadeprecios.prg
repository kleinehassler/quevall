*!*	select a as itag, b as iname, val(h) as costo, val(i) as precioa, val(j) as preciob, val(k) as precioc ;
*!*	from precios_g ;
*!*	where a<>'CODIGO' and !empty(a) ;
*!*	into table precios_g1

if used('precios_g1')
	sele precios_g1
else
	sele 0
	use precios_g1
endif

sele * from precios_g1 where !empty(alltrim(iname)) into cursor invini

*select * from items2 where substr(alltrim(itag),1,7)<>'Categor' into cursor invini

x=0

=sqli("begin;")

sele invini
go top

q1="delete from preciosv"
=sqli(q1)

if !fintransq()
	wait 'error' wind nowait
	return
endif

wait 'importanto Tipos' wind at 2,2 nowait


sele invini
go top
do while !eof() 
	
	sele invini
	
	q1="select iditem, iname, itag, costopro "+;
		"from items "+;
		"where itag="+alup(itag)+" and substr(iname,1,15)="+alup(substr(iname,1,15))
		
	if sqli(q1,'items')
		if reccount('items')=1

			wait 'actualizando: '+alltrim(invini.iname) wind nowait
			
			if items.costopro<invini.costo
				q1="update items set costopro="+alup(invini.costo)+;
								",   artcosto="+alup(invini.costo)+;
					" where iditem="+alup(items.iditem)
				=sqli(q1)
			endif
			
			sele invini
			
			q1="insert into preciosv (iditem, iddato, preciov) values "+;
							pal(items.iditem)+ al(3254) + ual(precioa)
			=sqli(q1)

			q1="insert into preciosv (iditem, iddato, preciov) values "+;
							pal(items.iditem)+ al(5853) + ual(preciob)
			=sqli(q1)

			q1="insert into preciosv (iditem, iddato, preciov) values "+;
							pal(items.iditem)+ al(1190) + ual(precioc)
			=sqli(q1)
		
		endif
	endif
	sele invini
	skip
enddo

