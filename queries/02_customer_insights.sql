-- Customer Insights

-- 3.	Who are the top 10 customers by lifetime value?

SELECT TOP 10 c.name, c.customer_id, c.name, SUM(oi.price * oi.quantity)  AS lifetime_value
FROM CUSTOMERS c
JOIN ORDERS o
ON c.customer_id = o.customer_id
JOIN ORDER_ITEMS oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
ORDER BY lifetime_value

-- 4.	What percentage of customers made more than one order?  

-- first modified the table to repeat some customers in the orders table to change this 0.00%

UPDATE ORDERS
SET customer_id = 15
WHERE order_id IN (2,10,15,13,21);
------------------------
UPDATE ORDERS
SET customer_id = 15
WHERE order_id IN (23,1,8,7,4);
--------------------
SELECT * 
FROM ORDERS
WHERE order_id IN (23,1,8,7,4);

--------------------
WITH order_counts AS 
(SELECT customer_id, COUNT(order_id) AS order_count 
FROM ORDERS GROUP BY customer_id)
SELECT ROUND((COUNT(CASE WHEN order_count > 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS multiple_order_percentage
FROM order_counts;