<?php declare(strict_types=1);

/**
 * Get all monitored series items with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, Series};
use Server\Domain\DefaultDatabase;

final class SeriesGetAllProcess extends AbstractProcess
{
  public function __construct(private DefaultDatabase $dbc)
  {
  }

  private function createQuery(): string
  {
    $sql = <<<'SQL'
      SELECT series_id, name, release_year, season_min, season_max
      FROM tracker.series
      SQL;

    return $sql;
  }

  public function execute(): void
  {
    $this->results = new \StdClass;

    $sql = $this->createQuery();
    $stm = $this->dbc->query($sql);

    foreach ($stm as $r) {
      $o = new Series(new SeriesId($r->series_id), $r->name, $r->release_year, $r->season_min, $r->season_max);
      $this->results->{$r->series_id} = $o;
    }
  }
}