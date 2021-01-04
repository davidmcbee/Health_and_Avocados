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

SELECT * FROM prices_tableau;
SELECT * FROM prod_tableau;
SELECT * FROM predictions_tableau;
SELECT * FROM plu_tableau;

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

-- alter date columns to date type
-- market
ALTER TABLE market_2017
ALTER date TYPE date USING(date::date);

ALTER TABLE market_2018
ALTER date TYPE date USING(date::date);

ALTER TABLE market_2019
ALTER date TYPE date USING(date::date);

ALTER TABLE market_2020
ALTER date TYPE date USING(date::date);

-- prices
ALTER TABLE prices_2017
ALTER date TYPE date USING(date::date);

ALTER TABLE prices_2018
ALTER date TYPE date USING(date::date);

ALTER TABLE prices_2019
ALTER date TYPE date USING(date::date);

ALTER TABLE prices_2020
ALTER date TYPE date USING(date::date);

-- production
ALTER TABLE prod_2018
ALTER date TYPE date USING(date::date);

ALTER TABLE prod_2019
ALTER date TYPE date USING(date::date);

ALTER TABLE prod_2020
ALTER date TYPE date USING(date::date);

-- union production datasets
CREATE TABLE all_prod
AS
  SELECT * FROM prod_2018
  UNION
  SELECT * FROM prod_2019
  UNION
  SELECT * FROM prod_2020;

-- union prices dataset
CREATE TABLE all_prices
AS
  SELECT * FROM prices_2017
  UNION
  SELECT * FROM prices_2018
  UNION
  SELECT * FROM prices_2019
  UNION
  SELECT * FROM prices_2020;

-- union market datasets
CREATE TABLE all_market
AS
  SELECT * FROM market_2017
  UNION
  SELECT * FROM market_2018
  UNION
  SELECT * FROM market_2019
  UNION
  SELECT * FROM market_2020;


-- check out combined datasets
SELECT * FROM all_prod;
SELECT * FROM all_prices;
SELECT * FROM all_market;
SELECT * FROM climate;


-- join prices and production datasets on date
CREATE TABLE prices_prod AS
SELECT
	price.year_month,
	price.geography,
	price.date,
	price.type,
	price.avg_price,
	price.prices_total_volume,
	price.units_4046,
	price.units_4225,
	price.units_4770,
	price.total_bags,
	price.s_bags,
	price.l_bags,
	price.xl_bags,
	prod.status,
	prod.prod_total_volume,
	prod.california,
	prod.chile,
	prod.mexico,
	prod.peru,
	prod.colombia
FROM all_prices AS price
INNER JOIN all_prod AS prod USING (date);


-- join market and production datasets on date
CREATE TABLE market_prod AS
SELECT
	mar.year_month,
	mar.geography,
	mar.period,
	mar.date,
	mar.units_prior_year,
	mar.units_current_year,
	mar.unit_variance,
	mar.dollars_prior_year,
	mar.dollars_current_year,
	mar.dollar_variance,
	mar.avg_price_prior_year,
	mar.avg_price_current_year,
	mar.avg_price_variance,
	prod.prod_total_volume,
	prod.california,
	prod.chile,
	prod.mexico,
	prod.peru,
	prod.colombia
FROM all_market AS mar
INNER JOIN all_prod AS prod USING (date);


-- join prices and climate datasets on year_month
CREATE TABLE prices_clim AS
SELECT
	price.year_month,
	price.geography,
	price.date,
	price.type,
	price.avg_price,
	price.prices_total_volume,
	price.units_4046,
	price.units_4225,
	price.units_4770,
	price.total_bags,
	price.s_bags,
	price.l_bags,
	price.xl_bags,
	clim.pcp,
	clim.tavg,
	clim.pdsi,
	clim.phdi,
	clim.zndx,
	clim.pmdi,
	clim.cdd,
	clim.sp01,
	clim.sp02,
	clim.sp03,
	clim.sp06,
	clim.sp09,
	clim.sp12,
	clim.sp24,
	clim.tmin,
	clim.tmax
FROM all_prices AS price
INNER JOIN climate AS clim USING (year_month);


-- join market and climate datasets on year_month
CREATE TABLE market_clim AS
SELECT
	mar.year_month,
	mar.geography,
	mar.period,
	mar.date,
	mar.units_prior_year,
	mar.units_current_year,
	mar.unit_variance,
	mar.dollars_prior_year,
	mar.dollars_current_year,
	mar.dollar_variance,
	mar.avg_price_prior_year,
	mar.avg_price_current_year,
	mar.avg_price_variance,
	clim.pcp,
	clim.tavg,
	clim.pdsi,
	clim.phdi,
	clim.zndx,
	clim.pmdi,
	clim.cdd,
	clim.sp01,
	clim.sp02,
	clim.sp03,
	clim.sp06,
	clim.sp09,
	clim.sp12,
	clim.sp24,
	clim.tmin,
	clim.tmax
FROM all_market AS mar
INNER JOIN climate AS clim USING (year_month);


-- join production and climate datasets on year_month
CREATE TABLE prod_clim AS
SELECT
	prod.year_month,
	prod.status,
	prod.prod_total_volume,
	prod.california,
	prod.chile,
	prod.mexico,
	prod.peru,
	prod.colombia,
	clim.pcp,
	clim.tavg,
	clim.pdsi,
	clim.phdi,
	clim.zndx,
	clim.pmdi,
	clim.cdd,
	clim.sp01,
	clim.sp02,
	clim.sp03,
	clim.sp06,
	clim.sp09,
	clim.sp12,
	clim.sp24,
	clim.tmin,
	clim.tmax
FROM all_prod AS prod
INNER JOIN climate AS clim USING (year_month);


-- check out joined datasets
SELECT * FROM prices_prod;
SELECT * FROM market_prod;
SELECT * FROM prices_clim;
SELECT * FROM market_clim;
SELECT * FROM prod_clim;