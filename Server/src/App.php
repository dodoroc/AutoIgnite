<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

require '../vendor/autoload.php';
require 'helpers.php';

use Server\Router\{SimpleRouter, HttpMethods};
use Server\Controller\ControllerInterface;
use Server\Domain\DefaultDatabase;
use Server\Logger\{FileLogger, UDPLogger};

final class App
{
  public static Dependency $dependencies;

  private function addDepLogger(array $conf): void
  {
    ini_set('error_log', $conf['logger']['path']['err']);

    static::$dependencies->set(FileLogger::class, function() use ($conf) {
      $file = $conf['logger']['path']['app'];
      return new FileLogger($file);
    });

    static::$dependencies->set(UDPLogger::class, function() use ($conf) {
      $addr = $conf['logger']['udp'];
      return new UDPLogger($addr);
    });
  }

  private function addDepDatabase(array $conf): void
  {
    static::$dependencies->set(DefaultDatabase::class, function() use ($conf) {
      $dsn = $conf['database']['projects']['dsn'];
      $usr = $conf['database']['projects']['usr'];
      $pwd = $conf['database']['projects']['pwd'];

      return new DefaultDatabase($dsn, $usr, $pwd);
    });
  }

  public function __construct()
  {
    static::$dependencies = new Dependency;

    static::$dependencies->set('conf', function() {
      return array_merge_recursive(
        parse_ini_file('../../.secrets/server.ini', true),
        parse_ini_file('../server.ini', true),
      );
    });

    $conf = static::$dependencies->get('conf');
    $this->addDepLogger($conf);
    $this->addDepDatabase($conf);

    $udp = static::$dependencies->get(UDPLogger::class);
    $udp->log('testing');
    $udp->log(print_r(static::$dependencies, true));

    $log = static::$dependencies->get(FileLogger::class);
    $log->log('testing');
  }

  public function run(): ControllerInterface
  {
    $method = $_SERVER['REQUEST_METHOD'];

    // CHECK Which server var is most correct (SCRIPT_NAME PHP_SELF apache/php)(DOCUMENT_URI nginx)
    // TEST Confirm UTF-8 isn't mangled in any way
    // NOTE There is a bug in filter_input with INPUT_SERVER
    $path = filter_var($_SERVER['DOCUMENT_URI'], FILTER_SANITIZE_URL); //
    $path = trim(urldecode($path ?: ''), '/');
    $path = $path === '' ? [] : explode('/', $path);

    $router = new SimpleRouter;
    return $router->route($method, $path);
  }
}


try {
  $ctl = (new App)->run();
  $res = $ctl->execute();
}
catch (Exception $ex) {
  $res = new ResponseServerError;
}

$res->vent();

/*
Cache-Control: no-store //no caching of anything
Cache-Control: no-cache //cache but revalidate for each req
Cache-Control: max-age=604800, must-revalidate //refresh after it goes stale by max-age
*/

/*
Content-Type: text/html; charset=utf-8

text/plain
text/html
text/css
text/javascript

application/json
application/ld+json

text/markdown
application/octet-stream
*/