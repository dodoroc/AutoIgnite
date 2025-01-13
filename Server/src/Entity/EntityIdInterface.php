<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

interface EntityIdInterface
{
  // Confirm we have a valid primary key
  // A key can be either 19 digits or empty string
  // By default hasValidKey will not consider an empty
  // string as valid, so in cases where needed we can
  // override this behavious
  public function hasValidKey(bool $isEmptyValid = false): bool;
}