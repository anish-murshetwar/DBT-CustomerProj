-- models/marts/mart_monthly_spending_summary.sql

{{ config(
    materialized='incremental',
    unique_key=['aggregation_month', 'profession_cleaned'],
    on_schema_change='fail'
) }}

WITH source_data AS (
    -- 1. Select and clean data from the staging model (stg_customers)
    SELECT
        customer_id,
        profession_cleaned,
        spending_score,
        -- **MOCKING A TIMESTAMP** for the incremental logic. 
        -- In a real scenario, this would be a column from your source.
        -- We'll use the current date for demonstration, but you would use a 
        -- real source column like 'customer_created_at' or 'last_order_date'.
        DATE_TRUNC('month', CURRENT_DATE) AS aggregation_month,
        CURRENT_DATE AS incremental_timestamp 

    FROM
        {{ ref('stg_customers') }}
),

monthly_aggregates AS (
    -- 2. Aggregate the data for the selected month
    SELECT
        aggregation_month,
        profession_cleaned,
        
        COUNT(customer_id) AS total_customers_added,
        AVG(spending_score) AS avg_spending_score_monthly
        
    FROM
        source_data
    GROUP BY 1, 2
)

SELECT *
FROM monthly_aggregates

-- 3. THE INCREMENTAL FILTER (The core of incremental logic)
-- This tells dbt which data to include only on subsequent runs.
{% if is_incremental() %}

    -- Only include data where the aggregation month is newer than the 
    -- latest month already in the target table (this model itself).
    WHERE aggregation_month > (
        SELECT MAX(aggregation_month) FROM {{ this }}
    )

{% endif %}