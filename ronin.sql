
-- f[^x[XÌ¼O
create database if not exists ronin;
use ronin;

drop table if exists cast;

-- e[uÌ¼OEè`
create table cast (
  id int primary key auto_increment,
  name varchar(20),
  gender char(1),
  birthday date,
  state varchar(10),
  office varchar(20)
);

insert into cast 
  (name, gender, birthday, state, office)
values
('V¾Y',   'm', '1931-11-29', 'çt§', 'v'),
('óûÂÞq', 'f', '1958-12-13', 'V§', '}je'),
('Î´@i',   'm', '1941-08-09', 's', 'cæµa'),
('cMq',   'm', '1932-11-23', 'ò§', 'oDÀ'),
('c©¨é', 'f', '1964-11-27', 's', 'ItBXPS'),
('öj',     'm', '1942-08-11', 'çt§', 'ÃÙvWFNg');

-- C³: Thu 2023/09/28 22:33:25
