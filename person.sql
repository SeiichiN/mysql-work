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

SELECT
    p.id AS ID,
    p.name AS ���O,
    g.gname AS ����,
    p.birthday AS �a����,
    s.sname AS �o�g,
    c.cname AS �R�[�X
  FROM person p
  INNER JOIN gender g
  ON p.g_id = g.gid
    INNER JOIN state s
    ON p.s_id = s.sid
      INNER JOIN course c
      ON p.c_id = c.cid;