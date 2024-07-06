# Write your MySQL query statement below
# 날짜별로 판매된 다양한 제품의 수와 이름을 찾는 솔루션을 작성하세요. 
# 각 날짜에 판매된 제품 이름은 사전순으로 정렬되어야 합니다. 
# Sell_date를 기준으로 정렬된 결과 테이블을 반환합니다.
# 풀이 - group_concat(col)을 사용하면 string이 default ,로 구분되어 합쳐짐

select sell_date, count(distinct product) as num_sold, group_concat(distinct product) as products
from Activities
group by sell_date