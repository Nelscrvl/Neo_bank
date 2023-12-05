WITH table1 AS
(SELECT
user_id,
birth_year,
country,
DATE (created_date) AS created_date,
user_settings_crypto_unlocked,
plan,
CAST(attributes_notifications_marketing_email AS INTEGER) as attributes_notifications_marketing_email,
CAST(attributes_notifications_marketing_push AS INTEGER) as attributes_notifications_marketing_push,
num_contacts,
num_referrals,
num_successful_referrals
FROM {{ ref('stg_raw__users') }})


SELECT 
user_id,
birth_year,
country,
created_date,
user_settings_crypto_unlocked,
plan,
CASE 
    WHEN attributes_notifications_marketing_push = 1 THEN '1'
    WHEN attributes_notifications_marketing_push = 0 THEN '0'
    ELSE 'No answer' 
END AS attributes_notifications_marketing_push,
CASE 
    WHEN attributes_notifications_marketing_email = 1 THEN '1'
    WHEN attributes_notifications_marketing_email = 0 THEN '0'
    ELSE 'No answer' 
END AS attributes_notifications_marketing_email,
num_contacts,
num_referrals,
num_successful_referrals
FROM table1