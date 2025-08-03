-- Product Performance

-- 5. What are the top 5 best-selling products per category?

SELECT *
FROM (SELECT p.category, p.name, SUM(oi.quantity) AS total_quantity_sold, RANK() OVER (
      PARTITION BY p.category 
      ORDER BY SUM(oi.quantity) DESC
      ) AS rnk
     FROM PRODUCTS p
     JOIN ORDER_ITEMS oi ON p.product_id = oi.product_id
     GROUP BY p.category, p.name
) ranked_products
WHERE rnk <= 5
ORDER BY category, rnk;


--6. Which products have high stock but poor sales?

 SELECT p.product_id, p.name, p.stock_quantity, COALESCE(SUM(oi.quantity), 0) AS total_sold
FROM PRODUCTS p
LEFT JOIN ORDER_ITEMS oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name, p.stock_quantity
ORDER BY p.stock_quantity DESC, total_sold ASC;
