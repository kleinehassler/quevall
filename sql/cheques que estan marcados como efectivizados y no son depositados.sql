-- select * from cheques where isefectivo='true' and fecheque>='2014-05-01' and fecheque<'2014-06-11'

-- select distinct numcta, d.descripda, numche, fecheque, valor, isefectivo, isdoc from cheques c left join detagru d	on (c.banco=d.iddato)	where code=329125

-- select distinct c.nucuban, d.descripda, b.nudocban, b.fecdoc, b.punitario as cvaldo, b.isconfbanc as iscobrado, 'f'::bool from ctasban c, detadocb b, detagru d	where not isdet and c.idcuenta=b.idcuenta and c.idbanco=d.iddato and not isanulado and b.code=329125

-- select distinct nomdoc, cbenef, cconce, nucuban, punitario from vdocub where isdet and code=329125

-- select distinct coded, nomdoc, rubname, valort, tipoie from vdocud where code=329125

-- select distinct rubtab, rubname, valor, tie from vdocul where code=329125

-- SELECT t.code, i.sname AS snamed, i.ssri AS ssrid, i.scode, i.idsujeto, t.punitario, t.qty, t.idcheque  FROM (detadocs t LEFT JOIN sujetos i ON ((t.idsujeto = i.idsujeto))) where code=329125

select * from cheques where isefectivo and idcheque not in (select idcheque from vdocus);