WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "privileges") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source