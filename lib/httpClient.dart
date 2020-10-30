import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  final String apiKey;
  final http.Client _inner;

  HttpClient(this.apiKey, this._inner);

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  @override
  Future<http.Response> get(dynamic url, {Map<String, String> headers}) {
    final Map _headers = _mergedHeaders(headers);
    _headers['x-api-key'] = this.apiKey;

    return _inner.get(url, headers: _headers);
  }

  @override
  Future<http.Response> post(dynamic url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) {
    final Map _headers = _mergedHeaders(headers);
    _headers['x-api-key'] = this.apiKey;

    return _inner.post(url, headers: _headers, body: body, encoding: encoding);
  }

  Future<http.StreamedResponse> send(http.BaseRequest request) =>
      _inner.send(request);

  Map<String, String> _mergedHeaders(Map<String, String> headers) =>
      {...?_defaultHeaders, ...?headers};
}
