-- ============================================
-- METRIC: Revenue
-- GRAIN: Daily
-- DESCRIPTION:
--   Calculates total revenue per day considering
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
    DATE(order_date) AS metric_date,
    SUM(quantity * unit_price) AS revenue
FROM 
    orders o
JOIN 
    order_item oi ON o.order_id = oi.order_id_fk
WHERE 
    o.order_status IN ('Paid', 'Shipped', 'Delivered', 'Completed')
GROUP BY DATE(order_date)
ORDER BY DATE(order_date);  
