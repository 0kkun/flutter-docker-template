import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workspace/screens/page_a.dart';
import 'package:workspace/screens/page_b.dart';
import 'package:workspace/screens/page_c.dart';


final GoRouter routerConfig = GoRouter(
  // アプリが起動したときのパス
  initialLocation: '/a',
  // パスと画面の組み合わせを定義する
  routes: <RouteBase>[
    GoRoute(
      path: '/a',
      builder: (BuildContext context, GoRouterState state) => const PageA(),
    ),
    GoRoute(
      path: '/b',
      builder: (BuildContext context, GoRouterState state) => const PageB(),
    ),
    GoRoute(
      path: '/c',
      builder: (BuildContext context, GoRouterState state) => const PageC(),
    ),
  ],

  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);