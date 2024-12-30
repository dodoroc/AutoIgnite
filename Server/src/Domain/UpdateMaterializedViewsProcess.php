<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Domain;

use \PDO;

final class UpdateMaterializedViewsProcess extends AbstractProcess
{
  private PDO|null $dbc = null;

  public function __construct()
  {
    $this->dbc = \Server\DepContainer::get('projects-dbc');
  }

  public function execute() : void
  {
    // $sql = <<<'SQL'
    //   EXECUTE FORMAT('REFRESH MATERIALIZED VIEW tracker.series_%s WITH DATA', ?);
    //   SQL;
    $sql = 'call tracker.update_series_matviews()';

    $stm = $this->dbc->prepare($sql);
    $stm->execute();
  }
}