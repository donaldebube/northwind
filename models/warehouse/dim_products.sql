WITH source AS (
    SELECT
        products.ID AS PRODUCT_ID,
        products.PRODUCT_CODE,
        products.PRODUCT_NAME,
        products.DESCRIPTION,
        supplier.COMPANY AS SUPPLIER_COMPANY,
        products.STANDARD_COST,
        products.LIST_PRICE,
        products.REORDER_LEVEL,
        products.TARGET_LEVEL,
        products.QUANTITY_PER_UNIT,
        products.DISCONTINUED,
        products.MINIMUM_REORDER_QUANTITY,
        products.CATEGORY,
        products.ATTACHMENTS,
        products.DBT_INGESTION_TIMESTAMP AS insertion_timestamp
    FROM {{ ref('stg_products')}} AS products
    LEFT JOIN {{ ref('stg_suppliers') }} AS supplier
        ON products.supplier_id = supplier.id
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
    SUPPLIER_COMPANY,
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




