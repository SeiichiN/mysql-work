-- sample_null.sql

create database if not exists sample_null;
use sample_null;

drop table if exists members;

create table members (
  id int primary key auto_increment,
  name varchar(100),
  age int,
  dept_id char(3)
);

insert into members
(name, age)
values
('���J�đ�',   33),
('��K���ӂ�', 24),
('�n�ӓN',     NULL),
('�E�c�m��',   NULL)\g


select * from members;


-- �C������: Mon 2025/03/31 09:17:42
