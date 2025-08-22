CREATE DATABASE lab19;
use lab19;

-- Q1--
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO department (department_id, name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

INSERT INTO employee (emp_id, first_name, last_name, department_id, salary) VALUES
(1, 'mohan', 'hari', 1, 50000),
(2, 'ravi', 'kumar', 1, 55000),
(3, 'mohan', 'raj', 2, 60000),
(4, 'raj', 'kumar', 2, 62000),
(5, 'ram', 'kumar', 3, 70000),
(6, 'mani', 'raja', 3, 75000);

SELECT 
    department_id, 
    AVG(salary) AS average_salary
FROM 
    employee
GROUP BY 
    department_id;
    
-- Q2--

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL
);

INSERT INTO student (student_id, first_name, last_name, date_of_birth) VALUES
(1, 'Aarav', 'Sharma', '2008-05-10'),
(2, 'Isha', 'Patel', '2010-07-20'),
(3, 'Rohan', 'Verma', '2009-06-17'),
(4, 'Neha', 'Singh', '2012-03-15'),
(5, 'Karan', 'Kapoor', '2007-11-25');

SELECT *
FROM student
WHERE date_of_birth > '2009-06-16';


-- Q3--
SELECT *
FROM student
WHERE first_name LIKE 'A%' OR first_name LIKE 'J%';

-- Q4--
CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Age INT
);

INSERT INTO Person (PersonID, FirstName, LastName, Age) VALUES
(1, 'Mohan', 'Hari', 25),
(2, 'Ravi', 'Kumar', 30),
(3, 'Raj', 'Verma', 28);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    Age INT
);


INSERT INTO Employee (emp_id, first_name, last_name, Age) VALUES
(101, 'Suresh', 'Patel', 35),
(102, 'Anil', 'Shah', 29),
(103, 'Kiran', 'Das', 33);

ALTER TABLE employee
ADD COLUMN age INT;

UPDATE employee
SET age = 25 WHERE emp_id = 1;
UPDATE employee
SET age = 30 WHERE emp_id = 2;
UPDATE employee
SET age = 32 WHERE emp_id = 3;
UPDATE employee
SET age = 35 WHERE emp_id = 4;
UPDATE employee
SET age = 28 WHERE emp_id = 5;
UPDATE employee
SET age = 31 WHERE emp_id = 6;


SELECT PersonID AS ID, FirstName AS First_Name, LastName AS Last_Name, Age
FROM Person
UNION
SELECT emp_id AS ID, first_name AS First_Name, last_name AS Last_Name, Age
FROM Employee;

-- Q5--

USE StudentManagementSystem;

SELECT Student1.StudentID, Student1.FirstName, Student1.LastName, Enrollment.EnrollmentID, Enrollment.CourseID
FROM Student1
RIGHT JOIN Enrollment
ON Student1.StudentID = Enrollment.StudentID;

-- Reset tables 
TRUNCATE TABLE Student1;
TRUNCATE TABLE Enrollment;

INSERT INTO Student (StudentID, FirstName, LastName, Email) VALUES
(1, 'John', '', 'john@email.com'),
(2, 'Jane', '', 'jane@email.com'),
(3, 'Bob', '', 'bob@email.com');

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID) VALUES
(101, 1, 'MATH101'),
(102, 1, 'HIST201'),
(103, 2, 'PHYS301'),
(104, 3, 'CHEM401'),
(105, 4, 'ENG501');

SELECT Student1.StudentID, Student1.FirstName, Student1.Email, Enrollment.EnrollmentID, Enrollment.CourseID
FROM Student1
LEFT JOIN Enrollment
ON Student1.StudentID = Enrollment.StudentID;

-- Q6--
SELECT Student1.StudentID, Student1.FirstName, Student1.Email,
       Enrollment.EnrollmentID, Enrollment.CourseID
FROM Student1
LEFT JOIN Enrollment
ON Student1.StudentID = Enrollment.StudentID
UNION
SELECT Student1.StudentID, Student1.FirstName, Student1.Email,
       Enrollment.EnrollmentID, Enrollment.CourseID
FROM Student1
RIGHT JOIN Enrollment
ON Student1.StudentID = Enrollment.StudentID;