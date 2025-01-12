<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

final class Dependency implements DepedencyInterface
{
  private $dependencies = [];
  private $initializers = [];

  public function has(string $name) : bool
  {
    return array_key_exists($name, $this->$dependency);
  }

  public function get(string $name) : mixed
  {
    if ($this->has($name)) {
      return $this->dependencies[$name];
    }

    if (array_key_exists($name, $this->initializers)) {
      $this->dependencies[$name] = $this->initializers[$name]();
      unset($this->initializers[$name]);

      return $this->dependencies[$name];
    }

    return null;
  }

  public function set(string $name, callable $initializer) : void
  {
    $this->initializers[$name] = $initializer;
  }

}