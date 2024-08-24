# Write your MySQL query statement below
WITH cte AS(
    SELECT DISTINCT salary as mx
    FROM Employee
    ORDER BY salary DESC
    LIMIT 2
)
SELECT CASE WHEN COUNT(*) = 2 THEN MIN(mx)
        ELSE null
        END AS SecondHighestSalary
FROM cte;