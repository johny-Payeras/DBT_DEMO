SELECT * 
FROM {{ source('source_demo', 'bike') }}
LIMIT  