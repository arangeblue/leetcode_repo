# Write your MySQL query statement below
# 세 개의 선분마다 삼각형을 형성할 수 있는지 보고합니다. 어떤 순서로든 결과 테이블을 반환합니다.

select *, 
    case
        when (x + y > z) and (y + z > x) and (z + x > y) then 'Yes'
        else 'No' end as triangle
    
from triangle