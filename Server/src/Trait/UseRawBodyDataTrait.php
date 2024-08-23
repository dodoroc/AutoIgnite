<?php declare(strict_types=1);

/**
 *
 *
 */

namespace Server\Trait;

trait UseRawBodyDataTrait
{
  public string $rawBodyData = '';

  public function getRawBodyData()
  {
    $this->bodyDataRaw = file_get_contents('php://input');
  }
}