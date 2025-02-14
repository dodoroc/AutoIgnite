<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId};
use Server\Domain\DefaultDatabase;
use \PDO;

final class UnwatchedBySeriesIdProcess extends AbstractProcess
{
  public function __construct(private DefaultDatabase $dbc, private SeriesId $seriesId)
  {
  }

  private function createQuery(): string
  {
    $sql = <<<'SQL'
      SELECT tracked.name FROM tracker.tracked
      LEFT JOIN tracker.watched USING (series_id, name)
      WHERE watched.name IS NULL
      AND series_id=:series_id
      SQL;

    return $sql;
  }

  public function execute(): void
  {
    $this->results = [];

    $sql = $this->createQuery();
    $stm = $this->dbc->prepare($sql);
    $stm->bindParam(':series_id', $this->seriesId, PDO::PARAM_STR);
    $stm->execute();

    foreach ($stm as $r) {
      array_push($this->results, $r->name);
    }
  }
}