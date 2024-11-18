<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\TrackedGetAllBySeriesIdProcess;
use Server\Entity\SeriesId;

final class TrackedController extends AbstractController
{
  private function doGet() : ResponseInterface
  {
    $proc = new TrackedGetAllBySeriesIdProcess(new SeriesId($this->pathData['seriesId']));
    $proc->execute();

    $resp = ResponseSuccess::fromJSON($proc);
    return $resp;
  }

  public function execute() : ResponseInterface
  {
    $resp = new ResponseMisdirected;

    if ($this->method === HttpMethods::GET) {
      $resp = $this->doGet();
    }

    return $resp;
  }
}