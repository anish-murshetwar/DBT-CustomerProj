{{config(alias='Profession_Income_Stats')}}

with customers_raw as(SELECT
    profession,
    COUNT(customer_id) AS total_customers_in_profession,
    AVG(annual_income) AS average_annual_income,
    MAX(work_experience) AS max_work_experience
FROM
    {{ source('customers_raw', 'customers') 
       }} 
GROUP BY 1
HAVING COUNT(customer_id) >= 10
ORDER BY average_annual_income DESC)



select * from customers_raw