<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\EpisodeGetOneProcess;
use Server\Entity\ProgramId;

final class EpisodeDetailController extends AbstractController
{
  private function doGet() : ResponseInterface
  {
    $proc = new EpisodeGetOneProcess(new ProgramId($this->pathData['programId']));
    $proc->execute();

    $resp = new ResponseSuccess;
    $resp->body = json_encode($proc);
    $resp->setHeader('Content-Type', 'application/json');
    $resp->setHeader('Content-Length', (string)strlen($resp->body));

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