# Write your MySQL query statement below
# 최소 5명의 학생이 있는 모든 수업을 찾는 솔루션을 작성하세요. 어떤 순서로든 결과 테이블을 반환합니다.

select class
from Courses
group by class
having count(*) >= 5