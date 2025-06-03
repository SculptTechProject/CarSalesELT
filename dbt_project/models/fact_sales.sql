{{ config(materialized = "table", alias = "fact_sales") }}

with base as (
  select
    *,
    date_trunc('month', to_date(sale_date, 'YYYY-MM-DD')) as sale_month
  from {{ ref('stg_car_sales') }}
)

select
  sale_month,
  make        as car_make,
  model       as car_model,
  count(*)    as total_sales,
  avg(price_in_thousands) as avg_price
from base
group by 1, 2, 3
order by 1 desc, 2, 3