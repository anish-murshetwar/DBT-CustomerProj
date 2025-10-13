 select customer_id,annual_income
 from {{ ref('customers') }}
 where annual_income <0 
