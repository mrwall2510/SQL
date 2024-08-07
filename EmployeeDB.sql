-- Tạo DATABASE
CREATE DATABASE EmployeeDB

USE EmployeeDB

-- Tạo Bảng
CREATE TABLE Department (
    DepartId INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL)

CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartId INT,
    Salary MONEY CHECK (Salary > 0),
    FOREIGN KEY (DepartId) REFERENCES Department(DepartId))

-- Chèn thông tin
INSERT INTO Department (DepartId, DepartName, Description) VALUES (1, 'Tuyển dụng', 'Bộ phận Nhân sự')
INSERT INTO Department (DepartId, DepartName, Description) VALUES (2, 'IT', 'Bộ phận Công Nghệ Thông Tin')
INSERT INTO Department (DepartId, DepartName, Description) VALUES (3, 'Kế toán', 'Bộ phận tài chính')


INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartId, Salary) VALUES ('123450', 'Nguyễn', 'Lan', '2003-01-01', 1, 'Hà Nội', 1, 2000)
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartId, Salary) VALUES ('123451', 'Mạnh', 'Tường', '2003-01-02', 0, 'Hà Nội', 2, 3000)
INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartId, Salary) VALUES ('123452', 'Hoàng', 'Sơn', '2003-01-03', 1, 'Hà Nội', 3, 2500)

-- Cập nhật
UPDATE Employee SET Salary = Salary * 1.10

-- Thêm ràng buộc
ALTER TABLE Employee ADD CONSTRAINT chk_salary_positive CHECK (Salary > 0)

--Truy vấn
SELECT * FROM Department
SELECT * FROM Employee