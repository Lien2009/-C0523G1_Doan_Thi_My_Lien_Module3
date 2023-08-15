USE ss2;
-- 1. Đánh, xóa index cho cột name trong bảng student.
alter table student add index idx_name(name);
alter table student drop index idx_name;
-- 2. Tạo view chứa thông tin id và name của student.
create view student_views as
select id, name
from student;
select * from student_views;