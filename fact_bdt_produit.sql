
DROP TYPE fact_bdt_produit_type;
CREATE OR REPLACE TYPE fact_bdt_produit_type AS OBJECT (
reference varchar(10),
price number(4),
size number(2),
color varchar(7), 
type varchar(12), 
city_ofact_prod varchar(20),
sector varchar(20),
MEMBER FUNCTION getReference RETURN varchar,
MEMBER FUNCTION getPrice RETURN number,
MEMBER FUNCTION getSize RETURN number,
MEMBER FUNCTION getColor RETURN varchar,
MEMBER FUNCTION getType RETURN varchar,
MEMBER FUNCTION getCity RETURN varchar,
MEMBER FUNCTION getSector RETURN varchar
);
/

CREATE TABLE fact_bdt_produit OF fact_bdt_produit_type;

CREATE UNIQUE INDEX fact_bdt_produit_idx ON fact_bdt_produit(reference);

ALTER TABLE fact_bdt_produit 
ADD CONSTRAINT fact_bdt_produit_pk PRIMARY KEY (reference);