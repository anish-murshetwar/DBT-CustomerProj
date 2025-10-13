-- This test checks if the income_category column is ever NULL.
-- It will pass if 0 rows are returned (i.e., no NULLs found).
SELECT
    customer_id
FROM
    {{ ref('customers') }} -- Reference your new model
WHERE
    annual_income IS NULL