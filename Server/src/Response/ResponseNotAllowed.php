<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseNotAllowed extends AbstractResponse
{
  const CODE = 405;
  public function __construct()
  {
    self::init(self::CODE, '[ '. self::CODE .' ]; You gave me a spoon, maybe a spork would be better.');
  }
}
