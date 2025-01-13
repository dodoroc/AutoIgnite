<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{Response, ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\{DefaultDatabase, TrackedGetAllBySeriesIdProcess};
use Server\Entity\SeriesId;

final class TrackedController extends AbstractController
{
  private function doGet(): ResponseInterface
  {
    $dbc = deps()->get(DefaultDatabase::class);
    $proc = new TrackedGetAllBySeriesIdProcess($dbc, new SeriesId($this->pathData['seriesId']));
    $proc->execute();

    $resp = Response::asJSON($proc, ResponseSuccess::class);
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