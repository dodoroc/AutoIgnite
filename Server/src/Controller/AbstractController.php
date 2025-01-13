<?php declare(strict_types=1);

/**
 * Quick and very dirty router not suitable for anything larger
 *
 */

namespace Server\Controller;

use Server\Response\ResponseInterface;

abstract class AbstractController implements ControllerInterface
{
  public function __construct(
    protected readonly string $method,
    protected readonly array $pathData
  ) {}

  abstract public function execute(): ResponseInterface;
}