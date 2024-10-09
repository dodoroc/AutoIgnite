/*
// series
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

// tracked
[
    {
        "name": "Brooke Schofield",
        "airedOn": "2024-06-24",
        "watchedOn": "2024-07-10",
        "programId": "6899404022541512112",
        "seepKey": "0039030"
    },
    {
        "name": "Brooke Schofield II",
        "airedOn": "2024-06-24",
        "watchedOn": "2024-07-18",
        "programId": "6913634914419264112",
        "seepKey": "0039031"
    },
]
*/



export const data = {
  series: null,
  seriesId: null,

  get count() {
    return this.series[this.seriesId]?.programs?.length ?? 0;
  },

  loadSeries() {
    // cached data available then return
    if (this.series) {
      return Promise.resolve();
    }

    // return fetch(`http://192.168.50.200:9080/series`)
    return fetch(`/series`)
    .then(data => data.json())
    .then(json => {
      if (json?.constructor === Object) {
        this.series = json;
      }
    });
  },

  loadTracked(seriesId) {
    this.seriesId = null;
    // cached data available then return
    if (this.series[seriesId].programs) {
      this.seriesId = seriesId;
      return Promise.resolve();
    }

    // return fetch(`http://192.168.50.200:9080/series/${seriesId}/tracked`)
    return fetch(`/series/${seriesId}/tracked`)
    .then(data => data.json())
    .then(json => {
      if (json?.constructor === Array) {
        this.seriesId = seriesId;
        this.series[seriesId].programs = json;
      }
    });
  },
};
