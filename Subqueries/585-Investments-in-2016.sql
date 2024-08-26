# Write your MySQL query statement below
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM insurance AS i
WHERE i.tiv_2015 in (
    SELECT i2.tiv_2015 
    FROM insurance AS i2
    WHERE i2.pid <> i.pid
)
AND (i.lat, i.lon) NOT IN (
    SELECT i3.lat, i3.lon
    FROM insurance i3
    WHERE i3.pid <> i.pid
)