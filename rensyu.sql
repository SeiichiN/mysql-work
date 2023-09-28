
create database rensyu;

use rensyu;

create table emp (
  id        int           primary key,
  name      varchar(20),
  age       int,
  birthyear year,
  dept      varchar(20)
);

insert into emp
  (id, name, age, birthyear, dept)
 values
  (1, '›Œ´•¶‘¾', 40, 1933, '‘–±•”'),
  (2, 'ç—t^ˆê', 34, 1939, '‰c‹Æ•”'),
  (3, '–k‘å˜H‹Ó–ç', 30, 1943, 'Œo—•”'),
  (4, 'Š‰èˆßq', 26, 1947, '‰c‹Æ•”');
   
   

select * from emp;
