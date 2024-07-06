# Write your MySQL query statement below
# 다음에 대한 솔루션을 작성하세요. 
# 가장 많은 영화를 평가한 사용자의 이름을 찾으십시오. 동점인 경우 사전순으로 더 작은 사용자 이름을 반환합니다.
# 2020년 2월 평균 평점이 가장 높은 영화 이름을 찾습니다. 동점인 경우 사전순으로 더 작은 영화 이름을 반환합니다.

(select u.name as results
from MovieRating as mr
join Users as u on mr.user_id = u.user_id
group by mr.user_id
order by count(movie_id) desc, u.name asc limit 1)

union all
(select m.title as results
from MovieRating as mr
join Movies as m on mr.movie_id = m.movie_id
where date_format(created_at, "%Y-%m") = "2020-02"
group by mr.movie_id
order by avg(mr.rating) desc, m.title asc limit 1)

