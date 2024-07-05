# Write your MySQL query statement below
# 각 사용자에 대해 팔로어 수를 반환하는 솔루션을 작성하세요. 
# user_id를 기준으로 오름차순으로 정렬된 결과 테이블을 반환합니다.


select user_id, count(*) as followers_count
from Followers
group by user_id
order by user_id asc