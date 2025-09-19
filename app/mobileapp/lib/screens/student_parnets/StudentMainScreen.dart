import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class StudentMainScreen extends StatefulWidget {
  @override
  _StudentMainScreenState createState() => _StudentMainScreenState();
}

class _StudentMainScreenState extends State<StudentMainScreen> {
  int _currentIndex = 0;

  // 👇 Route names (not widgets directly)
  final List<String> _routes = [
    AppRoutes.studentHome, // 🏠 Home
    AppRoutes.liveTracking, // 🗺️ Tracking
    AppRoutes.studentBusRoute,
    // AppRoutes.studentNotifications,
    // AppRoutes.studentProfile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        // keep state of each screen alive
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (settings) => AppRoutes.generateRoute(
            RouteSettings(name: _routes[_currentIndex])),
      ),

      // 🌈 Common Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFFC67C4E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: "Tracking",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.route),
              label: "Routes",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Alerts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
