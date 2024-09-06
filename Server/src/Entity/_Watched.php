<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

final class Watched extends AbstractEntity
{
  public function __construct(
    public readonly ProgramId $programId,
    public readonly string|null $watchedOn,
    public readonly string $type,
    public readonly string $name,
    public readonly string|null $airedOn,
    public readonly int $season,
    public readonly SeriesId $seriesId,
  ) {}

  public function isValid() : bool
  {
    return true;
  }
}