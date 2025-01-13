<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Router\HttpMethods;
use Server\Response\{Response, ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Domain\{DefaultDatabase, WatchedGetAllProcess, WatchedPutSomeProcess};

// use function \Server\f;

final class WatchedController extends AbstractController
{
  // return an object with programIds as keys that were watched
  private function doGet(): ResponseInterface
  {
    $dbc = deps()->get(DefaultDatabase::class);
    $proc = new WatchedGetAllProcess($dbc);
    $proc->execute();

    $resp = Response::asJSON($proc, ResponseSuccess::class);
    return $resp;
  }

  private function doPut(): ResponseInterface
  {
    $raw = file_get_contents('php://input');
    $watchedItems = json_decode($raw);
    $raw = null;

    $dbc = deps()->get(DefaultDatabase::class);
    $proc = new WatchedPutSomeProcess($dbc, $watchedItems);
    $proc->execute();

    $resp = new ResponseSuccess;
    return $resp;
  }

  public function execute(): ResponseInterface
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