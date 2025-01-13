<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\{ResponseInterface, ResponseBadRequest};

final class ErrorBadRequestController extends AbstractController
{
  public function execute(): ResponseInterface
  {
    return new ResponseBadRequest;
  }
}