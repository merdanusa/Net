import 'package:flutter/material.dart';
import 'counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Welcome to Home Page",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: const Text("Go to Counter Page (Named Route)"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterPage()),
                );
              },
              child: const Text("Go to Counter Page (Direct Route)"),
            ),
          ],
        ),
      ),
    );
  }
}
