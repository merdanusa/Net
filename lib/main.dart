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
  redirect: (context, state) {
    final loggedIn = authController.isLoggedIn;
    final path = state.uri.path;
    final loggingIn = path == '/login' || path == '/register';

    if (!loggedIn && !loggingIn) return '/login';
    if (loggedIn && loggingIn) return '/';
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
    return Obx(() {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      );
    });
  }
}
