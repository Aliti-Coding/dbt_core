select
      n_records as failures,
      n_records != 0 as should_warn,
      n_records != 0 as should_error
    from (
      

    

    select count(*) as n_records
    from "dw"."public"."fct_direct_join_to_source"


      
    ) dbt_internal_test