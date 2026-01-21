-- do flight delays increase or decrease spending?
with transaction_flights as (
    select
        t.transaction_id,
        t.total_amount_usd,
        f."Departure delay (Minutes)" as departure_delay
    from bulgari_lax_retail_transactions t
    join lax_flights_departures f
        on t.flight_id = f."Flight Number"
),
transactions_by_delay_type as (
    select
        case
            when departure_delay = 0 then 'on time'
            when departure_delay between 1 and 30 then 'short delay'
            else 'long delay'
        end as delay_type,
        total_amount_usd
    from transaction_flights
)
select
    delay_type,
    count(*) as transactions,
    round(avg(total_amount_usd), 2) as avg_spend,
    round(
        avg(total_amount_usd)
        - avg(avg(total_amount_usd)) over (),
        2
    ) as diff_vs_overall_avg
from transactions_by_delay_type
group by delay_type
order by avg_spend desc;





