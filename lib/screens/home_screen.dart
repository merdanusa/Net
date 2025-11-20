import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:vpn/controllers/auth_controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Sora'), centerTitle: true),
      body: Center(
        child: Obx(() {
          final loggedIn = authController.isLoggedIn;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!loggedIn)
                GFButton(
                  onPressed: () => context.go('/login'),
                  text: "Auth",
                  type: GFButtonType.solid,
                  shape: GFButtonShape.pills,
                  color: GFColors.SUCCESS_SWATCH,
                  fullWidthButton: true,
                )
              else
                GFButton(
                  onPressed: () {
                    authController.clearToken();
                    context.go('/login');
                  },
                  text: "Logout",
                  type: GFButtonType.solid,
                  shape: GFButtonShape.pills,
                  color: GFColors.DANGER,
                  fullWidthButton: true,
                ),
              GFButton(
                onPressed: () {
                  context.go('/details');
                },
                text: "Go to details",
                type: GFButtonType.solid,
                shape: GFButtonShape.pills,
                color: GFColors.FOCUS,
                fullWidthButton: true,
              ),
            ],
          );
        }),
      ),
    );
  }
}
