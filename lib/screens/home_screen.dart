import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:vpn/controllers/auth_controllers.dart';
import 'package:vpn/widgets/header_widget.dart';
import 'package:vpn/widgets/prompt_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: const CustomHomeAppBar(),
      drawer: const HomeDrawer(),
      backgroundColor: const Color(0xFF0A0A0A),
      body: Center(
        child: Obx(() {
          return const PromptWidget();
        }),
      ),
    );
  }
}
