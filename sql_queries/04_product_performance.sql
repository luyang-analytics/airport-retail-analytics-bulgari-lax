--Which product categories perform best for different traveler types?
select
    traveler_type,
    product_category,
    sum(quantity) as units_sold,
    sum(total_amount_usd) as total_revenue,
    round(avg(total_amount_usd), 2) as avg_transaction_value
from bulgari_lax_retail_transactions
group by traveler_type, product_category
order by traveler_type, total_revenue desc;
