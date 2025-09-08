import 'dart:ui';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Theme colors
    final colorScheme = Theme.of(context).colorScheme;

    // 🎨 Your custom gradient colors (unchanged)
    const accentColor = Color(0xFFC67C4E);
    const darkColor = Color(0xFF0F0C29);
    const middleColor = Color(0xFF302B63);

    return Scaffold(
      backgroundColor: colorScheme.surface, // uses theme background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== HEADER =====
            Container(
              width: double.infinity,
              height: 220,
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/images/react-logo.png"),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Hello, Driver 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Ready for your trip?",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // ===== ACTION CARDS =====
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                children: [
                  _buildActionCard(
                    context,
                    title: "Scan Bus QR",
                    icon: Icons.qr_code_scanner,
                    color: colorScheme.primary,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.driverQrScanner);
                    },
                  ),
                  _buildActionCard(
                    context,
                    title: "Start Sharing",
                    icon: Icons.play_circle_fill,
                    color: colorScheme.secondary,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Start Sharing"),
                          content: const Text(
                              "This would start location sharing for the bus."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Got it"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  _buildActionCard(
                    context,
                    title: "Stop Sharing",
                    icon: Icons.stop_circle,
                    color: colorScheme.error,
                    onTap: () {},
                  ),
                  _buildActionCard(
                    context,
                    title: "Profile",
                    icon: Icons.person,
                    color: colorScheme.tertiary,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withOpacity(0.5), width: 1.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: color),
                const SizedBox(height: 12),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
