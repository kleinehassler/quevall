-- update sujetos set sruc=sruc || '001'  where char_length(sruc)=10 and idsujeto=100
-- update sujetos set scedula=sruc, sruc='' where char_length(scedula)<1 and char_length(sruc)=10 
select idsujeto, sruc, scedula from sujetos where char_length(sruc)=9 and char_length(scedula)<10