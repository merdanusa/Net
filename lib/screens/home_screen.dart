import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/controllers/auth_controllers.dart';
import 'package:vpn/widgets/header_widget.dart';
import 'package:vpn/widgets/header_widget.dart';
import 'package:vpn/widgets/prompt_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>();

    return Scaffold(
      appBar: const CustomHomeAppBar(),
      drawer: const HomeDrawer(),
      backgroundColor: const Color(0xFF0A0A0A),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            PromptWidget(),
          ],
        ),
      ),
    );
  }
}
