local cantexi, item

*!*	select a as compra, b as referencia, c as cliente, ctod(f) as fecha, ctod(g) as fecven, ;
*!*		h as credito, val(i) as saldo ;
*!*	from ctaxpag_g ;
*!*	where !empty(c) and !empty(f) and val(i)>0.10 ;
*!*	into table ctasxpag_g1


q1="select distinct idsujeto, codigo as scode, nombre as sname "+;
	"from vsujetos  "
	
if !sqli(q1,'sujetos1') then
	return
endif

IF !USED('ctasxpag_g1')
	USE ctasxpag_g1.dbf IN 0 SHARED
ENDIF

select distinct s.*, c.idsujeto ;
from ctasxpag_g1 s left join sujetos1 c on s.cliente=c.sname ;
order by idsujeto into table proveedor_g

x=0
if !sqli("begin;") then
	wait 'Problema de Comunicacion' wind nowait
	return
endif

q1="delete from saldosci where ctacon=6150"

=sqli(q1) 

sele proveedor_g
go top
SCAN FOR IDSUJETO>0

*	IDSUJETO1=CLIENTE.IDSUJETO
	
	wait alltrim(str(proveedor_g.IDSUJETO))+' => '+alltrim(proveedor_g.cliente) wind nowait
		
	q1="insert into saldosci (code, idsujeto, saldo, monto, pdocode, fecultpag, ctacon, fecven, cuota, referencia, fecha) values "+;
				pal(0)+al(proveedor_g.idsujeto)+al(proveedor_g.saldo)+al(proveedor_g.saldo)+;
				al(iprd)+al(hoy)+al(6150)+al(proveedor_g.fecven)+al(proveedor_g.saldo)+;
				al("Ref: "+alltrim(proveedor_g.referencia)+;
				' - Compra: '+alltrim(compra))+ual(proveedor_g.fecha)
			
	=sqli(q1)

	sele proveedor_g
	
EndScan	

************
do fintrans
************
