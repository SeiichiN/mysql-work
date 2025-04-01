
create database nulltest;
use nulltest;

create table test (
  name varchar(10) not null
);

insert into test values
('yama'),
('');

