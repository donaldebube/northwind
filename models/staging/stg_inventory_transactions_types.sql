WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "inventory_transaction_types") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source