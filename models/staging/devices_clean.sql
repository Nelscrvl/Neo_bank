WITH renamed AS (SELECT 
    string_field_0 AS device, 
    string_field_1 AS user_id
  FROM {{ ref('stg_raw__devices') }}

)

SELECT *
FROM renamed
WHERE device != 'brand'
ORDER BY user_id DESC





