<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Entity;

interface EntityInterface
{
  // Check for validity of fields that are mapped from db
  // if valid return true
  // else return array of failed property names
  // public function isValid() : array|bool;

  // As above but bool val on success/failure
  public function isValid() : bool;
}