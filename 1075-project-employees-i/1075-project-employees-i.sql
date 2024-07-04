# Write your MySQL query statement below

-- with cal_project_table as (
--     select project_id, employee_id
-- )

select p.project_id, round(avg(e.experience_years),2) as average_years
from Employee as e 
    join Project as p on e.employee_id = p.employee_id
group by p.project_id
-- having p.project_id is not null;