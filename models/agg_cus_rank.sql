-- models/agg_customer_ranks.sql
-- This model consumes the EPHEMERAL logic and creates a final TABLE.

{{ config(
    materialized='table',
    alias='Final_Customer_Ranks'
) }}

SELECT
    customer_id,
    profession_cleaned,
    annual_income,
    customer_value_score,
    profession_rank
    
FROM
    -- This reference causes dbt to inject the SQL from
    -- 'int_customer_ranks.sql' here as a CTE.
    {{ ref('int_cus_rank') }} 

WHERE
    profession_rank <= 5 -- Example: Select only the top 5 customers per profession
    
ORDER BY
    profession_cleaned, profession_rank