WITH source AS (
    SELECT
        ID AS PRODUCT_ID,
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
        ATTACHMENTS,
        DBT_INGESTION_TIMESTAMP AS insertion_timestamp
    FROM {{ ref('stg_products')}}
),

unique_source AS (
    SELECT *,
        row_number() over (partition by PRODUCT_ID ORDER BY insertion_timestamp DESC) AS row_number
    FROM source
)
SELECT 
    PRODUCT_ID,
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
    ATTACHMENTS,
    insertion_timestamp
FROM unique_source
WHERE row_number = 1




