with customers as (
    select * from "dw"."public"."stg_jaffle_shop__customers"
)
,

orders as (
    select * from "dw"."public"."stg_jaffle_shop__orders"
)
,

customer_orders as (
    select
        c.customer_id,
        min(o.order_date) as first_order_date,
        max(o.order_date) as most_recent_order_date,
        count(o.order_id) as number_of_orders
    from customers as c
    left join orders as o
        on c.customer_id = o.customer_id
    group by 1
)

select * from customer_orders