<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Logger;

final class FileLogger implements LoggerInterface
{
  private $handle = null;

  public function __construct(string $filename)
  {
    $this->handle = @fopen($filename, 'ab') ?: null;
  }

  public function __destruct()
  {
    if ($this->handle) {
      fclose($this->handle);
    }
  }

  public function log(string $msg) : void
  {
    if ($this->handle) {
      $msg = trim($msg);
      if ($msg) {
        $date = date('Y-m-d H:i:s');
        fwrite($this->handle, "\n\n{$date}\n{$msg}\n");
      }
    }
  }
}