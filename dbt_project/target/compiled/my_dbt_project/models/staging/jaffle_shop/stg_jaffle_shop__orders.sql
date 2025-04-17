-- filepath: /Users/fehmmialiti/docker_learning/dbt_airflow/dbt_project/models/staging/jaffle_shop/stg_jaffle_shop_orders.sql
with source as (
    select * from "dw"."public_jaffle_shop"."orders"
)
,

renamed as (
    select
        "ID" as order_id,
        "USER_ID" as customer_id,
        "ORDER_DATE" as order_date,
        "STATUS" as status
    from source
)

select * from renamed