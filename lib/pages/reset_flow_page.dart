import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/pages/home_page.dart';
import 'package:vpn/routes/app_routes.dart';

class ResetFlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Reset Flow"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Warning",
                  middleText: "Are you sure?",
                  textConfirm: "Yes",
                  textCancel: "No",
                  onConfirm: () {
                    Get.back();
                    Get.offAllNamed(AppRoutes.home);
                    Get.snackbar("Success", "You're redirected to home page");
                  },
                );
              },
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
