-- sampleuser で実行する
-- mysql -u sampleuser -p
-- Password: 1234

-- データベースの作成
CREATE DATABASE IF NOT EXISTS sample;

-- データベースの選択
USE sample;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- table create 'emp'
CREATE TABLE emp (
  id INT AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  age INT NOT NULL,
  birthday YEAR NOT NULL,
  dept_id CHAR(3),
  PRIMARY KEY (id)
);

-- table create 'dept'
CREATE TABLE dept (
  id CHAR(3) PRIMARY KEY,
  name VARCHAR(20) NOT NULL
);
