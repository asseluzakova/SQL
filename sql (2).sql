CREATE DATABASE  family;
use family;
CREATE TABLE FamilyMembers
(member_id int not null primary key ,
statuss varchar(100),
member_name varchar(100),
birthdate date
);

CREATE TABLE Payments
(payment_id int not null primary key auto_increment,
good_name varchar(100) not null,
amount decimal not null,
datee date not null
);

CREATE TABLE FamilyFriends
(friend_id int not null primary key,
friend_name varchar(100),
member_name varchar(100),
friend_age int 
);