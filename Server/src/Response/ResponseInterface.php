<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

interface ResponseInterface
{
  // public function setHeader(string $key, string|array|null $value, bool $replace = true) : void;
  public function vent() : void;
}
