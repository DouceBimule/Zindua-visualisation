-- Create the database
CREATE DATABASE Job;

-- Use the database
USE Job;

-- Create the table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    department VARCHAR(100),
    hire_date DATE
);

-- Insert 10 records into the employees table
INSERT INTO employees (name, age, salary, department, hire_date)
VALUES 
('Alice', 30, 5000.00, 'IT', '2022-01-15'),
('Bob', 40, 6000.00, 'HR', '2019-05-20'),
('Charlie', 25, 7000.00, 'Finance', '2020-03-11'),
('Diana', 35, 6500.00, 'IT', '2018-07-30'),
('Eve', 28, 8000.00, 'Marketing', '2021-11-22'),
('Frank', 32, 5500.00, 'IT', '2020-01-01'),
('Grace', 45, 9000.00, 'Finance', '2016-02-14'),
('Hank', 29, 7200.00, 'HR', '2021-06-10'),
('Ivy', 50, 10000.00, 'Finance', '2015-04-18'),
('Jake', 27, 4000.00, 'Marketing', '2023-02-25');
SELECT name, age, salary 
FROM employees;

SELECT name, salary 
FROM employees 
WHERE department = 'IT';

SELECT name, salary 
FROM employees 
WHERE department = 'HR';

SELECT name, salary 
FROM employees 
WHERE department = 'Finance';
 
SELECT name, age, salary 
FROM employees 
ORDER BY salary;

SELECT name, salary 
FROM employees 
ORDER BY salary DESC 
LIMIT 3;

SELECT name, salary, department 
FROM employees 
WHERE department = 'HR' OR salary > 7000; 

SELECT name, salary, department 
FROM employees 
WHERE department = 'IT' OR salary > 7000;

SELECT name, hire_date 
FROM employees 
ORDER BY age ASC 
LIMIT 2;

SELECT DISTINCT department 
FROM employees 
ORDER BY department;

 





