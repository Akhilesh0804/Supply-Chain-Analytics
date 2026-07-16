-- ==========================================================
-- File: 04_data_validation.sql
-- Project: Global Supply Chain Analytics
-- Purpose: Validate the integrity and consistency of the
--          normalized database after ETL.
-- Database: PostgreSQL
--
-- Validation Includes:
-- • Row Count Validation
-- • Referential Integrity
-- • Duplicate Primary Key Checks
-- • Business Rule Validation
-- ==========================================================

-- Row count validation 
SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS departments FROM departments;
SELECT COUNT(*) AS categories FROM categories;
SELECT COUNT(*) AS products FROM products;
SELECT COUNT(*) AS orders FROM orders;
SELECT COUNT(*) AS shipping FROM shipping;
SELECT COUNT(*) AS order_items FROM order_items;

-- Every Order Item belongs to an Order
SELECT COUNT(*)
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;


-- Every Order belongs to a Customer
SELECT COUNT(*)
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- Every Product belongs to a Category
SELECT COUNT(*)
FROM products p
LEFT JOIN categories c
ON p.category_id = c.category_id
WHERE c.category_id IS NULL;


-- Every Category belongs to a Department
SELECT COUNT(*)
FROM categories c
LEFT JOIN departments d
ON c.department_id = d.department_id
WHERE d.department_id IS NULL;


-- Every Shipping Record belongs to an Order
SELECT COUNT(*)
FROM shipping s
LEFT JOIN orders o
ON s.order_id = o.order_id
WHERE o.order_id IS NULL;
