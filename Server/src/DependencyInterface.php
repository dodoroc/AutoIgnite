<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

interface DependencyInterface {
  public function has(string $name): bool;
  public function get(string $name): mixed;
  public function set(string $name, callable $initializer): void;
}