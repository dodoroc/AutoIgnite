<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\EpisodeGetAllBySeriesIdProcess;
use Server\Entity\SeriesId;

final class SeriesEpisodesController extends AbstractController
{
  private function doGet() : ResponseInterface
  {
    $proc = new EpisodeGetAllBySeriesIdProcess(new SeriesId($this->pathData['seriesId']));
    $proc->execute();

    $resp = new ResponseSuccess;
    $resp->setHeader('Content-Type', 'application/json');
    $resp->body = json_encode($proc);

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