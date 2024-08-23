<?php declare(strict_types=1);

/**
 *
 */


namespace Server;

function f(string $msg)
{
  $fp = fopen('php://stderr', 'w');
  fwrite($fp, $msg);
  fclose($fp);
}

// require __DIR__.DIRECTORY_SEPARATOR.'autoloader.php';
require '../vendor/autoload.php';

use Server\Router\{SimpleRouter, HttpMethods};
use Server\Controller\ControllerInterface;

final class App
{
  public static $config = [];

  public function __construct()
  {
    // self::$config['db'] = parse_ini_file(__DIR__.DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'.secrets'.DIRECTORY_SEPARATOR.'projects.db.ini');
    self::$config['db'] = parse_ini_file('../../.secrets/projects.db.ini');
    // f("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
  }

  public function run() : ControllerInterface
  {
    $method = $_SERVER['REQUEST_METHOD'];

    // Check which server var is correct with proper web server also rewriting may affect this as well
    // UTF-8 is likely an issue for at least one of the functions to resolve the path
    // There is a bug in filter_input with INPUT_SERVER
    $path = filter_var($_SERVER['DOCUMENT_URI'], FILTER_SANITIZE_URL); //SCRIPT_NAME PHP_SELF
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