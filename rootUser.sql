-- sampleuser を作成する
-- rootユーザーで実行

GRANT ALL ON sample.* TO 'sampleuser'@'localhost' IDENTIFIED BY '1234';

GRANT ALL ON sample2.* TO 'sampleuser'@'localhost';


