<?php declare(strict_types=1);

/**
 * Fetch the list of episodes and create/merge that list with the db.json file
 */



// Site serves html regardless of accept header so we
// fetch the document and retrieve csv from 'tag'
function fetchFromSiteRawCSV(string $url, string $tag, int $ndx) : string
{
  $csv = '';

  try {
    // suppress all warnings/errors and if needed
    // use libxml_get_errors() to get them
    libxml_use_internal_errors(true);

    // HTML4 parser works well enough for now
    $dom = new DOMDocument;
    $dom->loadHTMLFile($url);
    $csv = $dom->getElementsByTagName($tag)?->item($ndx)?->textContent ?? '';
    $csv = trim($csv);

  } catch (Exception $ex) {
    echo $ex->toString();
  }

  return $csv;
}

function fetchLinesFromCSV(string $rawCSV, bool $hasHeader = false) : Generator
{
  $rows = [];

  // php may use php://temp instead depending on size
  $fp = fopen('php://memory', 'r+');
  fputs($fp, $rawCSV);
  rewind($fp);

  if ($hasHeader) {
    fgetcsv($fp);
  }

  while ($line = fgetcsv($fp)) {
    yield $line;
  }

  fclose($fp);
}

function checkServerIsRunning(string $addr = '127.0.0.1', int $port = 9080) : bool
{

}

final class FieldIndex
{
  private function __construct() {}

  // FIELD_COUNT reserved name
  const NUMBER = 0;
  const SEASON = 1;
  const EPISODE = 2;
  const AIRDATE = 3;
  const TITLE = 4;
  const LINK = 5;

  const FIELD_COUNT = 6;
}

const MIN_SEASON_NUM = 31;


function createQuery() : string
{
  $sql = <<<'SQL'
    INSERT INTO tracker.episode (series_id, name, air_date)
    VALUES (:seriesId, :name, :aired)
    ON CONFLICT (series_id, name) DO UPDATE
    SET air_date=EXCLUDED.air_date
    SQL;

  return $sql;
}

// NOTE: first line of source contains the header; following comment shows field structure
// Fields: number,season,episode,airdate,title,tvmaze link
// <number> season number, while mostly an in, some rows (specials) have a season ref? as a string
// <airdate> format: dd mmm yy
$fnCache = './cached';
if (file_exists($fnCache)) {
  $rawCSV = file_get_contents($fnCache);
} else {
  $rawCSV = fetchFromSiteRawCSV('https://epguides.com/common/exportToCSVmaze.asp?maze=916', 'pre', 0);
  file_put_contents($fnCache, $rawCSV);
}

if ($rawCSV) {
  $csvLineGenerator = fetchLinesFromCSV($rawCSV, true);


  $dsn = "pgsql:host=192.168.50.200;port=5432;dbname=projects;";
  $user = getenv('PROJECTS_USER') ?: getenv('TRACKER_USER');
  $pass = getenv('PROJECTS_PASS') ?: getenv('TRACKER_PASS');
  $dbc = new PDO($dsn, $user, $pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

  // $dbc = new PDO('sqlite:./series-tracker.db', null, null);
  $sql = createQuery();
  $stm = $dbc->prepare($sql);
  $stm->setFetchMode(PDO::FETCH_OBJ);
  $seriesId = '6774048176174390112';

  $i = 1;
  foreach ($csvLineGenerator as $fields) {
    if (count($fields) != FieldIndex::FIELD_COUNT) continue;
    if (!is_numeric($fields[FieldIndex::SEASON])) continue;
    if ($fields[FieldIndex::SEASON] < MIN_SEASON_NUM) continue;
    // echo $i++,' ',count($fields),' ',$fields[1],' ',$fields[4],"\n";

    $dt = date_create($fields[FieldIndex::AIRDATE]);
    $dt = date_format($dt, 'Y-m-d');

    try {
      $stm->bindValue(':seriesId', $seriesId, PDO::PARAM_STR);
      $stm->bindValue(':name', trim($fields[FieldIndex::TITLE]), PDO::PARAM_STR);
      $stm->bindValue(':aired', $dt, PDO::PARAM_STR);
      $stm->execute();
      echo $fields[FieldIndex::TITLE],"\n";
    }
    catch (Exception $ex) {
      echo $fields[FieldIndex::TITLE], "\n";
      echo $ex->getMessage() ."\n";
      // print_r($ex);
      //echo "Failed ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n";
    }

    $i++;
    // if ($i++ > 3) break;

    // if (str_ends_with($fields[FieldIndex::TITLE], 'Kostek XX')) {
    //   $dt = date_create($fields[FieldIndex::AIRDATE]);
    //   echo "\n", $fields[FieldIndex::TITLE], ' ', $fields[FieldIndex::SEASON], ' ', date_format($dt, 'Y-m-d'),"\n";
    // }
  }
  echo "\n\n$i\n";
}
