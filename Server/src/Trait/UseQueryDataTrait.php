<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Trait;

trait UseQueryDataTrait
{
  protected array $queryData = [];

  protected function getQueryData(array $keys) : array
  {
    $keyCnt = count($keys);
    $cnt = 0;
    $from = &$_GET;

    foreach ($keys as $k) {
      if (array_key_exists($k, $from)) {
        $this->queryData[$k] = $from[$k];
        $cnt++;
      }
    }

    return [$cnt, $keyCnt];
  }
}