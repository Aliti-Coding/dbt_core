with source as (
    select * from {{ ref('stg_jaffle_shop__payments') }}
)
,

payment_orders as (
    select
        order_id,
        max(created) as payment_finalized_date,
        sum(amount) / 100.0 as total_amount_paid
    from source
    where status <> 'fail'
    group by 1
)

select * from payment_orders
