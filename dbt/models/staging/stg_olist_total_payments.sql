SELECT 
    order_id,
    COUNT(order_item_id) AS total_order_items,
    product_id,
    seller_id,
    shipping_limit_date,
    ROUND((SUM(price) + SUM(freight_value)), 2) AS total_payment
FROM {{ source('sources', 'olist_order_items_dataset') }}
GROUP BY 5,4,1,3
ORDER BY 2 DESC