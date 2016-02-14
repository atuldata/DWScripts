
DROP TYPE fact_bdt_clerk_type;
CREATE OR REPLACE TYPE fact_bdt_clerk_type AS OBJECT (
clerk_id number(4),
experience number(3),
gender varchar(7),
store varchar(7),
store_opening varchar(10),
store_city varchar(20),
store_sector varchar(20),
MEMBER FUNCTION getClerk RETURN number,
MEMBER FUNCTION getExperience RETURN number,
MEMBER FUNCTION getGender RETURN varchar,
MEMBER FUNCTION getStore RETURN varchar,
MEMBER FUNCTION getStoreOpening RETURN date,
MEMBER FUNCTION getCity RETURN varchar,
MEMBER FUNCTION getSector RETURN varchar
);
/

CREATE TABLE fact_bdt_clerk OF fact_bdt_clerk_type;

CREATE UNIQUE INDEX fact_bdt_clerk_idx ON fact_bdt_clerk(clerk_id);

ALTER TABLE fact_bdt_clerk 
ADD CONSTRAINT fact_bdt_clerk_pk PRIMARY KEY (clerk_id);