<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Logger;

final class ErrorLogger implements LoggerInterface
{
  public function log($msg): void
  {
    $msg = trim($msg);
    $date = date('Y-m-d H:i:s');
    error_log("\n\n{$date}\n{$msg}\n");
  }
}