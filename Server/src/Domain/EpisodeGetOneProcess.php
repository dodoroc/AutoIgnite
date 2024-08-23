<?php declare(strict_types=1);

/**
 * Get one monitored series item with filters
 *
 */

namespace Server\Domain;

use Server\Entity\{SeriesId, ProgramId, Episode};
use \PDO;

final class EpisodeGetOneProcess extends AbstractDatabaseProcess
{
  public function __construct(private ProgramId $programId)
  {
    parent::__construct();
  }

  private function createQuery() : string
  {
    $sql = <<<'SQL'
      SELECT series_id, name, air_date, program_id
      FROM tracker.episode
      WHERE program_id = :programId
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
    $stm->execute(['programId' => $this->programId]);

    $rsi = $stm->getIterator();
    if ($rsi->valid()) {
      $r = $rsi->current();
      $o = new Episode(new SeriesId($r->series_id), $r->name, $r->air_date, new ProgramId($r->program_id));
      array_push($this->results, $o);
    }
  }
}