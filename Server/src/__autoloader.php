<?php declare(strict_types=1);

/**
 *
 */


define('BASE', dirname(__DIR__) . DIRECTORY_SEPARATOR);

// spl_autoload_extensions('');
spl_autoload_register(function ($class) {
  $class_path = ltrim($class, '\\');
  $class_path = BASE . $class_path;
  $class_path = str_replace('\\', DIRECTORY_SEPARATOR, $class_path);
  $file = $class_path . '.php';

  // file_put_contents('php://stderr', ">>>> $class\n>> $file\n> ".__DIR__."\n\n");
  // file_put_contents('php://stderr', ">>>> $class\n>> $file\n\n");
  if (file_exists($file)) {
    include $file;
  }
  else {
    error_log("Autoload cannot find file ($class) $file\n");
  }
}, true, true);

