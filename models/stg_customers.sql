-- models/staging/stg_customers.sql
-- Cleans and standardizes columns for downstream use

{{ config(materialized='table') }}

SELECT
    customer_id,
    TRIM(LOWER(gender)) as gender_cleaned,
    TRIM(LOWER(profession)) as profession_cleaned, -- Used by the macro
    
    age,
    gender,
    annual_income,
    profession,
    work_experience,
    spending_score
    
FROM
    {{ source('customers_raw', 'customers') }}
WHERE
    age IS NOT NULL AND annual_income > 0