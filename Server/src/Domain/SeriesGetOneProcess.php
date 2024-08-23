<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, Series};
use \PDO;

final class SeriesGetOneProcess extends AbstractDatabaseProcess
{
  public function __construct(private SeriesId $seriesId)
  {
    parent::__construct();
  }

  private function createQuery() : string
  {
    $sql = <<<'SQL'
      SELECT series_id, name, release_year, season_min, season_max
      FROM tracker.series
      WHERE series_id = :seriesId
      LIMIT 1
      SQL;

    return $sql;
  }

  public function execute() : void
  {
    $this->results = [];

    $sql = $this->createQuery();
    $stm = $this->dbc->prepare($sql, [PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY]);
    $stm->setFetchMode(PDO::FETCH_OBJ);
    $stm->execute(['seriesId' => $this->seriesId]);

    $rsi = $stm->getIterator();
    if ($rsi->valid()) {
      $r = $rsi->current();
      $o = new Series(new SeriesId($r->series_id), $r->name, $r->release_year, $r->season_min, $r->season_max);
      array_push($this->results, $o);
    }
  }
}