
    
    

select
    concat(car_make, '-', car_model, '-', car_year) as unique_field,
    count(*) as n_records

from "staging"."public_public"."dim_car"
where concat(car_make, '-', car_model, '-', car_year) is not null
group by concat(car_make, '-', car_model, '-', car_year)
having count(*) > 1


