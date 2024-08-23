<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

interface ResponseInterface
{
  public function init(int $code, string $body) : void;
  public function setHeader(string $key, string|array|null $value, bool $replace = true) : void;
  public function vent() : void;
}
