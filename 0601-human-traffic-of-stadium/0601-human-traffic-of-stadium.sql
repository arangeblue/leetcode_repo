# Write your MySQL query statement below
# 연속된 ID가 있는 3개 이상의 행이 있는 레코드를 표시하는 솔루션을 작성하고 각 행의 인원 수는 100명 이상입니다. 
# Visit_date 기준으로 오름차순으로 정렬된 결과 테이블을 반환합니다.
# 풀이 - 최소 3일동안 100명이상인 것을 찾자.

select 
    id, 
    visit_date, 
    people
from (
    select *,
        lead(people, 1) over (order by id) next,
        lead(people, 2) over (order by id) next2,
        lag(people, 1) over (order by id) pre,
        lag(people, 2) over (order by id) pre2
    from Stadium
) as temp
where (temp.people >= 100 and temp.next >= 100 and temp.next2 >= 100) 
    or (temp.people >= 100 and temp.next >= 100 and temp.pre >= 100)
    or (temp.people >= 100 and temp.pre >= 100 and temp.pre2 >= 100)