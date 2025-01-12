// -------------------------------------------------------------------
// https://epguides.com/NCISOrigins/

const vals = [];
const rows = document.querySelectorAll('div#eplist table tr:has(td.epinfo)');
rows.forEach(s => {
  const name = s.children[3].innerText.trim().replace(/'/g, "''");
  const tmp = s.children[2].innerText.trim();
  const aired = new Date(tmp).toISOString().slice(0, 10);
  const seep = s.children[1].innerText.trim();
  const tmp2 = seep.match(/^(\d+)-(\d+)$/);
  if (!tmp2 || tmp2.length != 3) return;

  const se = new String(parseInt(tmp2[1], 10)).padStart(4, '0');
  const ep = new String(parseInt(tmp2[2], 10)).padStart(3, '0');

  vals.push(`('8263471060961978112', '${name}', '${aired}', '${se+ep}', 'epguides.com')`);
});

console.log(`
INSERT INTO tracker.tracked (series_id, name, aired_on, seep_key, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO --NOTHING
UPDATE SET aired_on = EXCLUDED.aired_on, seep_key = EXCLUDED.seep_key
WHERE tracked.aired_on IS NULL OR tracked.seep_key IS NULL
;
`);
// UPDATE SET air_date=EXCLUDED.air_date WHERE episode.air_date IS NULL

