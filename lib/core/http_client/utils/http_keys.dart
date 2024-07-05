import 'package:flutter_dotenv/flutter_dotenv.dart';

enum HttpKeys {
  host,
  scheme,
  apiKey,
  accessToken,
}

extension HttpKeysExtensions on HttpKeys {
  String? get value {
    switch (this) {
      case HttpKeys.accessToken:
        return dotenv.env['ACCESS_TOKEN'];
      case HttpKeys.apiKey:
        return dotenv.env['API_KEY'];
      case HttpKeys.host:
        return dotenv.env['PRODUCTION_URL'];
      case HttpKeys.scheme:
        return "https";
      default:
        return HttpKeys.host.value;
    }
  }
}
