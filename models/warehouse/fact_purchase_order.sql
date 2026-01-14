{{
    config(
        materialized='table',
        cluster_by=['creation_date', 'purchase_order_id']
    )
}}

WITH source AS (
    SELECT 
        c.id AS customer_id,
        e.id AS employee_id,
        pod.purchase_order_id,
        p.id AS product_id,
        pod.quantity,
        pod.unit_cost,
        pod.date_received,
        pod.posted_to_inventory,
        pod.inventory_id,
        po.supplier_id,
        po.created_by,
        po.submitted_date,
        date(po.creation_date) AS creation_date,
        po.status_id,
        po.expected_date,
        po.shipping_fee,
        po.taxes,
        po.payment_date,
        po.payment_amount,
        po.payment_method,
        po.notes,
        po.approved_by,
        po.approved_date,
        po.submitted_by,
        current_timestamp() AS insertion_timestamp
    FROM {{ ref("stg_purchase_orders")}} AS po
    LEFT JOIN {{ ref("stg_purchase_order_details")}} AS pod
        ON po.id = pod.purchase_order_id
    LEFT JOIN {{ ref("stg_products")}} AS p
        ON p.id = pod.product_id
    LEFT JOIN {{ ref("stg_order_details") }} AS od
        ON od.product_id = p.id
    LEFT JOIN {{ ref("stg_orders") }} AS o
        ON o.id = od.order_id
    LEFT JOIN {{ ref("stg_employees") }} AS e
        ON e.id = po.created_by
    LEFT JOIN {{ ref("stg_customer") }} c
        ON c.id = o.customer_id
    WHERE o.customer_id IS NOT NULL  -- Ensures customer linkage exists
),

unique_source AS (
    SELECT *,
        row_number() OVER (
            PARTITION BY customer_id, employee_id, purchase_order_id, product_id, inventory_id, supplier_id, creation_date
            ORDER BY insertion_timestamp DESC
        ) AS row_number
    FROM source
)

SELECT 
    customer_id,
    employee_id,
    purchase_order_id,
    product_id,
    quantity,
    unit_cost,
    date_received,
    posted_to_inventory,
    inventory_id,
    supplier_id,
    created_by,
    submitted_date,
    creation_date,
    status_id,
    expected_date,
    shipping_fee,
    taxes,
    payment_date,
    payment_amount,
    payment_method,
    notes,
    approved_by,
    approved_date,
    submitted_by,
    insertion_timestamp
FROM unique_source
WHERE row_number = 1
