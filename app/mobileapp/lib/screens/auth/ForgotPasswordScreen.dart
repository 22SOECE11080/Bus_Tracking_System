import 'dart:ui';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  void _handleSendEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Send reset email to: ${_emailController.text}"),
        );
      },
    );
    Navigator.pushNamed(context, AppRoutes.verifyOtp); // go to OTP screen
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
                  const SizedBox(height: 100),

                  // Logo
                  Image.asset(
                    "assets/images/react-logo.png",
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(height: 30),

                  // Headings
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Don’t worry, it happens to the best of us 😉",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Enter your registered email and we’ll send you a reset link.",
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
                                "Reset Password",
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
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
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
                              const SizedBox(height: 30),

                              // Send Email Button
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
                                  onPressed: _handleSendEmail,
                                  child: const Text(
                                    "SEND EMAIL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Back to Login Button
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // go back
                                },
                                child: const Text(
                                  "Back to Login",
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
