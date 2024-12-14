import {GetRequest, PostRequest} from '/task/actions_base.mjs';


// "href": "watchedprograms/{?maxDaysOld}"
// @return array of objects of watchedprograms
export class getWatchedPrograms extends GetRequest {
  constructor(xsctAuthToken, featuresToken) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/watchedprograms/`;
  }
}


// "href": "entity/program/{programId}/"
// @return program entity object
export class getProgramEntity extends GetRequest {
  constructor(xsctAuthToken, featuresToken, programId) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/entity/program/${programId}/`;
    // this.request.headers['Cache-control'] = 'no-cache, no-store';
  }
}


// "href": "entity/detail/program/{programId}/{?streamFormat,includeTve,includeTveLinear}"
export class getProgramEntityDetail extends GetRequest {
  constructor(xsctAuthToken, featuresToken, programId) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/entity/detail/program/${programId}/`;
    this.request.headers['Cache-control'] = 'no-cache, no-store';
    this.request.params['streamFormat'] = 'M3U';
    this.request.params['includeTve'] = true;
    this.request.params['includeTveLinear'] = true;
  }
}


// "href": "entity/program/{programId}/upcomingListings/{?freetome}"
export class getProgramUpcomingListings extends GetRequest {
  constructor(xsctAuthToken, featuresToken, programId) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/entity/program/${programId}/upcomingListings/`;
    this.request.params['freetome'] = 1;
    // this.request.headers['Cache-control'] = 'no-cache, no-store';
  }
}


// "href": "entity/series/{seriesId}/tvseason/{seasonNumber}/"
export class getTvSeasonEntity extends GetRequest {
  constructor(xsctAuthToken, featuresToken, seriesId, seasonNum) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/entity/series/${seriesId}/tvseason/${seasonNum}/`;
    // this.request.headers['Cache-control'] = 'no-cache, no-store';
  }
}


// "href": "entity/tvseason/ungrouped/{programId}/",
export class getTvSeasonUngroupedEntity extends GetRequest {
  constructor(xsctAuthToken, featuresToken, programId) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/entity/tvseason/ungrouped/${programId}/`;
    // this.request.headers['Cache-control'] = 'no-cache, no-store';
  }
}


// "href": "search/term/{?query,ftmvod,freetome,limit,includeMenus,aliasName,includeStations,matchExactChannel,includeVodCompany}",
export class searchByTerm extends GetRequest {
  constructor(xsctAuthToken, featuresToken, searchTerm) {
    super(xsctAuthToken, featuresToken);
    this.request.url = `/search/term/`;
    this.request.params['query'] = searchTerm;
    this.request.params['ftmvod'] = 1;
    this.request.params['freetome'] = 1;
  }
}
