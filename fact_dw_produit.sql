CREATE TABLE fact_dw_produit (
reference varchar(10),
price number(4),
size number(2),
color varchar(7), 
type varchar(12), 
city_ofact_prod varchar(20),
sector varchar(20)
);

CREATE UNIQUE INDEX fact_dw_produit_idx ON fact_dw_produit(reference);

ALTER TABLE fact_dw_produit
ADD CONSTRAINT fact_dw_produit_pk PRIMARY KEY (reference);