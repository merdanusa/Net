import 'package:flutter/material.dart';
import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/counter_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Black App',
      theme: ThemeData.dark(),
      home: const HomePage(),
      routes: {
        '/auth': (context) => const AuthPage(),
        '/counter': (context) => const CounterPage(),
      },
    );
  }
}
