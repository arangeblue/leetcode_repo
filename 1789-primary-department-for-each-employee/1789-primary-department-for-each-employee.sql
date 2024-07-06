# Write your MySQL query statement below
# 직원은 여러 부서에 속할 수 있습니다. 직원이 다른 부서에 합류할 때 어떤 부서가 자신의 기본 부서인지 결정해야 합니다. 직원이 하나의 부서에만 속해 있는 경우 기본 열은 'N'입니다.
# 모든 직원을 주 부서로 보고하는 솔루션을 작성하세요. 한 부서에 소속된 직원의 경우 해당 부서만을 보고합니다.

select employee_id, department_id
from Employee 
where employee_id in (
    select employee_id
    from Employee
    group by employee_id
    having count(*) = 1
) # 1명일 때는 y,n이 상관 없음
    or primary_flag = 'Y' # 2개 이상일 때 y인 것들만
order by employee_id
