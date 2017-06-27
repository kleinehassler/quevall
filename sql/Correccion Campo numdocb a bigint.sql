-- Cambio de Typo en Columna nudocban de Integer a bigint;


begin;
DROP VIEW vdocub;

DROP VIEW vdocubant;


alter table detadocb alter column nudocban type bigint;

CREATE OR REPLACE VIEW vdocub AS 
 SELECT DISTINCT t.code, i.nucuban, i.ticuban, k.descripda AS banco, t.isanulado, t.idcuenta, t.nudocban, t.cbenef, t.cconce, t.fecdoc, t.punitario, t.qty, t.isanulado AS docanulado, t.isconfbanc, t.isprotesto, t.isconciliado, t.isprint AS isprintb, t.tipodoc, t.fecpag, t.isposfec, t.isconpos, t.isdet, t.secuencia, r.dtag, r.nomdoc, t.fecha, t.isaccount, i.numaux
   FROM detadocb t
   LEFT JOIN ctasban i ON t.idcuenta = i.idcuenta
   LEFT JOIN detagru k ON i.idbanco = k.iddato
   LEFT JOIN reversodoc r ON t.tipodoc = r.iddocu;

ALTER TABLE vdocub OWNER TO postgres;



CREATE OR REPLACE VIEW vdocubant AS 
 SELECT b.code, b.nudocban, b.punitario AS valor, b.cbenef, b.cconce, c.nucuban, b.qty, b.isconfbanc, b.isanulado, b.isconciliado, b.isprotesto, b.fecpag, b.tipodoc, b.fecdoc, b.isprint, b.isdet, b.isconpos, b.isposfec, b.fecha, b.isaccount, b.idcuenta, b.secuencia
   FROM detadocb b
   LEFT JOIN reversodoc r ON b.tipodoc = r.iddocu
   LEFT JOIN ctasban c ON b.idcuenta = c.idcuenta
  WHERE b.code = 0 OR b.code IS NULL OR NOT (b.code IN ( SELECT documents.code
   FROM documents))
  ORDER BY b.code;

ALTER TABLE vdocubant OWNER TO postgres;
commit;
