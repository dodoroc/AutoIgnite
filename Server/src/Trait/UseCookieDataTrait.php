<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Trait;

trait UseCookieDataTrait
{
  protected array $cookieData = [];

  protected function getCookieData(array $keys) : array
  {
    $keyCnt = count($keys);
    $cnt = 0;
    $from = &$_COOKIE;

    foreach ($keys as $k) {
      if (array_key_exists($k, $from)) {
        $this->cookieData[$k] = $from[$k];
        $cnt++;
      }
    }

    return [$cnt, $keyCnt];
  }
}