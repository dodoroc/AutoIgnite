<?php declare(strict_types=1);

/**
 * Put (insert/update) a series to the database; this action is idempotent
 * such that PUT is more appropriate than POST
 *
 */

namespace Server\Domain;

use \PDO;

final class WatchedPutSomeProcess extends AbstractProcess
{
  private PDO|null $dbc = null;

  public function __construct(private array $watchedItems)
  {
    $this->dbc = Server\DepContainer::get('projects-dbc');
  }

  private function createQuery() : string
  {
    $sql = <<<'SQL'
      INSERT INTO tracker.watched (program_id, watched_on, type, name, aired_on, season, series_id)
      VALUES (:programId, :watchedOn, :type, :name, :airedOn, :season, :seriesId)
      ON CONFLICT (program_id) DO UPDATE SET
      watched_on=excluded.watched_on,
      type=excluded.type,
      name=excluded.name,
      aired_on=excluded.aired_on,
      season=excluded.season,
      series_id=excluded.series_id;
      SQL;

    return $sql;
  }

  public function execute() : void
  {
    $sql = $this->createQuery();

    $stm = $this->dbc->prepare($sql);

    try {
      $this->dbc->beginTransaction();

      foreach ($this->watchedItems as $obj)
      {
        $stm->bindParam(':programId', $obj->programId, PDO::PARAM_STR);
        $stm->bindParam(':watchedOn', $obj->watchedOn, PDO::PARAM_STR);
        $stm->bindParam(':type', $obj->type, PDO::PARAM_STR);
        $stm->bindParam(':name', $obj->name, PDO::PARAM_STR);
        $stm->bindParam(':airedOn', $obj->airedOn, PDO::PARAM_STR);
        $stm->bindParam(':season', $obj->season, PDO::PARAM_INT);
        $stm->bindParam(':seriesId', $obj->seriesId, PDO::PARAM_STR);

        $stm->execute();
      }

      $this->dbc->commit();
    }
    catch (Exception $ex) {
      error_log(print_r($ex, true));

      $this->dbc->rollback();
      throw $ex;
    }
  }
}