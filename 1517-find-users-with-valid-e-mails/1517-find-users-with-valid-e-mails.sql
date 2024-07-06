# Write your MySQL query statement below
# 유효한 이메일을 가지고 있는 사용자를 찾는 솔루션을 작성하세요. 
# 유효한 이메일에는 접두사 이름과 도메인이 있습니다.
# 접두사 이름은 문자(대문자 또는 소문자), 숫자, 밑줄 '_', 마침표 '.' 및/또는 대시 '-'를 포함할 수 있는 문자열입니다. 접두사 이름은 문자로 시작해야 합니다.
# 도메인은 '@leetcode.com' 입니다
# 풀이 email 시작은 문자 ^[a-zA-Z] ^: 시작하는 문자, {1} : 한개, [a-zA-Z0-9_.-/] : 포함 []*: 0회 이상

select user_id, name, mail
from Users
where mail regexp "^[a-zA-Z]{1}[a-zA-Z0-9_.-]*@leetcode\.com$"