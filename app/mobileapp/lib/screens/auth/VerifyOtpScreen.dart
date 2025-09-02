import 'dart:ui';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  void _handleVerify() {
    final otp = _otpControllers.map((c) => c.text).join();
    print("Verify OTP: $otp");
    Navigator.pushReplacementNamed(context, AppRoutes.resetPassword);
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
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),

                  // Title + Subtitle
                  const Text(
                    "Verify OTP",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Enter the 6-digit code sent to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Glassmorphic Card
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
                            children: [
                              // OTP Input Row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (index) {
                                  return SizedBox(
                                    width: 45,
                                    child: TextField(
                                      controller: _otpControllers[index],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        filled: true,
                                        fillColor:
                                            Colors.white.withOpacity(0.12),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty && index < 5) {
                                          FocusScope.of(context).nextFocus();
                                        } else if (value.isEmpty && index > 0) {
                                          FocusScope.of(context)
                                              .previousFocus();
                                        }
                                      },
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(height: 30),

                              // Verify Button
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
                                  onPressed: _handleVerify,
                                  child: const Text(
                                    "VERIFY",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Resend Code
                              GestureDetector(
                                onTap: () {
                                  print("Resend Code");
                                },
                                child: const Text(
                                  "Resend Code",
                                  style: TextStyle(
                                    color: Color(0xFFC67C4E),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Back Button
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Back",
                                  style: TextStyle(color: Colors.white70),
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
