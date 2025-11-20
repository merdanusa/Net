import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          children: [
            GFButton(
              onPressed: () => context.go('/login'),
              text: "Auth",
              type: GFButtonType.solid,
              shape: GFButtonShape.pills,
              color: GFColors.SUCCESS_SWATCH,
              fullWidthButton: true,
            ),
          ],
        ),
      ),
    );
  }
}
