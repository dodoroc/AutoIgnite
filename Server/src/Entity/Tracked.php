<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

final class Tracked extends AbstractEntity
{
  public function __construct(
    public readonly string $name,
    public readonly string|null $airedOn,
    public readonly string|null $watchedOn,
    public readonly ProgramId $programId,
    public readonly int $ndx,
  ) {}

  public function isValid() : bool
  {
    return true;
  }
}