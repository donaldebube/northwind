WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "purchase_order_status") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source