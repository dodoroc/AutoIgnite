<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class Response
{
  public static function asJSON(mixed $value)
  {
    $content = json_encode($value);
    $headers = [
      'Content-Type' => 'application/json'
    ];

    $resp = new self($content, $headers);
    return $resp;
  }
}