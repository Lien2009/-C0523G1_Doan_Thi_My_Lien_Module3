CREATE DATABASE quanlysinhvien;
USE quanlysinhvien;
CREATE TABLE class (
    ClassID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    `Status` BIT
);
CREATE TABLE student (
    StudentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    `Status` BIT,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES class(ClassID)
);
CREATE TABLE `subject` (
    SubID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1,
    CHECK (Credit >= 1),
    `Status` BIT DEFAULT 1
);
CREATE TABLE mark (
    MarkID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SubID INT NOT NULL,
    FOREIGN KEY (SubID) REFERENCES `subject`(SubID),
    StudentID INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES student(StudentID),
    UNIQUE (SubID , StudentID),
    Mark FLOAT DEFAULT 0 CHECK (Mark between 0 and 100 ),
    ExamTimes TINYINT DEFAULT 1
);