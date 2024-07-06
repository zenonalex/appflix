import 'package:appflix/core/http_client/http_client.dart';
import 'package:http/http.dart' as http;

import '../di.dart';
import 'navigation/router.dart';

Future<void> initCore() async {
  //! AppRouter
  sl.registerSingleton<AppRouter>(AppRouter());

  //! HTTP Client
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<IHttpClient>(() => HttpClient(sl()));
}
