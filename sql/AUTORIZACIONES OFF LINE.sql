***
DROP VIEW vdocuret;
DROP VIEW vdocxml2;

ALTER TABLE aneiva ALTER numauto2 TYPE character varying(50);


CREATE OR REPLACE VIEW vdocuret AS 
 SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, d.numsecue1 AS numsecdoc, d.numsecue2, d.secueret, d.autoret, d.fcaducret, d.numserie2, d.numauto2 AS numautadq, d.fecha2 AS fecdocadq, d.fcaducidad2 AS feccadadq, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.saddr, u.sciudad, u.concepto, u.stelf, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc, i.codigo AS codigoret, d.fimpresion, z.isdocele, d.idsecudoc, z.reporte, d.clave, d.autoriza
   FROM aneiva d
   LEFT JOIN vdocuments u ON d.code = u.code
   LEFT JOIN cobros c ON c.code = d.code
   LEFT JOIN sritabla i ON c.idsritabla = i.idsritabla
   LEFT JOIN rubros r ON c.rubcode = r.rubcode
   LEFT JOIN sritabla s ON d.idtipdoc = s.idsritabla
   LEFT JOIN detagru g ON s.iddato = g.iddato
   LEFT JOIN vsecudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN reversodoc v ON z.iddocu = v.iddocu
  WHERE c.isdocret;

ALTER TABLE vdocuret OWNER TO postgres;

CREATE OR REPLACE VIEW vdocxml2 AS 
 SELECT d.code, d.fecharet AS fecha, d.numsecue1 AS numero, d.montoret, d.numserie1 AS seriedoc, d.numsecue1 AS numsecdoc, d.numsecue2, d.serieret, d.secueret, d.autoret, d.fcaducret, d.numserie2, d.numauto2 AS numautadq, d.fecha2 AS fecdocadq, d.fcaducidad2 AS feccadadq, s.descrip AS tipdoc, u.fecha AS feccom, u.sname, u.sruc, u.scedula, u.spasaporte, u.saddr, u.saddr2, u.sciudad, x.smail, u.stelf, u.scel, r.rubname, r.rubtab, r.valcal, c.valor, c.basecal AS monto, v.nomdoc, i.codigo AS codigoret, d.fimpresion, z.isdocele, z.tipoambi, u.cliente, to_char(s.codigo::smallint::integer, 'FM09'::text) AS tipdocsustento, d.clave, d.autoriza, d.isxmlres, d.isxmlenv, d.isxmlcon
   FROM aneiva d
   LEFT JOIN vdocuments u ON d.code = u.code
   LEFT JOIN cobros c ON c.code = d.code
   LEFT JOIN sritabla i ON c.idsritabla = i.idsritabla
   LEFT JOIN rubros r ON c.rubcode = r.rubcode
   LEFT JOIN sritabla s ON d.idtipdoc = s.idsritabla
   LEFT JOIN detagru g ON s.iddato = g.iddato
   LEFT JOIN vsecudoc z ON d.idsecudoc = z.idsecudoc
   LEFT JOIN reversodoc v ON z.iddocu = v.iddocu
   LEFT JOIN sujetos x ON u.cliente = x.idsujeto
  WHERE c.isdocret AND z.isdocele AND NOT u.isanulado;

ALTER TABLE vdocxml2 OWNER TO postgres;

****************