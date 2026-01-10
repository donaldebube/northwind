WITH source AS (
    SELECT 
    CAST(SUPPLIER_IDS  AS INTEGER) AS SUPPLIER_ID,
    ID,
    PRODUCT_CODE,
    PRODUCT_NAME,
    DESCRIPTION,
    STANDARD_COST,
    LIST_PRICE,
    REORDER_LEVEL,
    TARGET_LEVEL,
    QUANTITY_PER_UNIT,
    DISCONTINUED,
    MINIMUM_REORDER_QUANTITY,
    CATEGORY,
    ATTACHMENTS
    FROM {{ source("northwind_raw", "products") }}
    WHERE SUPPLIER_IDS NOT LIKE '%;%'
)

SELECT 
    *,
    current_timestamp() AS dbt_ingestion_timestamp
FROM source