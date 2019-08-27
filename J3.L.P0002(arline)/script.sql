CREATE DATABASE Airline
USE Airline

CREATE TABLE [User] (
	id int identity(1, 1) not null primary key,
	email varchar(100),
	password nvarchar(100),
	fname nvarchar(100),
	lname nvarchar(100),
	[address] nvarchar(300),
	phonenumber varchar(20),
	sex bit,
	age int,
	cardnumber varchar(20)
);

select * from [User];
delete from [User] where id = 2;

DROP TABLE [User];

CREATE TABLE Flight (
	id int identity(1, 1) not null primary key,
	[from] nvarchar(100),
	[to] nvarchar(100),
	flightdetail datetime,
	price float
);

CREATE TABLE BookingHistory (
	id int identity(1, 1) not null primary key,
	userid int foreign key references [User](id),
	flightid int foreign key references Flight(id),
	reservation_code varchar(50)
);

DROP TABLE BookingHistory;