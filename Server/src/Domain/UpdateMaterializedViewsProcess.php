<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Domain;

use Server\Domain\DefaultDatabase;
// use \PDO;

final class UpdateMaterializedViewsProcess extends AbstractProcess
{
  public function __construct(private DefaultDatabase $dbc)
  {
  }

  public function execute(): void
  {
    // $sql = <<<'SQL'
    //   EXECUTE FORMAT('REFRESH MATERIALIZED VIEW tracker.series_%s WITH DATA', ?);
    //   SQL;
    $sql = 'call tracker.update_series_matviews()';

    $stm = $this->dbc->prepare($sql);
    $stm->execute();
  }
}