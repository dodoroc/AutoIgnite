<?php declare(strict_types=1);

/**
 * This class ecapsulates a KEY (pk, fk, other?) which are used through out this codebase
 * The value is immutable
 */

namespace Server\Entity;

abstract class AbstractEntityId implements EntityIdInterface, \JsonSerializable
{
  public function __construct(public readonly string $value)
  {}

  public function __toString(): string
  {
    return $this->value;
  }

  // See EntityIdInterface for the rules this was coded for
  // /''|[0-9]{19}/
  public function hasValidKey(bool $isEmptyValid = false): bool
  {
    if ($isEmptyValid && $this->value === '')  return true;

    if (strlen($this->value) != 19) return false;
    if (!ctype_digit($this->value)) return false;

    return true;
  }

  public function jsonSerialize(): mixed
  {
    return $this->value;
  }
}