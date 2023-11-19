--create database ermodel;

use ermodel;


--1. Create 'COUNTRY' table
CREATE TABLE COUNTRY(
CountryId INT IDENTITY PRIMARY KEY, --auto-increment primary key
CountryName VARCHAR(30),
Continent VARCHAR(10),
Currency VARCHAR(3)
);

--2. Create 'DEPARTMENT' table
CREATE TABLE DEPARTMENT(
DepartmentId INT PRIMARY KEY,
DeptName VARCHAR(10),
CountryId INT FOREIGN KEY REFERENCES dbo.COUNTRY(CountryId),
);

--3. Create 'EMPLOYEE' table
CREATE TABLE EMPLOYEE(
EmpID INT PRIMARY KEY,
EmpName VARCHAR(20) NOT NULL,
DeptId INT FOREIGN KEY REFERENCES dbo.DEPARTMENT (DepartmentId) NULL
);

--4. Create 'FOLDER' table
CREATE TABLE FOLDER(
FolderId INT NOT NULL,
EmpId INT REFERENCES EMPLOYEE(EmpId),
AccessType VARCHAR(5) NULL
);



--right click on database diagram
--click on new database diagram