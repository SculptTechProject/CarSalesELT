
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select year
from "staging"."public_public"."stg_car_sales"
where year is null



  
  
      
    ) dbt_internal_test