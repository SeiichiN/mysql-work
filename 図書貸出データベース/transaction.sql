--
-- �����Y���񂪁u�킽���Ƃ�����Łv���؂肽
-- book_rental�f�[�^�x�[�X
--

USE book_rental;

BEGIN;

-- �ݏo�\�e�[�u�� rent
insert into rent values
('C05', '123457', '2024/10/2', '2024/10/16');


-- �ݏo���Ѓe�[�u�� rent_book
insert into rent_book values
('C05', 'bk002');


-- �G���[�̏ꍇ
-- ROLLBACK;

-- �����̏ꍇ
COMMIT;
