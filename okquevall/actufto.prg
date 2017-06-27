select pagares1
go top

scan
	select pagares1
	q1="update documents set fto='"+alltrim(pagares1.m)+"' where code="+alltrim(pagares1.a)+";"
	
	? q1
	
*!*		cancel
*!*		
*!*		if !sqli(q1) then
*!*			return 
*!*		else
*!*			wait 'ok' windows nowait
*!*		endif
*!*		wait 'proceso concluido' windows nowait	
	
endscan