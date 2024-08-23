<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Router;

use \Server\Controller\ControllerInterface;

interface RouterInterface
{
  public function route(string $method, array $path) : ControllerInterface;
}