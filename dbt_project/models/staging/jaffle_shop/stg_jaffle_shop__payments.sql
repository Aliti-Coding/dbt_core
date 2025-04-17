with source as (
    select * from {{ source('jaffle_shop', 'payments') }}
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
