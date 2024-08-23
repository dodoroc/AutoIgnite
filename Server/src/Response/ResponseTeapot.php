<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseTeapot extends AbstractResponse
{
  const CODE = 418;
  public function __construct()
  {
    self::init(self::CODE, '[ '. self::CODE .' ]; Tea, gov? Milk is anathema!');
  }
}
