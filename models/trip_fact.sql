{{
    config(
        materialized='table'
    )
}}

WITH trip AS (
    SELECT 
        RIDE_ID,
      --  RIDEABLE_TYPE,
        TO_TIMESTAMP(STARTED_AT) AS TRIP_DATE,
        START_STATION_ID,
        END_STATION_ID,
        MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS  TRIP_DURATION_SECONDS
        
    FROM {{ ref('stage_bike') }}
    --WHERE RIDE_ID != 'ride_id'
)

SELECT * FROM trip