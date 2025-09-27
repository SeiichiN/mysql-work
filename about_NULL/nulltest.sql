
create database nulltest;
use nulltest;

drop table if exists test;

create table test (
  name varchar(10) not null
);

insert into test values
('yama'),
('');

--
-- ''(空文字)は null ではないので、入力できる。
--





-- 修正時刻: Sat 2025/09/27 07:06:42
