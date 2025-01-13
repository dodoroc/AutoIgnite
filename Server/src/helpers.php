<?php

// this is basically the app function in laravel
function deps(): \Server\Dependency
{
  return \Server\App::$dependencies;
}