-- ronin.sql
-- 映画『浪人街』

CREATE DATABASE IF NOT EXISTS ronin\g

USE ronin\g

source state_utf8.sql

DROP TABLE IF EXISTS cast\g

CREATE TABLE cast (
  id INT,
  name VARCHAR(20),
  gender CHAR(1),
  birthday DATE,
  s_id CHAR(2),
  affil VARCHAR(20)
)\g

INSERT INTO cast
VALUES
(1, '勝新太郎', 'm', '1931-11-29', '12', '勝プロ'),
(2, '樋口可奈子', 'f', '1958-12-13', '15', 'ユマニテ'),
(3, '石橋蓮司', 'm', '1941-08-09', '13', '劇団第七病棟'),
(4, '田中邦衛', 'm', '1932-11-23', '21', '俳優座'), 
(5, '杉田かおる', 'f', '1964-11-27', '13', 'オフィスPS'),
(6, '中尾彬', 'm', '1942-08-11', '12', '古館プロジェクト')\g




-- 修正時刻: Tue 2022/10/04 18:34:10
