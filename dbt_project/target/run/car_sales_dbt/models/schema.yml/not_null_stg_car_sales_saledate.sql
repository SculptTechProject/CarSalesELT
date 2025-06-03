
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select saledate
from "staging"."public"."stg_car_sales"
where saledate is null



  
  
      
    ) dbt_internal_test