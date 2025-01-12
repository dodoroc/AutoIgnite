<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Logger;

interface LoggerInterface
{
  public function log(string $msg) : void;
}