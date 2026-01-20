-- =====================================================
-- METRIC: Average Order Value (AOV)
-- GRAIN: Year, Month
--
-- DESCRIPTION:
--   Calculates the average order value aggregated
--   by year and month.
--
--   Formula:
--     Total Revenue / Number of Distinct Orders
--
-- TABLES:
--   - orders
--   - order_item
--
-- STATUS LOGIC:
--   Includes only billable or completed orders:
--   Paid, Shipped, Delivered, Completed
--
-- NOTES:
--   Uses COUNT(DISTINCT order_id) to avoid
--   overcounting orders with multiple items.
-- =====================================================
SELECT
    YEAR(order_date) AS year_of_order,
    MONTH(order_date) AS month_of_order,
    SUM(oi.quantity * oi.unit_price ) / COUNT(DISTINCT o.order_id) AS average_order_value
FROM 
    order_item oi
JOIN 
    orders o ON oi.order_id_fk = o.order_id
WHERE
    o.order_status IN ('Paid', 'Shipped', 'Delivered', 'Completed') 
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year_of_order, month_of_order;
