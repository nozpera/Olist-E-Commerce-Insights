WITH marketing_funnel_olist AS (SELECT
cd.mql_id AS mql_id,
cd.seller_id AS seller_id,
mql.first_contact_date AS first_contact_date,
cd.won_date AS seller_approved_date,
cd.business_segment AS business_segment,
cd.lead_type AS lead_type,
cd.has_company AS has_company,
cd.has_gtin AS has_gtin,
mql.origin AS origin
FROM {{ source('sources', 'olist_closed_deals_dataset') }} AS cd
INNER JOIN {{ source('sources', 'olist_marketing_qualified_leads_dataset') }} AS mql
ON mql.mql_id = cd.mql_id)

SELECT * FROM marketing_funnel_olist WHERE first_contact_date <= seller_approved_date ORDER BY first_contact_date