para fecdia
local fhoy
fhoy=fecdia

q1="select idagen, ssri, resolucion, nrores, stelf, smail, saddr, sruc, idciud, c.descripda "+;
	"from empresas e left join detagru c on (e.idciud=c.iddato) limit 1"

if sqli(q1,'empr')
	rucemp=sruc
	idciuemp=idciud
	ciuemp=descripda
	
	idagen=idagen
	nresol=nrores
	cresol=resolucion
	empresa2=ssri
	fono=stelf
	correoe=smail
	diremp=saddr
endif

&& SOLO LA PRIMERA VEZ Q SE EJECUTA, LO HACE SIN RECIBIR PARAMETRO
if empty(fhoy) or isnull(fhoy) 
	fhoy=hoy
else
	if fhoy=hoy && ya fueron definidas las variables
		return
	endif
endif

q1="SELECT d.descripda AS variable, max(v.desde) as desde, v.hasta, v.valor, d.valorda AS tipod "+;
 	"FROM vardiarias v LEFT JOIN detagru d ON (v.codvar = d.iddato) "+;
 	"where "+alup(fhoy)+">=desde and "+alup(fhoy)+"<=hasta "+;
	"group by variable, tipod, hasta, valor;"
 	
if !sqli(q1,'varhoy') then
	=messagebox('No existe variables definidas, comuniquese con el centro de computo',0,empresa)
	return
endif

sele varhoy
go top
do while !eof()
		v=alltrim(variable)
		t=alltrim(tipod)
		do case 
			case t='N'
			    vd=val(varhoy.valor)
			case t='C'
			    vd=ALLTRIM(varhoy.valor)
			case t='D'
			    vd=ctod(alltrim(varhoy.valor))
			case t='L'
			    vd=iif(alltrim(varhoy.valor)='S','.t.','.f.')
		endcase
*		wait v+'= '+varhoy.valor wind nowait
		public &v
		&v=vd
		skip
enddo

sele varhoy
use
