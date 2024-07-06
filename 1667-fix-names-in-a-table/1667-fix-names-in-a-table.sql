# Write your MySQL query statement below
# 첫 번째 문자만 대문자이고 나머지는 소문자로 이름을 수정하는 솔루션을 작성하세요. 
# user_id순으로 정렬된 결과 테이블을 반환합니다.

select user_id, concat(upper(substring(name,1, 1)),lower(substring(name,2))) as name
from Users
order by user_id asc