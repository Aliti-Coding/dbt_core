with source as (
    select * from "dw"."public_jaffle_shop"."customers"
)
,

renamed as (
    select
        "ID" as customer_id,
        "FIRST_NAME" as first_name,
        "LAST_NAME" as last_name
    from source
)

select * from renamed