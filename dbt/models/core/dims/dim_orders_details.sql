WITH formatted_category_name AS 
(SELECT product_category_name, {{ format_product_name('product_category_name_english') }} AS product_category_name_english FROM {{ source('sources', 'product_category_name_translation') }}),
product_merged AS (SELECT
op.product_id,
op.product_category_name,
fcn.product_category_name_english
FROM {{ source('sources', 'olist_products_dataset') }} AS op
INNER JOIN formatted_category_name AS fcn
ON fcn.product_category_name = op.product_category_name)

SELECT
    sp.seller_id,
    otp.product_id,
    ood.customer_id,
    otp.order_id,
    pm.product_category_name_english AS product_category,
    otp.total_order_items,
    ood.order_status,
    ood.order_delivered_carrier_date,
    ood.order_delivered_customer_date,
    otp.shipping_limit_date,
    otp.total_payment,
    oor.review_score
FROM {{ ref('stg_olist_total_payments') }} AS otp
INNER JOIN {{ ref('dim_sellers_profile') }} AS sp
ON sp.seller_id = otp.seller_id
INNER JOIN product_merged AS pm
ON pm.product_id = otp.product_id
INNER JOIN {{ source('sources', 'olist_orders_dataset') }} AS ood
ON ood.order_id = otp.order_id
LEFT JOIN {{ source('sources', 'olist_order_reviews_dataset') }} AS oor
ON oor.order_id = otp.order_id
ORDER BY 1