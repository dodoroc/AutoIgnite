<?php declare(strict_types=1);

/**
 * Quick, dirtyish, opinionated and tree-like router
 *
 */

namespace Server\Router;

use Server\Router\Routing;
use Server\Controller\{ControllerInterface, ErrorNotFoundController, ErrorBadRequestController, ErrorNotAllowedController};

abstract class AbstractRouter
{
  protected function search(array $node, array $paths, int $ndx, int $len, array $vars = []): Routing|null
  {
    $seg = $paths[$ndx] ?? '.';

    foreach ($node as $pat => $obj) {

      if ($pat[0] === '^' && preg_match("#$pat#s", $seg, $matches) === 1) {
        // regex node matched
        // copy _only_ the named capture groups to 'vars'
        foreach ($matches as $k => $v) if (!is_int($k)) $vars[$k] = $v;
      }
      elseif ($pat === $seg) {
        // simple text node matched
        // do not delete this condition otherwise 'else' will handle it and fail
      }
      else {
        // node not matched
        continue;
      }

      if ($obj instanceof Routing) {
        $obj->vars = $vars;
        return $obj;
      }
      elseif (is_array($obj)) {
        return $this->search($obj, $paths, $ndx+1, $len, $vars);
      }
      else {
        // error state - something other than array|Routing was used in route declaration
        error_log(__METHOD__."\n@@else condition error: $pat ($seg): ".gettype($obj)."\n");
      }
    }

    return null;
  }

  public function route(string $method, array $path): ControllerInterface
  {
    $routing = $this->search($this->routes, $path, 0, count($path));

    // Http 404
    if ($routing === null) {
      return new ErrorNotFoundController($method, $path);
    }

    // Http 405
    if (!in_array($method, $routing->methods)) {
      return new ErrorNotAllowedController($method, $path);
    }

    // Success
    if (class_exists($routing->class)) {
      return new $routing->class($method, $routing->vars);
    }

    // Http 400
    return new ErrorBadRequestController($method, $path);
  }
}