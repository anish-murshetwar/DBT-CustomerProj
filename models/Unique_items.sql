-- models/Unique_Items.sql
-- Replaced dbt_utils.deduplicate with standard SQL to fix package error

WITH ranked_items AS (

    SELECT
        *,
        -- Assign a rank (rn) of 1 to the rows we want to keep
        ROW_NUMBER() OVER (
            PARTITION BY customer_id -- Unique key for the deduplication
            ORDER BY family_size DESC, annual_income DESC
            -- We keep the record with the largest family_size and then the largest income
        ) AS rn
    
    FROM
        {{ source('customers_raw', 'customers') }}

)

SELECT
    customer_id,
    gender,
    annual_income,
    family_size
    -- Select all columns needed for downstream models
FROM
    ranked_items
WHERE
    rn = 1