CREATE TABLE fact_dw_date (
dat date,      
jds varchar(10),
sem number(2),
mon number(2),
tri number(1),
temp number(3)
);

CREATE UNIQUE INDEX fact_dw_date_idx ON fact_dw_date(dat);

ALTER TABLE fact_dw_date
ADD CONSTRAINT fact_dw_date_pk PRIMARY KEY (dat);
