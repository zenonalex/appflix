import 'package:http/http.dart';

import 'utils/http_keys.dart';

abstract class IHttpClient {
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters});
}

class HttpClient implements IHttpClient {
  final Client client;

  HttpClient(this.client);

  final headers = {
    'Content-type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${HttpKeys.accessToken.value}',
  };

  @override
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    final url = _getUrl(endpoint, queryParameters);
    final response = await client.get(url, headers: headers);

    return response;
  }

  Uri _getUrl(String? endpoint, Map<String, dynamic>? queryParameters) {
    return Uri(
      scheme: HttpKeys.scheme.value,
      host: HttpKeys.host.value,
      path: endpoint,
      queryParameters: queryParameters,
    );
  }
}
