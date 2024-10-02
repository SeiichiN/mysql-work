--
-- 年齢を自動計算する
-- database: rensyu2
__

create database if not exists rensyu2;

use rensyu2;

drop table if exists emp;

create table emp (
  id        int auto_increment,
  name      varchar(20),
  birthday  date,
  dept      varchar(20),
  primary key (id)
);

insert into emp
  (name, birthday, dept)
 values
  ('菅原文太', '1933/08/16', '総務部'),
  ('千葉真一', '1939/01/22', '営業部'),
  ('北大路欣也', '1943/02/23', '経理部'),
  ('梶芽衣子', '1947/03/24', '営業部');
   
   

select
  id,
  name,
  timestampdiff(year, `birthday`, curdate()) as age,
  birthday,
  dept
from emp;

-- 修正時刻: Thu 2024/09/26 11:20:42
