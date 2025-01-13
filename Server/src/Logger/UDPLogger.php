<?php declare(strict_types=1);

/**
 *
 */
// Ethernet: Typical MTU(1500)
// IPv4: HSize(20..60)
// TCP: HSize(20..60)
// UDP: HSize(8)
// UDP MSS: 65535-8-(60..20)=65467..65507

/*
IPv4's max datagram size (the largest MTU it can fill up) is 2^16 bytes (i.e. 64KiB or 65535 bytes). So
the max TCP MSS by today's standards is 65,483 bytes with TCP timestamps on, or 65,495 with them disabled.
40-52
However, Ethernet and Ethernet-like networks with Ethernet-standard 1500 byte MTUs are so common, that
it's rare to see a path MTU across the public Internet that's larger than 1500 bytes, so it's rare to see
a TCP MSS larger than 1448 bytes.
*/



namespace Server\Logger;

final class UDPLogger implements LoggerInterface
{
  private \Socket|null $socket = null;
  private const MAX_LEN = 65467;

  public function __construct(string $addr)
  {
    [$ip, $port] = explode(':', $addr);

    if ($ip && $port) {
      $socket = @socket_create(AF_INET, SOCK_DGRAM, SOL_UDP) ?: null;
      if ($socket) {
        if (socket_connect($socket, $ip, intval($port))) {
          $this->socket = $socket;
        }
      }
    }
  }

  public function __destruct()
  {
    if ($this->socket) {
      socket_close($this->socket);
    }
  }

  public function log(string $msg): void
  {
    if ($this->socket) {
      $msg = trim($msg);

      if ($msg) {
        do {
          $len = min(static::MAX_LEN, strlen($msg));
          socket_send($this->socket, $msg, $len, 0);
          $msg = substr($msg, $len);
        } while ($msg);
      }
    }
  }
}

