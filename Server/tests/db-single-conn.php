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
  // PDO::ATTR_PERSISTENT => true,
]);

$dbc1 = new PDO($dsn, null, null, [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
  // PDO::ATTR_PERSISTENT => true,
]);
//*/

// $dbc2 = DepContainer::get('projects-dbc');
// $dbc3 = DepContainer::get('projects-dbc');

echo "\nstart ", time();

// $dbc0->query('select pg_sleep(0)');
// $dbc1->query('select pg_sleep(0)');
// $dbc2->query('select pg_sleep(0)');
// $dbc3->query('select pg_sleep(0)');



echo "\nwaiting ", time();
sleep(40);
echo "\ndone ", time();
echo "\n\n";
