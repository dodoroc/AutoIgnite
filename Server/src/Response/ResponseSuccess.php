<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseSuccess extends AbstractResponse
{
  const CODE = 200;
  public function __construct(string $body = '')
  {
    self::init(self::CODE, $body);
  }
}
