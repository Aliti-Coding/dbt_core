
  create view "dw"."public"."stg_jaffle_shop_customers__dbt_tmp"
    
    
  as (
    with source as (
    select * from "dw"."_jaffle_shop"."raw_customers"
),

renamed as (
    select
        id as customer_id,
        name as customer_name
    from source
)

select * from renamed
  );