CREATE TABLE Departments (
    DepartmentID INTEGER PRIMARY KEY,
    DepartmentName TEXT NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    DepartmentID INTEGER,
    HireDate TEXT,
    JobTitle TEXT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Salaries (
    SalaryID INTEGER PRIMARY KEY,
    EmployeeID INTEGER,
    BaseSalary REAL NOT NULL,
    EffectiveDate TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Payroll (
    PayrollID INTEGER PRIMARY KEY,
    EmployeeID INTEGER,
    PayDate TEXT,
    GrossPay REAL,
    Taxes REAL,
    Deductions REAL,
    NetPay REAL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    EmployeeID INTEGER,
    Username TEXT UNIQUE,
    PasswordHash TEXT,
    Role TEXT DEFAULT 'Employee',
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Attendance (
    AttendanceID INTEGER PRIMARY KEY ,
    EmployeeID INTEGER,
    Date TEXT,
    Status TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE LeaveRequests (
    RequestID INTEGER PRIMARY KEY,
    EmployeeID INTEGER,
    StartDate TEXT,
    EndDate TEXT,
    Reason TEXT,
    Status TEXT DEFAULT 'Pending',
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'Engineering');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'HR');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Sales');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (4, 'Marketing');
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, HireDate, JobTitle) VALUES (101, 'AJAY', 'KUMAR', 1, '2025-03-30', 'Administrator');
INSERT INTO Users (EmployeeID, Username, PasswordHash, Role) VALUES (101, 'user', '78a72bcb9c0f3714c0924cf037d407ec7ee513ac20c42df073db98e318d3a979', 'Admin');
INSERT INTO Salaries (SalaryID, EmployeeID, BaseSalary, EffectiveDate) VALUES (101, 101, 80000.00, '2025-03-30');
INSERT INTO Payroll (EmployeeID, PayDate, GrossPay, Taxes, Deductions, NetPay) VALUES (101, '2025-03-01', 6666.67, 1333.33, 533.33, 4800.01);
INSERT INTO Employees VALUES (102, 'JOHN', 'ADAMS', 1, '2025-04-11', 'Software Development');
INSERT INTO Salaries VALUES (102, 102, 120000.0, '2025-04-11');
INSERT INTO Users VALUES (102, 102, 'JOHN', '5a5a3c20db81eec632a8419cb4c9ab50e1eb99d0033ff7d52293e4375fb8517e', 'Employee');
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (101, '2025-04-13', 'Present');
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (101, '2025-04-14', 'Present');
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (101, '2025-04-15', 'Absent');
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (101, '2025-04-16', 'Leave');
INSERT INTO LeaveRequests (EmployeeID, StartDate, EndDate, Reason, Status) VALUES (102, '2025-04-16', '2025-04-18', 'SICK', 'Pending');
DELETE FROM Attendance WHERE AttendanceID = 1;
DELETE FROM Attendance WHERE AttendanceID = 3;
DELETE FROM Attendance WHERE AttendanceID = 2;
DELETE FROM Attendance WHERE AttendanceID = 4;
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (102, '2025-04-13', 'Present');
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (102, '2025-04-14', 'Absent');
INSERT INTO Attendance (EmployeeID, Date, Status) VALUES (102, '2025-04-15', 'Leave');
UPDATE LeaveRequests SET Status = 'Approved' WHERE RequestID = 1;
INSERT INTO LeaveRequests (EmployeeID, StartDate, EndDate, Reason, Status) VALUES (102, '2025-04-18', '2025-04-18', 'SICK', 'Pending');
