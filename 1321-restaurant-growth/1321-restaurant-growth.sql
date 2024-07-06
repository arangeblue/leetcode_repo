# Write your MySQL query statement below
# 당신은 식당 주인이고 가능한 확장을 분석하려고 합니다(매일 적어도 한 명의 고객이 있을 것입니다).
# 7일 기간(즉, 오늘 + 6일 전) 동안 고객이 지불한 금액의 이동 평균을 계산합니다. average_amount는 소수점 이하 2자리로 반올림되어야 합니다.

with temp as (
    select visited_on,
    sum(amount) as daily_amount
    from Customer
    group by visited_on
)

SELECT visited_on,
    sum(daily_amount) over (order by visited_on rows between 6 preceding and current row) as amount,
    round(avg(daily_amount) over (order by visited_on rows between 6 preceding and current row), 2) as average_amount
FROM temp
limit 6, 9999
