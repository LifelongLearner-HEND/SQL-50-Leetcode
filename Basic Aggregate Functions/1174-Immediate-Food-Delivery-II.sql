# Write your MySQL query statement below
WITH first_order as (
    SELECT customer_id, min(order_date) as min_date
    FROM delivery
    GROUP BY customer_id
)
SELECT ROUND(SUM(CASE WHEN customer_pref_delivery_date = first_order.min_date THEN 1 ELSE 0 END) / COUNT(DISTINCT first_order.customer_id) * 100,2) AS immediate_percentage
FROM first_order JOIN delivery 
ON first_order.customer_id = delivery.customer_id
AND first_order.min_date = delivery.order_date