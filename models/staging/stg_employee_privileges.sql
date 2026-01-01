WITH source AS (
    SELECT *
    FROM {{ source("northwind_raw", "employee_privileges") }}
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source