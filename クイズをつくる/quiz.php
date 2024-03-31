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

$questions = findAll();
// pre_dump($questions);
?>
<!doctype html>
<html lang="ja">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title></title>
  </head>
  <body>
    <h1>QUIZ</h1>
    <?php foreach ($questions as $quiz) : ?>
      <div class="mondai">
        <span class="id"><?php echo h($quiz['id']); ?></span>
        <span class="question"><?php echo h($quiz['question']); ?></span>
      </div>
      <div class="kotae">
        <form ascito="answer.php" method="post">
          <input type="text" name="answer"/>
          <input type="submit" value="送信"
        </form>
      </div>
    <?php endforeach; ?>
    <script>
    'use strict';

    </script>
  </body>
</html>


<!-- 修正時刻: Sun 2024/03/31 07:29:52 -->
