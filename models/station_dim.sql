{{
    config(
        materialized='table'
    )
}}

WITH station AS(
    SELECT DISTINCT
        START_STATION_ID
        ,START_STATION_NAME
        ,START_LAT
        ,START_LNG
    FROM {{ source('source_demo', 'bike') }}
    WHERE RIDE_ID != 'ride_id'
    
)

SELECT * FROM station