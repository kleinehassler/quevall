--select * into table chenc2014 from detadocb where isconfbanc='false';
--update chenc2014 set secuencia=secuencia+400 where secuencia>40480;
--select * from chenc2014 where secuencia>40480;
select * into table chenc20141 from chenc2014 where secuencia>40480;