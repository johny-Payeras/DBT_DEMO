{{
    config(
        materialized='table'
    )
}}

with correlation_table AS(
    SELECT 
    t.*
    ,dw.*,
    FROM {{ ref('trip_fact') }} t
        LEFT JOIN {{ ref('daily_weather') }} dw ON dw.daily_weather = t.trip_date
    LIMIT 10
)

SELECT * FROM correlation_table