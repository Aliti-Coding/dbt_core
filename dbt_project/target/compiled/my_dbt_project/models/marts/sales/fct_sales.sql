with customer_orders as (
    select * from "dw"."public"."int_customer_orders"
),

paid_orders as (
    select * from "dw"."public"."int_paid_orders"
),

sales as (
    select
        p.*,
        row_number() over (
            order by p.order_id
        ) as transaction_seq,
        row_number() over (
            partition by p.customer_id
            order by p.order_id
        ) as customer_sales_seq,
        case
            when c.first_order_date = p.order_placed_at
                then 'new'
            else 'return'
        end as nvsr,
        sum(p.total_amount_paid) over (
            partition by p.customer_id
            order by p.customer_id
        ) as customer_lifetime_value,
        c.first_order_date as fdos
    from paid_orders as p
    left join customer_orders as c on p.customer_id = c.customer_id
)

select * from sales