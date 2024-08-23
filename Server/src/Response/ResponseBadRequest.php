<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseBadRequest extends AbstractResponse
{
  const CODE = 400;
  public function __construct()
  {
    self::init(self::CODE, '[ '. self::CODE .' ]; So confused, cannot do anything; bye...');
  }
}
