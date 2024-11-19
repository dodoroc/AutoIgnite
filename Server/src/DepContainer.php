<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

final class DepContainer
{
  private static $dependency = [];
  private static $init = [];

  public static function has(string $key)
  {
    return array_key_exists($key, self::$dependency);
  }

  public static function get(string $key) : object|null
  {
    if (array_key_exists($key, self::$dependency)) {
      return self::$dependency[$key];
    }

    if (array_key_exists($key, self::$init)) {
      self::$dependency[$key] = self::$init[$key]();
      return self::$dependency[$key];
    }

    return null;
  }

  public static function register(string $key, \Closure $init)
  {
    self::$init[$key] = $init;
  }
}