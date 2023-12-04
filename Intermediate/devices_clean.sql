SELECT
string_field_0 AS devices, 
string_field_1 AS user_id
FROM {{ ref('stg_raw__devices') }}

