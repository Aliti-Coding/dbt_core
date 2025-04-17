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