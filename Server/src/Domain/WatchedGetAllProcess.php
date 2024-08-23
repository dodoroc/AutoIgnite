<?php declare(strict_types=1);

/**
 * Get all ignored entities
 *
 */

namespace Server\Domain;

use \PDO;

final class WatchedGetAllProcess extends AbstractDatabaseProcess
{
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
    $stm = $this->dbc->query($sql, PDO::FETCH_OBJ);

    foreach ($stm as $r) {
      $this->results->{$r->program_id} = null;
    }
  }
}