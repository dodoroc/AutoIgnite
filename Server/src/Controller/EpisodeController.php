<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\EpisodePutSomeProcess;

final class EpisodeController extends AbstractController
{

  private function doPut() : ResponseInterface
  {
    $raw = file_get_contents('php://input');
    $episodes = json_decode($raw);
    $raw = null;

    $proc = new EpisodePutSomeProcess($episodes);
    $proc->execute();

    $resp = new ResponseSuccess;
    // $resp->body = json_encode($proc);
    // $resp->setHeader('Content-Type', 'application/json');
    // $resp->setHeader('Content-Length', (string)strlen($resp->body));

    return $resp;
  }

  public function execute() : ResponseInterface
  {
    $resp = new ResponseMisdirected;

    if ($this->method === HttpMethods::PUT) {
      $resp = $this->doPut();
    }

    return $resp;
  }
}