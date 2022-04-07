-- person.sql
-- user: sampleuser
-- password: 1234

-- ============ gender�\ ========================
DROP TABLE IF EXISTS gender;

CREATE TABLE gender (
  gid CHAR(1) PRIMARY KEY,
  gname VARCHAR(3)
);

INSERT INTO gender (gid, gname) VALUES
('0', '�s��'),
('1', '�j��'),
('2', '����'),
('3', '���̑�');

-- =============== state�\ ================
DROP TABLE IF EXISTS state;

CREATE TABLE state (
  sid CHAR(2) PRIMARY KEY,
  sname VARCHAR(5)
);

-- =============== course�\ =============
DROP TABLE IF EXISTS course;

CREATE TABLE course (
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(50)
);

INSERT INTO course (cname) VALUES
('HTML/CSS�R�[�X'),
('JavaScript�R�[�X'),
('PHP�R�[�X'),
('Java�R�[�X'),
('�T�[�u���b�gJSP�R�[�X');

-- ============ person�\ =================
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
('���J�đ�', '1', '1992/09/03', '13', 2),
('��K���ӂ�', '2', '1994/09/21', '47', 3),
('�n�ӓN', '1', '1950/03/11', '23', 4),
('�E�˗m��', '1', '1979/05/07', '14', 1),
('�g���R���q', '2', '1988/07/22', '13', 4);


SELECT * FROM person;
