
WITH sales_dim AS(

    SELECT
        ROW_NUMBER() OVER( ORDER BY (SELECT NULL) )AS SALES_ID,
        CAST(TOTAL_SALES AS FLOAT) AS TOTAL_SALES,
        CASE 
            WHEN CAST(DAYS_FROM_LAST_ORDER AS INT) <= 30 THEN 'Purchased_30Days_' 
            WHEN CAST(DAYS_FROM_LAST_ORDER AS INT) BETWEEN 31 AND 60  THEN 'Purchased_60Days_' 
            WHEN CAST(DAYS_FROM_LAST_ORDER AS INT) BETWEEN 61 AND 90  THEN 'Purchased_90Days_' 
            ELSE 'MoreThan90Days_' 
        END AS Churn_customer
    FROM {{ source('sales_bikes', 'SALESTABLE') }}
    WHERE TOTAL_SALES != 'Total_Sales'
)

SELECT * FROM sales_dim