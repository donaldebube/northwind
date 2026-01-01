WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "purchase_order_details") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source