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
('õ’JãÄ‘¾',   33),
('“ñŠK“°‚Ó‚İ', 24),
('“n•Ó“N',     NULL),
('ŒE“c—m‰î',   NULL)\g


select * from members;


-- C³: Mon 2025/03/31 09:17:42
