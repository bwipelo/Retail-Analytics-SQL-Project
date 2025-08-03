-- Sales Analysis

--1.	What is the monthly revenue trend over the past year?

SELECT FORMAT(o.order_date, 'yyyy-MM') AS month, 
		SUM(oi.price * oi.quantity) AS monthly_revenue
FROM Orders o
JOIN ORDER_ITEMS oi
ON o.order_id = oi.order_id
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;

-- 2.	Which product categories generate the most revenue? 

SELECT p.category, SUM(oi.price * oi.quantity) AS total_revenue
FROM ORDER_ITEMS oi
JOIN PRODUCTS p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;