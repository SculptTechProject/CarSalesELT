{{ config(
    alias='dim_car',
    materialized='table'
) }}

select distinct
  make    as car_make,
  model   as car_model,
  year    as car_year,
  fuelType as car_fuel
from {{ ref('stg_car_sales') }}