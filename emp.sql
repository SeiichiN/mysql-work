-- sampleuser で実行する
-- mysql -u sampleuser -p
-- Password: 1234

-- データベースの作成
CREATE DATABASE IF NOT EXISTS sample;

-- データベースの選択
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
('001', '総務部'),
('002', '営業部'),
('003', '経理部'),
('004', '開発部');

ALTER TABLE emp AUTO_INCREMENT = 1;

INSERT INTO emp (name, age, birthday, dept_id) VALUES
('菅原文太', 40, 1933, '001'),
('千葉真一', 34, 1939, '002'),
('北大路欣也', 30, 1943, '003'),
('梶芽衣子', 26, 1947, '002');


SELECT * FROM emp;
SELECT * FROM dept;

create view emp_v as
select emp.id as ID, emp.name as 名前, 
    age as 年齢, dept.name as 部署名 
  from emp 
  inner join dept
    on emp.dept_id = dept.id
    order by ID;
