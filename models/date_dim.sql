WITH CTE AS(
    SELECT 
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) AS DAY_STARTED_AT,
        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat','Sun') 
            THEN 'Weekend'
            ELSE 'BussinessDay'
        END AS DAY_TYPE,
        MONTH(TO_TIMESTAMP(STARTED_AT)) AS MONTH_STARTED_AT,
        CASE
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (12,1,2) THEN 'Winter'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (3,4,5) THEN 'Spring'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (6,7,8) THEN 'Summer'
            WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN (9,10,11) THEN 'Fall'
            ELSE ''
        END AS SEASON

    FROM {{ source('source_demo', 'bike') }}
    WHERE STARTED_AT != 'started_at'

)

SELECT * FROM CTE 

