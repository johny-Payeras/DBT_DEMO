
{{
    config(
        materialized='table'
    )
}}

WITH stage_bike AS(
    SELECT  
    CAST(ride_id AS INT) AS RIDE_ID,
    TO_TIMESTAMP(started_at) AS STARTED_AT,
    TO_TIMESTAMP(ended_at) AS ENDED_AT,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,


    FROM {{ source('source_demo', 'bike') }}
    WHERE RIDE_ID !='bikeid'
)

SELECT * FROM stage_bike