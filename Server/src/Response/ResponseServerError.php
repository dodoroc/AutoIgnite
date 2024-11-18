<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseServerError extends AbstractResponse
{
  const CODE = 500;
  public function __construct()
  {
    parent::__construct(self::CODE, '[ '. self::CODE .' ]; Something went horribly wrong; xoxo!');
  }
}
