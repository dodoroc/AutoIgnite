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
    // $this->dbc = new PDO('sqlite:./$$data/series-tracker.db', null, null, [PDO::ATTR_PERSISTENT => true]);

    // ALTER USER projects_user SET search_path TO tracker;
    // ALTER USER projects_user RESET search_path;
    // SET search_path TO tracker


    $dsn = CONFIG['dsn']['projects'];

    $this->dbc = new PDO($dsn);
    $this->dbc->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $this->dbc->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

  }

  public function __construct()
  {
    $this->connect();
  }
}