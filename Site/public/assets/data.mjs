/*
{
    "6774048176174390112": {
        "seriesId": "6774048176174390112",
        "name": "Ridiculousness",
        "releaseYear": "2011-",
        "seasonMin": 31,
        "seasonMax": 9999,
    },
    "8246950733502197112": {
        "seriesId": "8246950733502197112",
        "name": "Schitt's Creek",
        "releaseYear": "2015-2020",
        "seasonMin": 1,
        "seasonMax": 6
    }
}
*/



export const data = {
  series: null,
  // length: 0,
  // get length() {
  //   return this.rows.length;
  // },

  loadSeries() {
    // cached data available then return
    if (this.series) {
      return Promise.resolve();
    }

    return fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (json?.constructor === Object) {
        this.series = json;
        // this.series.length = Object.keys(json).length;
      }
    });
  },

  loadTracked(seriesId) {
    // cached data available then return
    if (this.series[seriesId].programs) {
      return Promise.resolve();
    }

    return fetch(`http://192.168.50.200:9080/series/${seriesId}/tracked`)
    .then(data => data.json())
    .then(json => {
      if (json?.constructor === Array) {
        this.series[seriesId].programs = json;
        // this.length = json.length;
      }
    });
  },
};
