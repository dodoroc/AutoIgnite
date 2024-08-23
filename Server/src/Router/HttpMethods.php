<?php declare(strict_types=1);

/**
 * Http request methods constants
 *
 */

namespace Server\Router;

final class HttpMethods
{
  public const string GET     = 'GET';
  public const string POST    = 'POST';
  public const string PUT     = 'PUT';
  public const string PATCH   = 'PATCH';
  public const string DELETE  = 'DELETE';

  public const string HEAD    = 'HEAD';
  public const string CONNECT = 'CONNECT';
  public const string OPTIONS = 'OPTIONS';

  // public const string TRACE   = 'TRACE';
}