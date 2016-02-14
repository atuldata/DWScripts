CREATE TABLE fact_dw_ventes (
num_ticket number(8),
dat date,
jolitre varchar(10),
clerk_id number(4), 
card_num number(8)
);

ALTER TABLE fact_dw_ventes
ADD CONSTRAINT fact_dw_ventes_fkcard FOREIGN KEY (card_num) REFERENCES fact_dw_customer(card_num);

ALTER TABLE fact_dw_ventes
ADD CONSTRAINT fact_dw_ventes_fkdat FOREIGN KEY (dat) REFERENCES fact_dw_date(dat);

ALTER TABLE fact_dw_ventes
ADD CONSTRAINT fact_dw_ventes_fkclerk FOREIGN KEY (clerk_id) REFERENCES fact_dw_clerk(clerk_id);

ALTER TABLE fact_dw_ventes
ADD CONSTRAINT fact_dw_ventes_fkjolitre FOREIGN KEY (jolitre) REFERENCES fact_dw_produit(jolitre);
