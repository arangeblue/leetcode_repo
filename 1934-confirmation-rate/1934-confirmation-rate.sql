# Write your MySQL query statement below
-- select s.user_id, s.time_stamp, c.action, avg(action) as confirmation_rate  from Signups as s
-- left join Confirmations as c on s.user_id = c.user_id 
-- group by s.user_id, c.action

with con_df as (
    select s.user_id, c.action, count(action) as c_c 
    from Signups as s 
        left join Confirmations as c on s.user_id = c.user_id and c.action = "confirmed" 
    group by user_id order by user_id),

out_df as (
    select s.user_id, c.action, count(action) as o_c
    from Signups as s 
        left join Confirmations as c on s.user_id = c.user_id and c.action <> "confirmed" 
    group by user_id order by user_id)

select c.user_id, round(ifnull( c.c_c /(c.c_c + o.o_c), 0), 2) as confirmation_rate 
from con_df as c
    join out_df as o on c.user_id = o.user_id

