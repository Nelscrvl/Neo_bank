WITH column_custom AS(

SELECT 

string_field_0 as device,
string_field_1 as user_id

FROM {{ ref('stg_raw__devices') }})

SELECT
*
FROM column_custom
WHERE device != 'brand'