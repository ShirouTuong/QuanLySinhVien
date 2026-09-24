DROP DATABASE IF EXISTS QuanLySinhVien;

CREATE DATABASE QuanLySinhVien;

USE QuanLySinhVien;

CREATE TABLE Class (
    ClassID INT NOT NULL AUTO_INCREMENT,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT,
    PRIMARY KEY (ClassID)
);

CREATE TABLE Student (
    StudentID INT NOT NULL AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Status BIT,
    ClassID INT NOT NULL,
    PRIMARY KEY (StudentID),
    CONSTRAINT FK_Student_Class
        FOREIGN KEY (ClassID)
        REFERENCES Class(ClassID)
);

CREATE TABLE Subject (
    SubID INT NOT NULL AUTO_INCREMENT,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1,
    Status BIT DEFAULT 1,
    PRIMARY KEY (SubID),
    CONSTRAINT CK_Subject_Credit
        CHECK (Credit >= 1)
);

CREATE TABLE Mark (
    MarkID INT NOT NULL AUTO_INCREMENT,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0,
    ExamTimes TINYINT DEFAULT 1,
    PRIMARY KEY (MarkID),
    CONSTRAINT FK_Mark_Subject
        FOREIGN KEY (SubID)
        REFERENCES Subject(SubID),
    CONSTRAINT FK_Mark_Student
        FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    CONSTRAINT CK_Mark
        CHECK (Mark BETWEEN 0 AND 100)
);

INSERT INTO Class (ClassID, ClassName, StartDate, Status)
VALUES
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', CURRENT_DATE(), 0);

INSERT INTO Student (StudentID, StudentName, Address, Phone, Status, ClassID)
VALUES
(1, 'Hung', 'Ha noi', '0912113113', 1, 1),
(2, 'Hoa', 'Hai phong', NULL, 1, 1),
(3, 'Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject (SubID, SubName, Credit, Status)
VALUES
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

INSERT INTO Mark (MarkID, SubID, StudentID, Mark, ExamTimes)
VALUES
(1, 1, 1, 8, 1),
(2, 1, 2, 10, 2),
(3, 2, 1, 12, 1);
