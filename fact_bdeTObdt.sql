DELETE FROM exceptions;

DELETE FROM fact_bdt_ventes;
DELETE FROM fact_bdt_customer;
DELETE FROM fact_bdt_produit;
DELETE FROM fact_bdt_clerk;
DELETE FROM fact_bdt_date;

-- D?sactivation des contraintes et index

/*ALTER TABLE fact_bdt_ventes DISABLE CONSTRAINT fact_bdt_ventes_fkcard;
ALTER TABLE fact_bdt_ventes DISABLE CONSTRAINT fact_bdt_ventes_fkdat;
ALTER TABLE fact_bdt_ventes DISABLE CONSTRAINT fact_bdt_ventes_fkclerk;
ALTER TABLE fact_bdt_ventes DISABLE CONSTRAINT fact_bdt_ventes_fkjolitre;*/

ALTER TABLE fact_bdt_date DISABLE CONSTRAINT fact_bdt_date_pk;--a tester si wrong retirer 
ALTER TABLE fact_bdt_customer DISABLE CONSTRAINT fact_bdt_customer_pk;
ALTER TABLE fact_bdt_produit DISABLE CONSTRAINT fact_bdt_produit_pk;
ALTER TABLE fact_bdt_clerk DISABLE CONSTRAINT fact_bdt_clerk_pk;

DROP INDEX fact_bdt_date_idx;-- a tester si wrong retirer !!!!!!!
DROP INDEX fact_bdt_customer_idx;
DROP INDEX fact_bdt_produit_idx;
DROP INDEX fact_bdt_clerk_idx;

-- Insertion

INSERT INTO fact_bdt_date (dat,temp)
SELECT dat, temp 
FROM fact_bde_data;

INSERT INTO fact_bdt_customer(card_num,dob,adress,secteur,gender,occupation,house)
SELECT card_num,dob,adress,secteur,gender,occupation,house
FROM fact_bde_customer;

INSERT INTO fact_bdt_produit(reference,price,size,color,type,city_ofact_prod,sector)
SELECT reference,price,size,color,type,city_ofact_prod,sector
FROM fact_bde_produit;

INSERT INTO fact_bdt_clerk (clerk_id,experience,gender,store,store_opening,store_city,store_sector)
SELECT c.clerk_id,c.experience,c.gender,c.store,s.store,s.store_opening,s.store_city,s.store_sector
FROM fact_bde_clerk c, fact_bde_store s
WHERE c.store = s.store;

INSERT INTO fact_bdt_ventes (num_ticket,dat,jolitre,clerk_id,card_num)
SELECT num_ticket,dat,jolitre,clerk_id,card_num
FROM fact_bde_ventes;

-- R?activation des index et contraintes

CREATE INDEX fact_bdt_date_idx ON fact_bdt_date(dat);--- si retirer plu tot retirer ici aussi
CREATE INDEX fact_bdt_customer_idx ON fact_bdt_customer(card_num);
CREATE INDEX fact_bdt_produit_idx ON fact_bdt_produit(reference);
CREATE INDEX fact_bdt_clerk_idx ON fact_bdt_clerk(clerk_id);

ALTER TABLE fact_bdt_date ENABLE CONSTRAINT fact_bdt_date_pk;--a tester si retirer plu tot retirer ici aussi
ALTER TABLE fact_bdt_customer ENABLE CONSTRAINT fact_bdt_customer_pk;
ALTER TABLE fact_bdt_produit ENABLE CONSTRAINT fact_bdt_produit_pk;
ALTER TABLE fact_bdt_clerk ENABLE CONSTRAINT fact_bdt_clerk_pk;

-----ATTENTION A CETTE PARTIE!!!!!!!!!!!!!!!!!!!!!!!!!!!----------------
/*ALTER TABLE fact_bdt_ventes ENABLE CONSTRAINT fact_bdt_ventes_fkcard;
ALTER TABLE fact_bdt_ventes ENABLE CONSTRAINT fact_bdt_ventes_fkdat;
ALTER TABLE fact_bdt_ventes ENABLE CONSTRAINT fact_bdt_ventes_fkclerk;
ALTER TABLE fact_bdt_ventes ENABLE CONSTRAINT fact_bdt_ventes_fkjolitre;*/

-------------------------------------------------------------------------


--SELECT count(*) FROM exceptions;

-- V?rification sommaire du transfert

SELECT * FROM fact_bdt_ventes WHERE ROWNUM=1;
SELECT count(*) FROM fact_bdt_ventes;

SELECT * FROM fact_bdt_customer WHERE ROWNUM=2;
SELECT count(*) FROM fact_bdt_customer;

SELECT * FROM fact_bdt_produit WHERE ROWNUM=1;
SELECT count(*) FROM fact_bdt_produit;

SELECT * FROM fact_bdt_clerk WHERE ROWNUM=1;
SELECT count(*) FROM fact_bdt_clerk;

SELECT * FROM fact_bdt_date WHERE ROWNUM=1;
SELECT count(*) FROM fact_bdt_date;
