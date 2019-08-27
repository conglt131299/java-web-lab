CREATE DATABASE OnlineQuiz
USE OnlineQuiz

CREATE TABLE Question (
	id int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	content nvarchar(500),
	opt1 nvarchar(500),
	opt2 nvarchar(500),
	opt3 nvarchar(500),
	opt4 nvarchar(500),
	answer nvarchar(500),
	created datetime
);

select * from Question;
delete from Question where id between 1 and 4;

DROP TABLE Question;

CREATE TABLE QuizHistory (
	id int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	studentId int,
	numberOfQuiz int,
	mark float
);

DROP TABLE QuizHistory;

CREATE TABLE [User] (
	id int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	username varchar(50),
	password varchar(50),
	type int,
	email varchar(100)
);

DROP TABLE [User];

Insert into [User]
values ('conglthe130017', '1234', 0, 'conglthe130017@fpt.edu.vn');

Insert into [User]
values ('sonnt5', '12345', 1, 'sonnt69@fpt.edu.vn');

select * from [User];