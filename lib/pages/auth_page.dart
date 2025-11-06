import 'package:flutter/material.dart';
import 'dart:ui';

class User {
  String? email;
  String? password;
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool modal = false;
  bool isSignIn = true;
  bool reConfirm = false;
  bool authSubmit = true;

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            opacity: modal ? 0 : 1,
            duration: const Duration(milliseconds: 400),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Let us get access\ncrossover Ethernet!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  if (authSubmit) ...[
                    const SizedBox(height: 25),

                    if (user.email != null && user.password != null) ...[
                      Text(
                        "Email: ${user.email}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Password: ${user.password}",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ],

                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => setState(() => modal = true),
                    child: const Text("Authenticate"),
                  ),
                ],
              ),
            ),
          ),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            reverseDuration: const Duration(milliseconds: 300),
            child: modal
                ? SlideFade(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                        child: Container(
                          width: 350,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                isSignIn ? "Sign In" : "Sign Up",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),

                              const SizedBox(height: 24),
                              _field("Email", (v) => user.email = v),
                              const SizedBox(height: 16),
                              _field(
                                "Password",
                                (v) => user.password = v,
                                obscure: true,
                              ),

                              if (!isSignIn) ...[
                                const SizedBox(height: 16),
                                _field(
                                  "Re-confirm Password",
                                  (v) => setState(
                                    () => reConfirm = (user.password == v),
                                  ),
                                  obscure: true,
                                ),
                              ],

                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () =>
                                    setState(() => isSignIn = !isSignIn),
                                child: Text(
                                  isSignIn
                                      ? "Don't have an account? Sign Up"
                                      : "Already have an account? Sign In",
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    authSubmit = true;
                                    modal = false;
                                  });
                                },
                                child: Text(
                                  isSignIn ? "Sign In" : "Create Account",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 16),

                              TextButton(
                                onPressed: () => setState(() => modal = false),
                                child: const Text(
                                  "Close",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _field(
    String label,
    Function(String) onChanged, {
    bool obscure = false,
  }) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        fillColor: Colors.white.withOpacity(0.06),
        filled: true,
      ),
      onChanged: onChanged,
    );
  }
}

class SlideFade extends StatelessWidget {
  final Widget child;
  const SlideFade({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.85, end: 1),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        );
      },
      child: child,
    );
  }
}
