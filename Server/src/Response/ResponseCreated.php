<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseCreated extends AbstractResponse
{
  const CODE = 201;
  public function __construct(string $body = 'Created')
  {
    $this->init(self::CODE, $body);
  }
}
