{{ config(
    alias='stg_car_sales',
    materialized='view'
) }}

select
  *
from
  public.car_sales