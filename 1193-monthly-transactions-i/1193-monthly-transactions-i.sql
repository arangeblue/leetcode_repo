# Write your MySQL query statement below

select 
    DATE_FORMAT(trans_date, "%Y-%m") as month, 
    ifnull(country, null) as country,
    count(ifnull(country, null)) as trans_count, 
    count(if (state<>"declined",1,null)) as approved_count,
    sum(amount) as trans_total_amount,
    sum(if (state<>"declined",amount,0)) as approved_total_amount 
from Transactions 
group by month, country
