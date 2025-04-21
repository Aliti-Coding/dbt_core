{% set payment_methods = dbt_utils.get_column_values(
    table=ref('stg_jaffle_shop__payments'),
    column='paymentmethod'
) %}


with source as (
    select * from {{ ref('stg_jaffle_shop__payments') }}
)

select
    order_id,

    {% for payment_method in payment_methods -%}
        sum(case when paymentmethod = '{{ payment_method }}' then amount / 100 else 0 end) as {{ payment_method }}_amount
        {%- if not loop.last -%}
            ,
        {%- endif %}
    {% endfor %}
from source
group by 1
