--TO START:
--1.	Create a new database named "CompanyDB."
CREATE DATABASE CompanyDB

--2.	Create a schema named "Sales" within the "CompanyDB" database.
USE CompanyDB
CREATE SCHEMA Sales
--3.	Create a table named "employees" with columns: employee_id (INT), first_name (VARCHAR), last_name (VARCHAR), and salary (DECIMAL) within the "Sales" schema.
CREATE TABLE Sales.employees (
    employee_id INT PRIMARY KEY ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
)
--Note: on employee_id use sequence instead of identity.
CREATE SEQUENCE Sales.employee_id_sequence 
START WITH 1 
INCREMENT BY 1 

ALTER TABLE Sales.employees 
ADD CONSTRAINT sq_employee_id 
DEFAULT NEXT VALUE FOR Sales.employee_id_sequence
FOR employee_id
--4.	Alter the "employees" table to add a new column named "hire_date" with the data type DATE.
ALTER TABLE Sales.employees 
ADD hire_date DATE
--5.	Add mock data to this table use https://www.mockaroo.com

--DATA MANIPULATION Exercises:
--1.	Select all columns from the "employees" table.
SELECT * 
FROM Sales.employees
--2.	Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT first_name, last_name 
FROM Sales.employees

--3.	Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
SELECT first_name + ' '+ last_name AS fullName 
FROM Sales.employees;

--4.	Show the average salary of all employees. (search on it)
SELECT AVG(salary) AS Average_salary 
FROM Sales.employees

--5.	Select employees whose salary is greater than 50000.
SELECT * 
FROM Sales.employees 
WHERE salary > 50000

--6.	Retrieve employees hired in the year 2020.
SELECT * 
FROM Sales.employees 
WHERE YEAR(hire_date) = 2020

--7.	List employees whose last names start with 'S.'
SELECT * 
FROM Sales.employees 
WHERE last_name LIKE 'S%'

--8.	Display the top 10 highest-paid employees.
SELECT top 10 * 
FROM Sales.employees 
ORDER BY salary DESC 

--9.	Find employees with salaries between 40000 and 60000.
SELECT * 
FROM Sales.employees 
WHERE salary BETWEEN 40000 AND 60000

--10.	Show employees with names containing the substring 'man.'
SELECT * 
FROM Sales.employees 
WHERE first_name LIKE '%man%' OR last_name LIKE '%man%';

--11.	Display employees with a NULL value in the "hire_date" column.
SELECT * 
FROM Sales.employees 
WHERE hire_date IS NULL

--12.	Select employees with a salary in the set (40000, 45000, 50000).
SELECT * 
FROM Sales.employees 
WHERE salary IN (40000, 45000, 50000)

--13.	Retrieve employees hired between '2020-01-01' and '2021-01-01.'
SELECT * 
FROM Sales.employees 
WHERE hire_date BETWEEN '2020-01-01' AND '2021-01-01'

--14.	List employees with salaries in descending order.
SELECT *
FROM Sales.employees 
ORDER BY salary DESC;

--15.	Show the first 5 employees ordered by "last_name" in ascending order.
SELECT top 5 * 
FROM Sales.employees 
ORDER BY last_name ASC

--16.	Display employees with a salary greater than 55000 and hired in 2020.
SELECT * 
FROM Sales.employees 
WHERE salary > 55000 AND YEAR(hire_date) = 2020;
--17.	Select employees whose first name is 'John' or 'Jane.'
SELECT * 
FROM Sales.employees 
WHERE first_name IN ('John', 'Jane');

--18.	List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
SELECT * 
FROM Sales.employees 
WHERE salary <= 55000 AND hire_date > '2022-01-01';

--19.	Retrieve employees with a salary greater than the average salary.
SELECT * 
FROM Sales.employees 
WHERE salary > (SELECT AVG(salary) FROM Sales.employees)

--20.	Display the 3rd to 7th highest-paid employees.
SELECT * 
FROM Sales.employees 
ORDER BY salary DESC
OFFSET 2 ROWS
FETCH NEXT 5 ROWS ONLY;

--21.	List employees hired after '2021-01-01' in alphabetical order.
SELECT * 
FROM Sales.employees 
WHERE hire_date > '2021-01-01' ORDER BY first_name

--22.	Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
SELECT * 
FROM Sales.employees 
WHERE salary > 50000 AND last_name NOT LIKE 'A%'
--23.	Display employees with a salary that is not NULL.
SELECT * 
FROM Sales.employees 
WHERE salary IS NOT NULL

--24.	Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT * 
FROM Sales.employees 
WHERE (first_name LIKE '%e%' OR first_name LIKE '%i%' OR last_name LIKE '%e%' OR last_name LIKE '%i%') 
AND salary > 45000