DROP DATABASE IF EXISTS bank_management;
CREATE DATABASE bank_management;
USE bank_management;

CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(40) NOT NULL,
    customer_address VARCHAR(200) NOT NULL,
    customer_email VARCHAR(40) NOT NULL,
    customer_phone VARCHAR(10)
);

CREATE TABLE bank_account(
	account_number INT PRIMARY KEY,
    account_type VARCHAR(40) NOT NULL,
	account_date date NOT NULL,
    acount_blance VARCHAR(40) NOT NULL,
    customer_id INT UNIQUE NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE bank_transaction(
	tran_number INT PRIMARY KEY,
    account_number INT NOT NULL,
	tran_date date NOT NULL,
    amounts DOUBLE NOT NULL,
    descriptions  VARCHAR(40) NOT NULL,
    FOREIGN KEY (account_number)
        REFERENCES bank_account (account_number)
);
