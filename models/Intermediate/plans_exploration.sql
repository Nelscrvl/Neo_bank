SELECT
CASE
    WHEN plan LIKE '%METAL%' THEN 'METAL'
    WHEN plan LIKE '%PREMIUM%' THEN 'PREMIUM'
    WHEN plan LIKE '%STANDARD%' THEN 'STANDARD'
END AS plan,
ROUND(SUM(turnover_by_user),2) turnover_per_plan,
ROUND(SUM(nb_transaction),2) nb_transactions_per_plan,
ROUND(SUM(sum_transaction_usd),2) sum_transactions_per_plan,
COUNT(user_id) as nb_users_per_plan,
SUM(is_churner) as nb_churners,
ROUND((SUM(is_churner)/COUNT(user_id))*100,2) as churn_percent_per_plan

FROM {{ ref('user_merged') }}

GROUP BY plan