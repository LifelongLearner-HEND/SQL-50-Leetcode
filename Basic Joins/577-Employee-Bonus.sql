/* Write your T-SQL query statement below */
SELECT name, bonus
FROM Employee LEFT JOIN Bonus ON Employee.empId = Bonus.empid 
WHERE bonus < 1000 OR bonus IS NULL;
