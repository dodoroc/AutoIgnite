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

define('CFG', parse_ini_file('../../.secrets/.ini'));

final class App
{
  public readonly static array|false $CFG;

  public function __construct()
  {
    //self::$CFG = parse_ini_file('../../.secrets/.ini');
  }

  public function run() : ControllerInterface
  {
    $method = $_SERVER['REQUEST_METHOD'];

    // CHECK Which server var is most correct (SCRIPT_NAME PHP_SELF apache/php)(DOCUMENt_URI nginx)
    // TEST Confirm UTF-8 isn't mangled in any way
    // There is a bug in filter_input with INPUT_SERVER
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