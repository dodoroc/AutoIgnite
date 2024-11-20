<?php declare(strict_types=1);

/**
 *
 */
namespace Test;

require '../vendor/autoload.php';


echo "\n";
echo "\nini ", time();

$fibers = [];
for ($i = 0; $i < 3; $i++) {
  $fibers[] = new \Fiber(function () use($i) {
    echo "\n pro $i ",time();
    sleep(30+$i);
    echo "\n epi $i ",time();
    return;
  });
}

echo "\nmid ", time();

$results = [];

foreach ($fibers as $fiber) {
  $result = $fiber->start();
  $results[] = $result;
}

echo "\nfin ", time();
echo "\n";
