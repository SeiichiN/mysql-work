--
-- database: web_school
--

CREATE DATABASE web_school;
USE web_school;

--
-- state表
--

source state.sql;

--
-- course表
--

DROP TABLE IF EXISTS course;

CREATE TABLE course (
  id   CHAR(3) PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

INSERT INTO course VALUES
('C01', 'JavaScript'),
('C02', 'PHP'),
('C03', 'Java'),
('C04', 'HTML/CSS'),
('C05', 'Python');

--
-- students表
--

DROP TABLE IF EXISTS students;

CREATE TABLE students (
  id        INT         AUTO_INCREMENT,
  name      VARCHAR(50) NOT NULL,
  gender    CHAR(1),
  birthday  DATE        NOT NULL,
  state_id  CHAR(2),
  course_id CHAR(3),
  PRIMARY KEY (id)
);

INSERT INTO students
  (name, gender, birthday, state_id, course_id)
VALUES
  ('染谷翔太',   '男', '1992/09/03', '13', 'C01'),
  ('二階堂ふみ', '女', '1994/09/21', '47', 'C02'),
  ('渡辺哲',     '男', '1950/03/11', '23', 'C03'),
  ('窪塚洋介',   '男', '1979/06/07', '14', 'C04'),
  ('吉高由里子', '女', '1988/07/22', '13', 'C03');

--
-- 結合
--

SELECT
  *
FROM students s
  INNER JOIN state st
  ON s.state_id = st.id
    INNER JOIN course c
    ON s.course_id = c.id
ORDER BY s.id ASC;







-- 修正時刻: Sat 2024/09/28 09:35:33
