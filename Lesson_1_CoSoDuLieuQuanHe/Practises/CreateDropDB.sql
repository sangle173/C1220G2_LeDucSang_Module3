drop database if exists student_management;
create database student_management;
use student_management;
create table student(
	id int primary key,
    `name` varchar(50),
    date_of_birth date,
    email varchar(40)
);
insert into student(id,`name`,date_of_birth, email)
values 
(123,'Duc Sang','2021-03-25','leducsang@gmail.com'),
(234,'Duc Sang','2021-03-25','leducsang@gmail.com'),
(345,'Duc Sang','2021-03-25','leducsang@gmail.com'),
(456,'Duc Sang','2021-03-25','leducsang@gmail.com');
drop database student_management;
