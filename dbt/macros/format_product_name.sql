{% macro format_product_name(column_name) -%}

    INITCAP(REPLACE({{ column_name }}, '_', ' '))

{%- endmacro %}