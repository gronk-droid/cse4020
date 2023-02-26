create database if not exists cse4020;

use cse4020;

CREATE TABLE IF NOT EXISTS `branch` (
    `branch_name` varchar(25),
    `branch_city` varchar(25),
    `assets` int,
    primary key (branch_name)
);

CREATE TABLE IF NOT EXISTS `account` (
    `account_number` char(10),
    `branch_name` varchar(25),
    `balance` int check (balance > 0),
    primary key (account_number)
);

CREATE TABLE IF NOT EXISTS `depositor` (
    `customer_name` varchar(25),
    `account_number` char(10),
    primary key (customer_name)
);

CREATE TABLE IF NOT EXISTS `customer` (
    `customer_name` varchar(25),
    `customer_street` varchar(25),
    `customer_city` varchar(25),
    primary key (customer_name)
);

CREATE TABLE IF NOT EXISTS `borrower` (
    `customer_name` varchar(25),
    `loan_number` char(10),
    primary key (customer_name)
);

CREATE TABLE IF NOT EXISTS `loan` (
    `loan_number` char(10),
    `branch_name` varchar(25),
    `amount` int check (amount > 0),
    primary key (loan_number)
);

ALTER TABLE
    `account`
ADD
    FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`);

ALTER TABLE
    `depositor`
ADD
    FOREIGN KEY (`account_number`) REFERENCES `account` (`account_number`);

ALTER TABLE
    `customer`
ADD
    FOREIGN KEY (`customer_name`) REFERENCES `depositor` (`customer_name`);

ALTER TABLE
    `borrower`
ADD
    FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`);

ALTER TABLE
    `borrower`
ADD
    FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`);

ALTER TABLE
    `loan`
ADD
    FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`);

ALTER TABLE
    `depositor`
ADD
    FOREIGN KEY (`account_number`) REFERENCES `depositor` (`customer_name`);