# Write your MySQL query statement below
# 각 급여 항목에 대한 은행 계좌 수를 계산하는 해를 작성하세요. 급여 카테고리는 다음과 같습니다.
# "낮은 급여": 모든 급여가 $20000 미만입니다. 
# "평균 급여": 포함 범위 [$20000, $50000]의 모든 급여입니다. 
# "고액 급여": 모든 급여가 $50000보다 엄격합니다.
# 결과 테이블에는 세 가지 범주가 모두 포함되어야 합니다. 카테고리에 계정이 없으면 0을 반환합니다.
# 풀이 - low, average, high를 따로 구해서 union(concat row)

select "Low Salary" as category, count(*) as accounts_count
from Accounts
where income < 20000

union
select "Average Salary" as category, count(*) as accounts_count
from Accounts
where income >=20000 and income <=50000

union
select "High Salary" as category, count(*) as accounts_count
from Accounts
where income > 50000 