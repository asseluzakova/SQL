CREATE DATABASE university;
USE university;

CREATE TABLE Address
(Id int not null primary key auto_increment,
Country varchar(50) default 'Kazakhstan',
County varchar(50),
City varchar(50),
Street varchar(50),
Numberr int,
unique(Numberr) 
);

INSERT INTO Address(City,Street,Numberr) VALUES('Almaty','Zholymbet',20);
INSERT INTO Address(County,City,Street,Numberr) VALUES
('Kyzylorda obl','Baikonur','Yangelya',21);
INSERT INTO Address(County,City,Street,Numberr) VALUES
('Aktobe obl','Aktobe','Astana',13),
('Batys Kaz obl','Oral','Seifullin',2 ),
('Mangystau obl','Zhanaozen','Abai',34);
SELECT * FROM Address;

CREATE TABLE Person
(Id int not null primary key auto_increment,
FirstName varchar(50)not null,
LastName varchar(50) not null,
PhoneNumber int null,
Birthdate date,
AddressId int,
unique(AddressId),
foreign key (AddressId) references Address(Id) on delete cascade
);
ALTER TABLE Person
ADD CONSTRAINT Unique key(PhoneNumber);
ALTER TABLE Person
MODIFY COLUMN PhoneNumber VARCHAR(11);

INSERT INTO Person(FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES
('Assel','Uzakova',87476184457,'1999-07-18',1),
('Adil','Serikkhanov',87476008203,'1995-09-09',2),
('Tumar','Toibayeva',87777777777,'1994-10-09',3),
('Rakhat','Serikkhanov',87788888888,'1994-09-25',4);
INSERT INTO Person(FirstName, LastName, PhoneNumber, BirthDate, AddressId) VALUES
('Abdurakhman','Berikov',Null,'2022-10-02',5);
SELECT * FROM Person;

CREATE TABLE Student
(Id int not null primary key auto_increment,
PersonId int,
Descriptionn varchar(100),
unique(PersonId),
foreign key (PersonId) references Person(Id) on delete cascade
);

INSERT INTO Student(PersonId,Descriptionn) VALUES 
(1,'dewd'),
(2,'ek2'),
(3,'frfref'),
(4,'fdrf'),
(5,'frds');
SELECT * FROM Student;

CREATE TABLE Teacher
(Id int not null primary key auto_increment,
Position varchar(50),
PersonId int,
unique(PersonId),
foreign key (PersonId) references Person(Id) on delete cascade
);

INSERT INTO Teacher(Position,PersonId) VALUES 
('VFD',1),
('cdsv',2),
('cdfsv',3),
('fsd',4),
('vdfv',5);
SELECT * FROM Teacher;

CREATE TABLE Course
(Id int not null primary key auto_increment,
Namee varchar(50),
Credits int not null,
Descriptionn varchar(100),
TeacherId int,
foreign key (TeacherId) references Teacher(Id)
);

INSERT INTO Course(Namee,Credits,Descriptionn,TeacherId) VALUES
('Fizika',5,'vfd',1),
('Biologiya',3,'dsfsa',2),
('Matem',5,'vrvvfd',3),
('Geometriya',4,'vfdv',3),
('Chemistry',2,'dsa',4);
SELECT * FROM Course;

