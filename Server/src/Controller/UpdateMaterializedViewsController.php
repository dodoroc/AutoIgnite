<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{Response, ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\{DefaultDatabase, UpdateMaterializedViewsProcess};
// use Server\Entity\SeriesId;

final class UpdateMaterializedViewsController extends AbstractController
{
  private function doGet(): ResponseInterface
  {
    $dbc = deps()->get(DefaultDatabase::class);
    $proc = new UpdateMaterializedViewsProcess($dbc);//new SeriesId($this->pathData['seriesId']));
    $proc->execute();

    // $resp = Response::asJSON($proc, ResponseSuccess::class);
    $resp = new ResponseSuccess;
    return $resp;
  }

  public function execute(): ResponseInterface
  {
    $resp = new ResponseMisdirected;

    if ($this->method === HttpMethods::GET) {
      $resp = $this->doGet();
    }

    return $resp;
  }
}