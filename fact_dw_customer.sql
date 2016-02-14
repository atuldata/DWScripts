CREATE  TABLE fact_dw_customer (
card_num number(8),
dob date,
adress varchar(50),
secteur varchar(50), 
gender varchar(1), 
occupation varchar(50),
house varchar(50)
);

CREATE UNIQUE INDEX fact_dw_customer_idx ON fact_dw_customer(card_num);

ALTER TABLE fact_dw_customer
ADD CONSTRAINT fact_dw_customer_pk PRIMARY KEY (card_num);
