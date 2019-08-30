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
delete from [User] where id = 3 or id = 5 or id = 6;

DROP TABLE [User];

CREATE TABLE Flight (
	id int identity(1, 1) not null primary key,
	[from] nvarchar(100),
	[to] nvarchar(100),
	departtime datetime,
	returntime datetime,
	traveltime time,
	price float
);

DROP TABLE [Flight];

CREATE TABLE BookingHistory (
	id int identity(1, 1) not null primary key,
	userid int foreign key references [User](id),
	flightid int foreign key references Flight(id),
	reservation_code varchar(50)
);

DROP TABLE BookingHistory;

select * from Flight;
delete from Flight where id = 1;

insert into [Flight] 
values (N'Hà Nội', N'Hồ Chí Minh', '2019-09-02 08:00:00', '2019-09-02 10:15:00', '02:15:00', 200);

insert into [Flight] 
values (N'Hồ Chí Minh', N'Hà Nội', '2019-09-08 14:30:00', '2019-09-08 16:45:00', '02:15:00', 200);

insert into [Flight] 
values (N'Hà Nội', N'Đà Nẵng', '2019-09-02 10:00:00', '2019-09-02 11:15:00', '01:15:00', 50);

insert into [Flight] 
values (N'Hà Nội', N'Singapore', '2019-09-02 06:00:00', '2019-09-02 12:15:00', '06:15:00', 400);

insert into [Flight] 
values (N'Hồ Chí Minh', N'Hà Nội', '2019-09-08 12:00:00', '2019-09-08 14:15:00', '02:15:00', 200);

SELECT * FROM Flight WHERE [from]=N'Hồ Chí Minh' and [to]=N'Hà Nội' and CAST(flightdetail AS DATE) = CAST('2019-09-08' AS DATE)

select * from BookingHistory;
delete from BookingHistory where id = 3 or id = 4;