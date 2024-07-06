import 'package:appflix/core/http_client/http_client.dart';
import 'package:http/http.dart' as http;

import '../di.dart';

Future<void> initCore() async {
  //! HTTP Client
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<IHttpClient>(() => HttpClient(sl()));
}
