<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\{ResponseInterface, ResponseSuccess, ResponseMisdirected};
use Server\Router\HttpMethods;

final class InfoController extends AbstractController
{
  private function infoPageText() : string
  {
    $txt = <<<'TXT'

      ------------------------------------------------
      -- Non API endpoints
      --

      ## default/status page
      GET /

      ## api doc
      GET /info



      ------------------------------------------------
      -- API endpoints all JSON
      --

      !! xxxxxId's are 19 digits long

      ## get all monitored series
      GET /series

      ## get specific monitored series
      GET /series/<seriesId>

      ## get all episodes for a monitored series
      GET /series/<seriesId>/episodes



      ## get info for a specific episode
      GET /episode/<programId>

      ## add/update episodes; array of object(s)
      PUT /episode

      ## get all episodes for a series
      GET /series/<seriesId>/episodes/<programId>



      ## get object with programId keys of all watched programs we have inspected
      GET /watched

      ## add/update watched programs (multiple fields); array of objects
      PUT /watched



      ## tootle
      GET /teapot

      TXT;

    return $txt;
  }

  private function doGet() : ResponseInterface
  {
    $resp = new ResponseSuccess;
    $resp->body = $this->infoPageText();
    $resp->setHeader('Content-Type', 'text/plain');
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