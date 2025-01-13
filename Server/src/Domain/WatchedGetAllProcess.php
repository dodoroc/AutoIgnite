<?php declare(strict_types=1);

/**
 * Get all ignored entities
 *
 */

namespace Server\Domain;

use Server\Domain\DefaultDatabase;
// use \PDO;

final class WatchedGetAllProcess extends AbstractProcess
{
  public function __construct(private DefaultDatabase $dbc)
  {
  }

  private function createQuery(): string
  {
    $sql = <<<'SQL'
      SELECT program_id
      FROM tracker.watched;
      SQL;

    return $sql;
  }

  public function execute(): void
  {
    $this->results = new \StdClass;

    $sql = $this->createQuery();
    $stm = $this->dbc->query($sql);

    foreach ($stm as $r) {
      $this->results->{$r->program_id} = null;
    }
  }
}