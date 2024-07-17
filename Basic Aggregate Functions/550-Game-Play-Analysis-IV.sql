# Write your MySQL query statement below
WITH first_day AS (
    SELECT player_id, min(event_date) as min_date
    FROM Activity
    GROUP BY player_id
),
next_day AS (
    SELECT DISTINCT Activity.player_id
    FROM Activity JOIN first_day
    ON Activity.player_id = first_day.player_id 
    AND DATEDIFF(Activity.event_date, first_day.min_date) = 1
)
SELECT ROUND(COUNT(next_day.player_id)/COUNT(DISTINCT first_day.player_id) ,2) AS fraction
FROM first_day
LEFT JOIN next_day
ON first_day.player_id = next_day.player_id;