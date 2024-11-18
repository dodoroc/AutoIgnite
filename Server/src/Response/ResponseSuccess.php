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

  public function fromJSON(mixed $value)
  {
    $content = json_encode($value);
    $headers = [
      'Content-Type' => 'application/json'
    ];

    $resp = new self($content, $headers);
    return $resp;
  }
}
