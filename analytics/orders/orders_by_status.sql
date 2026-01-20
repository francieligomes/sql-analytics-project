-- ============================================
-- METRIC: Orders count
-- GRAIN: Order status
-- DESCRIPTION:
--   Counts total number of orders grouped by
--   their current status.
--
-- TABLES:
--   - orders
-- ============================================
SELECT
    order_status,
    COUNT(*) AS qt_orders
FROM orders
GROUP BY order_status;
