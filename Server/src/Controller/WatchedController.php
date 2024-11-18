<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\{WatchedGetAllProcess, WatchedPutSomeProcess};

// use function \Server\f;

final class WatchedController extends AbstractController
{
  // return an object with programIds as keys that were watched
  private function doGet() : ResponseInterface
  {
    $proc = new WatchedGetAllProcess;
    $proc->execute();

    $resp = new ResponseSuccess;
    $resp->setHeader('Content-Type', 'application/json');
    $resp->body = json_encode($proc);
    // $resp->setHeader('Content-Length', (string)strlen($resp->body));

    return $resp;
  }

  private function doPut() : ResponseInterface
  {
    $raw = file_get_contents('php://input');
    $watchedItems = json_decode($raw);
    $raw = null;

    $proc = new WatchedPutSomeProcess($watchedItems);
    $proc->execute();

    $resp = new ResponseSuccess;

    return $resp;
  }

  public function execute() : ResponseInterface
  {
    $resp = new ResponseMisdirected;

    if ($this->method === HttpMethods::GET) {
      $resp = $this->doGet();
    }
    elseif ($this->method === HttpMethods::PUT) {
      $resp = $this->doPut();
    }

    return $resp;
  }
}