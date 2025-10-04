/*
    Aggregate Functions
*/

USE sql_demo;

CREATE TABLE IF NOT EXISTS Orders(
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO Orders(order_id, customer_name, product_name, quantity, price, order_date) VALUES
(1, 'Alice', 'Laptop', 1, 60000.00, '2025-09-20'),
(2, 'Bob', 'Mobile', 2, 20000.00, '2025-09-20'),
(3, 'Charlie', 'Laptop', 1, 60000.00, '2025-09-21'),
(4, 'Alice', 'Tablet', 3, 15000.00, '2025-09-22'),
(5, 'David', 'Headphones', 5, 2000.00, '2025-09-23'),
(6, 'Alice', 'Mobile', 1, 20000.00, '2025-09-23'),
(7, 'Eva', 'Camera', 1, 45000.00, '2025-09-24'),
(8, 'Bob', 'Laptop', 2, 60000.00, '2025-09-25');

SELECT *
FROM Orders

-- SUM 
-- Total Revenue: How much money did the store earn in total?
SELECT SUM(quantity*price) AS Total_Revenue
FROM Orders

-- COUNT
-- Number of Orders: How many orders were placed?
SELECT COUNT(order_id) AS total_orders
FROM Orders;

-- AVG
-- Average Order Value
-- On average: how much does one order earn?
SELECT AVG(quantity*price) AS avg_order_value
FROM Orders;

-- MAX, MIN
-- Highest & Lowest Order Value: Find the costliest and cheapest orders.
SELECT MAX(quantity*price) AS max_order, MIN(quantity*price) AS min_order
FROM Orders;

-- GROUP BY
-- Revenue by Customer: Who spent how much in total?
SELECT customer_name, SUM(quantity*price) AS total_spent
FROM Orders
GROUP BY customer_name;


-- HAVING
-- Top Customers: Who spent more than ₹50,000 in total?
SELECT customer_name, SUM(quantity*price) AS total_spent
FROM Orders
GROUP BY customer_name
HAVING total_spent > 50000;

-- COUNT
-- Most Popular Product: Which product was sold the most (by number of orders)?
SELECT product_name, COUNT(*) AS times_sold
FROM Orders
GROUP BY product_name
ORDER BY times_sold DESC


-- Daily Sales Summary (GROUP BY Date)
-- How much was earned each day?
SELECT order_date, SUM(quantity*price) as daily_revenue
FROM Orders
GROUP BY order_date
ORDER BY order_date;

-- Unique Products Sold (COUNT DISTINCT)
SELECT COUNT(DISTINCT product_name) AS unique_products
FROM Orders;

-- List of All Products Sold (GROUP_CONCAT)
SELECT GROUP_CONCAT(DISTINCT product_name) AS product_list
FROM Orders;