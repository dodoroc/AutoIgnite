<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

final class WatchedEpisode extends AbstractEntity
{
  public function __construct(
    public readonly string $name,
    public readonly string|null $airedOn,
    public readonly string|null $watchedOn,
    public readonly ProgramId $programId,
  ) {}

  public function isValid() : bool
  {
    return true;
  }
}