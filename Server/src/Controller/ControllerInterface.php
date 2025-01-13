<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Controller;

use Server\Response\ResponseInterface;

interface ControllerInterface
{
  public function execute(): ResponseInterface;
}