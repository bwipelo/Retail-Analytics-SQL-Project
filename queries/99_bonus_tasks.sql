-- A bonus: A SQL View or Stored Procedure for any custom metric (e.g. CLV)

CREATE VIEW customer_tlv_view AS
SELECT c.customer_id, c.name, SUM(oi.price * oi.quantity) AS lifetime_value
FROM CUSTOMERS c
JOIN ORDERS o
ON c.customer_id = o.customer_id
JOIN ORDER_ITEMS oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
