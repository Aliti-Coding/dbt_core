
  
    

  create  table "dw"."public"."int_paid_orders__dbt_tmp"
  
  
    as
  
  (
    with orders as (
    select * from "dw"."public"."stg_jaffle_shop__orders"
)
,

customers as (
    select * from "dw"."public"."stg_jaffle_shop__customers"
)
,

payment_orders as (
    select * from "dw"."public"."int_payment_orders"
)
,

paid_orders as (
    select
        o.order_id,
        o.customer_id,
        o.order_date as order_placed_at,
        o.status as order_status,
        p.total_amount_paid,
        p.payment_finalized_date,
        c.first_name as customer_first_name,
        c.last_name as customer_last_name
    from orders as o
    left join payment_orders as p on o.order_id = p.order_id
    left join customers as c on o.customer_id = c.customer_id

)

select * from paid_orders
  );
  