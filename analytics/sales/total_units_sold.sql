-- ============================================
-- METRIC: Total Units Sold
-- GRAIN: Global
-- DESCRIPTION:
--   Calculates the total number of units sold
--   across all completed or billable orders.
--
-- TABLES:
--   - orders
--   - order_item
--
-- STATUS LOGIC:
--   Paid, Shipped, Delivered, Completed
--
-- NOTES:
--   This metric represents overall sales volume
--   and is commonly used as a core KPI.
-- ============================================
SELECT
    SUM(quantity) AS total_units_sold
FROM
   order_item oi
JOIN 
    orders o ON oi.order_id_fk = o.order_id
WHERE 
    o.order_status IN ('Paid', 'Shipped', 'Delivered', 'Completed');
