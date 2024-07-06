# Write your MySQL query statement below
# 이 문제에서는 관리자를 자신에게 보고하는 다른 직원이 1명 이상 있는 직원으로 간주합니다.
# 모든 관리자의 ID와 이름, 그들에게 직접 보고하는 직원 수, 보고서의 평균 연령을 가장 가까운 정수로 반올림하여 보고하는 솔루션을 작성하세요.
# Employee_id별로 정렬된 결과 테이블을 반환합니다.

select e.employee_id, e.name, count(ee.reports_to) as reports_count, round(avg(ee.age),0) as average_age
from Employees as e
join Employees as ee on ee.reports_to = e.employee_id 
group by employee_id
order by employee_id