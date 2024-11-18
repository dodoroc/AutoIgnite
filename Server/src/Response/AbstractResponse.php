<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

abstract class AbstractResponse implements ResponseInterface
{
  public function __construct(protected int $code = 0, protected string $content = '', protected array $headers = [])
  {}


  /*
  public array $headers = [];

  // Minimal implementation for now
  final public function setHeader(string $key, string|array|null $value, bool $replace = true) : void
  {
    // Guarantee later code always deals with arrays
    $arrVal = is_array($value) ? $value : [$value];
    $hasKey = array_key_exists($key, $this->headers);

    if (!$hasKey || $replace) {
      $this->headers[$key] = $arrVal;
    } else {
      // Merge values, problems inc: duplicate values and no way of deleting
      $this->headers[$key] = [...$this->headers[$key], ...$arrVal];
    }
  }
  */


  final public function vent() : void
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