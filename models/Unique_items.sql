{{ dbt_utils.deduplicate(
    relation=source('customers_raw', 'customers'),
    partition_by='gender',
    order_by="family_size desc",
   )
}}
