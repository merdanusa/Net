import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/pages/reset_flow_page.dart';
import 'package:vpn/routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.resetFlow);
          },
          child: const Text("Replace Everything to Another Page"),
        ),
      ),
    );
  }
}
