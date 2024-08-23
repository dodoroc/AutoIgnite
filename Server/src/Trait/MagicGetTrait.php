<?php declare(strict_types=1);

/**
 * Add magic methods to an class.
 *
 * Trait used since using an abstract class cannot access private elements.
 */

namespace Server\Trait;

trait MagicGetTrait
{
  public function __get(string $prop) : mixed
  {
    if (property_exists($this, $prop)) {
      return $this->$prop;
    }

    return null;
  }
}
