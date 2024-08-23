<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Trait;

trait UseHeaderDataTrait
{
  protected array $headerData = [];

  protected function getHeaderData(array $keys) : array
  {
    $keyCnt = count($keys);
    $cnt = 0;
    $from = &$_SERVER;

    foreach ($keys as $k) {
      if (array_key_exists($k, $from)) {
        $this->headerData[$k] = $from[$k];
        $cnt++;
      }
    }
    $this->headerData['test'] = 'test str';

    return [$cnt, $keyCnt];
  }
}