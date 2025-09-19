import 'dart:ui';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class StudentHomeScreen extends StatelessWidget {
  final String username; // ✅ Add username property

  const StudentHomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // 🎨 Gradient colors (your brand theme)
    const accentColor = Color(0xFFC67C4E);
    const darkColor = Color(0xFF0F0C29);
    const middleColor = Color(0xFF302B63);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== HEADER =====
            Container(
              width: double.infinity,
              height: 250, // ✅ Increased height
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [darkColor, middleColor, accentColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                // ✅ Everything in column form
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/react-logo.png"),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Welcome, $username 👋", // ✅ Dynamic username
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24, // ✅ Slightly bigger
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Track your school bus in real-time",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== BUS INFO CARD =====
            _buildInfoCard(
              title: "Assigned Bus",
              value: "Bus #12 - Green Route",
              icon: Icons.directions_bus,
              gradientColors: [darkColor, middleColor],
            ),

            _buildInfoCard(
              title: "Current Status",
              value: "On the way 🚍",
              icon: Icons.access_time,
              gradientColors: [middleColor, accentColor],
            ),

            _buildInfoCard(
              title: "Driver",
              value: "John Doe (9876543210)",
              icon: Icons.person,
              gradientColors: [darkColor, accentColor],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  // Reusable Info Card
  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required List<Color> gradientColors,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    )),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
