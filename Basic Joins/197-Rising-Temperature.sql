# Write your MySQL query statement below
SELECT B.id
FROM Weather A JOIN Weather B
ON DATEDIFF(A.recordDate, B.recordDate) = -1 AND B.temperature > A.temperature;
