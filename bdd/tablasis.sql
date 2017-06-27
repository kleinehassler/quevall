--
-- PostgreSQL database dump
--

-- Started on 2007-10-26 23:53:47 Hora est. del Pacífico de SA

SET client_encoding = 'SQL_ASCII';
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 1549
-- Name: tablasis_idtablasis_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('tablasis', 'idtablasis'), 11, true);


--
-- TOC entry 1997 (class 0 OID 79982)
-- Dependencies: 1550
-- Data for Name: tablasis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (1, 'DOCUSE', true, 1, 'IDDOCU', 'docuse_iddocu_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (2, 'DDOCUSE', true, 1, 'IDDOCUSE', 'ddocuse_iddocuse_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (3, 'ORIGENDOC', true, 1, 'IDORIGENDOC', 'origendoc_idorigendoc_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (4, 'SECUENCIAS', true, 1, 'IDSECU', 'secuencias_idsecu_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (5, 'WORKSTATIONS', true, 1, 'IDWORKSTATION', 'workstations_idworkstation_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (6, 'AUTOSRI', true, 1, 'IDAUTOSRI', 'autosri_idautosri_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (7, 'ORIGENDOC', true, 1, 'IDORIGENDOC', 'origendoc_idorigendoc_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (8, 'DETAGRU', true, 1, 'IDDATO', 'detagru_iddato_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (9, 'DCONTITEM', true, 1, 'IDDCONTITEM', 'dcontitem_iddcontitem_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (10, 'SECUDOC', true, 1, 'IDSECUDOC', 'secudoc_idsecudoc_seq');
INSERT INTO tablasis (idtablasis, tabla, tienerep, nivel, ckey, secsis) VALUES (11, 'DOCUMENTS', true, 1, 'CODE', 'documents_code_seq');

INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0002', 160, 1, 1, 15000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0003', 160, 2, 1, 100000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0004', 160, 3, 1, 3000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0005', 160, 4, 1, 2500, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0007', 160, 6, 1, 1000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0008', 160, 8, 1, 10000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0009', 160, 9, 1, 15000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0010', 160, 10, 1, 30000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0006', 160, 5, 1, 5000, '2007-02-01', false);
INSERT INTO secuagen (codigo, idagencia, idtablasis, secini, secfin, fecini, ismaster) VALUES ('0011', 160, 11, 1, 100000, '2007-01-01', false);

-- Completed on 2007-10-26 23:53:47 Hora est. del Pacífico de SA

--
-- PostgreSQL database dump complete
--

