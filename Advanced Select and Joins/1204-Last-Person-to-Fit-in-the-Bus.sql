# Write your MySQL query statement below
WITH cte AS(
    SELECT person_id,
    person_name,
    weight,
    turn,
    SUM(weight) OVER (ORDER BY turn) AS cumulative
    FROM Queue
)
SELECT person_name
FROM cte
WHERE cumulative <= 1000
ORDER BY turn DESC
LIMIT 1;