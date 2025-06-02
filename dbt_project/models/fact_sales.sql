{{ config(
    alias='fact_sales',
    materialized='table'
) }}

with base as (
  select
    *,
    date_trunc('month', to_date(saledate, 'YYYY-MM-DD')) as sale_month
  from {{ ref('stg_car_sales') }}
)

select
  sale_month,
  make     as car_make,
  model    as car_model,
  count(*) as total_sales,
  avg(price) as avg_price
from base
group by 1, 2, 3
order by 1 desc, 2, 3