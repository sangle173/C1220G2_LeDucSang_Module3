create database ss12_user_jdbc;
use ss12_user_jdbc;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    country VARCHAR(255)
);

insert into users(`name`, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(`name`, email, country) values('Kante','kante@che.uk','Kenia');
