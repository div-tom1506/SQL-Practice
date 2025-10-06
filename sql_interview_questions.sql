CREATE DATABASE IF NOT EXISTS sql_interview;

USE sql_interview;

CREATE TABLE IF NOT EXISTS Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary FLOAT,
    designation VARCHAR(50),
    department VARCHAR(50)
);

DESC Employees;

INSERT INTO Employees (emp_id, emp_name, salary, designation, department) VALUES
(101, 'Amit Sharma', 75000, 'Software Engineer', 'IT'),
(102, 'Priya Verma', 95000, 'Senior Developer', 'IT'),
(103, 'Rahul Mehta', 60000, 'QA Engineer', 'Quality Assurance'),
(104, 'Sneha Patel', 120000, 'Team Lead', 'IT'),
(105, 'Vikram Singh', 55000, 'Intern', 'HR'),
(106, 'Neha Gupta', 70000, 'UI/UX Designer', 'Design'),
(107, 'Rohit Yadav', 85000, 'Backend Developer', 'IT'),
(108, 'Pooja Nair', 130000, 'Project Manager', 'Management'),
(109, 'Ankit Das', 78000, 'Data Analyst', 'Analytics'),
(110, 'Kavya Rao', 88000, 'DevOps Engineer', 'DevOps'),
(111, 'Saurabh Jain', 75000, 'Software Engineer', 'IT'),
(112, 'Megha Iyer', 95000, 'Senior Developer', 'IT'),
(113, 'Manish Tiwari', 60000, 'QA Engineer', 'Quality Assurance'),
(114, 'Isha Kapoor', 120000, 'Team Lead', 'IT'),
(115, 'Tanya Roy', 55000, 'Intern', 'HR'),
(116, 'Deepak Kumar', 70000, 'UI/UX Designer', 'Design'),
(117, 'Ritika Bose', 85000, 'Backend Developer', 'IT'),
(118, 'Arjun Malhotra', 130000, 'Project Manager', 'Management'),
(119, 'Divya Soni', 78000, 'Data Analyst', 'Analytics'),
(120, 'Karan Batra', 88000, 'DevOps Engineer', 'DevOps'),
(121, 'Ramesh Pillai', 95000, 'Senior Developer', 'IT'),
(122, 'Simran Gill', 120000, 'Team Lead', 'Management'),
(123, 'Harshit Ahuja', 85000, 'Backend Developer', 'IT'),
(124, 'Nisha Reddy', 78000, 'Data Analyst', 'Analytics'),
(125, 'Aditya Menon', 70000, 'UI/UX Designer', 'Design');

SELECT *
FROM Employees;

-- Second highest salary 

-- 1. Using Subquery
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM EMPLOYEES
);

-- 1.a. Using Subquery (Second Highest in the IT Department)
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE department = 'IT' and salary < (
    SELECT MAX(salary)
    FROM Employees
    WHERE department = 'IT'
);

-- 2. Using LIMIT function
SELECT DISTINCT salary
FROM Employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 3. Window function
SELECT emp_name, department, salary
FROM (
    SELECT emp_name,
           department,
           salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
    FROM Employees
) AS ranked
WHERE rank = 2;
