<?php
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
$quiz = findById($id);
pre_dump($quiz);
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
    <div class="mondai">
      <span class="id"><?php echo $id; ?></span>
      <span class="question"><?php echo h($quiz['question']); ?></span>
    </div>
    <div class="kotae">
      <form action="answer.php" method="post">
        <input type="text" name="answer"/>
        <input type="hidden" name="id" value="<?php echo $id; ?>"/>
        <input type="submit" value="送信"/>
      </form>
    </div>
    <script>
    'use strict';

    </script>
  </body>
</html>


<!-- 修正時刻: Sun 2024/03/31 07:29:52 -->
