--Which flight conditions consistently produce above-average retail spend?

with flight_level_spend as (
    select
        flight_id,
        round(avg(total_amount_usd), 2) as avg_spend
    from bulgari_lax_retail_transactions
    group by flight_id
),
flight_conditions as (
    select
        f."Flight Number" as flight_id,
        case
            when f."Departure delay (Minutes)" = 0 then 'on time'
            when f."Departure delay (Minutes)" between 1 and 30 then 'short delay'
            else 'long delay'
        end as delay_type
    from lax_flights_departures f
)
select
    c.delay_type,
    round(avg(s.avg_spend), 2) as avg_transaction_value,
    round(
        avg(s.avg_spend) - avg(avg(s.avg_spend)) over (),
        2
    ) as lift_vs_overall
from flight_level_spend s
join flight_conditions c
  on s.flight_id = c.flight_id
group by c.delay_type
order by avg_transaction_value desc;

