create schema inventory;
create table inventory.employees (
    EmployeeID INT primary key,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);
insert into inventory.employees (EmployeeID, FirstName, LastName, Gender, Department, HireDate, Salary) VALUES
(1, 'John', 'Doe', 'Male', 'IT', '2018-05-01', 60000.00),
(2, 'Jane', 'Smith', 'Female', 'HR', '2019-06-15', 50000.00),
(3, 'Michael', 'Johnson', 'Male', 'Finance', '2017-03-10', 75000.00),
(4, 'Emily', 'Davis', 'Female', 'IT', '2020-11-20', 70000.00),
(5, 'Sarah', 'Brown', 'Female', 'Marketing', '2016-07-30', 45000.00),
(6, 'David', 'Wilson', 'Male', 'Sales', '2019-01-05', 55000.00),
(7, 'Chris', 'Taylor', 'Male', 'IT', '2022-02-25', 65000.00);

--1
select * from inventory.employees;
--2
select FirstName from inventory.employees;
--3
select DISTINCT Department from inventory.employees;
--4
select count(*)  as totalEmployes from inventory.employees;
--5
select sum(Salary) as totalSalary from inventory.employees;
--6
select avg(Salary) as averageSalary 
from inventory.employees;
--7
select max(Salary) as highestSalary 
from inventory.employees;
--8
select min(Salary) as lowestSalary 
from inventory.employees;
--9
select count(*) as maleEmployees 
from inventory.employees 
where Gender = 'Male';
--10
select count(*) as femaleEmployees
from inventory.employees
where Gender = 'Female';
--11
select count(*) as hiredIn2020 
from inventory.employees 
where date_part('year', HireDate) = 2020;
--12
select avg(Salary) as averageSalaryIT
from inventory.employees
where Department = 'IT';
--13
select Department, count(*) as NumEmployees 
from inventory.employees
group by Department;

--14
select Department, sum(Salary) as TotalSalary 
from inventory.employees 
group by Department;

--15
select Department, max(Salary) as MaxSalary 
from inventory.employees 
group by Department;
--16
select Department, min(Salary) as minsalary
from inventory.employees 
group by Department;



--17
select Gender, count(*) as  NumerEmployees 
from inventory.employees 
group by Gender;

--18
select Gender, AVG(Salary) as  AverageSalary 
from inventory.employees 
group by Gender;

--19
select * 
from inventory.employees 
group by Salary desc 
limit 5;
--20
select COUNT(DISTINCT FirstName) as  UniqueFirstNames 
from inventory.employees;




--22
select * 
from  inventory.employees 
order by HireDate 
limit 10

--23
select employee.* 
from inventory.employees employee
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID 
where sale.SaleID is null;

--24
select employee.EmployeeID, employee.FirstName, employee.LastName, COUNT(sale.SaleID) as  totalSales 
from inventory.employees employee 
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID 
group by employee.EmployeeID, employee.FirstName, employee.LastName;


--25


select employee.EmployeeID, employee.FirstName, employee.LastName, sum(sale.Total) as totalSales
from inventory.employees employee
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID
group by employee.EmployeeID, employee.FirstName, employee.LastName
order by totalSales desc
limit 1;



--26
select employee.Department, avg(sale.Quantity) as averageQuantity
from inventory.employees employee
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID
group by  employee.Department;


--27
select employee.EmployeeID, employee.FirstName, employee.LastName, sum(sale.Total) as totalSalesOf2021
from inventory.employees employee
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID
where extract(year from sale.SaleDate) = 2021
group by employee.EmployeeID, employee.FirstName, employee.LastName;


--28
select employee.EmployeeID, employee.FirstName, employee.LastName, sum(sale.Quantity) as totalQuantity
from  inventory.employees employee
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID
group by employee.EmployeeID, employee.FirstName, employee.LastName
order by TotalQuantity desc
limit 3;

--29
select employee.Department, sum(sale.Quantity) as totalQuantity
from inventory.employees employee
left join inventory.sales sale on employee.EmployeeID = sale.EmployeeID
group by employee.Department;

create table inventory.products (
    ProductID INT primary key,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

insert into inventory.products (ProductID, ProductName, Category, Price, Stock) values
(1, 'Laptop', 'Electronics', 1200.00, 30),
(2, 'Desk', 'Furniture', 300.00, 50),
(3, 'Chair', 'Furniture', 150.00, 200),
(4, 'Smartphone', 'Electronics', 800.00,75),
(5, 'Monitor', 'Electronics', 250.00, 40),
(6, 'Bookshelf', 'Furniture', 100.00, 60),
(7, 'Printer', 'Electronics', 200.00, 25);


select * from inventory.products;

--30
select product.Category, sum(sale.Total) as totalRevenue
from inventory.products product
left join inventory.sales sale on product.ProductID = sale.ProductID
group by product.Category;


create table inventory.sales (
    SaleID INT primary key,
    ProductID INT,
    EmployeeID INT,
    SaleDate DATE,
    Quantity INT,
    Total DECIMAL(10, 2),
    foreign key (ProductID) references inventory.products(ProductID),
    foreign key (EmployeeID) references inventory.employees(EmployeeID)
);

insert into inventory.sales (SaleID, ProductID, EmployeeID, SaleDate, Quantity, Total) values
(1, 1, 1, '2021-01-15', 2, 2400.00),
(2, 2, 2, '2021-03-22', 1, 300.00),
(3, 3, 3, '2021-05-10', 4, 600.00),
(4, 4, 4, '2021-07-18', 3, 2400.00),
(5, 5, 5, '2021-09-25', 2, 500.00),
(6, 6, 6, '2021-11-30', 1, 100.00),
(7, 7, 1, '2022-02-15', 1, 200.00),
(8, 1, 2, '2022-04-10', 1, 1200.00),
(9, 2, 3, '2022-06-20', 2, 600.00),
(10, 3, 4, '2022-08-05', 3, 450.00),
(11, 4, 5, '2022-10-11', 1, 800.00),
(12, 5, 6, '2022-12-29', 4, 1000.00);

select * from inventory.sales;

--21
select employee.*, sale.SaleID, sale.ProductID, sale.SaleDate, sale.Quantity, sale.Total 
from  inventory.employees employee 
left join  inventory.sales sale on employee.EmployeeID = sale.EmployeeID;



