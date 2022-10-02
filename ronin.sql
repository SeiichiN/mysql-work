-- ronin.sql
-- 映画『浪人街』

CREATE DATABASE IF NOT EXISTS ronin\g

USE ronin\g

DROP TABLE IF EXISTS cast\g

CREATE TABLE cast (
  id INT,
  name VARCHAR(20),
  gender CHAR(1),
  birthday DATE,
  state VARCHAR(10),
  affil VARCHAR(20)
)\g

INSERT INTO cast
VALUES
(1, '勝新太郎', 'm', '1931-11-29', '千葉県', '勝プロ'),
(2, '樋口可奈子', 'f', '1958-12-13', '新潟県', 'ユマニテ'),
(3, '石橋蓮司', 'm', '1941-08-09', '東京都', '劇団第七病棟'),
(4, '田中邦衛', 'm', '1932-11-23', '岐阜県', '俳優座'), 
(5, '杉田かおる', 'f', '1964-11-27', '東京都', 'オフィスPS'),
(6, '中尾彬', 'm', '1942-08-11', '千葉県', '古館プロジェクト')\g




-- 修正時刻: Sun 2022/10/02 10:22:58
