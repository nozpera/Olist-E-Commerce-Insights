WITH formatted_category_name AS 
(SELECT product_category_name, {{ format_product_name('product_category_name_english') }} AS product_category_name_english FROM {{ source('sources', 'product_category_name_translation') }})

SELECT
    otp.product_id,
    fcn.product_category_name_english AS product_category_name,
    otp.total_sold_products,
    otp.total_revenue,
    op.product_weight_g AS product_weight,
    op.product_length_cm AS product_length,
    op.product_height_cm AS product_height,
    op.product_width_cm AS product_width
FROM {{ source('sources', 'olist_products_dataset') }} AS op
INNER JOIN {{ ref('stg_olist_total_products') }} AS otp 
ON otp.product_id = op.product_id
INNER JOIN formatted_category_name AS fcn
ON fcn.product_category_name = op.product_category_name
ORDER BY 3 DESC