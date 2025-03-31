{{
    config(
        materialized='view'
    )
}}
with orders as (select * from {{ source('jaffle_source', 'orders') }}),
customers as (select  * from {{ source('jaffle_source', 'customers') }}),
joined_value as (select * from orders ord join customers cst on ord.user_id=cst.id)

select user_id,order_date,status from joined_value

