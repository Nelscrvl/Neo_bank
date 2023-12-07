select

    tc.user_id,
    uc.created_date,
    tc.transaction_id,
    tc.amount_usd,
    tc.date_transaction,
    date_diff(date '2019-05-16', (date_transaction), day) as nb_days_last_today,

from{{ ref("transaction_clean") }} as tc
left join {{ ref("users_clean") }} as uc on tc.user_id = uc.user_id
order by date_transaction, user_id
