# Write your MySQL query statement below
WITH cte AS(
    SELECT visited_on, 
    SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT a.visited_on,
    ROUND(SUM(b.amount), 2) AS amount,
    ROUND(AVG(b.amount), 2) AS average_amount
FROM cte AS a, cte AS b
WHERE DATEDIFF(a.visited_on, b.visited_on) BETWEEN 0 AND 6
GROUP BY a.visited_on 
HAVING COUNT(*) > 6
ORDER BY a.visited_on;