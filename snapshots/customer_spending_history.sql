-- snapshots/customer_spending_history.sql

{% snapshot customer_spending_history %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['annual_income', 'spending_score'],
        invalidate_hard_deletes=True
    )
}}

SELECT
    customer_id,
    gender,
    profession,
    annual_income,
    spending_score
    
FROM
    -- Use the clean staging data as the source for the snapshot
    {{ ref('stg_customers') }} 

{% endsnapshot %}