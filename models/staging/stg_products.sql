WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "products") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source