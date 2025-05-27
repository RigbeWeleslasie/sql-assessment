create schema inventory;
CREATE TABLE inventory.employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);
drop table inventory.employees;


INSERT INTO inventory.employees (EmployeeID, FirstName, LastName, Gender, Department, HireDate, Salary) VALUES
(1, 'John', 'Doe', 'Male', 'IT', '2018-05-01', 60000.00),
(2, 'Jane', 'Smith', 'Female', 'HR', '2019-06-15', 50000.00),
(3, 'Michael', 'Johnson', 'Male', 'Finance', '2017-03-10', 75000.00),
(4, 'Emily', 'Davis', 'Female', 'IT', '2020-11-20', 70000.00),
(5, 'Sarah', 'Brown', 'Female', 'Marketing', '2016-07-30', 45000.00),
(6, 'David', 'Wilson', 'Male', 'Sales', '2019-01-05', 55000.00),
(7, 'Chris', 'Taylor', 'Male', 'IT', '2022-02-25', 65000.00);


SELECT * FROM inventory.employees;

SELECT FirstName FROM inventory.employees;

SELECT DISTINCT Department from inventory.employees;

SELECT COUNT(*) AS totalEmployes FROM inventory.employees;

SELECT SUM(Salary) AS totalSalary from inventory.employees;

SELECT AVG(Salary) AS AverageSalary FROM inventory.employees;

SELECT MAX(Salary) AS HighestSalary FROM inventory.employees;

SELECT MIN(Salary) AS LowestSalary FROM inventory.employees;

SELECT COUNT(*) AS MaleEmployees 
FROM inventory.employees 
WHERE Gender = 'Male';

SELECT COUNT(*) AS FemaleEmployees
FROM inventory.employees
WHERE Gender = 'Female';

SELECT COUNT(*) AS HiredIn2020 
FROM inventory.employees 
WHERE DATE_PART('year', HireDate) = 2020;

SELECT AVG(Salary) AS AvgSalaryIT 
FROM inventory.employees
WHERE Department = 'IT';

SELECT Department, COUNT(*) AS NumEmployees 
FROM inventory.employees
GROUP BY Department;


CREATE TABLE inventory.products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

INSERT INTO inventory.products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 30),
(2, 'Desk', 'Furniture', 300.00, 50),
(3, 'Chair', 'Furniture', 150.00, 200),
(4, 'Smartphone', 'Electronics', 800.00, 75),
(5, 'Monitor', 'Electronics', 250.00, 40),
(6, 'Bookshelf', 'Furniture', 100.00, 60),
(7, 'Printer', 'Electronics', 200.00, 25);


SELECT * FROM inventory.products;



