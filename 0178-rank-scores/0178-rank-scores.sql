# Write your MySQL query statement below
# 점수의 순위를 구하는 답을 작성하세요. 순위는 다음 규칙에 따라 계산되어야 합니다. 
# 점수는 가장 높은 것부터 가장 낮은 것까지 순위가 매겨져야 합니다. 
# 두 점수 사이에 동점이 있는 경우 두 점수 모두 동일한 순위를 가져야 합니다.


select 
    score, 
    dense_rank() over(order by score desc) as 'rank'
from Scores
