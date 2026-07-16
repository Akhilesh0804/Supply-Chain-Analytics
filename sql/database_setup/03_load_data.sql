-- ==========================================================
-- File: 03_load_data.sql
-- Project: Global Supply Chain Analytics
-- Purpose: Populate the normalized tables from the staging table
-- Database: PostgreSQL
-- Dataset: DataCo Global Supply Chain Dataset
--
-- Workflow:
-- stg_dataco
--      ↓
-- customers
-- departments
-- categories
-- products
-- orders
-- shipping
-- order_items
--
-- Notes:
-- • DISTINCT is used for dimension tables.
-- • DISTINCT ON (order_id) is used for order-level tables.
-- • Date and Boolean values are transformed during loading.
-- ==========================================================


-- ==========================================
-- Load Customers
-- ==========================================

INSERT INTO customers (
    customer_id,
    customer_segment,
    customer_city,
    customer_state,
    customer_country
)
SELECT DISTINCT
    customer_id,
    customer_segment,
    customer_city,
    customer_state,
    customer_country
FROM stg_dataco;


-- ==========================================
-- Load Departments
-- ==========================================

INSERT INTO departments (
    department_id,
    department_name
)
SELECT DISTINCT
    department_id,
    department_name
FROM stg_dataco;


-- ==========================================
-- Load Categories
-- ==========================================

INSERT INTO categories (
    category_id,
    category_name,
    department_id
)
SELECT DISTINCT
    category_id,
    category_name,
    department_id
FROM stg_dataco;


-- ==========================================
-- Load Products
-- ==========================================

INSERT INTO products (
    product_id,
    category_id,
    product_name,
    product_price
)
SELECT DISTINCT
    product_id,
    category_id,
    product_name,
    product_price
FROM stg_dataco;


-- ==========================================
-- Load Orders
-- ==========================================

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    order_status,
    order_city,
    order_state,
    order_country,
    order_region,
    market,
    payment_type,
    order_profit
)
SELECT DISTINCT ON (order_id)
    order_id,
    customer_id,
    TO_DATE(SPLIT_PART(order_date,' ',1),'MM/DD/YYYY'),
    order_status,
    order_city,
    order_state,
    order_country,
    order_region,
    market,
    payment_type,
    order_profit
FROM stg_dataco
ORDER BY order_id;


-- ==========================================
-- Load Shipping
-- ==========================================

INSERT INTO shipping (
    order_id,
    shipping_date,
    shipping_mode,
    delivery_status,
    late_delivery_risk,
    scheduled_shipping_days,
    actual_shipping_days
)
SELECT DISTINCT ON (order_id)
    order_id,
    TO_DATE(SPLIT_PART(shipping_date,' ',1),'MM/DD/YYYY'),
    shipping_mode,
    delivery_status,
    CASE
        WHEN late_delivery_risk = 1 THEN TRUE
        ELSE FALSE
    END,
    scheduled_shipping_days,
    actual_shipping_days
FROM stg_dataco
ORDER BY order_id;


-- ==========================================
-- Load Order Items
-- ==========================================

INSERT INTO order_items (
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    gross_sales,
    discount_amount,
    discount_rate,
    net_sales,
    profit_ratio
)
SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    gross_sales,
    discount_amount,
    discount_rate,
    net_sales,
    profit_ratio
FROM stg_dataco;
