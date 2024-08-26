# Write your MySQL query statement below
WITH cte1 AS(
    SELECT requester_id, COUNT(*) as requests_count
    FROM RequestAccepted
    GROUP BY requester_id
), 
cte2 AS(
    SELECT accepter_id, COUNT(*) as accepters_count
    FROM RequestAccepted
    GROUP BY accepter_id
),
result AS(
    SELECT requester_id, requests_count
    FROM cte1
    UNION ALL
    SELECT accepter_id, accepters_count
    FROM cte2
)
SELECT requester_id AS id,
        SUM(requests_count) AS num
FROM result
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1;
