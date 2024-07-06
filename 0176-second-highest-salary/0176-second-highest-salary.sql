# Write your MySQL query statement below
# Employee 테이블에서 두 번째로 높은 급여를 찾는 솔루션을 작성하세요. 
# 두 번째로 높은 급여가 없으면 null을 반환합니다.

select 
    max(salary) as SecondHighestSalary
from
    (
        select salary, dense_rank() over(order by salary desc) as ranking
        from Employee
    ) as temp
where ranking = 2

