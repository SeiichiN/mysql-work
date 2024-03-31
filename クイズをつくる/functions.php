<?php
function h($str) {
  return htmlspecialchars($str, ENT_QUOTES, "UTF-8");
}

function pre_dump($str) {
  echo '<pre>';
  var_dump($str);
  echo '</pre>';
}

function connect() {
  $db_name = 'quiz';
  $db_host = 'localhost';
  $db_user = 'quizuser';
  $db_pass = 'quizuser';
  $dsn = "mysql:host={$db_host};dbname={$db_name};charset=utf8";
  $pdo = new PDO($dsn, $db_user, $db_pass);
  $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  return $pdo;
}

function findAll() {
  $result = null;
  try {
    $pdo = connect();
    $sql = "SELECT * FROM question";
    $stm = $pdo->prepare($sql);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);
  } catch (PDOException $e) {
    echo "データベースエラー";
    echo $e->getMessage();
  } finally {
    $pdo = null;
  }
  return $result;
}

function findById($id) {
  $result = null;
  try {
    $pdo = connect();
    $sql = "SELECT * FROM question WHERE id = :id";
    $stm = $pdo->prepare($sql);
    $stm->bindValue(':id', $id, PDO::PARAM_INT);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);
  } catch (PDOException $e) {
    echo "データベースエラー";
    echo $e->getMessage();
  } finally {
    $pdo = null;
  }
  return $result[0];
}

// 修正時刻: Sun 2024/03/31 07:29:52
