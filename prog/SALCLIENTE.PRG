local cantexi, item

*!*	select b as referencia, c as cliente, ctod(f) as fecha, ctod(g) as fecven, ;
*!*		h as dias, i as credito, val(k) as saldo ;
*!*	from ctaxcob_g ;
*!*	where !empty(c) and !empty(f) and val(k)>0.10 ;
*!*	into table ctasxcob_g1


q1="select distinct idsujeto, codigo as scode, nombre as sname "+;
	"from vsujetos  "
	
if !sqli(q1,'sujetos1') then
	return
endif

IF !USED('ctasxcob_g1')
	USE ctasxcob_g1.dbf IN 0 SHARED
ENDIF

select distinct s.*, c.idsujeto ;
from ctasxcob_g1 s left join sujetos1 c on s.cliente=c.sname ;
order by idsujeto into table clientes_G


x=0
if !sqli("begin;") then
	wait 'Problema de Comunicacion' wind nowait
	return
endif

q1="delete from saldosci where ctacon=6055"

=sqli(q1) 

sele CLIENTEs_g
go top
SCAN FOR IDSUJETO>0

*	IDSUJETO1=CLIENTE.IDSUJETO
	
	wait alltrim(str(CLIENTEs_g.IDSUJETO))+' => '+alltrim(CLIENTEs_g.cliente) wind nowait
		
	q1="insert into saldosci (code, idsujeto, saldo, monto, pdocode, fecultpag, ctacon, fecven, cuota, referencia, fecha) values "+;
				pal(0)+al(clientes_g.idsujeto)+al(clientes_g.saldo)+al(clientes_g.saldo)+;
				al(iprd)+al(hoy)+al(6055)+al(clientes_g.fecven)+al(clientes_g.saldo)+;
				al("Ref:"+alltrim(clientes_g.referencia)+;
				' - DIas:'+alltrim(dias)+' - Credito:'+alltrim(str(val(credito),10,2)))+ual(clientes_g.fecha)
			
	=sqli(q1)

	sele clientes_g
	
EndScan	

************
do fintrans
************
