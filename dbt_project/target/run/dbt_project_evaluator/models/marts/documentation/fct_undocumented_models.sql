
  create view "dw"."public"."fct_undocumented_models__dbt_tmp"
    
    
  as (
    with

all_resources as (
    select * from "dw"."public"."int_all_graph_resources"
    where not is_excluded

),

final as (

    select
        resource_name,
        model_type

    from all_resources
    where not is_described and resource_type = 'model'

)

select * from final



    

    
    

    

    


  );