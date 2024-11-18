<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseMisdirected extends AbstractResponse
{
  const CODE = 421;
  public function __construct()
  {
    parent::__construct(self::CODE, '[ '. self::CODE .' ]; Something happened; cannot produce a response!');
  }
}
