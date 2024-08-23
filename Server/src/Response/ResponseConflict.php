<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseConflict extends AbstractResponse
{
  const CODE = 409;
  public function __construct()
  {
    self::init(self::CODE, '[ '. self::CODE .' ]; Something sort of conflict happened; server could not fullfill the request.');
  }
}
