--
-- quiz.sql
--

CREATE DATABASE IF NOT EXISTS quiz;

USE quiz;

DROP TABLE IF EXISTS question;

CREATE TABLE question (
  id INT PRIMARY KEY AUTO_INCREMENT,
  question VARCHAR(255),
  answer VARCHAR(255),
  score INT
);

-- INSERT INTO question
-- (question, answer, score)
-- VALUES
-- ('世界の真ん中には何がある?', 'か', 10),
-- ('赤ずきんちゃんのおばあちゃんを食べた動物は?', 'おおかみ', 10),
-- ('[かっぱの川流れ」と同じ意味のことわざは?', '猿も木から落ちる', 10);

-- CSVファイルの読込みをする。

CREATE USER IF NOT EXISTS 'quizuser'@'localhost'
IDENTIFIED BY 'quizuser';

GRANT ALL ON quiz.* TO 'quizuser'@'localhost';



-- 修正時刻: Sun 2024/03/31 07:29:52
