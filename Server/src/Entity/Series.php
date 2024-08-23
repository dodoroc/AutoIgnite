<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

final class Series extends AbstractEntity
{
  public function __construct(
    public readonly SeriesId $seriesId,
    public readonly string $name,
    public readonly string $releaseYear,
    public readonly int $seasonMin,
    public readonly int $seasonMax,
  ) {}

  public function isValid() : bool
  {
    return true;
  }
}