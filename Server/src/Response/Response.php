<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

final class Response
{
  public static function asJSON(mixed $value, object $class)
  {
    $content = json_encode($value);
    $headers = [
      'Content-Type' => 'application/json'
    ];

    $resp = new $class($content, $headers);
    return $resp;
  }
}