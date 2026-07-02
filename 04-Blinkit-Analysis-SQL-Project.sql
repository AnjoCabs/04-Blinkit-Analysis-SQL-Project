-- DISCLAIMER:
-- This analysis has been conducted solely for educational and practice purposes in learning SQL and data
-- analytics. The dataset used is hypothetical or publicly available and does not reflect the operations,
-- performance, or strategies of any real-world company. Any resemblance to actual companies, campaigns, or
-- individuals is purely coincidental.

-- DATA SOURCE: https://www.youtube.com/watch?v=VCE62a9Z5Vc&list=PLVOfSd1Syc0FamdRp-yypwMx2AMVpI0Cx


USE blinkit_database;

CREATE TABLE blinkit_customer_feedback
(
	`id` INT NOT NULL AUTO_INCREMENT, 
	`feedback_id` INT DEFAULT NULL,
	`order_id` INT DEFAULT NULL,
	`customer_id` INT DEFAULT NULL,
	`rating` INT DEFAULT NULL,
	`feedback_text` VARCHAR(255) DEFAULT NULL,
	`feedback_category` VARCHAR(255) DEFAULT NULL,
	`sentiment` VARCHAR(255) DEFAULT NULL,
	`feedback_date` DATE DEFAULT NULL,
    `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_customer_feedback1.csv'
INTO TABLE blinkit_customer_feedback
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_customers
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`customer_id` INT DEFAULT NULL,
	`customer_name` VARCHAR(50) DEFAULT NULL,
	`email` VARCHAR(50) DEFAULT NULL,
	`phone` VARCHAR(50) DEFAULT NULL,
	`address` VARCHAR(50) DEFAULT NULL,
	`area` VARCHAR(50) DEFAULT NULL,
	`pincode` INT DEFAULT NULL,
	`registration_date` DATE DEFAULT NULL,
	`customer_segment` VARCHAR(50) DEFAULT NULL,
	`total_orders` INT DEFAULT NULL,
	`avg_order_value` DECIMAL(8,2),
    `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_customers.csv'
INTO TABLE blinkit_customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_delivery_performance
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT DEFAULT NULL, 
	`delivery_partner_id` INT DEFAULT NULL,
	`promised_time` DATE DEFAULT NULL,
	`actual_time` DATE DEFAULT NULL,
	`delivery_time_minutes`INT DEFAULT NULL,
	`distance_km` DECIMAL(6.2),
	`delivery_status` VARCHAR(50) DEFAULT NULL,
	`reasons_if_delayed` VARCHAR(50) DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_delivery_performance.csv'
INTO TABLE blinkit_delivery_performance
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_inventory
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`product_id` INT DEFAULT NULL,
	`date` DATE DEFAULT NULL,
	`stock_received` INT DEFAULT NULL, 
	`damaged_stock` INT DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);


LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_inventory.csv'
INTO TABLE blinkit_inventory
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_marketing_performance
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`campaign_id` INT DEFAULT NULL,
	`campaign_name` VARCHAR(255) DEFAULT NULL,
	`date` DATE DEFAULT NULL,
	`target_audience` VARCHAR(50) DEFAULT NULL,
	`channel` VARCHAR(50) DEFAULT NULL,
	`impressions` INT DEFAULT NULL,
	`clicks` INT DEFAULT NULL,
	`conversions` INT DEFAULT NULL,
	`spend` DECIMAL(8,2) DEFAULT NULL,
	`revenue_generated` DECIMAL(8,2) DEFAULT NULL,
	`roas` DECIMAL(8,2) DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_marketing_performance.csv'
INTO TABLE blinkit_marketing_performance
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_order_items
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT DEFAULT NULL,
	`product_id` INT DEFAULT NULL,
	`quantity` INT DEFAULT NULL,
	`unit_price` DECIMAL(8,2) DEFAULT NULL,
	`total_price` DECIMAL(8,2) DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_order_items.csv'
INTO TABLE blinkit_order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_orders
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`order_id` INT DEFAULT NULL,
	`customer_id` INT DEFAULT NULL,
	`order_date` DATE DEFAULT NULL,
	`promised_delivery_time` DATE DEFAULT NULL,
	`actual_delivery_time` DATE DEFAULT NULL,
	`delivery_status` VARCHAR(50) DEFAULT NULL,
	`order_total` DECIMAL(8,2) DEFAULT NULL,
	`payment_method` VARCHAR(50) DEFAULT NULL,
	`delivery_partner_id` INT DEFAULT NULL, 
	`store_id` INT DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_orders.csv'
INTO TABLE blinkit_orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_products 
(
	`id`	INT NOT NULL AUTO_INCREMENT,
    `product_id` INT DEFAULT NULL,
	`product_name` VARCHAR(255) DEFAULT NULL,
	`category` VARCHAR(255) DEFAULT NULL,
	`brand` VARCHAR(255) DEFAULT NULL,
	`price` DECIMAL(8,2) DEFAULT NULL,
	`mrp` DECIMAL(8,2) DEFAULT NULL,
	`margin_percentage` INT DEFAULT NULL, 
	`shelf_life_days` INT DEFAULT NULL,
	`min_stock_level` INT DEFAULT NULL,
	`max_stock_level` INT DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/blinkit_products.csv'
INTO TABLE blinkit_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE category_icons1
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`category` VARCHAR(255) DEFAULT NULL,
	`Img` VARCHAR(255) DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(`id`) 
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/Blinkit Dataset/category_icons1.csv'
INTO TABLE category_icons1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

CREATE TABLE blinkit_combined_view AS
SELECT 
    o.order_id,
    o.customer_id,
    o.delivery_partner_id,
    oi.product_id,
    cf.feedback_id,
    o.order_date AS order_datetime,
    c.area,
    c.customer_name,
    c.customer_segment,
    p.product_name,
    p.category,
    p.price,
    oi.quantity,
    oi.total_price AS value,
    o.payment_method,
    dp.promised_time,
    dp.actual_time,
    dp.delivery_time_minutes,
    dp.reasons_if_delayed,
    cf.rating,
    cf.feedback_category,
    cf.feedback_text,
    cf.sentiment AS feedback_segment,
    cf.rating AS star,
  ci.Img AS img,
    cf.feedback_date AS `Date`
    
FROM blinkit_orders o

LEFT JOIN blinkit_customers c
    ON o.customer_id = c.customer_id

LEFT JOIN blinkit_order_items oi
    ON o.order_id = oi.order_id

LEFT JOIN blinkit_products p
    ON oi.product_id = p.product_id

LEFT JOIN blinkit_delivery_performance dp
    ON o.order_id = dp.order_id

LEFT JOIN blinkit_customer_feedback cf
    ON o.order_id = cf.order_id

LEFT JOIN category_icons1 ci
    ON p.category = ci.category;
    
    
    
 CREATE VIEW blinkit_database_with_inner_join AS   
    SELECT 
    o.order_id,
    o.customer_id,
    o.delivery_partner_id,
    oi.product_id,
    cf.feedback_id,
    o.order_date AS order_datetime,
    c.area,
    c.customer_name,
    c.customer_segment,
    p.product_name,
    p.category,
    p.price,
    oi.quantity,
    oi.total_price AS value,
    o.payment_method,
    dp.promised_time,
    dp.actual_time,
    dp.delivery_time_minutes,
    dp.reasons_if_delayed,
    cf.rating,
    cf.feedback_category,
    cf.feedback_text,
    cf.sentiment AS feedback_segment,
    cf.rating AS star,
    ci.Img AS img,
    cf.feedback_date AS `Date`

FROM blinkit_orders o

INNER JOIN blinkit_customers c
    ON o.customer_id = c.customer_id

INNER JOIN blinkit_order_items oi
    ON o.order_id = oi.order_id

INNER JOIN blinkit_products p
    ON oi.product_id = p.product_id

INNER JOIN blinkit_delivery_performance dp
    ON o.order_id = dp.order_id

INNER JOIN blinkit_customer_feedback cf
    ON o.order_id = cf.order_id

INNER JOIN category_icons1 ci
    ON p.category = ci.category;
    
CREATE VIEW blinkit_datasheet AS
SELECT 
    o.order_id,
    o.customer_id,
    o.delivery_partner_id,
    oi.product_id,
    cf.feedback_id,
    c.customer_name,
    c.customer_segment,
    c.area,
    p.category,
    ci.Img AS category_img,
    p.brand,
    p.product_name,
    cf.feedback_category,
    cf.feedback_text,
    cf.rating,
    cf.rating AS Star,
    cf.sentiment AS feedback_segment,
    o.order_date AS Order_Date_Time,
    DATE(o.order_date) AS Order_Date,
    o.payment_method,
    o.promised_delivery_time,
    o.actual_delivery_time,
    dp.delivery_time_minutes,
    o.delivery_status,
    oi.quantity,
    o.order_total AS Total_order_amount

FROM blinkit_orders o

LEFT JOIN blinkit_customers c
    ON o.customer_id = c.customer_id

LEFT JOIN blinkit_order_items oi
    ON o.order_id = oi.order_id

LEFT JOIN blinkit_products p
    ON oi.product_id = p.product_id

LEFT JOIN blinkit_delivery_performance dp
    ON o.order_id = dp.order_id

LEFT JOIN blinkit_customer_feedback cf
    ON o.order_id = cf.order_id

LEFT JOIN category_icons1 ci
    ON p.category = ci.category;

-- BUSINESS ANALYSIS QUESTIONS
-- 1. Which products generate the most revenue?
SELECT 	boi.product_id, 
		product_name,
		SUM(quantity * unit_price) AS total_revenue
FROM blinkit_order_items boi
JOIN blinkit_products bp
	ON boi.product_id = bp.product_id
GROUP BY boi.product_id,
		product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 2. What is the average order value per customer?
SELECT
	customer_id,
    customer_name,
    avg_order_value
FROM blinkit_customers
GROUP BY 
	customer_id,
	customer_name,
    avg_order_value
ORDER BY avg_order_value DESC;


-- 3. Which categories are selling the most in terms of units and revenue?
SELECT 	
	boi.product_id, 
	product_name,
	SUM(boi.quantity) AS total_units_sold,
	SUM(quantity * unit_price) AS total_revenue
FROM blinkit_order_items boi
JOIN blinkit_products bp
	ON boi.product_id = bp.product_id
GROUP BY 
	boi.product_id,
	product_name,
	quantity
ORDER BY 
	total_revenue DESC,
	total_units_sold DESC;

-- 4. Who are the top 10 loyal customers based on order frequency?
SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM blinkit_orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- OPERATIONS AND DELIVERY
-- 5. Which delivery agents or time slots have the most delays?
SELECT
    delivery_partner_id,
    COUNT(*) AS total_deliveries,
    SUM(CASE 
            WHEN delivery_status IN ('Slightly Delayed', 'Delayed') 
            THEN 1 ELSE 0 
        END) AS delay_count
FROM blinkit_delivery_performance
GROUP BY delivery_partner_id
ORDER BY delay_count DESC;


-- 6. What percent of orders are delivered on time?
SELECT 	
    ROUND((COUNT(CASE WHEN delivery_status = 'On Time' THEN 1 END) * 100.0) / 
        COUNT(delivery_status), 
    2) AS onTimePercentage
FROM blinkit_delivery_performance;

-- MARKETING PERFORMANCE
-- 7. Which campaigns had the highest conversion rates?
SELECT
	campaign_id,
    campaign_name,
    SUM(conversions) AS total_conversions,
    SUM(impressions) AS total_impressions,
    ROUND((SUM(conversions) * 100.0 / NULLIF(SUM(impressions), 0)), 2) AS conversionRate_percentage
FROM blinkit_marketing_performance
GROUP BY 
	campaign_id,
	campaign_name
ORDER BY conversionRate_percentage DESC;

-- 8. What is the most effective campaign that gathered the most revenue?
SELECT
	campaign_id,
    campaign_name,
    SUM(revenue_generated) AS total_revenue
FROM blinkit_marketing_performance
GROUP BY
	campaign_id,
    campaign_name
ORDER BY total_revenue DESC;

-- 9. What is the ROI (return on investment) per marketing channel?
SELECT
    channel,
    SUM(revenue_generated) AS total_revenue,
    SUM(spend) AS total_spend,
    ROUND((SUM(revenue_generated) - SUM(spend)) / NULLIF(SUM(spend), 0) * 100, 2) AS ROI_Percentage
FROM blinkit_marketing_performance
GROUP BY channel
ORDER BY ROI_Percentage DESC;

-- CUSTOMER FEEDBACK
-- 10. What is the average rating per product or category?
SELECT
	feedback_category,
    AVG(rating) AS average_rating
FROM blinkit_customer_feedback
GROUP BY feedback_category 
ORDER BY average_rating DESC;

-- 11. Which product categories receive the most negative feedback?
SELECT
    feedback_category,
    SUM(CASE WHEN sentiment = 'Negative' THEN 1 ELSE 0 END) AS negative_feedback
FROM blinkit_customer_feedback
GROUP BY feedback_category
ORDER BY negative_feedback DESC;

-- 12. Do delays correlate with lower customer ratings?
SELECT 
    delivery_status,
    COUNT(feedback_id) AS total_feedbacks,
    AVG(rating) AS average_rating
FROM blinkit_delivery_performance bdp
JOIN blinkit_customer_feedback bcf 
    ON bdp.order_id = bcf.order_id
WHERE rating IS NOT NULL
GROUP BY delivery_status
ORDER BY average_rating ASC;

-- INVENTORY AND PRODUCTS ANALYSIS
-- 13. Which products are frequently damaged?
SELECT
    bp.product_id,
    bp.product_name,
    SUM(bi.stock_received) AS total_stock,
    SUM(bi.damaged_stock) AS total_damaged
FROM blinkit_inventory bi
JOIN blinkit_products bp 
    ON bi.product_id = bp.product_id
GROUP BY bp.product_id, bp.product_name
HAVING total_damaged > 0
ORDER BY total_damaged DESC;

-- 14. Which product/items has the highest sales by revenue
SELECT 
    boi.product_id,
    bp.product_name,
    SUM(boi.quantity) AS total_units_sold,
    SUM(boi.quantity * boi.unit_price) AS total_revenue
FROM blinkit_order_items boi
JOIN blinkit_products bp
    ON boi.product_id = bp.product_id
GROUP BY boi.product_id, bp.product_name
ORDER BY total_revenue DESC;

-- 15. Which products/items has the highest sales by unit sold
SELECT 
    boi.product_id,
    bp.product_name,
    SUM(boi.quantity) AS total_units_sold
FROM blinkit_order_items boi
JOIN blinkit_products bp
    ON boi.product_id = bp.product_id
GROUP BY boi.product_id, bp.product_name
ORDER BY total_units_sold DESC;

-- RETENTION AND CHURN
-- 16. How many customers placed only one order and never returned?
SELECT 
    COUNT(*) AS one_timeCustomers
FROM (
    SELECT 
        customer_id
    FROM blinkit_orders
    GROUP BY customer_id
    HAVING COUNT(order_id) = 1
) AS single_orderCustomers;

-- 17 What is the time gap between first and last order per customer?
SELECT 
    customer_id,
    MIN(order_date) AS first_orderDate,
    MAX(order_date) AS last_orderDate,
    DATEDIFF(MAX(order_date), MIN(order_date)) AS days_betweenOrders
FROM blinkit_orders
GROUP BY customer_id
ORDER BY days_betweenOrders DESC;

-- 18. Which customer segment shows highest repeat order rate?
SELECT
    bc.customer_segment,
    COUNT(DISTINCT bo.customer_id) AS total_customers_with_orders,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN bo.customer_id END) AS repeat_customers,
    ROUND(COUNT(DISTINCT CASE WHEN order_count > 1 THEN bo.customer_id END) * 100.0 /
          COUNT(DISTINCT bo.customer_id), 2) AS repeat_order_rate_percentage
FROM blinkit_customers bc
JOIN (
    SELECT customer_id, COUNT(*) AS order_count
    FROM blinkit_orders
    GROUP BY customer_id
) bo ON bc.customer_id = bo.customer_id
GROUP BY bc.customer_segment
ORDER BY repeat_order_rate_percentage DESC;


-- DISCLAIMER:
-- This analysis has been conducted solely for educational and practice purposes in learning SQL and data
-- analytics. The dataset used is hypothetical or publicly available and does not reflect the operations,
-- performance, or strategies of any real-world company. Any resemblance to actual companies, campaigns, or
-- individuals is purely coincidental.

-- DATA SOURCE: https://www.youtube.com/watch?v=VCE62a9Z5Vc&list=PLVOfSd1Syc0FamdRp-yypwMx2AMVpI0Cx