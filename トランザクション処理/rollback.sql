--
-- トランザクション処理でデータを挿入する
-- rollback
--

--
-- database: rensyu
-- table: dept, emp
--

USE rensyu;

BEGIN;
-- start transaction;

INSERT INTO dept VALUES
('005', '人事部');

INSERT INTO emp
(name, age, birthyear, dept_id)
VALUES
('山下一郎', 34, 1990, '005');

ROLLBACK;

-- 修正時刻: Thu 2024/09/26 09:17:54
