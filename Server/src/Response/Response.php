<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

use Server\Response\ResponseInterface;

final class Response
{
  public static function asJSON(mixed $value, string $class) : ResponseInterface
  {
    $content = json_encode($value);
    $headers = [
      'Content-Type' => 'application/json'
    ];

    $resp = new $class($content, $headers);
    return $resp;
  }
}