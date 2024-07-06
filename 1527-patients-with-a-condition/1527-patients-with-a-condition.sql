# Write your MySQL query statement below
# 제1형 당뇨병 환자의 환자 ID, 환자 이름, 상태를 찾는 솔루션을 작성하세요. 
# 제1형 당뇨병은 항상 DIAB1 접두어로 시작됩니다. 어떤 순서로든 결과 테이블을 반환합니다.

select patient_id, patient_name, conditions
from Patients
where conditions like "% DIAB1%" or conditions like "DIAB1%"
