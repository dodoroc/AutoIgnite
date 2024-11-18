<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

interface EntityInterface
{
  // Check for validity of fields that are mapped from db
  public function isValid() : bool;
}