<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{Response, ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\SeriesGetAllProcess;

final class SeriesController extends AbstractController
{
  private function doGet() : ResponseInterface
  {
    $proc = new SeriesGetAllProcess;
    $proc->execute();

    $resp = ResponseSuccess::asJSON($proc);
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