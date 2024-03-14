-- データベース sample

create database sample;
use sample;

-- テーブル person
-- id int プライマリキー
-- 名前 可変長文字列 20文字以内
-- 性別 char(1)     // 固定長文字1文字（全角もok)
--                  // '男', '女', '他'
--                  // 'm', 'f', 'o'
-- birthday DATE    // '1992/09/03' 文字列で入力する

create table person (
  id int primary key auto_increment,
  name varchar(20),
  gender char(1),
  birthday date
);

insert into person
  (name, gender, birthday)
values
  ('染谷将太', '男', '1992/09/03'),
  ('二階堂ふみ', '女', '1994/09/21'),
  ('渡辺哲', '男', '1950/03/11'),
  ('窪塚洋介', '男', '1979/05/07'),
  ('吉高由里子', '女', '1988/07/22');

-- 修正時刻: Thu 2023/09/28 20:19:22
