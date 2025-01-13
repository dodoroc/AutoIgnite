<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\{ResponseInterface, ResponseTeapot};

final class TeapotController extends AbstractController
{
  public function execute(): ResponseInterface
  {
    return new ResponseTeapot;
  }
}