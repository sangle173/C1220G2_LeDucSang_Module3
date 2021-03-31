drop database if exists practises_query_sql;

create database practises_query_sql;

use practises_query_sql;

create table students (
    id int not null,
    full_name varchar(50) not null,
    age int not null,
    course varchar(10) not null,
    tuition_fee int not null
);

insert into students(id, full_name, age, course, tuition_fee)
values
(1, "Hoang", 21, "CNTT", 400000),
(2, "Viet", 19, "DTVT", 320000),
(3, "Thanh", 18, "KTDN", 400000),
(4, "Nhan", 19, "CK", 450000),
(5, "Huong", 20, "TCNH", 500000),
(5, "Huong", 20, "TCNH", 200000);

-- Viết câu lệnh hiện thị tất cả các dòng có tên là Huong
select *
from students
where full_name='Huong';

-- Viết câu lệnh lấy ra tổng số tiền của Huong

select id,full_name, age, course, sum(tuition_fee) as tuition_total 
from students
where full_name='Huong';

-- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp

select distinct *
from students;