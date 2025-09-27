-- sample_null.sql

create database if not exists sample_null;
use sample_null;

drop table if exists members;

create table members (
  id int primary key auto_increment,
  name varchar(100) ,
  age int not null,
  dept_id char(3)
);

insert into members
(name, age)
values
('染谷翔太',   33),
('二階堂ふみ', 24),
('', 45),
('窪塚洋介', 0)\g

insert into members
(name)
values
('吉高由里子')\g



select * from members;


-- 修正時刻: Sat 2025/09/27 07:06:42
