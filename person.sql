-- person.sql
-- user: sampleuser
-- password: 1234

USE sample;

DROP TABLE IF EXISTS gender;

CREATE TABLE gender (
  gid CHAR(1) PRIMARY KEY,
  gname VARCHAR(3)
);

INSERT INTO gender (gid, gname) VALUES
('0', '不明'),
('1', '男性'),
('2', '女性'),
('3', 'その他');


-- =============== course表 =============
DROP TABLE IF EXISTS course;

CREATE TABLE course (
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(50)
);

INSERT INTO course (cname) VALUES
('HTML/CSSコース'),
('JavaScriptコース'),
('PHPコース'),
('Javaコース'),
('サーブレットJSPコース');

-- ============ person表 =================
DROP TABLE IF EXISTS person;

CREATE TABLE person (
  id int PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20),
  g_id CHAR(1),
  birthday DATE,
  s_id CHAR(2),
  c_id INT
);

INSERT INTO person (name, g_id, birthday, s_id, c_id) VALUES
('染谷翔太', '1', '1992/09/03', '13', 2),
('二階堂ふみ', '2', '1994/09/21', '47', 3),
('渡辺哲', '1', '1950/03/11', '23', 4),
('窪塚洋介', '1', '1979/05/07', '14', 1),
('吉高由里子', '2', '1988/07/22', '13', 4);


SELECT * FROM person;

DROP VIEW IF EXISTS person_v;

CREATE VIEW person_v AS
SELECT
    p.id AS ID,
    p.name AS 名前,
    g.gname AS 性別,
    timestampdiff(YEAR, p.birthday, curdate()) as 年齢,
    s.sname AS 出身,
    c.cname AS コース
  FROM person p
  INNER JOIN gender g
  ON p.g_id = g.gid
    INNER JOIN state s
    ON p.s_id = s.sid
      INNER JOIN course c
      ON p.c_id = c.cid;

SELECT * FROM person_v;
