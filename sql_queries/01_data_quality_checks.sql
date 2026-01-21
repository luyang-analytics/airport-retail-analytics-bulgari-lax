-- transaction count
select count(*) as total_transactions
from bulgari_lax_retail_transactions;

-- missing values
select
    sum(case when flight_id is null then 1 else 0 end) as missing_flight_id,
    sum(case when total_amount_usd is null then 1 else 0 end) as missing_sales
from bulgari_lax_retail_transactions;

-- price sanity check
select
    min(unit_price_usd) as min_price,
    max(unit_price_usd) as max_price,
    avg(unit_price_usd) as avg_price
from bulgari_lax_retail_transactions;



