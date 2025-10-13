{# ======================================================
    DBT Model: customers_transformed.sql
    Purpose: Clean, categorize, and rank customer data
   ====================================================== #}

{% set income_brackets = [
    {'label': 'Low Income', 'min': 0, 'max': 30000},
    {'label': 'Medium Income', 'min': 30001, 'max': 70000},
    {'label': 'High Income', 'min': 70001, 'max': 9999999}
] %}

-- Step 1: Extract raw data
with customers_raw as (
    select
        customer_id,
        initcap(gender) as gender,
        age,
        annual_income,
        spending_score,
        profession,
        family_size
    from {{ source('customers_raw', 'customers') }}
),

-- Step 2: Apply income categorization dynamically
customers_categorized as (
    select
        *,
        case
            {% for bracket in income_brackets %}
                when annual_income between {{ bracket.min }} and {{ bracket.max }}
                then '{{ bracket.label }}'
            {% endfor %}
        end as income_category
    from customers_raw
    where age is not null
      and annual_income > 0
),

-- Step 3: Rank by gender and income
ranked_customers as (
    select
        *,
        row_number() over (partition by gender order by annual_income desc) as income_rank
    from customers_categorized
)

-- Step 4: Final selection
select
    customer_id,
    gender,
    age,
    annual_income,
    spending_score,
    profession,
    family_size,
    income_category
from ranked_customers
where income_rank <= 10
order by gender, annual_income desc