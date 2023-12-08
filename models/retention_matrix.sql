SELECT

    -- transaction_cohort
    tc.user_id,
    tc.created_date,
    tc.transaction_id,
    tc.date_transaction,
    tc.nb_days_last_today,

    -- user_merged
    um.birth_year,
    2019 - um.birth_year AS age,
    
    CASE 
        WHEN (2019 - um.birth_year) BETWEEN 18 AND 25 THEN '18-25'
        WHEN (2019 - um.birth_year) BETWEEN 26 AND 35 THEN '26-35'
        WHEN (2019 - um.birth_year) BETWEEN 36 AND 45 THEN '36-45'
        WHEN (2019 - um.birth_year) BETWEEN 46 AND 55 THEN '46-55'
        WHEN (2019 - um.birth_year) BETWEEN 56 AND 65 THEN '56-65'
        ELSE '66+'

    END AS age_cat,
    
    um.country,
    um.user_settings_crypto_unlocked,
    um.plan,
    um.attributes_notifications_marketing_push,
    um.attributes_notifications_marketing_email,
    um.device,
    um.nb_transaction,
    um.turnover_by_user

FROM {{ ref('Transaction_cohort') }} AS tc

    LEFT JOIN {{ ref('user_merged') }} AS um
    ON tc.user_id = um.user_id