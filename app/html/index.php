<h2>config</h2>
<?php
require_once '../lib/config.php';
echo '<pre>';
print_r($CONFIG);
echo '</pre>';
?>


<h2>mysql</h2>
<?php
// mysql
try {
  $dbh = new PDO("mysql:host=db;dbname={$CONFIG['MYSQL_DATABASE']}", $CONFIG['MYSQL_USER'], $CONFIG['MYSQL_PASSWORD']);
  echo '<pre>';
  foreach ($dbh->query("select * from test_table") as $row) {
    print_r($row);
  }
  echo '</pre>';
}
catch (Exception $e) {
  print "error: {$e->getMessage()}<br>";
}


phpinfo();
