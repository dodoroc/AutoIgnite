<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Domain;

use \PDO;

abstract class AbstractDatabaseProcess extends AbstractProcess
{
  protected PDO|null $dbc = null;

  protected function connect() : void
  {
    // ALTER USER projects_user SET search_path TO tracker;
    // ALTER USER projects_user RESET search_path;
    // SET search_path TO tracker
    // ;options='--client_encoding=UTF8'

    $db = \Server\App::$config['db'];

    $this->dbc = new PDO($db['dsn'], $db['user'], $db['pass'], [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

    // $this->dbc = new PDO('sqlite:./$$data/series-tracker.db', null, null, [PDO::ATTR_PERSISTENT => true]);
  }

  public function __construct()
  {
    $this->connect();
  }
}