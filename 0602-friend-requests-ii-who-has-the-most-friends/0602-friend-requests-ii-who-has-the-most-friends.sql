# Write your MySQL query statement below
# 가장 많은 친구와 가장 많은 친구 수를 가진 사람을 찾는 솔루션을 작성하세요. 
# 테스트 케이스는 한 사람만이 가장 많은 친구를 갖도록 생성됩니다.
# 풀이 - 1. request와 accept id가 가장 많이 포함된 id가 가장 많은 친구를 가진 사람이라고 할 수 있음
# 2. request_id와 accept_id를 id로 모두 포함시킨 다음 id로 그룹하여 count를 진행
# 3. 가장 많은 count를 가진 사람만 뽑으면 ok
with all_df as (
    (select
    requester_id as id 
    from RequestAccepted)
    union all
    (select
        accepter_id as id
    from RequestAccepted)
)

select id, count(*) as num
from all_df
group by id
order by num desc limit 1