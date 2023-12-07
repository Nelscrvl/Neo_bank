SELECT 

reason,
channel,
status,
user_id,
DATE (created_date) AS created_date

FROM {{ ref('stg_raw__notifications') }}