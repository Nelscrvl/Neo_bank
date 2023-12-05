SELECT 

reason,
channel,
status,
user_id,
EXTRACT(year FROM created_date) AS creation_year,
EXTRACT(month FROM created_date) AS creation_month,
EXTRACT(day FROM created_date) AS creation_day,
EXTRACT(hour FROM created_date) AS creation_hour

FROM {{ ref('stg_raw__notifications') }}