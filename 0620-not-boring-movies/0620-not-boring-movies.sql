# Write your MySQL query statement below

select id, movie, description, rating 
from Cinema as c
where MOD(c.id,2) <> 0 and c.description not like "%boring%" 
order by rating desc;