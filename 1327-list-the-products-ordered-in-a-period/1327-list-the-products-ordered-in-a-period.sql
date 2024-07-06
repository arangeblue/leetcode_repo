# Write your MySQL query statement below
# 2020년 2월에 100개 이상 주문한 제품의 이름과 수량을 가져오는 솔루션을 작성하세요. 
# 어떤 순서로든 결과 테이블을 반환합니다.

select p.product_name, sum(o.unit) as unit
from Orders as o
join Products as p on o.product_id = p.product_id
where date_format(order_date, "%Y-%m") = '2020-02'
group by p.product_name
having unit >= 100
