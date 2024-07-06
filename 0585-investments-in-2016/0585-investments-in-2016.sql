# Write your MySQL query statement below
# 다음과 같은 모든 보험 계약자에 대해 2016년 tiv_2016의 모든 총 투자 가치 합계를 보고하는 솔루션을 작성하세요.
# 한 명 이상의 다른 보험 계약자와 동일한 tiv_2015 값을 갖고, 
# 다른 보험 계약자와 동일한 도시에 위치하지 않습니다(즉, (lat, lon) 속성 쌍은 고유해야 합니다).

# 풀이 disticnt tiv_2015 > 1 and unique (lat lon)

select round(sum(tiv_2016),2) as tiv_2016
from Insurance
where tiv_2015 in (
        select tiv_2015
        from Insurance
        group by tiv_2015
        having count(*) > 1
    ) and (lat, lon) in (
        select lat, lon
        from Insurance
        group by lat, lon
        having count(*) = 1
    )
