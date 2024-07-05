# Write your MySQL query statement below
# 단일 숫자는 MyNumbers 테이블에 한 번만 나타나는 숫자입니다. 
# 가장 큰 단일 숫자를 찾으십시오. 단일 숫자가 없으면 null을 보고합니다.

select num
from MyNumbers
group by num
having count(*) <= 1

union all
select null

order by num desc limit 1