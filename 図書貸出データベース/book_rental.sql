--
-- �f�[�^�x�[�X��: book_rental
--

CREATE DATABASE IF NOT EXISTS book_rental;

USE book_rental;

DROP TABLE IF EXISTS rent_book;
DROP TABLE IF EXISTS rent;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS member;


--
-- ���Е\
--
CREATE TABLE book (
  id     CHAR(5) PRIMARY KEY,
  name   VARCHAR(100),
  author VARCHAR(100)
);

INSERT INTO book VALUES
('bk001', '���₢�₦��',     '���엛�}�q'),
('bk002', '�킽���Ƃ������', '�G�b�c'),
('bk003', '�G���}�[�̖`��',   '�K�l�b�g'),
('bk004', '�Q�h��L',         '���E�O�E�B��'),
('bk005', '����͂ւ������', '�J��r���Y');

SELECT * FROM book;

--
-- ����\
--
CREATE TABLE member (
  id   CHAR(6) PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO member VALUES
('123456', '�Y�����Y'),
('123457', '�����Y'),
('123458', '������P');

SELECT * FROM member;


--
-- �ݏo�\ rent
--
CREATE TABLE rent (
  id         CHAR(3) PRIMARY KEY,
  member_id  CHAR(6),
  rent_day   DATE,
  return_day DATE,
  FOREIGN KEY (member_id)
  REFERENCES member (id)
);

INSERT INTO rent VALUES
('C01', '123456', '2024/9/30', '2024/10/15'),
('C02', '123456', '2024/9/18', '2024/10/2' ),
('C03', '123457', '2024/9/30', '2024/10/15'),
('C04', '123458', '2024/9/3',  '2024/9/17' );

SELECT * FROM rent;

--
-- �ݏo���Е\ rent_book
--
CREATE TABLE rent_book (
  rent_id CHAR(3),
  book_id CHAR(5),
  PRIMARY KEY (rent_id, book_id)
);

ALTER TABLE rent_book
ADD
  FOREIGN KEY (rent_id) REFERENCES rent (id),
ADD
  FOREIGN KEY (book_id) REFERENCES book (id);
  

INSERT INTO rent_book VALUES
('C01', 'bk001'),
('C01', 'bk002'),
('C02', 'bk003'),
('C03', 'bk004'),
('C03', 'bk005'),
('C04', 'bk001');

SELECT * FROM rent_book;


--
-- �����\ INNER JOIN
--
SELECT
  r.id         AS �ݏo�\,
  m.id         AS ����ԍ�,
  m.name       AS �����,
  b.id         AS ���Дԍ�,
  b.name       AS ���Ж�,
  b.author     AS ����,
  r.rent_day   AS �ݏo��,
  r.return_day AS �ԋp�\���
FROM rent r
  INNER JOIN member m
  ON r.member_id = m.id
    INNER JOIN rent_book rb
    ON r.id = rb.rent_id
      INNER JOIN book b
      ON rb.book_id = b.id
;

