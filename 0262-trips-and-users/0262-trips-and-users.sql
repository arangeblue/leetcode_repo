# Write your MySQL query statement below
# 취소율은 금지되지 않은 사용자에 대한 취소된(클라이언트 또는 드라이버별) 요청 수를 해당 날짜에 금지되지 않은 사용자에 대한 총 요청 수로 나누어 계산합니다.
# "2013-10-01"부터 "2013-10-03" 사이에 매일 금지되지 않은 사용자(클라이언트와 드라이버 모두 금지되지 않아야 함)에 대한 요청 취소 비율을 찾는 솔루션을 작성하세요. 취소율은 소수점 이하 2자리로 반올림됩니다.

# 풀이 - 1. ban 당한 사람들은 아예 무시되기 때문에 당하지 않은 사람들의 요청만을 전체 수로 지정
# 2. 전체 요청 수에서 completed가 아닌 것(cancel)의 비율을 구해줌, 이때 null로 하면 count에서 제외되기에 count되지 않음

select 
    request_at as Day,
    round(count(if(status <>'completed', 1, null))/count(*),2) as 'Cancellation Rate'
from Trips
where 
    request_at between "2013-10-01" and '2013-10-03' and
    client_id not in (select users_id from Users where Banned = 'yes') and
    driver_id not in (select users_id from Users where Banned = 'yes')
group by request_at
    