<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, ProgramId, Tracked};
use \PDO;

final class TrackedGetAllBySeriesIdProcess extends AbstractProcess
{
  private PDO|null $dbc = null;

  public function __construct(private SeriesId $seriesId)
  {
    $this->dbc = \Server\DepContainer::get('projects-dbc');
  }

  private function createQuery() : string
  {
    $sql = 'SELECT name,aired_on,watched_on,program_id,seep_key FROM tracker.series_'.$this->seriesId;
    return $sql;
  }

  public function execute() : void
  {
    $this->results = [];

    $sql = $this->createQuery();
    $stm = $this->dbc->query($sql);

    foreach ($stm as $r) {
      $o = new Tracked($r->name, $r->aired_on, $r->watched_on, new ProgramId($r->program_id ?? ''), $r->seep_key);
      array_push($this->results, $o);
    }
  }
}