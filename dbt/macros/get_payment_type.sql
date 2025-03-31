{#
    This macro returns the description of the payment_type
#}

{% macro get_payment_type(payment_type) -%}

    case cast( {{payment_type}} as STRING )
        when 'credit_card' then 'Credit Card'
        when 'voucher' then 'Voucher'
        when 'not_defined' then 'Unknown'
        when 'boleto' then 'Boleto'
        when 'debit_card' then 'Debit Card'
        else 'EMPTY'
    end

{%- endmacro %}