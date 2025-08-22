CREATE DATABASE StudentManagementSystem;
USE StudentManagementSystem;

create table Student1 (StudentID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),DateOfBirth DATE,Gender ENUM('Male', 'Female', 'Other'),Email VARCHAR(100),Phone VARCHAR(15));

desc Student;

CREATE TABLE Course (CourseID INT PRIMARY KEY,CourseTitle VARCHAR(100),Credits INT);
CREATE TABLE Instructor (InstructorID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),Email VARCHAR(100));
CREATE TABLE Enrollment (EnrollmentID INT PRIMARY KEY,EnrollmentDate DATE,StudentID INT,CourseID INT,InstructorID INT,FOREIGN KEY (StudentID) REFERENCES Student(StudentID),FOREIGN KEY (CourseID) REFERENCES Course(CourseID),FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID));

CREATE TABLE Score (ScoreID INT AUTO_INCREMENT PRIMARY KEY,CourseID INT,StudentID INT,DateOfExam DATE,CreditObtained INT,FOREIGN KEY (CourseID) REFERENCES Course(CourseID),FOREIGN KEY (StudentID) REFERENCES Student(StudentID));
CREATE TABLE Feedback (FeedbackID INT AUTO_INCREMENT PRIMARY KEY,StudentID INT,Date DATE,InstructorName VARCHAR(100),Feedback TEXT,FOREIGN KEY (StudentID) REFERENCES Student(StudentID));
INSERT INTO Student1 (FirstName, LastName, DateOfBirth, Gender, Email, Phone) VALUES
('hari', 'mohan', '2002-05-15', 'Male', 'hari@gmail.com', '9876543210'),
('mohan', 'raj', '2001-06-20', 'Male', 'raj@gmail.com', '8765432109'),
('krishna', 'kumar', '2003-07-10', 'Male', 'krishna@gmail.com', '7654321098'),
('Priya', '', '2000-12-01', 'Female', 'priya@gmail.com', '6543210987'),
('Kavin', '', '2002-08-05', 'Male', 'kavin@gmail.com', '5432109876');

INSERT INTO Course (CourseTitle, Credits) VALUES
('Database Systems', 4),
('Java Programming', 3),
('Web Development', 3),
('Data Structures', 4),
('Python Basics', 3);

INSERT INTO Instructor (FirstName, LastName, Email) VALUES
('Rahul', 'Verma', 'rahul@anudip.org'),
('Mohan', 'Joshi', 'mohan@anudip.org'),
('Ram', 'Roy', 'ram@anudip.org'),
('Ravi', 'Rathi', 'ravi@anudip.org'),
('Gokul', 'Yadav', 'gokul@anudip.org');

INSERT INTO Enrollment (EnrollmentDate, StudentID, CourseID, InstructorID) VALUES
('2025-01-10', 1, 1, 1),
('2025-01-12', 2, 2, 2),
('2025-01-15', 3, 3, 3),
('2025-01-18', 4, 4, 4),
('2025-01-20', 5, 5, 5);

INSERT INTO Score (CourseID, StudentID, DateOfExam, CreditObtained) VALUES
(1, 1, '2025-04-01', 4),
(2, 2, '2025-04-03', 3),
(3, 3, '2025-04-05', 3),
(4, 4, '2025-04-07', 4),
(5, 5, '2025-04-09', 3);

INSERT INTO Feedback (StudentID, Date, InstructorName, Feedback) VALUES
(1, '2025-02-01', 'Rahul ', 'Very interactive.'),
(2, '2025-02-05', 'Mohan', 'Explained clearly.'),
(3, '2025-02-10', 'Ram', 'Good use of examples.'),
(4, '2025-02-15', 'Ravi', 'Excellent teaching.'),
(5, '2025-02-20', 'Gokul', 'Focused on practical knowledge.');

SELECT * FROM Student1;
SELECT * FROM Course;
SELECT * FROM Instructor;
SELECT * FROM Enrollment;
SELECT * FROM Score;
SELECT * FROM Feedback;


