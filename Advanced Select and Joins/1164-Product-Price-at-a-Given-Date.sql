# Write your MySQL query statement below
WITH pre_maxDate as(
    SELECT product_id, max(change_date) as pre_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
SELECT p.product_id, new_price AS price
FROM Products AS p JOIN pre_maxDate As pre
ON p.product_id = pre.product_id AND p.change_date = pre.pre_date
UNION 
SELECT DISTINCT product_id, 10 AS price 
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM  pre_maxDate);
