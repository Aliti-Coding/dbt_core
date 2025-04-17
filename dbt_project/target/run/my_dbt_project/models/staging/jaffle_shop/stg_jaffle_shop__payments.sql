
  create view "dw"."public"."stg_jaffle_shop__payments__dbt_tmp"
    
    
  as (
    with source as (
    select * from "dw"."public_jaffle_shop"."payments"
)
,

renamed as (
    select
        "ID" as id,
        "ORDERID" as order_id,
        "PAYMENTMETHOD" as paymentmethod,
        "STATUS" as status,
        "AMOUNT" as amount,
        "CREATED" as created
    from source
)

select * from renamed
  );