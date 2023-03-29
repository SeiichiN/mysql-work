-- hobby_view.sql

DROP VIEW IF EXISTS hobby_v;

CREATE VIEW hobby_v
  AS
SELECT
  e.id,
  e.name AS 名前,
  g.name AS 性別,
  e.age AS 年齢,
  d.name AS 部署,
  h.name AS 趣味
FROM emp e
INNER JOIN emp_hobby eh
ON eh.emp_id = e.id
  INNER JOIN hobby h
  ON eh.hobby_id = h.id
    INNER JOIN gender g
    ON e.gender = g.id
      LEFT OUTER JOIN dept d
      ON e.dept_id = d.id
\g


select
*
FROM emp
LEFT OUTER JOIN dept
ON emp.dept_id = dept.id
  INNER JOIN gender
  ON emp.gender = gender.id
    LEFT OUTER JOIN emp_hobby
    ON emp.id = emp_hobby.emp_id
    
  


;; 修正時刻: Mon 2022/10/10 19:35:03
