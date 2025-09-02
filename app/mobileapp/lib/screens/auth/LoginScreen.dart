import 'dart:ui';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleLogin() {
    print("Login with: ${_emailController.text}, ${_passwordController.text}");
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFFC67C4E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 100), // moved a little further down

                  // Logo
                  Image.asset(
                    "assets/images/react-logo.png",
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: 30),

                  // Headings
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Sign in to continue your journey 🚀",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Stay productive, stay connected – your workspace awaits.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white60),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Glassmorphism Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFC67C4E),
                                ),
                              ),
                              const SizedBox(height: 35),

                              // Email Input
                              TextField(
                                controller: _emailController,
                                style: const TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.12),
                                  hintText: "Email",
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),

                              // Password Input
                              TextField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.12),
                                  hintText: "Password",
                                  hintStyle:
                                      const TextStyle(color: Colors.white70),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.white70,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xFFC67C4E),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFC67C4E),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  onPressed: _handleLogin,
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Forgot Password
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.forgotPassword);
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Color(0xFFC67C4E),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
