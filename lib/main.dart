import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'package:vpn/controllers/auth_controllers.dart';
import 'package:vpn/screens/details_screen.dart';
import 'package:vpn/screens/home_screen.dart';
import 'package:vpn/screens/login_screen.dart';
import 'package:vpn/screens/register_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final AuthController authController = Get.put(AuthController());

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.distinct().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final GoRouter _router = GoRouter(
  refreshListenable: GoRouterRefreshStream(authController.token.stream),
  redirect: (context, state) {
    final isLoggedIn = authController.token.value.isNotEmpty;
    final path = state.uri.path;
    final isAuthPage = path == '/login' || path == '/register';

    if (!isLoggedIn && !isAuthPage) return '/login';
    if (isLoggedIn && isAuthPage) return '/';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) => const DetailsScreen(),
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterScreen(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Sora',
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
    );
  }
}
