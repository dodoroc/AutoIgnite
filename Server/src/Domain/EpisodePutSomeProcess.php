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
      INSERT INTO tracker.episode (series_id, name, aired_on)
      VALUES (:seriesId, :name, :airedOn)
      ON CONFLICT (series_id, name) DO NOTHING;
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
        $stm->bindParam(':airedOn',   $obj->airedOn, PDO::PARAM_STR);

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