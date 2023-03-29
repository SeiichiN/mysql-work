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
  ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO dept
VALUES
  ('001', '総務部'),
  ('002', '営業部'),
  ('003', '経理部'),
  ('004', '開発部'),
  ('005', '人事部'),
  ('006', '情報システム部');
  

-- ALTER TABLE emp AUTO_INCREMENT = 1;

INSERT INTO emp
  (name, age, birthday, dept_id)
VALUES
  ('菅原文太', 40, 1933, '001'),
  ('千葉真一', 34, 1939, '002'),
  ('北大路欣也', 30, 1943, '003'),
  ('梶芽衣子', 26, 1947, '002');


SELECT * FROM emp;
SELECT * FROM dept;

DROP VIEW IF EXISTS emp_v;

CREATE VIEW emp_v
  AS
SELECT
  emp.id AS ID,
  emp.name AS 名前, 
  age AS 年齢,
  dept.name AS 部署名 
FROM emp 
INNER JOIN dept
  ON emp.dept_id = dept.id
ORDER BY ID;

SELECT * FROM emp_v;

-- 修正時刻: Wed 2023/03/29 05:51:52
