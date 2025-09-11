{{
    config(
        materialized='table'
    )
}}

WITH newyork_data AS (
    SELECT *
    FROM {{ source('crime_data', 'urban_crime_incident_log') }}
    WHERE CITY ='New York'
        AND OFFENSE_CATEGORY IN ('Theft','Driving Under The Influence') 
),

aggregations AS (
    SELECT 
        OFFENSE_CATEGORY
        ,COUNT(OFFENSE_CATEGORY) AS COUNT_OFFENSE_CATEGORY
        ,{{ season_function('DATE') }} AS SEASON
        ,{{day_type('DATE')}} AS DAY_TYPE

    FROM newyork_data
    GROUP BY OFFENSE_CATEGORY,SEASON,DAY_TYPE

)
SELECT * FROM aggregations ORDER BY COUNT_OFFENSE_CATEGORY DESC