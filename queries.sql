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



--updated from here down
CREATE TABLE prices_prod AS
SELECT
	price.year_month,
	price.geography,
	price.date,
	price.type,
	price.avg_price,
	price.price_total_volume,
	price.four_zero_four_six_units,
	price.four_two_two_five_units,
	price.four_seven_seven_zero_units,
	price.total_bags,
	price.s_bags,
	price.l_bags,
	price.xl_bags,
	prod.status,
	prod.prod_total_volume,
	prod.california,
	prod,chile,
	prod.mexico,
	prod.peru,
	prod.columbia
FROM all_prices AS price
INNER JOIN all_prod AS prod USING (date);

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
	prod,chile,
	prod.mexico,
	prod.peru,
	prod.columbia
FROM all_market AS mar
INNER JOIN all_prod AS prod USING (date);

CREATE TABLE prices_clim AS
SELECT
	price.year_month,
	price.geography,
	price.date,
	price.type,
	price.avg_price,
	price.price_total_volume,
	price.four_zero_four_six_units,
	price.four_two_two_five_units,
	price.four_seven_seven_zero_units,
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

CREATE TABLE prod_clim AS
SELECT
	prod.year_month,
	prod.status,
	prod.prod_total_volume,
	prod.california,
	prod,chile,
	prod.mexico,
	prod.peru,
	prod.columbia,
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
=======
SELECT * FROM climate;
