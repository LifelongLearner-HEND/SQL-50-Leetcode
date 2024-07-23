# Write your MySQL query statement below
SELECT a.employee_id, a.name, COUNT(*) AS reports_count, ROUND(AVG(b.age)) AS average_age
FROM Employees AS a JOIN Employees as b
ON a.employee_id = b.reports_to 
GROUP BY a.employee_id
ORDER BY a.employee_id
