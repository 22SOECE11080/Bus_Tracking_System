import 'package:flutter/material.dart';
import '../../routes/routes.dart'; // make sure AppRoutes.login exists

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F0C29),
              Color(0xFF302B63),
              Color(0xFFC67C4E),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),

              // Top illustration
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Image.asset(
                  'assets/images/react-logo.png', // Replace with your illustration
                  height: 180,
                ),
              ),

              const SizedBox(height: 28),

              // Logo
              Image.asset(
                'assets/images/react-logo.png',
                height: 90,
              ),

              const SizedBox(height: 16),

              const Text(
                'MyApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome to your futuristic workspace',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 6),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Boost productivity • Organize smarter • Work with style 🚀',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    height: 1.35,
                  ),
                ),
              ),

              const Spacer(),

              // Get Started Button
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 34),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC67C4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 6,
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
