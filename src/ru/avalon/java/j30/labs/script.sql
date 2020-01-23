
-- Создание таблиц
create table UserInfo
(id integer primary key generated always as identity (start with 1, increment by 1),
name varchar(255) not null,
surname varchar(255) not null);

create table Roles
(id integer unique generated always as identity (start with 1, increment by 1),
name varchar(255) primary key);

create table Users
(id integer unique generated always as identity (start with 1, increment by 1),
email varchar(255) primary key,
password varchar(255),
info integer references UserInfo(id),
role integer references Roles(id));

create table Orders
(id integer primary key generated always as identity (start with 1, increment by 1),
users integer references Users(id),
created timestamp);

create table Supplier
(id integer unique generated always as identity (start with 1, increment by 1),
name varchar(255) primary key,
address varchar(255) not null,
phone varchar(255),
representative varchar(255) not null);

create table Product
(id integer unique generated always as identity (start with 1, increment by 1),
code varchar(255) primary key,
title varchar(255),
supplier integer references Supplier(id),
initial_price double,
retail_value double);

create table Order2Product
(orders integer references Orders(id),
product integer references Product(id));

-- Добавление записей

insert into UserInfo(name, surname) values ('Иван','Соколовский');
insert into UserInfo(name, surname) values ('Петр','Дыков');
insert into UserInfo(name, surname) values ('Даниил','Котомцев');

insert into Roles(name) values ('a');
insert into Roles(name) values ('b');
insert into Roles(name) values ('c');

insert into Users(email) values ('dfgh@mail.ru');
insert into Users(email) values ('bbbb@gmail.com');
insert into Users(email) values ('eee@yandex.ru');

insert into Supplier(name, address, representative) values ('Иван', 'Moscow', 'ok');
insert into Supplier(name, address, representative) values ('Петр', 'SPB', 'ok');
insert into Supplier(name, address, representative) values ('Даниил', 'NY', 'ok');

insert into Product (code) values ('майка');
insert into Product (code) values ('шорты');
insert into Product (code) values ('кепка');

insert into Orders (users) values (1);
insert into Orders (users) values (2);
insert into Orders (users) values (3);

insert into Order2Product (orders, product) values (1, 1);
insert into Order2Product (orders, product) values (2, 2);
insert into Order2Product (orders, product) values (2, 2);
