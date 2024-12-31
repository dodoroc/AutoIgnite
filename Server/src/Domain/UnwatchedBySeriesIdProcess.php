<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, ProgramId, Tracked};
use \PDO;

final class UnwatchedBySeriesIdProcess extends AbstractProcess
{
  private PDO|null $dbc = null;

  public function __construct(private SeriesId $seriesId)
  {
    $this->dbc = \Server\DepContainer::get('projects-dbc');
  }

  private function createQuery() : string
  {
    $sql = <<<'SQL'
      SELECT tracked.name FROM tracker.tracked
      LEFT JOIN tracker.watched USING (series_id, name)
      WHERE watched.name IS NULL
      AND series_id=:series_id
      SQL;

    return $sql;
  }

  public function execute() : void
  {
    $sql = $this->createQuery();
    $stm = $this->dbc->prepare($sql);
    $stm->bindParam(':series_id', $this->seriesId, PDO::PARAM_STR);
    $stm = $this->dbc->execute();
  }
}