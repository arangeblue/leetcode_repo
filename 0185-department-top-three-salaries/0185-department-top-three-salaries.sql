# Write your MySQL query statement below
# 회사의 경영진은 회사의 각 부서에서 누가 가장 많은 돈을 벌고 있는지 확인하는 데 관심이 있습니다. 한 부서의 고소득자는 해당 부서의 상위 3개 고유 급여에 포함되는 급여를 받는 직원입니다.
# 각 부서에서 고소득 직원을 찾는 솔루션을 작성하세요.
# 풀이 - 1. 각 부서의 상위 3 개 고유 급여를 구함
# 2. 이에 해당하는 직원을 찾음

select Department, Employee, Salary
from (
    select 
        d.name as Department, 
        e.name as Employee, 
        e.salary as Salary,
        dense_rank() over(partition by e.departmentId order by e.salary desc) as ranking
    from Employee as e
    join Department as d on e.departmentId = d.id
) as sub
where ranking <= 3

