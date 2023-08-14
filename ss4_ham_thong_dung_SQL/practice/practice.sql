USE quan_ly_sinh_vien;
SELECT address, COUNT(student_id) AS so_luong
FROM students
GROUP BY address;
SELECT students.student_id, AVG(marks.mark) AS avg_mark
FROM students
JOIN marks ON students.student_id = marks.student_id
GROUP BY students.student_id;