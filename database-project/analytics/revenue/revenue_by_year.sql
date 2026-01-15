-- ============================================
-- METRIC: Revenue
-- GRAIN: Year
-- DESCRIPTION:
--   Calculates total revenue per year considering
--   only completed or billable orders.
--
-- TABLES:
--   - orders
--   - order_item
--
-- STATUS LOGIC:
--   Paid, Shipped, Delivered, Completed
-- ============================================
SELECT
    YEAR(order_date) AS year_of_order,
    SUM(quantity * unit_price) AS revenue
FROM 
    orders o
JOIN 
    order_item oi ON o.order_id = oi.order_id_fk
WHERE
    o.order_status IN ('Paid', 'Shipped', 'Delivered', 'Completed') 
GROUP BY YEAR(order_date)
ORDER BY year_of_order;
