SELECT 
    foc.seller_id,
    foc.order_id,
    foc.customer_id,
    foc.total_order_items,
    foc.order_status,
    seller.zip_code_prefix AS seller_zip_code_prefix,
    seller.geolocation_lat AS seller_geolocation_lat,
    seller.geolocation_lng AS seller_geolocation_lng,
    cust.zip_code_prefix AS cust_zip_code_prefix,
    cust.geolocation_lat AS cust_geolocation_lat,
    cust.geolocation_lng AS cust_geolocation_lng,
    seller.seller_state AS seller_state,
    cust.customer_state AS customer_state
FROM {{ ref('facts_orders_customer') }} AS foc
LEFT JOIN {{ ref('dim_geolocation_customers') }} AS cust
ON cust.customer_id = foc.customer_id
LEFT JOIN {{ ref('dim_geolocation_sellers') }} AS seller
ON seller.seller_id = foc.seller_id