/*
    Joins: A SQL JOIN is used to combine rows from two or more tables based on a related column between them.

    Types Of Joins
        [INNER JOIN, LEFT JOIN | LEFT OUTER JOIN, RIGHT JOIN | RIGHT OUTER JOIN, FULL OUTER JOIN, 
            CROSS JOIN, SELF JOIN]
    
*/

CREATE DATABASE IF NOT EXISTS sql_demo;
USE sql_demo;

CREATE TABLE IF NOT EXISTS Emps (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT 
)

CREATE TABLE IF NOT EXISTS Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
)

desc Emps Departments

INSERT INTO Emps(emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'David', NULL),
(5, 'Eva', 101);

INSERT INTO Departments(dept_id, dept_name) VALUES
(101, 'HR'),
(102, 'IT'),
(104, 'Finance');


SELECT *
FROM Emps

SELECT *
FROM Departments

-- INNER JOIN
--  Find employees with valid department assignments (ignore unassigned or invalid ones).
-- Use Case: When you only care about employees who belong to a department.