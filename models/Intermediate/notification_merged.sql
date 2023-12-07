SELECT 

n.*,
c.is_churner


FROM{{ ref('notifications_clean') }} as n
LEFT JOIN {{ ref('Definition_churner_transaction') }} as c on n.user_id = c.user_id 

