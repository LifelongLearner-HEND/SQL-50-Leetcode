/* Write your T-SQL query statement below */
SELECT a.machine_id, ROUND(AVG(b.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a JOIN Activity b ON a.process_id = b.process_id AND a.machine_id = b.machine_id
WHERE b.activity_type = 'end' AND a.activity_type = 'start'
GROUP BY a.machine_id;
