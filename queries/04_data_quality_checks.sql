-- Operational & Data Quality

-- 7. Are there any orders where total_amount doesn’t match the sum of items?

SELECT o.order_id, o.total_amount, SUM(oi.price * oi.quantity) AS calculated_total
FROM ORDERS o
JOIN ORDER_ITEMS oi
ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total_amount
HAVING o.total_amount != SUM(oi.price * oi.quantity);

-- 8. Identify duplicate emails in the customer table.

SELECT email, count(*) AS email_count
FROM CUSTOMERS
GROUP BY email
HAVING COUNT(*) > 1;