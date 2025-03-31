WITH sellers_orders AS (SELECT
    sp.seller_id,
    oto.order_id,
    oto.total_order_items,
    oto.total_order_value,
    oto.total_freight_value,
    ROUND(oto.total_order_value + oto.total_freight_value, 2) AS total_payment
FROM {{ ref('dim_sellers_profile') }} AS sp
INNER JOIN {{ ref('stg_olist_total_orders') }} AS oto
ON oto.seller_id = sp.seller_id
ORDER BY 3 DESC)

SELECT
    so.seller_id AS seller_id,
    so.order_id AS order_id,
    ood.customer_id AS customer_id,
    so.total_order_items AS total_order_items,
    ood.order_status AS order_status,
    so.total_order_value AS total_order_value,
    so.total_freight_value AS total_freight_value,
    so.total_payment AS total_payment
FROM sellers_orders AS so
INNER JOIN {{ source('sources', 'olist_orders_dataset') }} AS ood
ON ood.order_id = so.order_id
ORDER BY 4 DESC