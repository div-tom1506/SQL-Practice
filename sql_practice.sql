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

-> Aggregate Functions: 

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
ADD Designation VARCHAR(25) NOT NULL;

TRUNCATE TABLE employees; -- deletes only the table data, keeps structure as it is
DROP TABLE IF EXISTS employees;  -- deletes the whole table with its data

DROP DATABASE IF EXISTS sql_demo;