<?php declare(strict_types=1);

/**
 *
 */
namespace Test;

require '../vendor/autoload.php';


use \PDO;
use Server\DepContainer;

echo "\n\npreinit\n\n";
// echo (int)class_exists("DepContainer", false),"\n";
// echo (int)class_exists("DepContainer", true),"\n";
// echo (int)class_exists("\DepContainer", false),"\n";
// echo (int)class_exists("\DepContainer", true),"\n";
// echo (int)class_exists("Server\DepContainer", false),"\n";
// echo (int)class_exists("Server\DepContainer", true),"\n";
// echo (int)class_exists("\Server\DepContainer", false),"\n";
// echo (int)class_exists("\Server\DepContainer", true),"\n";
echo "\n\n";

$cfg1 = parse_ini_file('../../.secrets/.ini', true);
define('CONFIG', $cfg1);


DepContainer::register('projects-dbc', function() {
  $dbc = null;

  try {
    $dsn = CONFIG['dsn']['projects'];

    $dbc = new PDO($dsn, null, null, [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
      PDO::ATTR_PERSISTENT => true,
    ]);
  }
  catch (Exception $ex) {}

  return $dbc;
});

echo "\npre start ", time();

//*
$dsn = CONFIG['dsn']['projects'];

$dbc0 = new PDO($dsn, null, null, [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
  PDO::ATTR_PERSISTENT => true,
]);
//*/

$dbc1 = DepContainer::get('projects-dbc');
$dbc2 = DepContainer::get('projects-dbc');

echo "\nstart ", time();

$pid = pcntl_fork();
if (!$pid) {
  echo "\nchild 0 ", time();
  $dbc0->query('select pg_sleep(35)');
  // exit($i);
}
$pid = pcntl_fork();
if (!$pid) {
  echo "\nchild 1 ", time();
  $dbc1->query('select pg_sleep(36)');
  // exit($i);
}
$pid = pcntl_fork();
if (!$pid) {
  echo "\nchild 2 ", time();
  $dbc2->query('select pg_sleep(37)');
  // exit($i);
}


echo "\nwaiting ", time();


while (pcntl_waitpid(0, $status) != -1) {
  $status = pcntl_wexitstatus($status);
  echo "\nchild $status completed ", time();
}

echo "\ndone1 ", time();
sleep(40);
echo "\ndone2 ", time();
echo "\n\n";
