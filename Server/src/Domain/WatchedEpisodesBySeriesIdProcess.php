<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, ProgramId, WatchedEpisode};
use \PDO;

final class WatchedEpisodesBySeriesIdProcess extends AbstractDatabaseProcess
{
  public function __construct(private SeriesId $seriesId)
  {
    parent::__construct();
  }

  private function createQuery() : string
  {
    $sql = 'SELECT name,aired_on,watched_on,program_id FROM tracker.series_'.$this->seriesId;
    return $sql;
  }

  public function execute() : void
  {
    $this->results = [];

    $sql = $this->createQuery();
    $stm = $this->dbc->query($sql, PDO::FETCH_OBJ);

    foreach ($stm as $r) {
      $o = new WatchedEpisode($r->name, $r->aired_on, $r->watched_on, new ProgramId($r->program_id ?? ''));
      array_push($this->results, $o);
    }
  }
}