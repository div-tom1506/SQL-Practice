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
);

CREATE TABLE IF NOT EXISTS Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

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
FROM Emps;

SELECT *
FROM Departments;

-- INNER JOIN: Show only matched data
-- Find employees with valid department assignments (ignore unassigned or invalid ones).
-- Use Case: When you only care about employees who belong to a department.
SELECT e.emp_name, d.dept_name
FROM emps e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

-- LEFT JOIN: Keep everything from the left, even if no match
-- Generate an HR report of all employees, even if they’re not yet assigned to a department.
-- Use case: When you want a full employee list including those without departments
SELECT e.emp_name, d.dept_name
FROM emps e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

-- RIGHT JOIN: Keep everything from the right, even if no match
-- Show all departments, including those with no employees yet
-- When you want a full department list, even if some departments have no employees.
SELECT e.emp_name, d.dept_name
FROM emps e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

-- FULL OUTER JOIN: Everything from both sides (Not supported in MYSQL)
-- Create a master data audit to see which employees are missing departments and which departments are missing employees.
-- Use case: When you want all employees and all departments, matched or not.
    -- SELECT e.emp_name, d.dept_name
    -- FROM emps e
    -- FULL OUTER JOIN Departments d
    -- ON e.dept_id = d.dept_id;

-- Instead
SELECT e.emp_id, e.emp_name, d.dept_name
FROM emps e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id
UNION
SELECT e.emp_id, e.emp_name, d.dept_name
FROM emps e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

-- CROSS JOIN: All combinations (Cartesian Product)
-- Calculate training schedules where every employee must attend every department’s workshop.
-- Use case: Useful when generating combinations, like every employee × every department.
SELECT e.emp_name, d.dept_name
FROM emps e
CROSS JOIN Departments d;

-- SELF JOIN: Table joined with itself
-- Find coworkers in the same department
-- Use case: Useful for hierarchical data like managers & employees, or comparing rows in the same table.
SELECT e1.emp_name AS Employee1, e2.emp_name AS Employee2, e1.dept_id
FROM emps e1
JOIN emps e2
  ON e1.dept_id = e2.dept_id
 AND e1.emp_id <> e2.emp_id;
