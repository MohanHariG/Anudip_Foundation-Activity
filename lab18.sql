CREATE DATABASE lab18;
use lab18;

-- task1 Insert Data in employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(100)
);

INSERT INTO Employee (emp_id, first_name, last_name, age, email) VALUES
(1, 'mohan', 'kumar', 29, 'kumar@example.com'),
(2, 'mohan', 'raj', 35, 'raj@example.com'),
(3, 'mohan', 'hari', 40, 'mohan@example.com'),
(4, 'kumar', 'raja', 27, 'raja@example.com'),
(5, 'ram', 'kumar', 22, 'ram@example.com');

 -- Task 2: Retrieve First and Last Names
SELECT first_name, last_name FROM Employee;

-- Task 3: Employees Older Than 30
SELECT first_name, last_name, age
FROM Employee
WHERE age > 30;

-- task4:Update Age (Add 1 Year for Age > 25)
UPDATE Employee
SET age = age + 1
WHERE emp_id >= 1 AND age > 25;


/* Task 5:Hospital Patient Emergency Contacts Database
You are given the following unnormalized table:

PatientID PatientName	Age	Gender	Disease	     DoctorName	    ContactName	   Relationship	Phone	Email
101	Alice Smith	29	F	Diabetes	Dr. Brown	John Smith	Husband	111111	john@example.com
101	Alice Smith	29	F	Diabetes	Dr. Brown	Sarah White	Sister	222222	sarah@example.com
102	Mark Davis	40	M	Hypertension	Dr. Green	Lisa Davis	Wife	333333	lisa@example.com
*/

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Disease VARCHAR(100),
    DoctorName VARCHAR(100)
);

CREATE TABLE EmergencyContact (
    ContactID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    ContactName VARCHAR(100),
    Relationship VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100)
);


CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Disease VARCHAR(100),
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO Doctor (DoctorID, DoctorName) VALUES
(1, 'Dr. Brown'),
(2, 'Dr. Green');

INSERT INTO Patient (PatientID, PatientName, Age, Gender, Disease, DoctorID) VALUES
(101, 'Alice Smith', 29, 'F', 'Diabetes', 1),
(102, 'Mark Davis', 40, 'M', 'Hypertension', 2);

INSERT INTO EmergencyContact (PatientID, ContactName, Relationship, Phone, Email) VALUES
(101, 'John Smith', 'Husband', '111111', 'john@example.com'),
(101, 'Sarah White', 'Sister', '222222', 'sarah@example.com'),
(102, 'Lisa Davis', 'Wife', '333333', 'lisa@example.com');

SELECT 
    p.PatientID,
    p.PatientName,
    d.DoctorName,
    ec.ContactName,
    ec.Relationship,
    ec.Phone,
    ec.Email
FROM Patient p
JOIN Doctor d ON p.DoctorID = d.DoctorID
JOIN EmergencyContact ec ON p.PatientID = ec.PatientID;