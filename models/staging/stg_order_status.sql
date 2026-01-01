WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "orders_status") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source