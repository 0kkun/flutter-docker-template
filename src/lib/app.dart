import 'package:flutter/material.dart';
import 'package:workspace/router.dart';

// アプリ全体
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Routing Demo',
      // ここはgo_routerを使用するときおまじない
      routeInformationProvider: routerConfig.routeInformationProvider,
      routeInformationParser: routerConfig.routeInformationParser,
      routerDelegate: routerConfig.routerDelegate,
    );
  }
}