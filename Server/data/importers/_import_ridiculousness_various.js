// -------------------------------------------------------------------
// https://en.wikipedia.org/wiki/List_of_Ridiculousness_episodes_(season_21%E2%80%93present)#Season_31_(2023)

const vals = [];
const rows = document.querySelectorAll('table:is(.wikitable,.plainrowheaders):has(th[scope]) tr:has(th+td)');
rows.forEach(s => {
  const n = parseInt(s.children[0].innerText.trim(), 10);
  if (n >= 1079) {
    const name = s.children[2].innerText.trim().replace(/'/g, "''");
    const aired = s.children[3].children[0]?.children[0].innerText ?? s.children[3].innerText;

    vals.push(`('6774048176174390112', '${name}', '${aired}', 'en.wikipedia.org')`);
  }
});

console.log(`
INSERT INTO tracker.tracked (series_id, name, aired_on, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO NOTHING
;
`);
// UPDATE SET air_date=EXCLUDED.air_date WHERE episode.air_date IS NULL



// -------------------------------------------------------------------
// https://epguides.com/Ridiculousness/

const vals = [];
const rows = document.querySelectorAll('div#eplist table tr:has(td.epinfo)');
rows.forEach(s => {
  const n = parseInt(s.children[0].innerText.trim(), 10);
  if (n >= 1077) {
    const name = s.children[3].innerText.trim().replace(/'/g, "''");
    const tmp = s.children[2].innerText.trim();
    const aired = new Date(tmp).toISOString().slice(0, 10);

    vals.push(`('6774048176174390112', '${name}', '${aired}', 'epguides.com')`);
  }
});

console.log(`
INSERT INTO tracker.tracked (series_id, name, aired_on, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO NOTHING
;
`);
// UPDATE SET air_date=EXCLUDED.air_date WHERE episode.air_date IS NULL






// -------------------------------------------------------------------
// https://www.themoviedb.org/tv/38657-ridiculousness/season/31?language=en-CA

const vals = [];
const rows = document.querySelectorAll('div.card div.episode_title');
rows.forEach(s => {
  const name = s.children[0].children[0].innerText.trim().replace(/'/g, "''");
  const tmp = s.children[1].lastElementChild.children[0].innerText.trim();
  const aired = new Date(tmp).toISOString().slice(0, 10);

  vals.push(`('6774048176174390112', '${name}', '${aired}', 'themoviedb.org')`);
});

console.log(`
INSERT INTO tracker.tracked (series_id, name, aired_on, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO NOTHING
;
`);
// UPDATE SET air_date=EXCLUDED.air_date WHERE episode.air_date IS NULL







// -------------------------------------------------------------------
// https://thetvdb.com/series/ridiculousness/allseasons/official

const vals = [];
const rows = document.querySelectorAll('li.list-group-item');
rows.forEach(s => {
  const name = s.children[0].children[1].innerText.replace(/"/g, '').trim();
  if (name.toLowercase() == 'tba') return;

  const tmp1 = s.children[1].children[0].innerText.trim();
  const aired = new Date(tmp1).toISOString().slice(0, 10);
  const seep = s.children[0].children[0].innerText.trim();
  const tmp2 = seep.match(/^[Ss](\d+)[Ee](\d+)$/);
  if (!tmp2 || tmp2.length != 3) return;

  const se = new String(parseInt(tmp2[1], 10)).padStart(4, '0');
  const ep = new String(parseInt(tmp2[2], 10)).padStart(3, '0');
  if (parseInt(tmp2[1], 10) < 31) return;

  vals.push(`('6774048176174390112', '${name}', '${aired}', '${se+ep}', 'thetvdb.com')`);
});

console.log(`
INSERT INTO tracker.tracked (series_id, name, aired_on, seep_key, source) VALUES
${vals.join(',\n')}
ON CONFLICT (series_id, name) DO --NOTHING
UPDATE SET aired_on = EXCLUDED.aired_on, seep_key = EXCLUDED.seep_key
WHERE tracked.aired_on IS NULL OR tracked.seep_key IS NULL
;
`);
// DO UPDATE SET aired_on=EXCLUDED.aired_on, seep=EXCLUDED.seep
// DO NOTHING