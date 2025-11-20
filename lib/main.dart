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
  runApp(MyApp());
}

final AuthController authController = Get.put(AuthController());

final GoRouter _router = GoRouter(
  refreshListenable: authController,
  redirect: (context, state) {
    final loggedIn = authController.isLoggedIn;
    final loggingIn = state.subloc == '/login' || state.subloc == '/register';
    if (!loggedIn && !loggingIn) return '/login';
    if (loggedIn && loggingIn) return '/';
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      );
    });
  }
}
