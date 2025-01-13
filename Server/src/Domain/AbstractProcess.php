<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Domain;

abstract class AbstractProcess implements ProcessInterface, \JsonSerializable
{
  protected mixed $results;

  public function jsonSerialize(): mixed
  {
    return $this->results;
  }

  abstract public function execute(): void;
}