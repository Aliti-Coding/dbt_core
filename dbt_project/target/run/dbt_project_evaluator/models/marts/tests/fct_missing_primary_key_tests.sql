
  create view "dw"."public"."fct_missing_primary_key_tests__dbt_tmp"
    
    
  as (
    with

tests as (
    select * from "dw"."public"."int_model_test_summary"
    where resource_type in
    (
        'model'
        
    )
),

final as (

    select
        resource_name,
        resource_type,
        model_type,
        is_primary_key_tested,
        number_of_tests_on_model,
        number_of_constraints_on_model
    from tests
    where not(is_primary_key_tested)

)

select * from final



    

    
    

    

    


  );