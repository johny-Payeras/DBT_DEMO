
{{
    config(
        materialized='incremental',
        unique_key='HASHKEY',
        incremental_strategy ='merge'
    )
}}

SELECT * FROM {{ source('SOURCE_BTC', 'BTC') }}


{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where BLOCK_TIMESTAMP > (select max(BLOCK_TIMESTAMP) from {{ this }}) 
{% endif %}

