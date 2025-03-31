SELECT
    seller_id,
    order_id,
    COUNT(order_item_id) AS total_order_items,
    ROUND(SUM(price), 2) AS total_order_value,
    ROUND(SUM(freight_value), 2) AS total_freight_value
FROM {{ source('sources', 'olist_order_items_dataset') }}
GROUP BY 1, 2
ORDER BY 3 DESC