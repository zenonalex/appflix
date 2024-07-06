import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/navigation/router.dart';
import 'di.dart' as di;

void main() async {
  await dotenv.load(fileName: ".env");
  await di.init();

  io.HttpOverrides.global = MyHttpOverrides();

  runApp(AppFlix());
}

class AppFlix extends StatelessWidget {
  AppFlix({super.key});

  final _appRouter = di.sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AppFlix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}

class MyHttpOverrides extends io.HttpOverrides {
  @override
  io.HttpClient createHttpClient(io.SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (io.X509Certificate cert, String host, int port) => true;
  }
}
