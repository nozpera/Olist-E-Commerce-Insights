WITH product_sold AS (SELECT * 
FROM {{ source('sources', 'olist_order_items_dataset') }} 
WHERE FORMAT_TIMESTAMP("%Y", shipping_limit_date) != '2020')

SELECT
    product_id,
    FORMAT_TIMESTAMP("%Y", shipping_limit_date) AS Year,
    COUNT(order_item_id) AS total_sold_products,
    ROUND(SUM(price), 2) AS total_revenue
FROM product_sold
GROUP BY 1,2
ORDER BY 2