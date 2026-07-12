-- ==========================================================
-- File: 01_create_schema.sql
-- Project: Global Supply Chain Analytics
-- Purpose: Create the normalized relational database schema
-- Database: PostgreSQL
-- Dataset: DataCo Global Supply Chain Dataset
--
-- Tables Created:
--   1. customers
--   2. departments
--   3. categories
--   4. products
--   5. orders
--   6. shipping
--   7. order_items
--
-- Note:
-- Execute the CREATE TABLE statements in the order listed
-- to satisfy all foreign key dependencies.
-- ==========================================================


CREATE TABLE customers (
    customer_id       INT PRIMARY KEY,
    customer_segment  VARCHAR(50) NOT NULL,
    customer_city     VARCHAR(50) NOT NULL,
    customer_state    VARCHAR(50) NOT NULL,
    customer_country  VARCHAR(50) NOT NULL
);

CREATE TABLE departments (
    department_id     INT PRIMARY KEY,
    department_name   VARCHAR(50) NOT NULL
);

CREATE TABLE categories (
    category_id       INT PRIMARY KEY,
    category_name     VARCHAR(50) NOT NULL,
    department_id     INT NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE products (
    product_id        INT PRIMARY KEY,
    category_id       INT NOT NULL,
    product_name      VARCHAR(150) NOT NULL,
    product_price     DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id          INT PRIMARY KEY,
    customer_id       INT NOT NULL,
    order_date        DATE NOT NULL,
    order_status      VARCHAR(50) NOT NULL,
    order_city        VARCHAR(50) NOT NULL,
    order_state       VARCHAR(50) NOT NULL,
    order_country     VARCHAR(50) NOT NULL,
    order_region      VARCHAR(50) NOT NULL,
    market            VARCHAR(50) NOT NULL,
    payment_type      VARCHAR(50) NOT NULL,
    order_profit      DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE shipping (
    order_id                  INT PRIMARY KEY,
    shipping_date             DATE NOT NULL,
    shipping_mode             VARCHAR(50) NOT NULL,
    delivery_status           VARCHAR(50) NOT NULL,
    late_delivery_risk        BOOLEAN NOT NULL,
    scheduled_shipping_days   INT NOT NULL,
    actual_shipping_days      INT NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE order_items (
    order_item_id      INT PRIMARY KEY,
    order_id           INT NOT NULL,
    product_id         INT NOT NULL,
    quantity           INT NOT NULL,
    unit_price         DECIMAL(10,2) NOT NULL,
    gross_sales        DECIMAL(10,2) NOT NULL,
    discount_amount    DECIMAL(10,2) NOT NULL,
    discount_rate      DECIMAL(10,2) NOT NULL,
    net_sales          DECIMAL(10,2) NOT NULL,
    profit_ratio       DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
