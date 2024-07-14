# Write your MySQL query statement below
SELECT p.product_id, CASE WHEN SUM(units) IS NULL 
THEN 0.00
ELSE  ROUND(SUM(units * price)/SUM(units), 2) 
END as average_price
FROM Prices p LEFT JOIN UnitsSold u 
ON p.product_id = u.product_id AND (u.purchase_date BETWEEN p.start_date AND p.end_date)
GROUP BY p.product_id 