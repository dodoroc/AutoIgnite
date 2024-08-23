<?php declare(strict_types=1);

/**
 * Put (insert/update) a series to the database; this action is idempotent
 * such that PUT is more appropriate than POST
 *
 */

namespace Server\Domain;

// use Server\Entity\{SeriesId, ProgramId, Episode};
use \PDO;

final class EpisodePutSomeProcess extends AbstractDatabaseProcess
{
  public function __construct(private array $episodeItems)
  {
    parent::__construct();
  }

  private function createQuery() : string
  {
    $sql = <<<'SQL'
      INSERT INTO tracker.episode (series_id, name, air_date, program_id)
      VALUES (:seriesId, :name, :airDate, :programId)
      ON CONFLICT (series_id, name) DO UPDATE SET
      program_id=excluded.program_id;
      SQL;

    return $sql;
  }

  public function execute() : void
  {
    $sql = $this->createQuery();

    $stm = $this->dbc->prepare($sql);
    $stm->setFetchMode(PDO::FETCH_OBJ);

    try {
      $this->dbc->beginTransaction();

      foreach ($this->episodeItems as $obj)
      {
        $stm->bindParam(':seriesId',  $obj->seriesId, PDO::PARAM_STR);
        $stm->bindParam(':name',      $obj->name, PDO::PARAM_STR);
        $stm->bindParam(':airDate',   $obj->airedDate, PDO::PARAM_STR);
        $stm->bindParam(':programId', $obj->programId, PDO::PARAM_STR);

        $stm->execute();
      }

      $this->dbc->commit();
    }
    catch (Exception $ex) {
      $this->dbc->rollback();
      throw $ex;
    }
  }
}