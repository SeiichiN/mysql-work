-- �f�[�^�x�[�X sample

create database sample;
use sample;

-- �e�[�u�� person
-- id int �v���C�}���L�[
-- ���O �ϒ������� 20�����ȓ�
-- ���� char(1)     // �Œ蒷����1�����i�S�p��ok)
--                  // '�j', '��', '��'
--                  // 'm', 'f', 'o'
-- birthday DATE    // '1992/09/03' ������œ��͂���

create table person (
  id int primary key auto_increment,
  name varchar(20),
  gender char(1),
  birthday date
);

insert into person
  (name, gender, birthday)
values
  ('���J����', '�j', '1992/09/03'),
  ('��K���ӂ�', '��', '1994/09/21'),
  ('�n�ӓN', '�j', '1950/03/11'),
  ('�E�˗m��', '�j', '1979/05/07'),
  ('�g���R���q', '��', '1988/07/22');

-- �C������: Thu 2023/09/28 20:19:22
