create database furama_resort_dababase;

use furama_resort_dababase;

create table Positions(
	position_id int primary key,
    position_name varchar(50)
);
    
create table Employee_level(
	employee_level_id int primary key,
	employess_level varchar(15)
);

create table Department(
	department_id int primary key,
    department_name varchar(50)
);

create table RentalType(
	rental_type_id int primary key,
    rental_type_name varchar(50),
    price double
);

create table Servicetype(
	service_type_id int auto_increment primary key,
    service_type_name varchar(50)
);
    
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
-- Task 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới.\

insert into Positions(position_id, position_name)
value
	(1,'Staff'),
	(2,'Captain'),
	(3,'Supevisor'),
	(4,'Manager'),
	(5,'Director'),
	(6,'Genaral Manager')
;

insert into Employee_level(employee_level_id, employess_level)
value
	(1,'A1'),
	(2,'A2'),
	(3,'B1'),
	(4,'B2'),
	(5,'C1'),
	(6,'C2')
;

insert into Department(department_id, department_name)
value
	(1,'Sale & Marketing'),
	(2,'Financial'),
	(3,'Kitchen'),
	(4,'HouseAtendent'),
	(5,'F&B'),
	(6,'FO');
    
insert into RentalType(rental_type_id, rental_type_name, price)
value
	(1,'Day',200000.00),
	(2,'Month',6000000.00),
	(3,'Year',1000000000.00),
	(4,'Hour',100000.00);
    
insert into Servicetype(service_type_id, service_type_name)
value
	(1,'Villa'),
	(2,'House'),
	(3,'Room');

insert into CustomerType(customer_type_id, customer_type_name)
value
	(1,'Diamond'),
	(2,'Platinium'),
	(3,'Gold'),
	(4,'Silver'),
	(5,'Member');
    
insert into AccompaniedService(accompanied_service_id, accompanied_service_name, price, unit, availability_status)
value
	(1,'Karaoke',100000.00,1, 'Availabale'),
	(2,'Car',200000.00,2, 'Unavailabale'),
	(3,'Drink',300000.00,3, 'Availabale'),
	(4,'Food',600000.00,2, 'Availabale'),
	(5,'Spa',200000.00,2, 'Availabale');
    
insert into Services(service_name, area_using, no_of_floor, max_of_customer, rental_fee, rental_type_id, service_type_id, availability_status)
values
("Villa Lamark", 700.76, 2, 3, 2000000, 2, 1, "Available"),
("Villa A",	400.50,	3, 3,	1000000, 2, 1, "Available"),
("House Lamark", 100.70, 2, 3, 500000, 1, 2, "Not available"),
("House A", 80.70, 3, 2, 300000, 1, 2, "Available"),
("Room 312", 70.3, 2, 3, 200000, 2, 1, "Available"),
("Room 213", 50.4, 1, 2, 290000, 4, 3, "Not available");
    
insert into Employees( full_name, position_id, employee_level_id, department_id, date_of_birth, id_card_number, salary, phone_number, email, address) 
value 
	('Le Duc Sang', 1, 2, 3, '1992-06-19', '208876544', 12000000.00, '0333576574', 'sangle@gmail.com', '103 Hoang Dieu' ),
	('Nguyen Duc Hau', 2, 1, 4, '1996-07-25', '208876545', 16000000.00, '0907656547', 'hau_nguyen@gmail.com', 'Hoa Tien' ),
	('Bui Thanh Tai', 1, 1, 1, '1996-10-17', '207776513', 10000000.00, '0917676587', 'tai_bui@gmail.com', 'Hue' ),
	('Nguyen Thanh Tung', 1, 2, 3, '1988-07-23', '209971245', 18000000.00, '0333765654', 'tung_nguyen@gmail.com', 'Da Nang' ),
	('Ho Quang Kha', 2, 2, 2, '1995-08-30', '208877619', 15000000.00, '0345717654', 'kha_ho@gmail.com', 'Binh Dinh' ),
	('Nguyen Trung Kien', 1, 3, 2, '1999-09-30', '208845545', 10000000.00, '0907658333', 'kien_nguyen@gmail.com', 'Da Nang' ),
	('Ngueyn Huy', 1, 3, 2, '1987-07-29', '212376545', 16000000.00, '0944458654', 'huy_nguyen@gmail.com', 'Da Nang' ),
	('Dinh Van Thang', 2, 3, 1, '1992-10-17', '208856453', 100000000.00, '0333765654', 'thang_dinh@gmail.com', 'Quang Nam' ),
	('Nguyen Van Duc', 1, 3, 4, '1998-07-30', '218846565', 8000000.00, '0917636784', 'duc_nguyen@gmail.com', 'Nghe An' );
select length(phone_number) 
from employees;

 insert into Customers(customer_type_id, full_name, date_of_birth, id_card_number, phone_number, email ,address)
 value
	(1, 'Joan', '1977-06-20', '208872125', '0333576575', 'joan@gmail.com', 'Spanish' ),
	(2, 'Take Uchi Satoru', '1971-01-19', '208876546', '090765659', 'take_uchi@gmail.com', 'Japan' ),
	(2, 'Ty Colin', '1975-11-28', '207776517', '091767658', 'ty_colin@gmail.com', 'Us' ),
	(1, 'Nguyen Minh Phuc', '1984-08-19', '209971242', '0333765651', 'phuc_nguyen@gmail.com', 'Ha Noi' ),
	(2, 'Joan', '1920-11-19', '208877611', '0345176510', 'ha_nguyen@gmail.com', 'Quang Tri' ),
	(3, 'Nguyen Hong Dang', '1988-12-30', '208845540', '0906588335', 'dang_nguyen@gmail.com', 'Ha Noi' ),
	(2, 'Lam Ba Dat', '1987-07-29', '212376541', '0944456056', 'ba_dat@gmail.com', 'Sai Gon' ),
	(1, 'Cao Van Minh', '1992-10-17', '208856459','0333765651', 'minh_cao@gmail.com', 'Cao Bang' ),
	(2, 'Nguyen Dang Khoi', '1998-08-24', '218846561', '0917063678', 'khoi_nguyen@gmail.com', 'Da Nang' );
    
insert into Contracts(employee_id, customer_id, service_id, date_started, date_finished, down_payment, total_payment)
value
	(1, 1, 2, '2015-10-16', '2015-10-28', 150000, 1000000),
	(2, 2, 2, '2016-11-10', '2019-11-15', 100000, 1000000),
	(3, 3, 1, '2019-12-26', '2019-12-30', 200000, 2000000),
	(2, 4, 3, '2017-07-12', '2018-07-28', 100000, 10000000),
	(3, 4, 2, '2017-09-16', '2015-11-20', 200000, 1000000),
	(2, 2, 4, '2018-01-09', '2018-01-12', 100000, 1000000),
	(4, 3, 1, '2018-10-16', '2018-10-28', 300000, 1000000),
	(6, 3, 3, '2019-08-20', '2019-08-25', 100000, 1000000),
	(7, 6, 2, '2019-11-07', '2019-11-19', 150000, 1000000),
	(7, 7, 6, '2020-10-16', '2020-10-28', 150000, 1000000),
	(7, 8, 5, '2021-03-16', '2021-03-20', 300000, 1000000);
    
insert into Contracts(employee_id, customer_id, service_id, date_started, date_finished, down_payment, total_payment)
value
    (7, 6, 2, '2019-02-07', '2019-11-19', 150000, 1000000);
 insert into ContractDetail( contract_id, accompanied_service_id, amount)
 value
	(1, 1, 1 ),
	(2, 2, 2 ),
	(3, 3, 3 ),
	(4, 4, 2 ),
	(5, 5, 3 ),
	(7, 2, 1 ),
	(8, 3, 1 );
insert into ContractDetail( contract_id, accompanied_service_id, amount)
 value
	(10, 1, 1 ),
	(10, 2, 2 ),
	(10, 3, 3 ),
	(11, 4, 2 ),
	(11, 5, 3 ),
	(9, 2, 1 ),
	(12, 3, 1 );
insert into ContractDetail( contract_id, accompanied_service_id, amount)
 value
	(10, 1, 1 ),
	(10, 2, 2 ),
	(10, 3, 3 ),
	(11, 4, 2 ),
	(11, 5, 3 ),
	(9,2, 1 ),
	(12, 3, 1 ),
	(12, 3, 2 ),
	(12, 3, 3 ),
	(12, 3, 2 ),
	(12, 3, 1 ),
	(12, 3, 2 ),
	(12, 3, 3 ),
	(12, 3, 4 ),
	(12, 3, 1 ),
	(12, 3, 1 );
-- Task 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from employees
where (full_name regexp '[HKT][a-z]*$') and length(full_name) <=15;

-- Task 3.	Hiển thị thông tin của tất cả khách  hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from customers
where (timestampdiff(year, date_of_birth, curdate()) between 18 and 50 ) and address in ('Da Nang', 'Quang Tri'); 
-- tính tuổi
select full_name, ROUND(DATEDIFF(CURDATE(), date_of_birth) / 365, 0) AS age
from customers;

select full_name,(YEAR(CURDATE()) - YEAR(date_of_birth)) - (RIGHT(CURDATE(), 5) < RIGHT(date_of_birth, 5)) AS age
from customers;

-- tính ngày sinh nhật là thứ mấy

select full_name, dayname(date_of_birth)
from customers;

-- tính tháng sinh nhật

select full_name, monthname(date_of_birth)
from customers;

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được 
-- sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select Customers.customer_id, Customers.full_name, Customertype.customer_type_name, COUNT(*) as noOfBooked
from Customers
	inner join Customertype on Customers.customer_type_id = Customertype.customer_type_id
	left join Contracts on Customers.customer_id = Contracts.customer_id
where
    Customertype.customer_type_name = 'Diamond'
group by  customer_id
ORDER BY noOfBooked;

-- 5. Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
-- TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong
-- và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng 
--  nào chưa từng đặt phòng cũng phải hiển thị ra).

select customers.customer_id, customers.full_name, customertype.customer_type_name, services.service_name, contracts.date_started,
		contracts.date_finished,
case when contracts.contract_id in (
	select contract_id
    from contractdetail
) then services.rental_fee	+	sum(contractdetail.amount*accompaniedservice.price)
else services.rental_fee
end as total_fee
from customers
	left join customertype on customertype.customer_type_id=customers.customer_type_id
    left join contracts on customers.customer_id= contracts.customer_id
    left join services on services.service_id  =contracts.service_id
    left join contractdetail on contracts.contract_id=contractdetail.contract_id
    left join accompaniedservice on accompaniedservice.accompanied_service_id= contractdetail.accompanied_service_id
group by contracts.contract_id;

-- 6. Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa 
-- từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select Services.service_id, Services.service_name, Services.area_using, Services.rental_fee, Servicetype.service_type_name, contracts.date_started
from Services
	inner join Servicetype on Services.service_type_id=Servicetype.service_type_id
    left join contracts on Services.service_id=contracts.service_id
where contracts.date_started not in (
	select contracts.date_started
    from contracts
    where (date_started between '2019-01-01' and '2019-03-31')
)
order by service_id;

-- 7. Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, 
-- TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt 
-- phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.

select services.service_id, services.service_name, services.area_using, services.max_of_customer, services.rental_fee, servicetype.service_type_name, contracts.date_started
from services
	inner join servicetype on services.service_type_id=servicetype.service_type_id
    left join contracts on services.service_id= contracts.service_id
where services.service_id in (
	select distinct  contracts.service_id
    from contracts
    where year(date_started)=2018
) and services.service_id not in (
	select distinct contracts.service_id
	from contracts
	where year(date_started) = 2019
)
order by service_id;

-- 8. Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau. 
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- firt way

select  distinct full_name
from customers;

-- second way
select *
from customers
group by full_name;

-- third way

select *
from (
	select *, row_number() over (partition by full_name order by customer_id) as rn from customers 
) t
where rn=2
order by customer_id;

-- fourth way

select *
from customers t1
	left join customers t2 on t1.full_name = t2.full_name and t1.customer_id>t2.customer_id
where t2.full_name is null;

-- fifth way
 select *
 from customers t1
where not exists (
	select 1
    from customers t2
    where t1.full_name= t2.full_name and t1.customer_id > t2.customer_id
)
order by customer_id;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
insert into Contracts(employee_id, customer_id, service_id, date_started, date_finished, down_payment, total_payment)
value
	(7, 1, 2, '2019-11-01', '2019-11-20', 150000, 1600000),
	(2, 2, 2, '2019-12-08', '2019-12-28', 100000, 3000000);
    
select month(contracts.date_started)as month_booking, sum(total_payment) as total_payment_in_month, count(*) as no_of_booking
from contracts
where year(contracts.date_started)=2019
group by month(contracts.date_started)
order by month(contracts.date_started);

-- 10. Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc,
-- SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

select contracts.contract_id, contracts.date_started, contracts.date_finished, contracts.down_payment, contractdetail.amount, count(*) as noOfAccompaniedService
from contracts left join contractdetail on contractdetail.contract_id = contracts.contract_id
group by contract_id
order by noOfAccompaniedService;

-- 11. Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có 
-- TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

select customers.customer_id, customers.address, customertype.customer_type_name, accompaniedservice.accompanied_service_name, accompaniedservice.price
from customers 
	inner join customertype on customers.customer_type_id=customertype.customer_type_id
	left join contracts on contracts.customer_id =customers.customer_id
    inner join contractdetail on contractdetail.contract_id=contracts.contract_id
    inner join accompaniedservice on accompaniedservice.accompanied_service_id=contractdetail.accompanied_service_id
where customertype.customer_type_name='Diamond' and customers.address in ('Quang Tri', 'Ha Noi');

-- 12. Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
-- (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 
-- tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

select contracts.contract_id, employees.full_name as employeeName, customers.full_name as customerName, customers.phone_number as customerPhoneNumber, services.service_name
, count(*) as amountOfAccompaningSerivce, contracts.date_started, contracts.down_payment
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contractdetail on contractdetail.contract_id= contracts.contract_id
where (month(date_started) between 9 and 12) and (year(date_started)=2019) and month(date_started) not in (
	select contract_id
    from contracts
    where month(date_started) between 1 and 6
)
group by contracts.contract_id
order by amountOfAccompaningSerivce;

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
set @max_of_use= (select max(maxOfAc) 
from (select accompaniedservice.accompanied_service_id, count(accompaniedservice.accompanied_service_id)as maxOfAc
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contractdetail on contractdetail.contract_id= contracts.contract_id
    inner join accompaniedservice on accompaniedservice.accompanied_service_id= contractdetail.accompanied_service_id
group by accompaniedservice.accompanied_service_id) as nou);

select  @max_of_use;

set @min_of_use = (select min(minOfAc) 
from (select accompaniedservice.accompanied_service_id, count(accompaniedservice.accompanied_service_id)as minOfAc
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contractdetail on contractdetail.contract_id= contracts.contract_id
    inner join accompaniedservice on accompaniedservice.accompanied_service_id= contractdetail.accompanied_service_id
group by accompaniedservice.accompanied_service_id) as nou);

select @min_of_use;

select contracts.contract_id, accompaniedservice.accompanied_service_name, count(accompaniedservice.accompanied_service_id)as noOfUsing
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contractdetail on contractdetail.contract_id= contracts.contract_id
    inner join accompaniedservice on accompaniedservice.accompanied_service_id= contractdetail.accompanied_service_id
group by accompaniedservice.accompanied_service_id
having noOfUsing= @max_of_use
order by noOfUsing;

select contracts.contract_id, accompaniedservice.accompanied_service_name, count(accompaniedservice.accompanied_service_id)as noOfUsing
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contractdetail on contractdetail.contract_id= contracts.contract_id
    inner join accompaniedservice on accompaniedservice.accompanied_service_id= contractdetail.accompanied_service_id
group by accompaniedservice.accompanied_service_id
having noOfUsing= @min_of_use
order by noOfUsing;

-- other way
select accompaniedservice.accompanied_service_id, accompaniedservice.accompanied_service_name, count(contractdetail.accompanied_service_id) as noOfBooking
from contractdetail
	inner join accompaniedservice on accompaniedservice.accompanied_service_id=contractdetail.accompanied_service_id
group by contractdetail.accompanied_service_id
having count(contractdetail.accompanied_service_id) =(select max(amount)
	from (select 
			count(accompanied_service_id) as noOfBooking
            from contractdetail
            group by accompanied_service_id) as noOfUseAccompanied
);

-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
select contracts.contract_id, accompaniedservice.accompanied_service_name, count(accompaniedservice.accompanied_service_id)as noOfUsing
from employees
	inner join contracts on contracts.employee_id=employees.employee_id
    inner join customers on customers.customer_id=contracts.customer_id
    inner join services on services.service_id= contracts.service_id
    inner join contractdetail on contractdetail.contract_id= contracts.contract_id
    inner join accompaniedservice on accompaniedservice.accompanied_service_id= contractdetail.accompanied_service_id
group by accompaniedservice.accompanied_service_id
having noOfUsing=1
order by noOfUsing;

--  15
-- Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan,
-- SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019

select employees.employee_id, employees.full_name, positions.position_name, department.department_name, employees.phone_number, employees.address, count(contracts.contract_id) as noOfContracts
from employees
	left join contracts on employees.employee_id=contracts.employee_id
    inner join positions on positions.position_id=employees.position_id
    inner join department on department.department_id=employees.department_id
where year(date_started) between 2018 and 2019
group by contracts.employee_id
having noOfContracts <=3;

-- 16.
-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019

select *
from employees;
delete
from employees
where employee_id not in (
	select employee_id
	from contracts
    where year(date_started) between 2017 and 2019
);

--  17.
-- Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ Platinium lên Diamond, chỉ cập nhật
-- những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ/500$

select *
from customertype;
update customers
set customer_type_id=(
	select customer_type_id
    from customertype
    where customer_type_name='Diamond'
);
select *
from customers
where customer_type_id = (
	select customer_type_id
    from customertype
    where customer_type_name='Platinium'
)
and customer_type_id in (
	select customer_id
    from contracts 
    group by customer_id
    having sum(total_payment) >10000000
);

-- 18. Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng)

delete 
from customers
where customer_id in (
	select customer_id
    from contracts
    where year(date_started) <2016
);

-- 19. Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi

update accompaniedservice
set price= price*2
where accompanied_service_id in (
	select accompanied_service_id
    from contractdetail
		inner join contracts on contracts.contract_id=contractdetail.contract_id
    group by contractdetail.accompanied_service_id
    having count(accompanied_service_id)>10
);

-- 20. Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

select employee_id as id, full_name, email, phone_number, date_of_birth, address
from employees
union all select customer_id as id, full_name, email, phone_number, date_of_birth, address
from customers;