SELECT 

user_id,
COUNT (transaction_id) AS nb_transaction,
ROUND(SUM (amount_usd)) AS sum_transaction_usd,
ROUND(SUM(CAST(amount_usd * 0.0025 AS FLOAT64))) AS turnover_by_user

FROM{{ ref('transaction_clean') }}
GROUP BY user_id

