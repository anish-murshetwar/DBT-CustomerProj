-- models/marts/agg_spending_by_profession.sql
-- Calls the macro to build the final aggregated table

{{ config(
    materialized='table',
    alias='Spending_Summary_by_Profession'
) }}

-- Call the macro, passing the reference to the staging model
{{ calculate_spending_summary(ref('stg_customers')) }}

 