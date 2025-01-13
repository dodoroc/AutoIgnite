<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

abstract class AbstractEntity implements EntityInterface//, JsonSerializable
{
  abstract public function isValid(): bool;
  // abstract public function jsonSerialize(): mixed;
}