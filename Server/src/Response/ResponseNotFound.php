<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseNotFound extends AbstractResponse
{
  const CODE = 404;
  public function __construct()
  {
    self::init(self::CODE, '[ '. self::CODE .' ]; Oops, cannot find that.');
  }
}
