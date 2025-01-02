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
  static GET = 'GET';
  static POST = 'POST';
  // static PUT = 'PUT';
  // static PATCH = 'PATCH';
  // static DELETE = 'DELETE';
  // static OPTIONS = 'OPTIONS';

  request = {
    headers: {},
    url: '',
    method: '',
    params: {}
  };

  async fetch() {
    const headers = ApiHeaders.reset().merge(this.request.headers).get();
    const options = { headers, method: this.request.method, redirect: 'follow', };

    // const params = Object.entries(this.request.params).reduce(
    //   (acc,par) => acc + `${encodeURIComponent(par[0])}=${encodeURIComponent(par[1])}`,
    //   ''
    // );
    const params = (new URLSearchParams(this.request.params)).toString();

    if (params.length) {
      if (this.request.method === ApiRequest.POST) {
        options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
        options.body = params;
      }
      else if (this.request.method === ApiRequest.GET) {
        this.request.url += '?' + params;
      }
    }

    let result = await
    fetch(`https://xtvapi.cloudtv.comcast.net${this.request.url}`, options)
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
      // TODO handle errors properly
    });

    return result || {};
  }
}


class Request extends ApiRequest {
  constructor(xsctAuthToken, featuresToken) {
    super();
    this.request.headers['Authorization'] = 'CCP ' + xsctAuthToken;
    this.request.headers['X-Finity-Features'] = featuresToken;
  }
}


export class GetRequest extends Request {
  constructor(xsctAuthToken, featuresToken) {
    super(xsctAuthToken, featuresToken);
    this.request.method = ApiRequest.GET;
  }
}


export class PostRequest extends Request {
  constructor(xsctAuthToken, featuresToken) {
    super(xsctAuthToken, featuresToken);
    this.request.method = ApiRequest.POST;
  }
}
