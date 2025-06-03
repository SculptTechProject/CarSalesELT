
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select car_model
from "staging"."public_public"."fact_sales"
where car_model is null



  
  
      
    ) dbt_internal_test