<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseNoContent extends AbstractResponse
{
  const CODE = 204;
  public function __construct()
  {
    parent::__construct(self::CODE, '');
  }
}
