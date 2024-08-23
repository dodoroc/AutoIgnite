<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Router\HttpMethods;

final class HomeController extends AbstractController
{
  private function doGet() : ResponseInterface
  {
    $resp = new ResponseSuccess;
    $resp->body = file_get_contents('home.template');
    $resp->setHeader('Content-Type', 'text/html');
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