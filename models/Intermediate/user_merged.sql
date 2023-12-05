SELECT 

U.*,
c.* EXCEPT(user_id),
chr.is_churner

FROM{{ ref('users_clean') }} AS U
LEFT JOIN {{ ref('devices_clean') }} AS d on U.user_id = d.user_id 
LEFT JOIN {{ ref('churner_count_agrg') }} as c on U.user_id = c.user_id
LEFT JOIN {{ ref('Definition_churner_transaction') }} as chr on U.user_id = chr.user_id
