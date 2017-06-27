select iditem, iif(qtyv>qtyc+qtyt, round((qtyv-(qtyc+qtyt))*1.206,0),0) as qty, min(costov) as costov, min(costoc) as costoc, min(punitario) as punitario, userstore ;
from saldoini ;
where qtyv>qtyc+qtyt ;
group by iditem, userstore ;
into cursor saldoini2

brow

select iditem, qty, costov, costoc, punitario ;
from saldoini2 ;
group by iditem ;
into cursor saldotot

select sum(qty*iif(costoc>0, costoc, iif(costov>0, costov, punitario))) from saldotot 
