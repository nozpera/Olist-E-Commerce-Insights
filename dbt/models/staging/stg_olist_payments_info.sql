SELECT
    order_id,
    payment_sequential,
    {{ get_payment_type('payment_type') }} AS payment_type,
    payment_installments,
    payment_value
FROM {{ source('sources', 'olist_order_payments_dataset') }}