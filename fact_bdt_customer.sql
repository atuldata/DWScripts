
DROP TYPE fact_bdt_customer_type;
CREATE OR REPLACE TYPE fact_bdt_customer_type AS OBJECT (
card_num number(8),
dob varchar(10),
adress varchar(50),
secteur varchar(50), 
gender char(1), 
occupation varchar(50),
house varchar(50),
MEMBER FUNCTION getCardNum RETURN number,
MEMBER FUNCTION getDob RETURN date,
MEMBER FUNCTION getAdress RETURN varchar,
MEMBER FUNCTION getSecteur RETURN varchar,
MEMBER FUNCTION getGender RETURN varchar,
MEMBER FUNCTION getOccupation RETURN varchar,
MEMBER FUNCTION getHouse RETURN varchar
);
/

CREATE TABLE fact_bdt_customer OF fact_bdt_customer_type;

CREATE UNIQUE INDEX fact_bdt_customer_idx ON fact_bdt_customer(card_num);

ALTER TABLE fact_bdt_customer 
ADD CONSTRAINT fact_bdt_customer_pk PRIMARY KEY (card_num);