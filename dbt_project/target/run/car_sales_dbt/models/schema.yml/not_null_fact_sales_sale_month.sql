
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sale_month
from "staging"."public_public"."fact_sales"
where sale_month is null



  
  
      
    ) dbt_internal_test