create database eigo;

use eigo;

create table eitango (
  id    int    auto_increment,
  toi   varchar(50),
  kotae varchar(50),
  maru  char(1),
  primary key (id)
);

insert into eitango (toi) values
('foreign'),
('reference');

