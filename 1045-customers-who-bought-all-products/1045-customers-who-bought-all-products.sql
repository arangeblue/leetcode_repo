# Write your MySQL query statement below
# Product 테이블의 모든 제품을 구매한 Customer 테이블의 고객 ID를 보고하는 솔루션을 작성하세요.
select customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(product_key) from Product)

