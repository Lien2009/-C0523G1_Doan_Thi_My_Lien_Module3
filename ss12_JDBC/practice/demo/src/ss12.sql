CREATE DATABASE ss12;
USE ss12;
CREATE TABLE users(
id int primary key auto_increment,
name varchar(100),
email varchar(100),
country varchar(100)
);
insert into users(name, email, country) values
('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');
delete from users where id = 3;
alter table users
add is_delete bit(1) default 0;
set sql_safe_updates = 0;
alter table users
drop is_delete;
delimiter //
create procedure get_all_users()
begin
select *
from users
where is_delete = 0;
end //
delimiter ;
call get_all_users();

delimiter //
create procedure delete_user(choose_id int)
begin
update users set is_delete = 1
where id = choose_id;
end //
delimiter ;
call delete_user(8);

delimiter //
create procedure edit_user(choose_id int,
new_name varchar(100),
new_email varchar(100),
new_country varchar(100) )
begin
update users set name = new_name, email = new_email, country = new_country
where id = choose_id;
end //
delimiter ;

create table permision(
id int primary key,
name varchar(100)
);
create table user_permision(
permision_id int,
user_id int
);
insert into permision (id, name) values 
(1,'add'), (2,'edit'),(3,'delete'),(4,'view');