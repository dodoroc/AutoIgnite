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
    parent::__construct(self::CODE, '[ '. self::CODE .' ]; Cannot fulfill the valid request; a conflict occured and has been noted.');
  }
}
