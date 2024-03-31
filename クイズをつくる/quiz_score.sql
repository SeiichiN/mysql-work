--
-- quiz_score.sql
-- ユーザーごとのクイズの得点を記録する
--

CREATE DATABASE IF NOT EXISTS quiz_score;

USE quiz_score;

DROP TABLE IF EXISTS score;

CREATE TABLE `score` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(100),
  q01 INT,
  q02 INT,
  q03 INT,
  q04 INT,
  q05 INT,
  q06 INT,
  q07 INT,
  q08 INT,
  q09 INT,
  q10 INT
);

INSERT INTO score
(user_name, q01, q02, q03, q04, q05, q06, q07, q08, q09, q10)
VALUES
('菅原文太', 10,  0,   10,  10,  0,   0,   10,  10,  10,  10),
('千葉真一', 10,  10,   0,  0,   10,  10,   10,  10,  10,  10);

SELECT * FROM score;

-- DROP TABLE IF EXISTS users;

-- CREATE TABLE users (
--   id INT AUTO_INCREMENT,
--   name VARCHAR(100),
--   password VARCHAR(100),
--   PRIMARY KEY (id)
-- );

-- INSERT INTO users
-- (name, password)
-- VALUES
-- ('菅原文太', 'bunta'),
-- ('千葉真一', 'shinichi');

-- SELECT * FROM users;

SELECT
  user_name AS name,
  q01, q02, q03, q04, q05, q06, q07, q08, q09, q10,
  (q01 + q02 + q03 + q04 + q05 + q06 + q07 + q08 + q09 + q10) AS total
FROM score
ORDER BY id ASC;




-- 修正時刻: Sun 2024/03/31 07:29:52
