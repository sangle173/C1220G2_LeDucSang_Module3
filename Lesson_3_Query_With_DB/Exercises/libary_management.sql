DROP DATABASE IF EXISTS libary_management;
CREATE DATABASE libary_management;
USE libary_management;

CREATE TABLE categorys (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);
INSERT INTO categorys(category_name)
VALUES
("Manga"),
("Math"),
("Chemitry"),
("Business"),
("World");

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    publishing_year INT NOT NULL,
    no_of_publications INT,
    price INT NOT NULL,
    image VARCHAR(50),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id)
        REFERENCES Category (category_id)
);
INSERT INTO books(book_title,publisher,author,publishing_year,no_of_publications,price,image,category_id)
VALUES
("Doraemon", "Kim Dong", "Fujiko F. Fujio", 1990, 5, 50,NULL,1),
("One Piece", "Kim Dong", "Eiichiro Oda", 2020,NULL,100,NULL,2),
("Dragonball", "Kim Vang", "Akira Toriyama", 2010, NULL, 100, NULL, 3),
("Doraemon", "Kim Sat","Fujiko Fujio", 2000, 10, 50, NULL, 4),
("Nghe Thuat Lua Doi", "Kim Chi","Doan Van Hau", 2010, 5, 100, NULL, 5 );

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    birthday DATE,
    address VARCHAR(500),
    email VARCHAR(50),
    phone VARCHAR(10),
    photo VARCHAR(8000)
);
INSERT INTO students(student_name,birthday,address,email,phone,photo)
VALUES
("Nguyen Duc Hau", NULL,NULL, "dmurphy@classicmodelcars.com", NULL, NULL),
("Le Duc Sang", NULL,NULL, "dmurphy@classicmodelcars.com", NULL,  NULL),
("Ho Quan Kha", NULL,NULL, "mpatterso@classicmodelcars.com", NULL,  NULL),
("Bui Thanh Tai", NULL, NULL, "jfirrelli@classicmodelcars.com", NULL, NULL),
("Bui Minh Thong", NULL, NULL, "thongnguyen@classicmodelcars.com", NULL, NULL);

CREATE TABLE borrow_order (
    borrow_order_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    return_day DATE NOT NULL,
    status VARCHAR(15) NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);
INSERT INTO borrow_order(student_id,return_day,status)
VALUES
(1, "2021-03-25", "returned"),
(2, "2021-03-25", "returned"),
(3, "2021-03-10", "overdue"),
(4, "2021-03-14", "borrowing");

CREATE TABLE order_detail (
    borrow_order_id INT,
    book_id INT,
    PRIMARY KEY (borrow_order_id , book_id),
    FOREIGN KEY (borrow_order_id)
        REFERENCES borrow_order (borrow_order_id),
    FOREIGN KEY (book_id)
        REFERENCES books (book_id)
);
INSERT INTO order_detail(borrow_order_id,book_id)
VALUES
(1, 1),
(1, 2),
(3, 4),
(4, 1);

SELECT borrow_order.borrow_order_id, students.student_name, books.book_title, categorys.category_name, borrow_order.return_day, borrow_order.status
FROM borrow_order INNER JOIN order_detail ON borrow_order.borrow_order_id=order_detail.borrow_order_id
INNER JOIN students ON borrow_order.student_id=students.student_id
INNER JOIN books ON order_detail.book_id=books.book_id
INNER JOIN categorys ON books.category_id=categorys.category_id;