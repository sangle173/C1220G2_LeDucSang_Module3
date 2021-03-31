drop database if exists furama_resort_dababase;
create database furama_resort_dababase;

use furama_resort_dababase;

create table Positions(
	position_id int primary key,
    position_name varchar(50)
);

insert into Positions(position_id, position_name)
value
	(1,'Staff'),
	(2,'Captain'),
	(3,'Supevisor'),
	(4,'Manager'),
	(5,'Director'),
	(6,'Genaral Manager')
;
    
create table Employee_level(
	employee_level_id int primary key,
	employess_level varchar(15)
);

insert into Employee_level(employee_level_id, employess_level)
value
	(1,'A1'),
	(2,'A2'),
	(3,'B1'),
	(4,'B2'),
	(5,'C1'),
	(6,'C2')
;

create table Department(
	department_id int primary key,
    department_name varchar(50)
);

insert into Department(department_id, department_name)
value
	(1,'Sale & Marketing'),
	(2,'Financial'),
	(3,'Kitchen'),
	(4,'HouseAtendent'),
	(5,'F&B'),
	(6,'FO');

create table RentalType(
	rental_type_id int primary key,
    rental_type_name varchar(50),
    price double
);

insert into RentalType(rental_type_id, rental_type_name, price)
value
	(1,'Day',200000.00),
	(2,'Month',6000000.00),
	(3,'Year',1000000000.00),
	(4,'Hour',100000.00);

create table Servicetype(
	service_type_id int auto_increment primary key,
    service_type_name varchar(50)
);

insert into Servicetype(service_type_id, service_type_name)
value
	(1,'Villa'),
	(2,'House'),
	(3,'Room');
    
create table Employees(
	employee_id int auto_increment primary key,
    full_name varchar(40) not null default 'Employee name',
    position_id int not null,
    employee_level_id int not null,
    department_id int not null,
    date_of_birth date,
    id_card_number varchar(10) not null unique,
    salary double,
    phone_number varchar(10),
    email varchar(100),
    address varchar(200),
	foreign key(position_id) references Positions(position_id),
	foreign key(employee_level_id) references Employee_level(employee_level_id),
	foreign key(department_id) references Department(department_id)
);



create table CustomerType(
	customer_type_id int  primary key,
    customer_type_name varchar(50)
);

insert into CustomerType(customer_type_id, customer_type_name)
value
	(1,'Vip'),
	(2,'Gold'),
	(3,'Deluxe'),
	(4,'Diamond'),
	(5,'Normal');

 create table Customers(
	customer_id int auto_increment primary key,
    customer_type_id int,
    full_name varchar(50),
    date_of_birth date,
    id_card_number varchar(10),
    phone_number varchar(10),
    email varchar(100),
    address varchar(200),
    foreign key (customer_type_id) references CustomerType(customer_type_id)
 );
    
 create table Services(
	service_id int auto_increment primary key,
    service_name varchar(50),
    area_using double,
    no_of_floor int,
    max_of_customer int,
    rental_fee double,
    rental_type_id int,
    service_type_id int,
    availability_status varchar(50),
    foreign key (rental_type_id) references RentalType(rental_type_id),
    foreign key (service_type_id) references ServiceType(service_type_id)
);

 create table AccompaniedService(
	accompanied_service_id int auto_increment primary key,
    accompanied_service_name varchar(50),
    price double,
	unit int,
    availability_status varchar(50)
 );
 
 insert into AccompaniedService(accompanied_service_id, accompanied_service_name, price, unit, availability_status)
value
	(1,'Karaoke',100000.00,1, 'On'),
	(2,'Car',200000.00,2, 'Off'),
	(3,'Drink',300000.00,3, 'On'),
	(4,'Food',600000.00,2, 'On'),
	(5,'Spa',200000.00,2, 'On');
    
create table Contracts(
	contract_id int auto_increment not null primary key,
    employee_id int,
    customer_id int,
    service_id int,
    date_started date,
    date_finished date,
    down_payment double,
    total_payment double,
	foreign key(employee_id) references Employees(employee_id),
	foreign key(customer_id) references Customers(customer_id),
	foreign key(service_id) references Services(service_id)
);

 
 create table ContractDetail(
	contract_detail_id int auto_increment primary key,
    contract_id int,
    accompanied_service_id int,
    amount int,
    foreign key (contract_id) references Contracts(contract_id),
    foreign key (accompanied_service_id) references AccompaniedService(accompanied_service_id)
 );
-- Task 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.

insert into Employees( full_name, position_id, employee_level_id, department_id, date_of_birth, id_card_number, salary, phone_number, email, address) 
value 
	('Le Duc Sang', 1, 2, 3, '1992-06-19', 208876544, 12000000.00, 0333576574, 'sangle@gmail.com', '103 Hoang Dieu' ),
	('Nguyen Duc Hau', 2, 1, 4, '1996-07-25', 208876545, 16000000.00, 090765654, 'hau_nguyen@gmail.com', 'Hoa Tien' ),
	('Bui Thanh Tai', 1, 1, 1, '1996-10-17', 207776513, 10000000.00, 091767658, 'tai_bui@gmail.com', 'Hue' ),
	('Nguyen Thanh Tung', 1, 2, 3, '1988-07-23', 209971245, 18000000.00, 0333765654, 'tung_nguyen@gmail.com', 'Da Nang' ),
	('Ho Quang Kha', 2, 2, 2, '1995-08-30', 208877619, 15000000.00, 0345717654, 'kha_ho@gmail.com', 'Binh Dinh' ),
	('Nguyen Trung Kien', 1, 3, 2, '1999-09-30', 208845545, 10000000.00, 090765333, 'kien_nguyen@gmail.com', 'Da Nang' ),
	('Ngueyn Huy', 1, 3, 2, '1987-07-29', 212376545, 16000000.00, 094445654, 'huy_nguyen@gmail.com', 'Da Nang' ),
	('Dinh Van Thang', 2, 3, 1, '1992-10-17', 208856453, 100000000.00, 0333765654, 'thang_dinh@gmail.com', 'Quang Nam' ),
	('Nguyen Van Duc', 1, 3, 4, '1998-07-30', 218846565, 8000000.00, 091763674, 'duc_nguyen@gmail.com', 'Nghe An' );

 insert into Customers(customer_type_id, full_name, date_of_birth, id_card_number, phone_number, email ,address)
 value
	(1, 'Joan', '1977-06-20', 208872125, 0333576575, 'joan@gmail.com', 'Spanish' ),
	(2, 'Take Uchi Satoru', '1971-01-19', 208876546, 090765659, 'take_uchi@gmail.com', 'Japan' ),
	(2, 'Ty Colin', '1975-11-28', 207776517, 091767658, 'ty_colin@gmail.com', 'Us' ),
	(1, 'Nguyen Minh Phuc', '1984-08-19', 209971242, 0333765651, 'phuc_nguyen@gmail.com', 'Ha Noi' ),
	(2, 'Nguyen Van Ha', '1978-11-19', 208877611, 03457176510, 'ha_nguyen@gmail.com', 'Quang Tri' ),
	(3, 'Nguyen Hong Dang', '1988-12-30', 208845540, 090765335, 'dang_nguyen@gmail.com', 'Ha Noi' ),
	(2, 'Lam Ba Dat', '1987-07-29', 212376541, 094445656, 'ba_dat@gmail.com', 'Sai Gon' ),
	(1, 'Cao Van Minh', '1992-10-17', 208856459, 0333765651, 'minh_cao@gmail.com', 'Cao Bang' ),
	(2, 'Nguyen Dang Khoi', '1998-08-24', 218846561, 091763678, 'khoi_nguyen@gmail.com', 'Da Nang' );
    
-- Task 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from employees
where (full_name regexp '[HKT][a-z]*$') and length(full_name) <=15;

-- Task 3.	Hiển thị thông tin của tất cả khách  hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from customers
where timestampdiff(year, date_of_birth, curdate()) between 18 and 50 and address in ('Da Nang', 'Quang Tri'); 

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được 
-- sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.