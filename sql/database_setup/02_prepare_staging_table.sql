-- ==========================================================
-- File: 02_prepare_staging_table.sql
-- Project: Global Supply Chain Analytics
-- Purpose: Rename the columns since the column headings were imported as strings 
-- Database: PostgreSQL
-- Dataset: DataCo Global Supply Chain Dataset
-- ==========================================================

ALTER TABLE stg_dataco RENAME COLUMN "Type" TO payment_type;

ALTER TABLE stg_dataco RENAME COLUMN "Days for shipping (real)" TO actual_shipping_days;
ALTER TABLE stg_dataco RENAME COLUMN "Days for shipment (scheduled)" TO scheduled_shipping_days;

ALTER TABLE stg_dataco RENAME COLUMN "Benefit per order" TO benefit_per_order;
ALTER TABLE stg_dataco RENAME COLUMN "Sales per customer" TO sales_per_customer;

ALTER TABLE stg_dataco RENAME COLUMN "Delivery Status" TO delivery_status;
ALTER TABLE stg_dataco RENAME COLUMN "Late_delivery_risk" TO late_delivery_risk;

ALTER TABLE stg_dataco RENAME COLUMN "Category Id" TO category_id;
ALTER TABLE stg_dataco RENAME COLUMN "Category Name" TO category_name;

ALTER TABLE stg_dataco RENAME COLUMN "Customer City" TO customer_city;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Country" TO customer_country;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Email" TO customer_email;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Fname" TO customer_fname;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Id" TO customer_id;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Lname" TO customer_lname;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Password" TO customer_password;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Segment" TO customer_segment;
ALTER TABLE stg_dataco RENAME COLUMN "Customer State" TO customer_state;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Street" TO customer_street;
ALTER TABLE stg_dataco RENAME COLUMN "Customer Zipcode" TO customer_zipcode;

ALTER TABLE stg_dataco RENAME COLUMN "Department Id" TO department_id;
ALTER TABLE stg_dataco RENAME COLUMN "Department Name" TO department_name;

ALTER TABLE stg_dataco RENAME COLUMN "Latitude" TO latitude;
ALTER TABLE stg_dataco RENAME COLUMN "Longitude" TO longitude;

ALTER TABLE stg_dataco RENAME COLUMN "Market" TO market;

ALTER TABLE stg_dataco RENAME COLUMN "Order City" TO order_city;
ALTER TABLE stg_dataco RENAME COLUMN "Order Country" TO order_country;
ALTER TABLE stg_dataco RENAME COLUMN "Order Customer Id" TO customer_id;
ALTER TABLE stg_dataco RENAME COLUMN "order date (DateOrders)" TO order_date;
ALTER TABLE stg_dataco RENAME COLUMN "Order Id" TO order_id;

ALTER TABLE stg_dataco RENAME COLUMN "Order Item Cardprod Id" TO product_id;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Discount" TO discount_amount;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Discount Rate" TO discount_rate;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Id" TO order_item_id;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Product Price" TO unit_price;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Profit Ratio" TO profit_ratio;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Quantity" TO quantity;

ALTER TABLE stg_dataco RENAME COLUMN "Sales" TO gross_sales;
ALTER TABLE stg_dataco RENAME COLUMN "Order Item Total" TO net_sales;
ALTER TABLE stg_dataco RENAME COLUMN "Order Profit Per Order" TO order_profit;

ALTER TABLE stg_dataco RENAME COLUMN "Order Region" TO order_region;
ALTER TABLE stg_dataco RENAME COLUMN "Order State" TO order_state;
ALTER TABLE stg_dataco RENAME COLUMN "Order Status" TO order_status;
ALTER TABLE stg_dataco RENAME COLUMN "Order Zipcode" TO order_zipcode;

ALTER TABLE stg_dataco RENAME COLUMN "Product Card Id" TO product_card_id;
ALTER TABLE stg_dataco RENAME COLUMN "Product Category Id" TO product_category_id;
ALTER TABLE stg_dataco RENAME COLUMN "Product Description" TO product_description;
ALTER TABLE stg_dataco RENAME COLUMN "Product Image" TO product_image;
ALTER TABLE stg_dataco RENAME COLUMN "Product Name" TO product_name;
ALTER TABLE stg_dataco RENAME COLUMN "Product Price" TO product_price;
ALTER TABLE stg_dataco RENAME COLUMN "Product Status" TO product_status;

ALTER TABLE stg_dataco RENAME COLUMN "shipping date (DateOrders)" TO shipping_date;
ALTER TABLE stg_dataco RENAME COLUMN "Shipping Mode" TO shipping_mode;
