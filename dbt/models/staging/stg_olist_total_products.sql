WITH olist_order_items_dataset AS (SELECT * FROM {{ source('sources', 'olist_order_items_dataset') }} WHERE FORMAT_TIMESTAMP("%Y", shipping_limit_date) != '2020')

SELECT
    product_id,
    COUNT(order_item_id) AS total_sold_products,
    ROUND(SUM(price), 2) AS total_revenue
FROM olist_order_items_dataset
GROUP BY 1
ORDER BY 2 DESC