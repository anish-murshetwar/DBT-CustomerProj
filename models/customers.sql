{{ config(materialized='table',
   alias='Males_Top50_Income') 
   }}

with customers_raw as (
    select 
        spending_score,
        customer_id,
        gender,
        annual_income,
        profession

    from
        {{ source('customers_raw', 'customers')
           }}
    where lower(gender) = 'male'

    order by annual_income desc
    limit 50
)

select * from customers_raw