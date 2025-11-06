import 'package:flutter/material.dart';

class User {
  String? email;
  String? password;
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  bool modal = false;
  bool isSignIn = true;
  bool reConfirm = false;

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (!modal)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Let us get access crossover Ethernet!",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        modal = true;
                      });
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(20),
                      ),
                    ),
                    child: const Text("Authenticate"),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    user.email == null ? "" : "Email: ${user.email}",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),

          if (modal)
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 360,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Sign in", style: TextStyle(fontSize: 20)),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: const InputDecoration(labelText: "Email"),
                      onChanged: (value) {
                        setState(() {
                          user.email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          user.password = value;
                        });
                      },
                    ),
                    if (!isSignIn)
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Re-confirm password",
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            reConfirm = (user.password == value);
                          });
                        },
                      ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => isSignIn = false);
                      },
                      child: Text(
                        isSignIn
                            ? "Haven't you got an account then Sign Up"
                            : "Have you got an account then Sign In",
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => modal = false);
                      },
                      child: const Text("Close"),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
