SELECT
reason,
channel,
COUNT(user_id) AS total_sent,
SUM(CASE WHEN status = 'SENT' THEN 1 ELSE 0 END) AS total_received,
SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS total_failed,
ROUND((SUM(CASE WHEN status = 'SENT' THEN 1 ELSE 0 END) / COUNT(user_id)) * 100, 2) AS reception_rate,
ROUND((SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) / COUNT(user_id)) * 100, 2) AS non_reception_rate,
SUM(CASE WHEN is_churner = 1 THEN 1 ELSE 0 END) AS nb_churners,
ROUND((SUM(CASE WHEN is_churner = 1 THEN 1 ELSE 0 END) / COUNT(user_id)) * 100, 2) AS churn_rate_per_notification

FROM {{ ref('notification_merged') }}

GROUP BY reason, channel

ORDER BY churn_rate_per_notification