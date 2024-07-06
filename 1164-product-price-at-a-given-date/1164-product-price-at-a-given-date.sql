# Write your MySQL query statement below
# 2019-08-16에 모든 제품의 가격을 구하는 솔루션을 작성하세요. 
# 변경 전 모든 제품의 가격이 10이라고 가정합니다. 어떤 순서로든 결과 테이블을 반환합니다.
# 변경 후면 new_price, 변경 전이면 10
# 1. 만약 2019-08-16보다 가장 작은 chage_date가 크다면 10
# 2. 2019-08-16과 가장 가까운 날의 price를 price로 지정

select p0.product_id,
case
    when min(p0.change_date) > date("2019-08-16") then 10
    else (
        select new_price
        from Products as p1
        where p1.product_id = p0.product_id
            and p1.change_date <= date('2019-08-16')
        order by change_date desc
        limit 1 
    )
    end as price
from Products as p0
group by p0.product_id