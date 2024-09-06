<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

final class Episode extends AbstractEntity
{
  public function __construct(
    public readonly SeriesId $seriesId,
    public readonly string $name,
    public readonly string|null $airedOn,
  ) {}

  public function isValid() : bool
  {
    return true;
  }
}