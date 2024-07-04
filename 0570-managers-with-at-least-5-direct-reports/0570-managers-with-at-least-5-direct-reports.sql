# Write your MySQL query statement below
with cal_table as ( select managerId, count(managerId) as count_ from Employee group by managerId having count_ >= 5)

select name from Employee as e
left join cal_table as c on e.id = c.managerId
where count_ is not null