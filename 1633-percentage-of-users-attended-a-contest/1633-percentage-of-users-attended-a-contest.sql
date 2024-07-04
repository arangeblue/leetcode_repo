# Write your MySQL query statement below

with length_table as ( select count(*) as counts from Users)

select r.contest_id, round((count(r.user_id) /counts) * 100, 2) as percentage
from Register as r
    join Users as u on r.user_id = u.user_id
    cross join length_table
group by r.contest_id
order by percentage desc, contest_id asc;