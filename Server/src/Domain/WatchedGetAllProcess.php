<?php declare(strict_types=1);

/**
 * Get all ignored entities
 *
 */

namespace Server\Domain;

use \PDO;

final class WatchedGetAllProcess extends AbstractProcess
{
  private PDO|null $dbc = null;

  public function __construct()
  {
    $this->dbc = \Server\DepContainer::get('projects-dbc');
  }

  private function createQuery() : string
  {
    $sql = <<<'SQL'
      SELECT program_id
      FROM tracker.watched;
      SQL;

    return $sql;
  }

  public function execute() : void
  {
    $this->results = new \StdClass;

    $sql = $this->createQuery();
    $stm = $this->dbc->query($sql);

    foreach ($stm as $r) {
      $this->results->{$r->program_id} = null;
    }
  }
}