<?php declare(strict_types=1);

/**
 * A matched a route/url
 *
 */

namespace Server\Router;

final class Routing
{
  public function __construct(
    public readonly string $class,
    public readonly array $methods,
    public array $vars = []
  ) {}
}