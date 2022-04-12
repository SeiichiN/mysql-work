-- sampleuser �Ŏ��s����
-- mysql -u sampleuser -p
-- Password: 1234

-- �f�[�^�x�[�X�̍쐬
CREATE DATABASE IF NOT EXISTS sample;

-- �f�[�^�x�[�X�̑I��
USE sample;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- table create 'dept'
CREATE TABLE dept (
  id CHAR(3) PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

-- table create 'emp'
CREATE TABLE emp (
  id INT AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  age INT NOT NULL,
  birthday YEAR NOT NULL,
  dept_id CHAR(3),
  PRIMARY KEY (id),
  CONSTRAINT fk_dept_id
  FOREIGN KEY (dept_id) REFERENCES dept (id)
);

INSERT INTO dept VALUES
('001', '������'),
('002', '�c�ƕ�'),
('003', '�o����'),
('004', '�J����');

ALTER TABLE emp AUTO_INCREMENT = 1;

INSERT INTO emp (name, age, birthday, dept_id) VALUES
('��������', 40, 1933, '001'),
('��t�^��', 34, 1939, '002'),
('�k��H�Ӗ�', 30, 1943, '003'),
('����ߎq', 26, 1947, '002');


SELECT * FROM emp;
SELECT * FROM dept;

create view emp_v as
select emp.id as ID, emp.name as ���O, 
    age as �N��, dept.name as ������ 
  from emp 
  inner join dept
    on emp.dept_id = dept.id
    order by ID;
