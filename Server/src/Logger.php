<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

class Logger
{
  public function __construct(protected string $file)
  {
  }

  public function log($msg) : void
  {
    $msg = trim($msg);
    error_log("\n\n--------\n{$msg}\n", 3, $this->file);
  }
}