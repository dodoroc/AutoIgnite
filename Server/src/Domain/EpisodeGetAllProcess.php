<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, ProgramId, Episode};
use \PDO;

final class EpisodeGetAllProcess extends AbstractDatabaseProcess
{
  private function createQuery() : string
  {
    $sql = <<<'SQL'
      SELECT series_id, name, air_date
      FROM tracker.episode
      SQL;

    return $sql;
  }

  public function execute() : void
  {
    $this->results = [];

    $sql = $this->createQuery();
    $stm = $this->dbc->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
    $stm->setFetchMode(PDO::FETCH_OBJ);

    foreach ($stm as $r) {
      $o = new Episode(new SeriesId($r->series_id), $r->name, $r->air_date);
      array_push($this->results, $o);
    }
  }
}