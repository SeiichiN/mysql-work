-- f[^x[X sample

create database sample;
use sample;

-- e[u person
-- id int vC}L[
-- ¼O ÂÏ·¶ñ 20¶Èà
-- «Ê char(1)     // Åè·¶1¶iSpàok)
--                  // 'j', '', '¼'
--                  // 'm', 'f', 'o'
-- birthday DATE    // '1992/09/03' ¶ñÅüÍ·é

create table person (
  id int primary key auto_increment,
  name varchar(20),
  gender char(1),
  birthday date
);

insert into person
  (name, gender, birthday)
values
  ('õJ«¾', 'j', '1992/09/03'),
  ('ñK°ÓÝ', '', '1994/09/21'),
  ('nÓN', 'j', '1950/03/11'),
  ('EËmî', 'j', '1979/05/07'),
  ('gR¢q', '', '1988/07/22');

-- C³: Thu 2023/09/28 20:19:22
