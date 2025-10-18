/* 
1. DDL (Data Definition Language)
    [CREATE, DROP, ALTER, TRUNCATE, COMMENT, RENAME]

2. DML (Data Manipulation Language)
    [INSERT, UPDATE, DELETE]

3. DQL (Data Query Language)
    [SELECT, WHERE, FROM, GROUP BY, HAVING, LIMIT, DISTINCT, ORDER BY]

4. DCL (Data Control Language)
    [GRANT, REVOKE]

5. TCL (Transaction Control Language)
    [BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT]

Operators: 
    >, >=, <, <=, =, <>, BETWEEN, LIKE, IN

*/



CREATE DATABASE IF NOT EXISTS sql_demo;

USE sql_demo;

CREATE TABLE IF NOT EXISTS employees (
    empId INT PRIMARY KEY,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    DOB DATE NOT NULL
);

-- RENAME TABLE employees TO Workers

DESC TABLE employees;

INSERT INTO employees(empId, firstName, lastName, DOB) VALUES
    (1234, 'Divyanshu', 'Kumar', '2002-01-15'),
    (5678, 'qwerty', 'asdf', '2000-06-22');

SELECT *
FROM employees;

ALTER TABLE employees             -- [ADD | DROP | MODIFY | RENAME] 
ADD (Designation VARCHAR(25) NOT NULL, Country VARCHAR(25) NOT NULL);

-- to add designation to existing emps
UPDATE employees
SET Designation = 'SDE I', Country = 'India'
WHERE empId = 1234

UPDATE employees
SET Designation = 'Data Analyst', Country = 'USA'
WHERE empId = 5678

ALTER TABLE employees
ADD AGE INT NOT NULL;

UPDATE employees
SET AGE = 25 WHERE empId = 5678

UPDATE employees
SET AGE = 23 WHERE empId = 1234

INSERT INTO employees(empId, firstName, lastName, DOB, Designation, Country, Age) VALUES
    (4322, 'Ananya', 'Sharma', '1998-03-22', 'Software Engineer', 'India', 27),
    (4323, 'Rohit', 'Verma', '1995-07-10', 'Senior Developer', 'USA', 30),
    (4324, 'Priya', 'Mehta', '1999-11-05', 'QA Engineer', 'India', 25),
    (4325, 'Aman', 'Singh', '1997-09-14', 'DevOps Engineer', 'UK', 28),
    (4326, 'Sneha', 'Patil', '1996-02-29', 'UI/UX Designer', 'India', 29),
    (4327, 'Kunal', 'Joshi', '1994-08-17', 'Project Manager', 'Germany', 31),
    (4328, 'Meera', 'Iyer', '2000-12-01', 'Business Analyst', 'India', 24),
    (4329, 'Arjun', 'Reddy', '1993-06-03', 'Tech Lead', 'USA', 32),
    (4330, 'Neha', 'Gupta', '1998-04-25', 'Data Scientist', 'India', 27),
    (4331, 'Vikas', 'Nair', '1998-07-11', 'Software Engineer', 'India', 27),
    (4332, 'Isha', 'Kapoor', '1999-01-19', 'QA Engineer', 'UK', 25),
    (4333, 'Aditya', 'Mishra', '1995-12-30', 'Senior Developer', 'USA', 30),
    (4334, 'Pooja', 'Rana', '2000-03-09', 'Business Analyst', 'Germany', 24),
    (4335, 'Rajesh', 'Menon', '1997-10-05', 'DevOps Engineer', 'India', 28),
    (4336, 'Sonia', 'Chopra', '1996-05-22', 'UI/UX Designer', 'India', 29),
    (4337, 'Deepak', 'Yadav', '1993-09-01', 'Tech Lead', 'USA', 32),
    (4338, 'Ritika', 'Bansal', '1994-11-15', 'Project Manager', 'UK', 31),
    (4339, 'Harsh', 'Pandey', '1998-02-18', 'Software Engineer', 'India', 27),
    (4340, 'Kavya', 'Deshmukh', '1999-08-27', 'QA Engineer', 'India', 25);

SELECT *
FROM employees;

DELETE FROM employees
WHERE empID = 5678;

SELECT empId, firstName, Designation
FROM employees;

SELECT empId, firstName, Designation
FROM employees
WHERE Age = 27;

SELECT Country, COUNT(*) AS employee_count
FROM employees
GROUP BY Country;

SELECT DISTINCT Country
FROM employees;

SELECT Country, COUNT(*) AS employee_count
FROM employees
GROUP BY Country
HAVING COUNT(*) >= 2; 

SELECT *
FROM employees
ORDER BY Age DESC    -- [DESC | ASC]

SELECT *
FROM employees
WHERE Age BETWEEN 23 and 27

SELECT *
FROM employees
where firstName LIKE "D%"

SELECT *
FROM employees
WHERE Age IN (23,27)

SELECT COUNT(DISTINCT AGE)
FROM employees

SELECT *
FROM employees
ORDER BY firstName ASC, Age DESC

SELECT *
FROM employees
ORDER BY firstName ASC, Age DESC
LIMIT 5

TRUNCATE TABLE employees; -- deletes only the table data, keeps structure as it is
DROP TABLE IF EXISTS employees;  -- deletes the whole table with its data

DROP DATABASE IF EXISTS sql_demo;