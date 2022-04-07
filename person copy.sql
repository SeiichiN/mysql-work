-- person.sql
-- user: sampleuser
-- password: 1234

DROP TABLE IF EXISTS person;

CREATE TABLE person (
  id int PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20),
  gender CHAR(1),
  birthday DATE,
  state VARCHAR(5),
  course VARCHAR(50)
);

INSERT INTO person (name, gender, birthday, state, course) VALUES
('染谷翔太', '男', '1992/09/03', '東京都', 'JavaScriptコース'),
('二階堂ふみ', '女', '1994/09/21', '沖縄県', 'PHPコース'),
('渡辺哲', '男', '1950/03/11', '愛知県', 'Javaコース'),
('窪塚洋介', '男', '1979/05/07', '神奈川県', 'HTML/CSSコース'),
('吉高由里子', '女', '1988/07/22', '東京都', 'Javaコース');


