{{ config(materialized = "table", alias = "dim_car") }}

select distinct
  make,
  model,
  year_resale_value as car_year,
  power_perf_factor as car_fuel  
from {{ ref('stg_car_sales') }}