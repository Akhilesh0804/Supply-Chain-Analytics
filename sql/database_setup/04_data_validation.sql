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

-- Row count validation: 
SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS departments FROM departments;
SELECT COUNT(*) AS categories FROM categories;
SELECT COUNT(*) AS products FROM products;
SELECT COUNT(*) AS orders FROM orders;
SELECT COUNT(*) AS shipping FROM shipping;
SELECT COUNT(*) AS order_items FROM order_items;

-- ==========================================================

-- Referential Integrity:

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

-- ==========================================================

-- Business Rule Validation:

-- Every Order has at least one Order Item
SELECT COUNT(*)
FROM orders o
LEFT JOIN order_items oi
ON o.order_id = oi.order_id
WHERE oi.order_id IS NULL;


-- Every Order has exactly one Shipping Record
SELECT COUNT(*)
FROM orders o
LEFT JOIN shipping s
ON o.order_id = s.order_id
WHERE s.order_id IS NULL;


-- ==========================================================

-- Duplicate Primary Key Checks 

SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT department_id, COUNT(*)
FROM departments
GROUP BY department_id
HAVING COUNT(*) > 1;

SELECT category_id, COUNT(*)
FROM categories
GROUP BY category_id
HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_item_id, COUNT(*)
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;


