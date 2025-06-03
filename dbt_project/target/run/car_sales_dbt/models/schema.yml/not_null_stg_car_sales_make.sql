
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select make
from "staging"."public"."stg_car_sales"
where make is null



  
  
      
    ) dbt_internal_test