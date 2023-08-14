CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE classrooms (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    `status` BIT
);
CREATE TABLE students (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES classrooms (class_id)
);
CREATE TABLE subjects (
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    `status` BIT DEFAULT 1
);

CREATE TABLE marks (
    mark_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id INT NOT NULL,
    student_id INT NOT NULL,
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)
        REFERENCES subjects (sub_id),
    FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);
INSERT INTO classrooms
VALUES (1, 'A1', '2008-12-20', 1),(2, 'A2', '2008-12-22', 1);
INSERT INTO classrooms
VALUES (3, 'B3', current_date, 0);

INSERT INTO students (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO students (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, address, phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO marks (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM students 
WHERE substring_index(student_name,' ',-1) LIKE 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT * FROM classrooms WHERE MONTH(start_date) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * FROM subjects WHERE credit IN(3,5);
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET sql_safe_updates = 0;
UPDATE students
SET class_id = 2
WHERE student_name = "Hung";
SET sql_safe_updates = 1;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT students.student_name, subjects.sub_name, marks.mark
FROM students
JOIN marks ON students.student_id = marks.student_id
JOIN subjects ON marks.sub_id = subjects.sub_id
ORDER BY marks.mark DESC, students.student_name;
