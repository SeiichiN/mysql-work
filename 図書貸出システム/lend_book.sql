--
-- database: lend_book
-- user: bookuser
-- pass: bookuser
--

CREATE DATABASE IF NOT EXISTS lend_book;

USE lend_book;

--
-- member
--

DROP TABLE IF EXISTS member;

CREATE TABLE member (
  id char(4),
  name varchar(100),
  PRIMARY KEY (id)
);

INSERT INTO member VALUES
('n001', '菅原文太'),
('n002', '千葉真一'),
('n003', '北大路欣也'),
('n004', '梶芽衣子');

SELECT * FROM member;

--
-- books
--

DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id char(6),
  name varchar(100),
  author varchar(100),
  PRIMARY KEY (id)
);

INSERT INTO books VALUES
('bk0001', 'HTMLCSS基礎の本', '山田たかし'),
('bk0002', '笑いの本', '木下次郎'),
('bk0003', '日本の歴史', '河本工事');

SELECT * FROM books;

--
-- lending
-- 
DROP TABLE IF EXISTS lending;

CREATE TABLE lending (
  id char(4),
  member_id char(4),
  lend_date DATE,
  return_date DATE,
  PRIMARY KEY (id)
);

INSERT INTO lending VALUES
('k001', 'n001', '2024/03/29', '2024/04/15');

SELECT * FROM lending;

--
-- refer
--
DROP TABLE IF EXISTS refer;

CREATE TABLE refer (
  lending_id char(4),
  books_id char(6),
  PRIMARY KEY (lending_id, books_id)
);

INSERT INTO refer VALUES
('k001', 'bk0001'),
('k001', 'bk0002'),
('k001', 'bk0003');

SELECT * FROM refer;

--
-- join
--
SELECT
  r.lending_id AS 貸出番号,
  l.member_id AS 会員番号,
  m.name AS 会員氏名,
  l.lend_date AS 貸出日,
  l.return_date AS 返却予定日,
  r.books_id AS 書籍番号,
  b.name AS 書籍名,
  b.author AS 著者
FROM refer r
  INNER JOIN lending l
  ON r.lending_id = l.id
    INNER JOIN books b
    ON r.books_id = b.id
      INNER JOIN member m
      ON l.member_id = m.id
ORDER BY r.lending_id ASC;






-- 修正時刻: Sat 2024/03/30 10:42:38
