
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
  (1, '��������', 40, 1933, '������'),
  (2, '��t�^��', 34, 1939, '�c�ƕ�'),
  (3, '�k��H�Ӗ�', 30, 1943, '�o����'),
  (4, '����ߎq', 26, 1947, '�c�ƕ�');
   
   

select * from emp;
