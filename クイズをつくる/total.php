<?php
session_start();
if (!isset($_SESSION['total'])) {
  $_SESSION['total'] = 0;
}

require_once('functions.php');

$total = $_SESSION['total'];
$_SESSION = array();
?>
<!doctype html>
<html lang="ja">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <title></title>
  </head>
  <body>
    <h1>TOTAL</h1>
    <p>合計: <?php echo $total; ?></p>
    <p>
      <form action="quiz_id.php" method="post">
        <input type="hidden" name="id" value="1"/>
        <input type="submit" value="最初の問題"/>
      </form>
    </p>
    <script>
    'use strict';

    </script>
  </body>
</html>

<!-- 修正時刻: Sun 2024/03/31 07:29:52 -->
