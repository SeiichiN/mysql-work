
create database sample_table;
use sample_table;

create table members (
  id int primary key auto_increment,
  namae varchar(100),
  age int
);

insert into members
 (namae, age)
values
 ('���X�؏����Y', 25),
 ('�{�{����', 27);

alter table members
add
  gender char(1) after namae;

update members
set gender = '�j'
  where id = 1;

update members
set gender = '�j'
  where id = 2;

alter table members
change column namae name varchar(100);


  