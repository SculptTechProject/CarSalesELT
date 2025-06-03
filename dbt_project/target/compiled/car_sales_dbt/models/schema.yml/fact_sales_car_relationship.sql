
    
    

with child as (
    select  as from_field
    from "staging"."public_public"."fact_sales"
    where  is not null
),

parent as (
    select car_model as to_field
    from "staging"."public_public"."dim_car"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


