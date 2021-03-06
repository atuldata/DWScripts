CREATE OR REPLACE TYPE BODY fact_bdt_produit_type 
IS 

MEMBER FUNCTION getReference RETURN varchar
IS
BEGIN
IF REGEXP_LIKE(TRIM(SELF.reference),'^JL') THEN
    RETURN SELF.reference;
  ELSE 
    RETURN NULL;
  END IF;
END;

MEMBER FUNCTION getPrice RETURN number
IS
BEGIN
  RETURN price;
END;

MEMBER FUNCTION getSize RETURN number
IS
BEGIN
  RETURN size;
END;


MEMBER FUNCTION getColor RETURN varchar
IS
BEGIN
IF REGEXP_LIKE(TRIM(SELF.color),'^#') THEN
    RETURN SELF.color;
  ELSE 
    RETURN NULL;
  END IF;
END;

MEMBER FUNCTION getType RETURN varchar
IS
BEGIN
  RETURN type;
END;

MEMBER FUNCTION getCity RETURN varchar
IS
BEGIN
  RETURN city_ofact_prod;
END;

MEMBER FUNCTION getSector RETURN varchar
IS
BEGIN
  RETURN sector;
END;

END;