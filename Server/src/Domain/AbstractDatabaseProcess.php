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

    // $db = \Server\App::$config['db'];
    print_r(CFG);
    $dsn = CFG['DB_DSN'];
    $usr = CFG['DB_USER'];
    $pwd = CFG['DB_PASS'];

    $this->dbc = new PDO($dsn, $usr, $pwd, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

    // $this->dbc = new PDO('sqlite:./$$data/series-tracker.db', null, null, [PDO::ATTR_PERSISTENT => true]);
  }

  public function __construct()
  {
    $this->connect();
  }
}