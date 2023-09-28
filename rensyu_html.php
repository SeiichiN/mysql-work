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
?>

<!doctype html>
<html lang="ja">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title>サンプル</title>
    <style>
     table { border-collapse: collapse; }
     th, td { border: solid 1px #aaa; padding: 5px 8px; }
     th { text-align: left; }
    </style>
  </head>
  <body>
    <h1>社員一覧</h1>

    <table>
      <tr>
        <th>id</th>
        <th>名前</th>
        <th>年齢</th>
        <th>誕生年</th>
        <th>部署</th>
      </tr>
      <?php foreach ($data as $row): ?>
        <tr>
          <td><?= $row['id'] ?></td>
          <td><?= $row['name'] ?></td>
          <td><?= $row['age'] ?></td>
          <td><?= $row['birthyear'] ?></td>
          <td><?= $row['dept'] ?></td>
        </tr>
      <?php endforeach; ?>
    </table>
  </body>
</html>

<!-- 修正時刻: Fri 2023/09/29 06:42:38 -->
