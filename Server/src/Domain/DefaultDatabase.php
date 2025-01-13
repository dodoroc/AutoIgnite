<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Domain;

use \PDO;

class DefaultDatabase extends PDO
{
  public function __construct(string $dsn, string $usr, string $pwd) {
    parent::__construct($dsn, $usr, $pwd, [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
      PDO::ATTR_PERSISTENT => true,
    ]);
  }
}
