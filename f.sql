@raz.sql
@exceptions.sql
PROMPT
PROMPT ************************** BDE **************************
@fact_bde.sql
PROMPT
PROMPT ************************** BDT **************************
@fact_bdt.sql

PROMPT 
PROMPT ************************** DW **************************
@fact_dw.sql



PROMPT
PROMPT ************************** BDE TO BDT**************************
@fact_bdeTObdt.sql
commit;


PROMPT
PROMPT ************************** BDT TO DW**************************
@fact_bdtTOdw.sql
commit;
