<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\{ResponseInterface, ResponseNotFound};

final class ErrorNotFoundController extends AbstractController
{
  public function execute() : ResponseInterface
  {
    return new ResponseNotFound();
  }
}