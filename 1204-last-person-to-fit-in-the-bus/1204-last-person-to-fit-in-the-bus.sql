# Write your MySQL query statement below
# 버스를 타기 위해 사람들이 줄을 서고 있습니다. 다만, 버스의 무게 제한은 1000kg이므로 탑승하지 못하는 분들도 있을 수 있습니다.
# 무게 제한을 초과하지 않고 버스에 탑승할 수 있는 마지막 사람의 person_name을 찾는 솔루션을 작성하세요. 첫 번째 사람이 무게 제한을 초과하지 않도록 테스트 케이스가 생성됩니다
# 풀이 1.turn 순으로 오름차순
# 2. 한명씩 태우면서 계산 후 마지막 사람 구함


-- with asc_df as (
--     select * from Queue
--     order by turn)

select person_name 
from (
    select turn, person_id, person_name, weight, SUM(weight) OVER(ORDER BY turn) as total_weight
    from Queue
) as sq
where total_weight <= 1000
order by turn desc limit 1
