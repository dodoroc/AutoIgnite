// -------------------------------------------------------------------
// https://en.wikipedia.org/wiki/List_of_Schitt%27s_Creek_episodes

const vals = [];
const rows = document.querySelectorAll('table:is(.wikitable,.wikiepisodetable):has(th[scope]) tr:is(.module-episode-list-row)');
rows.forEach(s => {
  if (s.children.length > 5) {
    const name = s.children[2].innerText.trim().match(/^"?(.+?)"?$/)[1].replace(/'/g, "''");
    const aired = s.children[5]?.children[0]?.children[0]?.innerText.trim();
    vals.push(`('8246950733502197112', '${name}', '${aired}', 'en.wikipedia.org')`);
  }
});

console.log(`
INSERT INTO tracker.episode (series_id, name, aired_on, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO NOTHING
;
`);
// UPDATE SET air_date=EXCLUDED.air_date WHERE episode.air_date IS NULL



// -------------------------------------------------------------------
// https://epguides.com/SchittsCreek/

const vals = [];
const rows = document.querySelectorAll('div#eplist table tr:has(td.epinfo)');
rows.forEach(s => {
  const name = s.children[3].innerText.trim().replace(/'/g, "''");
  const tmp = s.children[2].innerText.trim();
  const aired = new Date(tmp).toISOString().slice(0, 10);

  vals.push(`('8246950733502197112', '${name}', '${aired}', 'epguides.com')`);
});

console.log(`
INSERT INTO tracker.episode (series_id, name, aired_on, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO NOTHING
;
`);
// UPDATE SET air_date=EXCLUDED.air_date WHERE episode.air_date IS NULL

