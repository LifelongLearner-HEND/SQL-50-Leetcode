# Write your MySQL query statement below
with cte as
(
    select id, num ,
    lead(num,1) over(order by id) as next,
    lead(num,2) over(order by id ) as next_2_next,
    lead(id,1) over(order by id) as next_team_id,
    lead(id,2) over(order by id) as next_2_next_team_id
    from Logs
)
select distinct num as ConsecutiveNums
from cte
where (num=next and num=next_2_next)
and (id+1=next_team_id and id+2=next_2_next_team_id)