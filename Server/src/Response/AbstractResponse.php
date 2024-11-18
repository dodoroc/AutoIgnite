<?php declare(strict_types=1);

/**
 *
 */


namespace Server\Response;

abstract class AbstractResponse implements ResponseInterface
{
  public array $headers = [];
  public int $code = 0;
  public string $body = '';

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


  final public function init(int $code, string $body) : void
  {
    $this->code = $code;
    $this->body = $body;
  }

  /*
  // get/set $this->body
  // return current value when param is null else the original values
  final public function body(string|null $body = null) : string
  {
    $org = $this->body;

    if ($body !== null) {
      $this->body = $body;
    }

    return $org ?? '';
  }
  */

  final public function vent() : void
  {
    http_response_code($this->code);

    // $this->setHeader('Content-Length', (string)strlen($this->body));
    foreach ($this->headers as $key => $val) {
      $cleaned = array_filter($val);
      $item = "$key: ".implode(',', $cleaned);
      header($item);
    }

    echo $this->body;
  }
}