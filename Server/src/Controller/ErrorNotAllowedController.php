<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\{ResponseInterface, ResponseNotAllowed};

final class ErrorNotAllowedController extends AbstractController
{
  public function execute() : ResponseInterface
  {
    return new ResponseNotAllowed;
  }
}