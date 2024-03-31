<?php
session_start();
if (!isset($_SESSION['total'])) {
  $_SESSION['total'] = 0;
}

require_once('functions.php');

if (isset($_POST['id']) && strlen($_POST['id']) > 0) {
  $_id = $_POST['id'];
  if (ctype_digit($_id)) {
    $id = (int)$_id;
  } else {
    die('アプリが異常を検出しました。終了します。');
  }
} else {
  $id = 1;
}

if (isset($_POST['answer']) && mb_strlen($_POST['answer']) > 0) {
  $answer = trim($_POST['answer']);
}
$quiz = findById($id);
pre_dump($quiz);
if ($quiz['answer'] === $answer) {
  $msg = "正解です";
  $_SESSION['total'] += $quiz['score'];
} else {
  $msg = "違います";
}
?>
<!doctype html>
<html lang="ja">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title></title>
  </head>
  <body>
    <h1>第<?php echo $id ?>問</h1>
    <p><?php echo $msg; ?></p>
    <p>
      <?php if ($id < 10): ?>
        <form action="quiz_id.php" method="post">
          <input type="hidden" name="id" value="<?php echo ($id + 1); ?>"/>
          <input type="submit" value="次の問題">
        </form>
      <?php else: ?>
        <form action="total.php" method="get">
          <input type="submit" value="結果">
        </form>
      <?php endif; ?>
    </p>
    <script>
    'use strict';

    </script>
  </body>
</html>
<!-- 修正時刻: Sun 2024/03/31 07:29:52 -->
