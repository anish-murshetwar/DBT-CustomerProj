-- macros/calculate_spending_summary.sql

{% macro calculate_spending_summary(model_ref) %}

SELECT
    profession,
    COUNT(customer_id) AS total_customers,
    
    -- Key aggregation metrics
    AVG(spending_score) AS average_spending_score,
    AVG(annual_income) AS average_annual_income,
    
    -- Find the highest and lowest spending score in the group
    MAX(spending_score) AS max_spending_score,
    MIN(spending_score) AS min_spending_score
    
FROM
    {{ ref("customers") }}
    
GROUP BY 1
ORDER BY average_spending_score DESC

{% endmacro %}