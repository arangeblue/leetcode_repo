# Write your MySQL query statement below
# 판매된 모든 제품의 첫 해에 대한 제품 ID, 연도, 수량, 가격을 선택하는 솔루션을 작성하세요. 
# 결과 테이블을 어떤 순서로든 반환합니다.

select product_id, year as first_year, quantity, price
from Sales
where (product_id, year) in (
    select product_id, min(year)
    from Sales
    group by product_id
)