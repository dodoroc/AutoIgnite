<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

/*
function f(string $msg)
{
  $fp = fopen('php://stderr', 'w');
  fwrite($fp, $msg);
  fclose($fp);
}
//*/

require '../vendor/autoload.php';

use Server\Router\{SimpleRouter, HttpMethods};
use Server\Controller\ControllerInterface;
use Server\Domain\DefaultDatabase;
use Server\Logger\{FileLogger, UDPLogger};

final class App
{
  // private Dependency $ioc = new Dependency;
  private Dependency $ioc = null;

  private function addDepLogger($conf) {
    ini_set('error_log', $conf['logger']['path']['err']);

    $this->ioc->set(FileLogger::class, function() {
      $file = $conf['logger']['path']['app'];
      return new FileLogger($file);
    });

    $this->ioc->set(UDPLogger::class, function() {
      $addr = $conf['logger']['udp'];
      return new UDPLogger($addr);
    });
  }

  private function addDepDatabase($conf) {
    $this->ioc->set(DefaultDatabase::class, function() {
      $dsn = $conf['database']['projects']['dsn'];
      $usr = $conf['database']['projects']['usr'];
      $pwd = $conf['database']['projects']['pwd'];

      return new DefaultDatabase($dsn, $usr, $pwd, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_PERSISTENT => true,
      ]);
    });
  }

  public function __construct()
  {
    $this->ioc = new Dependency;


    $this->ioc->set('conf', function() {
      return [
        ...parse_ini_file('../../.secrets/server.ini', true),
        ...parse_ini_file('../server.ini', true),
      ];
    });
    $conf = $this->ioc->get('conf');

    $this->addDepLogger($conf);
    $this->addDepDatabase($conf);

    $udp = $this->ioc->get(UDPLogger::class);
    $udp->log('testing');

    $log = $this->ioc->get(FileLogger::class);
    $log->log('testing');
  }

  public function run() : ControllerInterface
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