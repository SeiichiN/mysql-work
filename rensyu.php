<?php

function connect() {
  $db_user = 'root';
  $db_pass = 'root';
  $db_name = 'rensyu';
  $db_host = 'localhost';
  $dsn = "mysql:host={$db_host};dbname={$db_name};charset=utf8";
  
  try {
    $pdo = new PDO($dsn, $db_user, $db_pass);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  } catch (Exception $e) {
    echo 'データベースに接続できませんでした。' . $e->getMessage();
    exit();
  }
  return $pdo;
}

function findAll () {
  $sql = "SELECT * FROM emp";
  
  $pdo = connect();
  try {
    $stm = $pdo->prepare($sql);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);
  } catch (Exception $e) {
    echo 'データベース処理エラー' . $e->getMessage();
    exit();
  }
  return $result;
}

$data = findAll();

echo 'id name age birthyear dept', PHP_EOL;
foreach ($data as $row) {
  echo $row['id'], ' ';
  echo $row['name'], ' ';
  echo $row['age'], ' ';
  echo $row['birthyear'], ' ';
  echo $row['dept'], PHP_EOL;
}

// 修正時刻: Fri 2023/09/29 06:42:38
