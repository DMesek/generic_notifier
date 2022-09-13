import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/main.dart';
import 'package:reusability/presentation/example_page.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider<AppRouter?>((ref) {
  return AppRouter();
});

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: ExamplePage, initial: true, path: '/'),
    AutoRoute(page: SecondScreen, path: secondRoute),
    AutoRoute(page: Screen3, path: thirdRoute),
  ],
)
class AppRouter extends _$AppRouter {}
