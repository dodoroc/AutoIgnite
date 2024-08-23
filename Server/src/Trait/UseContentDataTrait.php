<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Trait;

trait UseContentDataTrait
{
  protected array $contentData = [];

  protected function getContentData(array $keys) : array
  {
    $keyCnt = count($keys);
    $cnt = 0;
    $from = &$_POST;

    foreach ($keys as $k) {
      if (array_key_exists($k, $from)) {
        $this->contentData[$k] = $from[$k];
        $cnt++;
      }
    }

    return [$cnt, $keyCnt];
  }
}