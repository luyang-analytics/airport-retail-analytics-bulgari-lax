--Does departure time affect spending?
--How does time pressure before departure affects spending?

with time_to_departure as (
    select
        transaction_id,
        total_amount_usd,
        extract(
            epoch from (
                scheduled_departure_time::timestamp
                - transaction_time::timestamp
            )
        ) / 60 as minutes_before_departure
    from bulgari_lax_retail_transactions
),
time_pressure_segments as (
    select
        case
            when minutes_before_departure < 30 then 'last minute'
            when minutes_before_departure between 30 and 90 then 'moderate time'
            else 'plenty of time'
        end as time_pressure,
        total_amount_usd
    from time_to_departure
)
select
    time_pressure,
    count(*) as transactions,
    round(avg(total_amount_usd), 2) as avg_spend
from time_pressure_segments
group by time_pressure
order by avg_spend desc;

