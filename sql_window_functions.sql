/*
Windows Function: A window function performs calculations across a set of rows related to the current row —
without collapsing them into one (unlike GROUP BY).
*/

CREATE DATABASE IF NOT EXISTS sql_interview;

USE sql_interview;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    amount INT
);

INSERT INTO Orders (order_id, customer_name, order_date, amount) VALUES
(1, 'Alice', '2024-10-01', 300),
(2, 'Bob', '2024-10-02', 150),
(3, 'Alice', '2024-10-03', 450),
(4, 'David', '2024-10-03', 200),
(5, 'Bob', '2024-10-04', 400),
(6, 'Alice', '2024-10-04', 100);


SELECT *
FROM Orders;

-- 1. ROW_NUMBER()
-- Assigns a unique number to each row within a partition.
SELECT customer_name, order_date, amount,
    ROW_NUMBER() OVER(PARTITION BY customer_name ORDER BY amount DESC) as order_rank
FROM Orders;

-- Use Case: Find the latest or highest order per customer:
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY customer_name ORDER BY amount DESC) as rn
    FROM Orders
) ranked
where rn = 1;


-- 2. RANK()
-- Ranks rows, but gives the same rank for ties and skips the next number.
SELECT customer_name, amount,
    RANK() OVER(ORDER BY amount DESC) AS rank_position
FROM Orders;

-- Use Case: Finding the 2nd highest order value (without skipping ties):
SELECT * 
FROM (
    SELECT *, RANK() OVER(ORDER BY amount DESC) AS rank_position
    FROM Orders
) ranked
WHERE rank_position = 2;


-- 3. DENSE_RANK()
-- Similar to RANK() but does not skip ranks after ties.

-- Use Case: Helpful in reports where rank continuity matters (no skipped ranks).


-- 4. LAG()
-- Accesses data from the previous row without using self-joins.

-- Use Case: Calculate difference between consecutive orders:


-- 5. LEAD()
-- Gets the next row’s value.

-- Use Case:Useful for predicting or comparing future order values or trends.


-- 6. NTILE(n)
-- Divides rows into n equal parts (buckets).

-- Use Case: Split customers or transactions into percentiles or quartiles for analysis (e.g., top 33%, middle 33%, bottom 33%).


-- 7. CUME_DIST()
-- Shows the cumulative distribution (percentage of rows below the current one).

-- Use Case: Used in statistical analysis — e.g., finding what percentile a value falls in.


-- 8. PERCENT_RANK()
-- Calculates the relative rank (percentile) of a row.

-- Use Case: Identify top X% of customers or transactions (e.g., top 10% spenders).


-- 9. FIRST_VALUE() and LAST_VALUE()
-- Return the first or last value in a partition.

-- Use Case: Track first and last order value per customer.
