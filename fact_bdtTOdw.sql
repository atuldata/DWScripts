DELETE FROM exceptions;

DELETE FROM fact_dw_ventes;
DELETE FROM fact_dw_date;
DELETE FROM fact_dw_customer;
DELETE FROM fact_dw_produit;
DELETE FROM fact_dw_clerk;

-- Désactivation des contraintes et index

ALTER TABLE fact_dw_ventes DISABLE CONSTRAINT fact_dw_ventes_fkcard;
ALTER TABLE fact_dw_ventes DISABLE CONSTRAINT fact_dw_ventes_fkdat;
ALTER TABLE fact_dw_ventes DISABLE CONSTRAINT fact_dw_ventes_fkclerk;
ALTER TABLE fact_dw_ventes DISABLE CONSTRAINT fact_dw_ventes_fkjolitre;

ALTER TABLE fact_dw_date DISABLE CONSTRAINT fact_dw_date_pk;
ALTER TABLE fact_dw_customer DISABLE CONSTRAINT fact_dw_customer_pk;
ALTER TABLE fact_dw_produit DISABLE CONSTRAINT fact_dw_produit_pk;
ALTER TABLE fact_dw_clerk DISABLE CONSTRAINT fact_dw_clerk_pk;

DROP INDEX fact_dw_date_idx;
DROP INDEX fact_dw_customer_idx;
DROP INDEX fact_dw_produit_idx;
DROP INDEX fact_dw_clerk_idx;

-- Insertion

INSERT INTO fact_dw_customer(card_num,dob,adress,secteur,gender,occupation,house)
SELECT cu.getCardNum(), cu.getDob(), cu.getAdress(), cu.getSecteur(), cu.getGender(), cu.getOccupation(), cu.getHouse()
FROM fact_bdt_customer cu;

INSERT INTO fact_dw_produit(reference,price,size,color,type,city_ofact_prod,sector)
SELECT t.getReference(),t.getPrice(),t.getSize(),t.getColor(),t.getType(),t.getCity(),t.getSector()
FROM fact_bdt_produit t;

INSERT INTO fact_dw_clerk (clerk_id,experience,gender,store,store_opening,store_city,store_sector)
SELECT cl.getClerk(), cl.getExperience(), cl.getGender(), cl.getStore(), cl.getStoreOpening(), cl.getCity(), cl.getSector()
FROM fact_bdt_clerk cl;

INSERT INTO fact_dw_date (dat, jds, sem, mon, tri, temp)
SELECT DISTINCT d.getDat(), d.getJds(), d.getSem(), d.getMon(), d.getTri(), d.getTemp()
FROM fact_bdt_date d
WHERE t.getDat() IS NOT NULL;

INSERT INTO fact_dw_ventes (num_ticket,dat,jolitre,clerk_id,card_num)
SELECT t.getNumTicket(), t.getDat(), t.getJolitre(), t.getClerk(), t.getCardNum()
FROM fact_bdt_ventes t;

-- Réactivation des index et contraintes

CREATE INDEX fact_dw_date_idx ON fact_dw_date(dat);
CREATE INDEX fact_dw_clerk_idx ON fact_dw_clerk(clerk_id);
CREATE INDEX fact_dw_produit_idx ON fact_dw_produit(reference);
CREATE INDEX fact_dw_customer_idx ON fact_dw_customer(card_num)


ALTER TABLE fact_dw_date ENABLE CONSTRAINT fact_dw_date_pk;
ALTER TABLE fact_dw_customer ENABLE CONSTRAINT fact_dw_customer_pk;
ALTER TABLE fact_dw_produit ENABLE CONSTRAINT fact_dw_produit_pk;
ALTER TABLE fact_dw_clerk ENABLE CONSTRAINT fact_dw_clerk_pk;

ALTER TABLE fact_dw_ventes ENABLE CONSTRAINT fact_dw_ventes_fkcard;
ALTER TABLE fact_dw_ventes ENABLE CONSTRAINT fact_dw_ventes_fkdat;
ALTER TABLE fact_dw_ventes ENABLE CONSTRAINT fact_dw_ventes_fkclerk;
ALTER TABLE fact_dw_ventes ENABLE CONSTRAINT fact_dw_ventes_fkjolitre;


PROMPT <<fact_dw_date>>
SELECT * FROM fact_dw_date WHERE ROWNUM=1;
SELECT count(*) FROM fact_dw_date;

PROMPT <<fact_dw_clerk>>
SELECT * FROM fact_dw_clerk WHERE ROWNUM=1;
SELECT count(*) FROM fact_dw_clerk;

PROMPT <<fact_dw_produit>>
SELECT * FROM fact_dw_produit WHERE ROWNUM=1;
SELECT count(*) FROM fact_dw_produit;

PROMPT <<fact_dw_ventes>>
SELECT * FROM fact_dw_ventes WHERE ROWNUM=1;
SELECT count(*) FROM fact_dw_ventes;

PROMPT <<fact_dw_customer>>
SELECT * FROM fact_dw_produit WHERE ROWNUM=1;
SELECT count(*) FROM fact_dw_customer;
