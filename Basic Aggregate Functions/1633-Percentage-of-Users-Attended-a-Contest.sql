# Write your MySQL query statement below
SELECT Register.contest_id, 
ROUND(COUNT(DISTINCT Register.user_id)/(SELECT COUNT(*) FROM Users) *100, 2) as percentage
FROM Users, Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC