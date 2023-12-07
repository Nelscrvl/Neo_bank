SELECT 

U.*,
d.device,
c.* EXCEPT(user_id),
chr.diff_last_today,
chr.last_transaction_date,

CASE WHEN diff_last_today >= 35 AND turnover_by_user >= 40 THEN 2 -- top client à risque 
    WHEN diff_last_today >= 92 THEN 1 -- perdu   
    ELSE 0 
END AS is_churner

FROM{{ ref('users_clean') }} AS U
LEFT JOIN {{ ref('devices_clean') }} AS d on U.user_id = d.user_id 
LEFT JOIN {{ ref('churner_count_agrg') }} as c on U.user_id = c.user_id
LEFT JOIN {{ ref('Definition_churner_transaction') }} as chr on U.user_id = chr.user_id
WHERE nb_transaction IS NOT NULL
ORDER BY created_date DESC