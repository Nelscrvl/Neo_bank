SELECT 

user_id,
COUNT (transaction_id) AS nb_transaction,
AVG (amount_usd) AS avg_amout

FROM{{ ref('transaction_clean') }}
GROUP BY user_id