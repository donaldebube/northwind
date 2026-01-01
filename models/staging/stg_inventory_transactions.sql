WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "inventory_transactions") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source