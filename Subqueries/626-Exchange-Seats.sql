# Write your MySQL query statement below
WITH cte AS(
    SELECT *, LEAD(id) OVER(ORDER BY id) AS next,
    LAG(id) OVER(ORDER BY id) AS prev
    FROM Seat
)
SELECT CASE 
WHEN ((id % 2 = 1) AND next IS NOT NULL) THEN next 
WHEN (id%2 = 0) THEN prev
ELSE id END AS id, student
FROM cte
ORDER BY id