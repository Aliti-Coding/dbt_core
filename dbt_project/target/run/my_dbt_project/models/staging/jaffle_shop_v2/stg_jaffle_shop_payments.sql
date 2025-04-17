
  create view "dw"."public"."stg_jaffle_shop_payments__dbt_tmp"
    
    
  as (
    with source as (
    select * from "dw"."public_jaffle_shop"."payments"
)
,

renamed as (
    select
        *
        -- orderid,
        -- paymentmethod,
        -- status,
        -- amount,
        -- created
    from source
)
select * from renamed
  );