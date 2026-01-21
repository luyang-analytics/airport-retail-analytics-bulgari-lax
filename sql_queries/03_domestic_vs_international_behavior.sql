-- How does spending differ between domestic and international travelers under different delay conditions?
with transaction_flights as (
    select
        t.transaction_id,
        t.total_amount_usd,
        t.is_international,
        f."Departure delay (Minutes)" as departure_delay
    from bulgari_lax_retail_transactions t
    join lax_flights_departures f
        on t.flight_id = f."Flight Number"
),
delay_classification as (
    select
        case
            when departure_delay = 0 then 'on time'
            when departure_delay between 1 and 30 then 'short delay'
            else 'long delay'
        end as delay_type,
        case
            when is_international then 'international'
            else 'domestic'
        end as traveler_type,
        total_amount_usd
    from transaction_flights
)
select
    delay_type,
    traveler_type,
    count(*) as transactions,
    round(avg(total_amount_usd), 2) as avg_spend,
    round(
        avg(total_amount_usd)
        - avg(avg(total_amount_usd)) over (partition by traveler_type),
        2
    ) as diff_vs_traveler_avg
from delay_classification
group by delay_type, traveler_type
order by traveler_type, avg_spend desc;

