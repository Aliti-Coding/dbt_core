select
      n_records as failures,
      n_records != 0 as should_warn,
      n_records != 0 as should_error
    from (
      

    

    select count(*) as n_records
    from "dw"."public"."fct_undocumented_source_tables"


      
    ) dbt_internal_test