<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

abstract class AbstractResponse implements ResponseInterface
{
  public function __construct(protected int $code = 0, protected string $content = '', protected array $headers = [])
  {}

  final public function vent(): void
  {
    http_response_code($this->code);
    $this->headers['Content-Length'] = strlen($this->content);

    foreach ($this->headers as $key => $val) {
      $item = "$key: $val";
      header($item);
    }

    echo $this->content;
  }
}