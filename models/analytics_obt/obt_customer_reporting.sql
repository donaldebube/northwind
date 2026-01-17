WITH source AS (
    SELECT 
        -- Purchase order fields
        po.purchase_order_id,
        --po.product_id,
        po.quantity,
        po.unit_cost,
        po.date_received,
        po.posted_to_inventory,
        po.inventory_id,
        po.supplier_id,
        po.created_by,
        po.submitted_date,
        po.creation_date,
        po.status_id,
        po.expected_date,
        po.shipping_fee,
        po.taxes,
        po.payment_date,
        po.payment_amount,
        po.payment_method,
        po.notes AS purchase_order_notes,
        po.approved_by,
        po.approved_date,
        po.submitted_by,

        -- Customer fields
        c.customer_id,
        c.company AS customer_company,
        c.last_name AS customer_last_name,
        c.first_name AS customer_first_name,
        c.email_address AS customer_email,
        c.job_title AS customer_job_title,
        c.business_phone AS customer_business_phone,
        c.home_phone AS customer_home_phone,
        c.mobile_phone AS customer_mobile_phone,
        c.fax_number AS customer_fax_number,
        c.address AS customer_address,
        c.city AS customer_city,
        c.state_province AS customer_state_province,
        c.zip_postal_code AS customer_zip_postal_code,
        c.country_region AS customer_country_region,
        c.web_page AS customer_web_page,
        c.notes AS customer_notes,
        c.attachments AS customer_attachments,

        -- Employee fields
        e.employee_id,
        e.company AS employee_company,
        e.last_name AS employee_last_name,
        e.first_name AS employee_first_name,
        e.email_address AS employee_email,
        e.job_title AS employee_job_title,
        e.business_phone AS employee_business_phone,
        e.home_phone AS employee_home_phone,
        e.mobile_phone AS employee_mobile_phone,
        e.fax_number AS employee_fax_number,
        e.address AS employee_address,
        e.city AS employee_city,
        e.state_province AS employee_state_province,
        e.zip_postal_code AS employee_zip_postal_code,
        e.country_region AS employee_country_region,
        e.web_page AS employee_web_page,
        e.notes AS employee_notes,
        e.attachments AS employee_attachments,

        -- Product fields
        p.product_id,
        p.product_code,
        p.product_name,
        p.description AS product_description,
        p.supplier_company,
        p.standard_cost,
        p.list_price,
        p.reorder_level,
        p.target_level,
        p.quantity_per_unit,
        p.discontinued,
        p.minimum_reorder_quantity,
        p.category,
        p.attachments AS product_attachments,

        -- Freshness field
        current_timestamp() AS insertion_timestamp
    FROM {{ ref("fact_purchase_order") }} po
    LEFT JOIN {{ ref("dim_customer") }} c 
        ON po.customer_id = c.customer_id
    LEFT JOIN {{ ref("dim_employees") }} e
        ON po.employee_id = e.employee_id
    LEFT JOIN {{ ref("dim_products") }} p
        ON po.product_id = p.product_id
)

SELECT *
FROM source
