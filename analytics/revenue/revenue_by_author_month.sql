-- ============================================
-- METRIC: Revenue
-- GRAIN: Year, Month, Author
-- DESCRIPTION:
--   Calculates total revenue aggregated by author
--   on a monthly basis, considering only billable orders.
--
-- TABLES:
--   - orders
--   - order_item
--   - book
--   - author
--
-- BUSINESS LOGIC:
--   Revenue is calculated as quantity * unit_price.
--
-- STATUS LOGIC:
--   Paid, Shipped, Delivered, Completed
-- ============================================
SELECT
    YEAR(o.order_date) AS year_of_order,
    MONTH(o.order_date) AS month_of_order,
    a.author_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM 
    orders o 
JOIN
    order_item oi ON o.order_id = oi.order_id_fk
JOIN 
    book b ON oi.book_id_fk = b.book_id
JOIN
    author a ON b.author_id_fk = a.author_id
WHERE
    o.order_status IN ('Paid', 'Shipped', 'Delivered', 'Completed') 
GROUP BY YEAR(o.order_date), MONTH(o.order_date), a.author_id, a.author_name
ORDER BY YEAR(o.order_date), MONTH(o.order_date), a.author_name;
