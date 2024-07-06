# Write your MySQL query statement below
# 연속해서 3번 이상 나타나는 숫자를 모두 찾아보세요. 어떤 순서로든 결과 테이블을 반환합니다.
# 3번 이상은 3번만 확인하면 ok



select distinct num as ConsecutiveNums
from Logs
where (id + 1, num) in (select * from Logs) and (id + 2, num) in (select * from Logs)