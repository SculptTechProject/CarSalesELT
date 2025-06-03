
  create view "staging"."public"."stg_car_sales__dbt_tmp"
    
    
  as (
    

select
  Manufacturer   as make,
  Model          as model,
  Sales_in_thousands      as sales_in_thousands,
  __year_resale_value     as year_resale_value,
  Vehicle_type   as vehicle_type,
  Price_in_thousands      as price_in_thousands,
  Engine_size    as engine_size,
  Horsepower     as horsepower,
  Wheelbase      as wheelbase,
  Width          as width,
  Length         as length,
  Curb_weight    as curb_weight,
  Fuel_capacity  as fuel_capacity,
  Fuel_efficiency as fuel_efficiency,
  Latest_Launch  as sale_date,
  Power_perf_factor as power_perf_factor
from "staging"."raw"."car_sales"
  );