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
use \PDO;

// Meh; needs work
define('CONFIG', [
  ...parse_ini_file('../../.secrets/.ini', true),
  ...parse_ini_file('./app.ini', true),
]);

// for testing delete
error_log("\n\n-- app start");

final class App
{
  public function __construct()
  {
    DepContainer::register('logger', function() {
      $file = CONFIG['logger']['file']['app'];
      return new Logger($file);
    });
    DepContainer::register('projects-dbc', function() {
      $dbc = null;

      try {
        $dsn = CONFIG['dsn']['projects'];
        $usr = CONFIG['database']['projects']['usr'];
        $pwd = CONFIG['database']['projects']['pwd'];

        $dbc = new PDO($dsn, $usr, $pwd, [
          PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
          PDO::ATTR_PERSISTENT => true,
        ]);
      }
      catch (Exception $ex) {
        DepContainer::get('logger').log("Cannot connect to database!\n".$ex->__toString());
      }

      return $dbc;
    });
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
  error_log(print_r($ex, true));
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