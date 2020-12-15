-- check out tables
SELECT * FROM climate;

SELECT * FROM market_2017;
SELECT * FROM market_2018;
SELECT * FROM market_2019;
SELECT * FROM market_2020;

SELECT * FROM prices_2017;
SELECT * FROM prices_2018;
SELECT * FROM prices_2019;
SELECT * FROM prices_2020;

SELECT * FROM prod_2018;
SELECT * FROM prod_2019;
SELECT * FROM prod_2020;


-- alter year_month columns to date type
-- climate
ALTER TABLE climate
ALTER year_month TYPE date USING(year_month::date);

-- market
ALTER TABLE market_2017
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE market_2018
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE market_2019
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE market_2020
ALTER year_month TYPE date USING(year_month::date);

-- prices
ALTER TABLE prices_2017
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE prices_2018
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE prices_2019
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE prices_2020
ALTER year_month TYPE date USING(year_month::date);

-- production
ALTER TABLE prod_2018
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE prod_2019
ALTER year_month TYPE date USING(year_month::date);

ALTER TABLE prod_2020
ALTER year_month TYPE date USING(year_month::date);



CREATE TABLE all_prod
AS
  SELECT * FROM prod_2018
  UNION
  SELECT * FROM prod_2019
  UNION
  SELECT * FROM prod_2020;

CREATE TABLE all_prices
AS
  SELECT * FROM prices_2017
  UNION
  SELECT * FROM prices_2018
  UNION
  SELECT * FROM prices_2019
  UNION
  SELECT * FROM prices_2020;

CREATE TABLE all_market
AS
  SELECT * FROM market_2017
  UNION
  SELECT * FROM market_2018
  UNION
  SELECT * FROM market_2019
  UNION
  SELECT * FROM market_2020;


--*************************************
SELECT * FROM all_prod;
SELECT * FROM all_prices;
SELECT * FROM all_market;
SELECT * FROM climate;