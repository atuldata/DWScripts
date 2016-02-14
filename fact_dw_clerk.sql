CREATE  TABLE fact_dw_clerk (
clerk_id number(4),
experience number(3),
gender varchar(1),
store varchar(7),
store_opening date,
store_city varchar(20),
store_sector varchar(20)
);

CREATE UNIQUE INDEX fact_dw_clerk_idx ON fact_dw_clerk(clerk_id);

ALTER TABLE fact_dw_clerk
ADD CONSTRAINT fact_dw_clerk_pk PRIMARY KEY (clerk_id);
