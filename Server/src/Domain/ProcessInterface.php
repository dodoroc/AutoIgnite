<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Domain;

interface ProcessInterface
{
  public function execute(): void;
}