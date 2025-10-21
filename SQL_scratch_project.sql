-------------SQL PROJECT------------------

--Create a new database
Create Database Practice;

--Login to the database
use Practice

--Create an employee data table with the following column: (Employee_ID, Employee_Name, Department, Gender and Age of employees) repectively.

Create Table EmployeeData (
Emp_ID int,
Emp_Name varchar (50),
Emp_Dept varchar (50),
Emp_Gender varchar (20),
Emp_Age int
)
--Populate the Employee data table with relevant attributes

Insert Into EmployeeData VALUES(
001, 'James Franca', 'Operations', 'Female', 32),
(002, 'Adelaja Kelvin', 'Security', 'Male', 40),
(003, 'David Ben', 'Operations', 'Male', 32),
(004, 'Friday Joseph', 'HR', 'Male', 28),
(005, 'Brender Mary', 'HR', 'Female', 22),
(006, 'Mercy Jacob', 'HR', 'Female', 25),
(007, 'Felix Chika', 'Statistics', 'Male', 29),
(008, 'Lopez Franklin', 'Accounting', 'Male', 35)

--TASK: Who is the oldest employee in terms of "Age"?
SELECT *
FROM EmployeeData
ORDER BY Emp_Age DESC

--Using the AND Operator
--TASK: Show the record of all the female HR employees on the EmployeeData table 
select * 
from EmployeeData
where Emp_Dept = 'HR' AND Emp_Gender = 'Female'


--Using the NOT Operator
--TASK: Show the record of all employees on the EmployeeData table except for the employees in the HR department.
select * 
from EmployeeData
where  NOT Emp_Dept = 'HR'

--Using the IN Operator
--TASK: Show the record of all employees in Statistics, Security and Operations Department on the EmployeeData table.

select *
from EmployeeData
where Emp_Dept IN ('Statistics', 'Security', 'Operations')

--Using the BETWEEN Operator (To select values in a range i.e BETWEEN)
--TASK: Check for employees within the age range of 30 - 40 years

select *
from EmployeeData
where Emp_Age BETWEEN 30 AND 40

--Using the LIKE Operator (when dealing with specified patterns e.g names starting with letter "J")
--TASK: Check for "Employee Name" starting with letter "A"

select *
from EmployeeData
where Emp_Name LIKE 'A%'

--TASK: Check for where the second letter of the "Employee Name" is "A"

select *
from EmployeeData
where Emp_Name LIKE '_a%'

--Using the MIN, MAX, and AVG function to find the Minimum, Maximum and Average of numerical values
--TASK: What is Minimum, Maximum and Average Age of Employees

select MIN(Emp_Age) AS MinAge, MAX(Emp_Age) AS MaxAge, AVG(Emp_Age) AS AvrAge
from EmployeeData

--Using the COUNT function to count the number of occurrence 
--TASK: How many employee are in the HR department?

select COUNT(Emp_Dept) AS HR_Dept
from EmployeeData
where Emp_Dept = 'HR'

--TASK: What is the total number of employees?
select COUNT(*) AS Total_No_of_Emp
from EmployeeData


--Using the NOT NULL function (Which constrain a column from the receipt of null values)
--Using the UNIQUE key function (To ensure that the the column does not accept the same data or value; Every value should be unique!)

--Create a new table (EmployeeTable)

Create Table EmployeeTable (
Emp_ID int NOT NULL UNIQUE,
Emp_Name varchar(255),
Emp_Dept varchar(255),
Emp_Gender varchar(25),
Emp_Salary int NOT NULL
)
--Insert data into the EmployeeTable

INSERT INTO EmployeeTable VALUES
(1001, 'Mariam Kelvin', 'Operations', 'Female', 50000),
(1002, 'Joy Robert', 'HR', 'Female', 70000),
(1003, 'Kelvin Martins', 'Statistics', 'Male', 55000),
(1004, 'Gray Luke', 'Operations', 'Male', 80000),
(1005, 'Vivian Mary', 'HR', 'Female', 75000),
(1006, 'Felix Jack', 'Security', 'Male', 60000),
(1007, 'Tele Mark', 'Security', 'Male', 50000)

--Confirm entered data

Select * 
from EmployeeTable

--Check for the UNIQUE key operations by trying to insert another data with existing Employee Data

INSERT INTO EmployeeTable VALUES
(1001, 'Royce Mike', 'Operations', 'Female', 50000)

--PRIMARY KEY: Uniquely identify each record in a table; A table can only have one primary key.

--FOREIGN KEY: This is a key in one table referencing the primary key of another table.
--The FOREIGN KEY is used to prevent entering invalid details from the parents table (containing primary key) into the foreign table.

--Using the CHECK constraint (used to allow only a defined parameters in a column e.g characters < 10)
--TASK: Create an Employee Salary column that only allow Employee salary > 50000

Create Table Emp_Salary (
Emp_ID int FOREIGN KEY REFERENCES EmployeeTable(Emp_ID),
Emp_Name varchar(255),
Emp_Salary int CHECK (Emp_Salary > 50000)
)

INSERT INTO Emp_Salary VALUES
(1001, 'Mariam Kelvin', 60000)

select *
from Emp_Salary

--Using the "ALTER TABLE" command
--TASK: Add a salary column to the EmployeeData table to capture the salary of each employee

ALTER TABLE EmployeeData
ADD 
Age int

--Oops! Age column was mistakenly added instead of salary column!
--TASK: Remove the Age column and replace with salary column

--(Remove)
ALTER TABLE EmployeeData
DROP COLUMN
Age

--(Replace)
ALTER TABLE EmployeeData
ADD 
Salary int

--Check
select * 
from EmployeeData

--Using the UPDATE function
--TASK: Update the EmployeeData table by populating the salary column with all the employee salaries respectively.

UPDATE EmployeeData
SET Salary = 40000
WHERE Emp_ID = 1

UPDATE EmployeeData
SET Salary = 50000 
WHERE Emp_ID = 2

UPDATE EmployeeData
SET Salary = 65000
WHERE Emp_ID = 3

UPDATE EmployeeData
SET Salary = 90000
WHERE Emp_ID = 4

UPDATE EmployeeData
SET Salary = 85000
WHERE Emp_ID = 5

UPDATE EmployeeData
SET Salary = 55000
WHERE Emp_ID = 6

UPDATE EmployeeData
SET Salary = 45000
WHERE Emp_ID = 7

UPDATE EmployeeData
SET Salary = 55000
WHERE Emp_ID = 8

--Check Update
SELECT *
FROM EmployeeData

--SQL ALIASES; for giving temporary name to a table or column
--TASK: Write an SQL query to populate only the employee names from the Emp_Salary table and replace the column name with "My_REsult".

SELECT Emp_Name AS My_Result
FROM EmployeeData

--Store Procedures; used in creating loop functions in SQL. It's also useful when trying to reuse a particular table for a defined purpose.
--TASK: Create a Stored Procedure to reuse the EmployeeData table.

CREATE PROCEDURE EmpData_Clone
AS 
SELECT *
FROM EmployeeData

--Confirm the created stored procedure
Exec EmpData_Clone

--TASK: Using Store Procedure, populate the record of an employee with the name "Adelaja Kelvin" whose age is "40"

--(Create Procedure)
CREATE PROCEDURE EmpData_Clone3 @Emp_Name varchar(255), @Emp_Age int
AS
SELECT * 
FROM EmployeeData
Where Emp_Name = @Emp_Name AND Emp_Age = @Emp_Age

--(Verify or Execute Procedure)
Exec EmpData_Clone3 @Emp_Name = 'Adelaja Kelvin', @Emp_Age = 40

--Using the SELECT INTO function which is used to copy data or record from one table to another
--This can be very useful in creating backups

--TASK: Create a backup for the EmplooyeeData table

SELECT * INTO EmpData_Backup
FROM EmployeeData

--Confirm the backup
SELECT * FROM EmpData_Backup

--Using the "SELECT TOP" Clause (to return specific numbers of record)
--TASK: Populate the record of the top 3 employees with the highest salary from the EmployeeData table

SELECT TOP 3 *
FROM EmployeeData
ORDER BY Salary DESC

--Backing Up a Database on SQL Server
--TASK: Backup the "Practice" database

backup database Practice
to disk = 'C:\SQL Project\SQL_Project.bak'
