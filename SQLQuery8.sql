--CREATE DATABASE tasks;
--USE task
CREATE SCHEMA sctask
CREATE TABLE sctask.actor(
   act_id int PRIMARY KEY,
   act_fname char(20) NOT NULL,
   act_lname char(20) NOT NULL,
   act_gender char(1),
)
CREATE TABLE sctask.director(
   dir_id int PRIMARY KEY ,
   dir_fname VARCHAR(20) NOT NULL,
   dir_lname VARCHAR(20) NOT NULL,
)
CREATE TABLE sctask.movie_direction(
   dir_id int,
   mov_id int,

)
CREATE TABLE sctask.movie_cast(
   act_id int,
   move_id int,
   role VARCHAR(30),

)
CREATE TABLE sctask.movie(
  mov_id int PRIMARY KEY,
  move_title VARCHAR(50) UNIQUE,
  move_year int NOT NULL,
  move_time int ,
  move_lang VARCHAR(50),
  move_dt_rel DATE,
  move_rel_country VARCHAR(5) NOT NULL

)
CREATE TABLE sctask.reviewer(
   rev_id int PRIMARY KEY,
   rev_name VARCHAR(30),
)
CREATE TABLE sctask.genres(
  gen_id int PRIMARY KEY,
  gen_title char(20) NOT NULL
)
CREATE TABLE sctask.movie_genres(
  mov_id int,
  gen_id int
)
CREATE TABLE sctask.rating(
  mov_id int,
  rev_id int,
  rev_stars int,
  num_o_ratings int
)
--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
CREATE TABLE sctask.Employeess(
  id int NOT NULL ,
  namee varchar ,
  salary decimal
)
--Add a new column named "Department" to the "Employees" table with data type varchar(50).
ALTER TABLE sctask.Employeess
ADD Departments varchar(50)
--•	Remove the "Salary" column from the "Employees" table.
ALTER TABLE sctask.Employeess
DROP COLUMN salary
--•	Rename the "Department" column in the "Employees" table to "DeptName".


EXEC sp_rename 'sctask.Employeess.Departments', 'DeptName', 'COLUMN';
--•	Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).

CREATE TABLE sctask.Projects(
  ProjectID int ,
  ProjectName varchar(50)

)

--•	Add a primary key constraint to the "Employees" table for the "ID" column.
ALTER TABLE sctask.Employeess
ADD CONSTRAINT P PRIMARY KEY (id);
--•	Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
ALTER TABLE Projects
ADD EmployeeID INT;

ALTER TABLE sctask.Projects
ADD CONSTRAINT EmployeeID
FOREIGN KEY (id)
REFERENCES Employees(id);
--•	Remove the foreign key relationship between "Employees" and "Projects."
ALTER TABLE Projects
DROP CONSTRAINT EmployeeID
--•	Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE sctask.Employeess
ADD CONSTRAINT i unique (namee);
--•	Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE sctask.Customers(
 CustomerID int,
 FirstName varchar,
 LastName varchar,
 Email varchar,
 Statuss varchar

)
--•	Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE sctask.Customers
ADD CONSTRAINT mm unique (FirstName,LastName);
--•	Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.
ALTER TABLE sctask.Customers
ADD CONSTRAINT D
DEFAULT 'Active' FOR Statuss;


--•	Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE sctask.Orders(
  OrderID int,
  CustomerID int,
  OrderDate datetime,
  TotalAmount  decimal

)
--•	Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE sctask.Orders
ADD CONSTRAINT CS CHECK (TotalAmount > 0);
--•	Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA saless
ALTER SCHEMA saless TRANSFER OBJECT::sctask.Orders
--•	Rename the "Orders" table to "SalesOrders."

EXEC sp_rename 'saless.Orders', 'saless.SalesOrders';