USE quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT sub_id,sub_name,credit,`status`
FROM subjects
WHERE credit IN (SELECT MAX(credit) FROM subjects);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.sub_id,s.sub_name,s.credit,s.`status`, m.mark
FROM subjects s
JOIN marks m ON s.sub_id = m.sub_id
WHERE m.mark = (SELECT MAX(marks.mark) FROM marks);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.student_id,s.student_name, AVG(m.mark) AS avg_mark
FROM students s
JOIN marks m ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY avg_mark DESC;