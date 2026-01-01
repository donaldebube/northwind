WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "order_details_status") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source