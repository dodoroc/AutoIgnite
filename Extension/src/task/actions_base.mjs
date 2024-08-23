class ApiHeaders {
  static BASE_HEADERS = {
    'Accept': 'application/comcast+hal+json, application/json, */*; q=0.01',
    'Accept-Language': 'en-US,en;q=0.9',

    // following are forbidden headers; no point in adding them, just here for reference
    // 'Accept-Encoding': 'gzip, deflate, br, zstd',
    // 'Origin': 'https://ignitetv.rogers.com',
    // 'Referer': 'https://ignitetv.rogers.com/',
    // 'Host': 'xtvapi.cloudtv.comcast.net',

    'Referrer-Policy': 'strict-origin-when-cross-origin',
    // 'Referrer-Policy': 'no-referrer',

    // following are forbidden headers; no point in adding them, just here for reference
    // 'Sec-Fetch-Dest': 'empty',
    // 'Sec-Fetch-Site': 'cross-site',
    // 'Sec-Fetch-Mode': 'cors',
  };

  static headers = ApiHeaders.BASE_HEADERS;

  static clear() {
    ApiHeaders.headers = {};
    return this;
  }

  static reset() {
    ApiHeaders.headers = ApiHeaders.BASE_HEADERS;
    return this;
  }

  static merge(moreHeaders) {
    ApiHeaders.headers = Object.assign({}, ApiHeaders.headers, moreHeaders);
    return this;
  }

  static get() {
    return ApiHeaders.headers;
  }
}


class ApiRequest {
  static BASE_URL = 'https://xtvapi.cloudtv.comcast.net';

  static GET = 'GET';
  static POST = 'POST';
  // static PUT = 'PUT';
  // static PATCH = 'PATCH';
  // static DELETE = 'DELETE';
  // static OPTIONS = 'OPTIONS';

  static async sendRequest(request) {
    const headers = ApiHeaders.reset().merge(request.headers).get();
    const options = { headers, method: request.method, redirect: 'follow', };

    const params = (new URLSearchParams(request.params)).toString();
    if (params.length) {
      if (request.method === ApiRequest.POST) {
        options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        options.body = params;
      }
      else if (request.method === ApiRequest.GET) {
        request.url += '?' + params;
      }
    }

    let result = await
    fetch(ApiRequest.BASE_URL + request.url, options)
    .then(response => {
      if (response.ok) {
        if (response.status === 200) {
          return new Response(response.body).json();
        }
      }

      throw new Error('ERR:API', {cause: response});
    })
    .catch(error => {
      throw new Error('ERR:NET', {cause: error.cause});
    });

    return result;
  }
}


class Action {
  request = {
    headers: {},
    url: '',
    method: '',
    params: {}
  };

  fetch() {
    return ApiRequest.sendRequest(this.request);
  }

  constructor(xsctAuthToken, featuresToken) {
    this.request.headers['Authorization'] = 'CCP ' + xsctAuthToken;
    this.request.headers['X-Finity-Features'] = featuresToken;
  }
}


export class GetAction extends Action {
  constructor(xsctAuthToken, featuresToken) {
    super(xsctAuthToken, featuresToken);
    this.request.method = ApiRequest.GET;
  }
}


export class PostAction extends Action {
  constructor(xsctAuthToken, featuresToken) {
    super(xsctAuthToken, featuresToken);
    this.request.method = ApiRequest.POST;
  }
}
