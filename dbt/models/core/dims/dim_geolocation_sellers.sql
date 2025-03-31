WITH geolocation_seller AS (SELECT
    geolocation_zip_code_prefix,
    AVG(geolocation_lat) AS geolocation_lat,
    AVG(geolocation_lng) AS geolocation_lng,
    FROM {{ source('sources', 'olist_geolocation_dataset') }}
    GROUP BY geolocation_zip_code_prefix),
    sellers_profile AS (SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_state
    FROM {{ source('sources', 'olist_sellers_dataset') }})

SELECT
    sp.seller_id AS seller_id,
    sp.seller_zip_code_prefix AS zip_code_prefix,
    gs.geolocation_lat AS geolocation_lat,
    gs.geolocation_lng AS geolocation_lng,
    sp.seller_state AS seller_state
FROM sellers_profile AS sp
LEFT JOIN geolocation_seller AS gs
ON gs.geolocation_zip_code_prefix = sp.seller_zip_code_prefix