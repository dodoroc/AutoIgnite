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


$f0 = new \Fiber(function () use (&$dbc0): void {
   //$parm = Fiber::suspend('fiber');
   //echo "Value used to resume fiber: ", $parm, PHP_EOL;
  $dbc0->query('select pg_sleep(35)');
  \Fiber::suspend('0');
});
$f1 = new \Fiber(function () use (&$dbc1): void {
   //$parm = Fiber::suspend('fiber');
   //echo "Value used to resume fiber: ", $parm, PHP_EOL;
  $dbc1->query('select pg_sleep(36)');
  \Fiber::suspend('1');
});
$f2 = new \Fiber(function () use (&$dbc2): void {
   //$parm = Fiber::suspend('fiber');
   //echo "Value used to resume fiber: ", $parm, PHP_EOL;
  $dbc2->query('select pg_sleep(37)');
  \Fiber::suspend('2');
});

echo "\nstart ", time();

$f0->start();
$f1->start();
$f2->start();

echo "\nwaiting ", time();

$f0->resume();
$f1->resume();
$f2->resume();



// sleep(40);
echo "\ndone ", time();
echo "\n\n";
