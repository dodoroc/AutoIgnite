<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class ResponseSuccess extends AbstractResponse
{
  const CODE = 200;
  public function __construct(string $content = '', $headers = [])
  {
    parent::__construct(self::CODE, $content, $headers);
  }
}
