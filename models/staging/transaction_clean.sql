SELECT * EXCEPT (created_date),
    DATE (created_date) AS date_transaction

FROM{{ ref('stg_raw__transactions') }}
WHERE amount_usd < 700000
ORDER BY amount_usd DESC 

 