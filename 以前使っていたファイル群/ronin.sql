
-- データベースの名前
create database if not exists ronin;
use ronin;

drop table if exists cast;

-- テーブルの名前・定義
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
('勝新太郎',   'm', '1931-11-29', '千葉県', '勝プロ'),
('樋口可奈子', 'f', '1958-12-13', '新潟県', 'ユマニテ'),
('石橋蓮司',   'm', '1941-08-09', '東京都', '劇団第七病棟'),
('田中邦衛',   'm', '1932-11-23', '岐阜県', '俳優座'),
('杉田かおる', 'f', '1964-11-27', '東京都', 'オフィスPS'),
('中尾彬',     'm', '1942-08-11', '千葉県', '古館プロジェクト');

-- 修正時刻: Thu 2023/09/28 22:33:25
