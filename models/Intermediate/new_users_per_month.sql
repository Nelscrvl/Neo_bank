WITH table1 AS(
SELECT 

user_id,
created_date,
EXTRACT(YEAR FROM created_date) as year,
EXTRACT(MONTH FROM created_date) AS month
FROM {{ ref('user_merged') }}

WHERE EXTRACT(YEAR FROM created_date) = 2018)

SELECT
month,
year,
COUNT(user_id) nb_users

FROM table1

GROUP BY month, year
ORDER BY month ASC