<?php declare(strict_types=1);

/**
 * NEED DI container and move this into a proper place
 */

namespace Server\Domain;

use \PDO;
use Server\DepContainer;

abstract class AbstractDatabaseProcess extends AbstractProcess
{
  protected PDO|null $dbc = null;

  protected function connect() : void
  {
    // $this->dbc = new PDO('sqlite:./$$data/series-tracker.db', null, null, [PDO::ATTR_PERSISTENT => true]);
    $this->dbc = DepContainer::get('projects-dbc');
  }
}