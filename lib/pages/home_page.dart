import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const ProfilePage());
          },
          child: const Text("Go to Profile"),
        ),
      ),
    );
  }
}
