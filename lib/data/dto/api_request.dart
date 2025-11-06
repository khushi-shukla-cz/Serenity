/// API Request wrapper
class ApiRequest {

  const ApiRequest({
    required this.endpoint,
    this.method = 'GET',
    this.headers,
    this.queryParameters,
    this.body,
  });
  final String endpoint;
  final String method;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? queryParameters;
  final dynamic body;

  Map<String, dynamic> toJson() => {
        'endpoint': endpoint,
        'method': method,
        'headers': headers,
        'queryParameters': queryParameters,
        'body': body,
      };
}
