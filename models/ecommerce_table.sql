
{{
    config(
        materialized='table'
    )
}}

WITH cte AS(

    SELECT 
    ROW_ID::INT AS ROW_ID,
    ORDER_ID,
    CUSTOMER_NAME,
    LEFT(ORDER_ID,2) AS STATE

    FROM {{ source('ecommerce_source', 'ECOMMERCE') }}
)
SELECT * FROM cte