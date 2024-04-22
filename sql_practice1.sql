CREATE DATABASE mydatabase;

SHOW DATABASES;

USE mydatabase;

-- DROP TABLE Employees, Departments;

-- Create Table
CREATE TABLE Employees (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    department TEXT
);

CREATE TABLE Departments (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    department_name TEXT NOT NULL
);

-- Insert Data to the table employee
INSERT INTO Employees (name, age, department) VALUES
('Ram Thapa', 30, 'HR'),
('Hari Kafle', 25, 'IT'),
('Alisha Sharma', 35, 'Finance'),
('Ravi Kumar', 28, 'HR'),
('Sunita Patel', 32, 'IT'),
('Vikas Gupta', 40, 'Finance'),
('Pooja Sharma', 26, 'Marketing'),
('Rahul Singh', 29, 'DevOps'),
('Anita Verma', 38, 'AI'),
('Amit Mehta', 35, 'HR'),
('Divya Rajan', 27, 'IT'),
('Sanjay Kapoor', 42, 'Finance'),
('Neha Singh', 31, 'Marketing');

INSERT INTO Departments (department_name)
VALUES ('HR'), ('IT'), ('Finance'), ('DevOps'), ('AI');

-- Read Data
SELECT * FROM Employees;

-- Updating Data
-- HR changed to Marketing 
UPDATE Employees SET department = 'Marketing' WHERE id = 1;

-- Delete Data
DELETE FROM Employees WHERE id = 3;

-- Comparison Operators
SELECT * FROM Employees WHERE age > 32;

-- Logical Operators
SELECT * FROM Employees 
WHERE age > 25 
AND department = 'IT';

-- LIKE, IN, BETWEEN
SELECT * FROM Employees 
WHERE name LIKE 'N%';

SELECT * FROM Employees 
WHERE age IN (25, 35);

SELECT * FROM Employees 
WHERE age BETWEEN 25 AND 35;


-- IS NULL
SELECT * FROM Employees 
WHERE department IS NULL;

-- AND, OR, NOT
SELECT * FROM Employees 
WHERE age > 35 
OR department = 'HR';

SELECT * FROM Employees 
WHERE NOT department = 'IT';

-- ORDER BY
SELECT * FROM Employees 
ORDER BY age DESC;

-- COUNT
SELECT COUNT(*) FROM Employees;

-- SUM
SELECT SUM(age) FROM Employees;

-- MIN/MAX
SELECT MIN(age) AS min_age,
MAX(age) AS max_age 
FROM Employees;

-- AVG
SELECT AVG(age) FROM Employees;

-- GROUP BY, HAVING
SELECT department, COUNT(*) FROM Employees 
GROUP BY department 
HAVING COUNT(*) > 1;

-- CASE
SELECT name, 
       CASE 
           WHEN age < 40 THEN 'Young'
           ELSE 'Old'
       END AS age_group
FROM Employees;

-- DISTINCT
SELECT DISTINCT department FROM Employees;

-- SQL Joins (INNER, OUTER, LEFT, RIGHT)
SELECT Employees.name, Departments.department_name
FROM Employees
INNER JOIN Departments ON Employees.department = Departments.department_name;


-- left
-- Returns all records from the left table, and the matched records from the right table 
SELECT Employees.name, Departments.department_name
FROM Employees
LEFT JOIN Departments ON Employees.department = Departments.department_name;

-- right
-- Returns all records from the right table, and the matched records from the left 
SELECT Employees.name, Departments.department_name
FROM Employees
RIGHT JOIN Departments ON Employees.department = Departments.department_name;

-- UNION
-- Combines the result sets of two or more SELECT statements into a single result set
-- removing duplicates.
SELECT name, age FROM Employees
UNION
SELECT department_name, NULL FROM Departments;
