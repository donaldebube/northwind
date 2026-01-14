-- partition segment
{{
    config(
        materialized='table',
        cluster_by=['transaction_created_date', 'product_id']
    )
}}

WITH source AS (
    SELECT 
        id AS inventory_id,
        transaction_type,
        transaction_created_date,
        transaction_modified_date,
        product_id,
        quantity,
        purchase_order_id,
        customer_order_id,
        comments,
        current_timestamp() AS insertion_timestamp
    FROM {{ ref("stg_inventory_transactions")}}
),

unique_source AS (
    SELECT 
        inventory_id,
        transaction_type,
        transaction_created_date,
        transaction_modified_date,
        product_id,
        quantity,
        purchase_order_id,
        customer_order_id,
        comments,
        insertion_timestamp,
        row_number () OVER (
            partition by inventory_id,product_id,purchase_order_id,customer_order_id,transaction_created_date
            ORDER BY insertion_timestamp
        ) AS row_number
    FROM source
)

SELECT 
    inventory_id,
    transaction_type,
    transaction_created_date,
    transaction_modified_date,
    product_id,
    quantity,
    purchase_order_id,
    customer_order_id,
    comments,
    insertion_timestamp,
FROM unique_source
WHERE row_number = 1