<?php declare(strict_types=1);

/**
 *
 */


use \PDO;
use Server\DepContainer;


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

$dbc1 = DepContainer::get('projects-dbc');
$dbc2 = DepContainer::get('projects-dbc');

sleep(120);
