<?php declare(strict_types=1);

/**
 * Add magic methods to an class.
 *
 * Trait used since using an abstract class cannot access private elements.
 */

namespace Server\Trait;

trait MagicSetTrait
{
  public function __set(string $prop, mixed $value) : void
  {
    if (property_exists($this, $prop)) {
      $this->$prop = $value;
    }
  }
}
