
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select car_make
from "staging"."public_public"."dim_car"
where car_make is null



  
  
      
    ) dbt_internal_test