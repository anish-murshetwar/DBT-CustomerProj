-- models/intermediate/int_customer_ranks.sql

{{ config(
    materialized='ephemeral'
) }}

SELECT
    *, 
    
    -- Calculation 1: Value Score based on Income and Experience
    (annual_income / 1000) + (work_experience * 10) AS customer_value_score,
    
    -- Calculation 2: Rank within profession
    RANK() OVER (
        PARTITION BY profession_cleaned
        ORDER BY (annual_income / 1000) + (work_experience * 10) DESC
    ) AS profession_rank
    
FROM
    -- Use the existing staging model for clean data
    {{ ref('stg_customers') }}