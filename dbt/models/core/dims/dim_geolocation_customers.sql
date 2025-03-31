WITH geolocation_cust AS (SELECT
    geolocation_zip_code_prefix,
    AVG(geolocation_lat) AS geolocation_lat,
    AVG(geolocation_lng) AS geolocation_lng,
    FROM {{ source('sources', 'olist_geolocation_dataset') }}
    GROUP BY geolocation_zip_code_prefix),
    cust_profile AS (SELECT
    customer_id,
    customer_zip_code_prefix,
    customer_state
    FROM {{ source('sources', 'olist_customers_dataset') }})

SELECT
    cp.customer_id AS customer_id,
    cp.customer_zip_code_prefix AS zip_code_prefix,
    gc.geolocation_lat AS geolocation_lat,
    gc.geolocation_lng AS geolocation_lng,
    cp.customer_state AS customer_state
FROM cust_profile AS cp
LEFT JOIN geolocation_cust AS gc
ON gc.geolocation_zip_code_prefix = cp.customer_zip_code_prefix