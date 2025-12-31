WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "customer") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source