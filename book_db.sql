-- book_db.sql
-- database: book_db
-- user: book_user
-- pass: 1234

CREATE DATABASE IF NOT EXISTS book_db;
USE book_db;

DROP TABLE IF EXISTS genre;

CREATE TABLE genre (
  id char(3) PRIMARY KEY,
  category varchar(100)
);

INSERT INTO genre
VALUES
('001', '経済'),
('002', '歴史'),
('003', '文学'),
('004', 'コンピュータ');

SELECT * FROM genre;

DROP TABLE IF EXISTS book;

CREATE TABLE book (
  id int AUTO_INCREMENT PRIMARY KEY,
  title varchar(100),
  author varchar(100),
  publish date,
  g_id char(3)
);

INSERT INTO book
  (title, author, publish, g_id)
VALUES
  ('よくわかる経済', '山田健介', '2010/11/3', '001'),
  ('日本文学傑作選', '大原洋子', '1998/3/5', '003'),
  ('日本経済史', '宮本良太', '2016/7/20', '001'),
  ('HTML&CSSとWebデザイン入門講座', 'Mana', '2019/3/16', '004');

SELECT * FROM book;

-- for root
/*
CREATE USER 'book_user'@'%' IDENTIFIED BY '1234';
GRANT ALL ON book_db.* TO 'book_user'@'%';
*/




-- 修正時刻: Wed 2022/10/05 06:44:07
