
-- �f�[�^�x�[�X�̖��O
create database if not exists ronin;
use ronin;

drop table if exists cast;

-- �e�[�u���̖��O�E��`
create table cast (
  id int primary key auto_increment,
  name varchar(20),
  gender char(1),
  birthday date,
  state varchar(10),
  office varchar(20)
);

insert into cast 
  (name, gender, birthday, state, office)
values
('���V���Y',   'm', '1931-11-29', '��t��', '���v��'),
('����ގq', 'f', '1958-12-13', '�V����', '���}�j�e'),
('�΋��@�i',   'm', '1941-08-09', '�����s', '���c�掵�a��'),
('�c���M�q',   'm', '1932-11-23', '�򕌌�', '�o�D��'),
('���c������', 'f', '1964-11-27', '�����s', '�I�t�B�XPS'),
('�����j',     'm', '1942-08-11', '��t��', '�Êكv���W�F�N�g');

-- �C������: Thu 2023/09/28 22:33:25
