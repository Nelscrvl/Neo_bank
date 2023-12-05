WITH dif_date AS (SELECT 

user_id,
    MAX(date_transaction) AS last_transaction_date,
    DATE_DIFF(DATE '2019-05-16', MAX(date_transaction), DAY) AS diff_last_today,
   

FROM{{ ref('transaction_clean') }}
GROUP BY user_id
ORDER BY diff_last_today DESC ),


churner  AS (SELECT 

*,
PERCENTILE_CONT(diff_last_today, 0.8) OVER () AS percentile_80,
PERCENTILE_CONT(diff_last_today, 0.75) OVER () AS percentile_75,
PERCENTILE_CONT(diff_last_today, 0.7) OVER () AS percentile_70,
PERCENTILE_CONT(diff_last_today, 0.6) OVER () AS percentile_60,
PERCENTILE_CONT(diff_last_today, 0.5) OVER () AS percentile_50,
PERCENTILE_CONT(diff_last_today, 0.25) OVER () AS percentile_25

FROM dif_date )

SELECT 

*, 
CASE WHEN diff_last_today >= 92 THEN 1 
    ELSE 0
END AS is_churner

FROM churner 


