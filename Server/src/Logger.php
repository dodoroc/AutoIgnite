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
    $date = date('Y-m-d H:i:s');
    error_log("\n--------\n{$date}     {$msg}\n\n", 3, $this->file);
  }
}