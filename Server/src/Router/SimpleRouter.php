<?php declare(strict_types=1);

/**
 *
 */

namespace Server\Router;

final class SimpleRouter extends AbstractRouter
{
  // Hardcoded literal|regex routes
  // <.> Since we cannot have empty keys in arrays we need a placeholder; '.' fitting  imputes the current directory)
  // <words> literal path component
  // <^...$> Anything anchored will be processed by regex; use named capture groups to pass var to controller
  //
  // Important: Cannot initialize routes inline as php won't allow 'new' to be used.
  // Use constructor initalization (standard or promotion).
  public function __construct(
    public readonly array $routes = [

      'episode' => new Routing('\Server\Controller\EpisodeController', [HttpMethods::PUT]),

      'watched' => new Routing('\Server\Controller\WatchedController', [HttpMethods::GET, HttpMethods::PUT]),

      'series' => [
        '.' => new Routing('\Server\Controller\SeriesController', [HttpMethods::GET]),

        '^(?<seriesId>\d{19})$' => [
          '.' => new Routing('\Server\Controller\SeriesDetailController', [HttpMethods::GET]),
          'episodes' => new Routing('\Server\Controller\SeriesEpisodesController', [HttpMethods::GET]),
          'watched-episodes' => new Routing('\Server\Controller\WatchedEpisodesController', [HttpMethods::GET]),
        ]
      ],

      'teapot' => new Routing('\Server\Controller\TeapotController', [HttpMethods::GET])
    ]
  ) {}
}