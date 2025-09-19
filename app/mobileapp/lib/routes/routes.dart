import 'package:flutter/material.dart';

// === Auth Screens ===
import '../screens/auth/ForgotPasswordScreen.dart';
import '../screens/auth/LoginScreen.dart';
import '../screens/auth/ResetPasswordScreen.dart';
import '../screens/auth/VerifyOtpScreen.dart';

// === Driver Screens ===
import '../screens/driver/BusAssignmentScreen.dart';
import '../screens/driver/DriverTrackingScreen.dart';
import '../screens/driver/EndTripScreen.dart';
import '../screens/driver/driver_home.dart';
import '../screens/driver/driver_qr_scanner.dart';

// === Splash Screen ===
import '../screens/splash/SplashScreen.dart';
import '../screens/student_parnets/LiveBusTrackingScreen.dart';
import '../screens/student_parnets/StudentHomeScreen.dart';
import '../screens/student_parnets/StudentMainScreen.dart';

class AppRoutes {
  // === Auth Routes ===
  static const String splash = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String verifyOtp = '/verify-otp';
  static const String resetPassword = '/reset-password';

  // === Driver Routes ===
  static const String driverHome = '/driver-home';
  static const String driverQrScanner = '/driver-qr-scanner';
  static const String driverBusAssignment = '/driver-bus-assignment';
  static const String driverTracking = '/driver-tracking';
  static const String endTrip = '/end-trip';

  // === Student/Parent Routes ===
  static const String studentMainScreen = '/student-main';
  static const String studentHome = '/student-home';
  static const String liveTracking = '/live-tracking';
  static const String studentBusRoute = '/student-bus-route';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // === Auth Screens ===
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case verifyOtp:
        return MaterialPageRoute(builder: (_) => const VerifyOtpScreen());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      // === Driver Screens ===
      case driverHome:
        return MaterialPageRoute(builder: (_) => const DriverHomeScreen());
      case driverQrScanner:
        return MaterialPageRoute(builder: (_) => const DriverQRScannerScreen());

      case driverBusAssignment:
        final busData = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BusAssignmentScreen(busData: busData),
        );

      case driverTracking:
        final stops = settings.arguments as List<Map<String, dynamic>>;
        return MaterialPageRoute(
          builder: (_) => DriverTrackingScreen(stops: stops),
        );
      case endTrip:
        final stops = settings.arguments as List<Map<String, dynamic>>;
        return MaterialPageRoute(
          builder: (_) => EndTripScreen(stops: stops),
        );
      // === Student/Parent Screens ===
      case studentMainScreen:
        return MaterialPageRoute(builder: (_) => StudentMainScreen());
      case studentHome:
        return MaterialPageRoute(
            builder: (_) => const StudentHomeScreen(
                  username: 'RJ',
                ));
      case liveTracking:
        final stops = settings.arguments as List<Map<String, dynamic>>? ?? [];
        final stopNames = stops.map((stop) => stop['name'] as String).toList();
        return MaterialPageRoute(
          builder: (_) => LiveBusTrackingScreen(stops: stopNames),
        );
      case studentBusRoute:
        final stops = (settings.arguments as List<Map<String, dynamic>>?) ??
            [
              {"name": "Stop 1", "expected": "08:00 AM", "actual": "08:02 AM"},
              {"name": "Stop 2", "expected": "08:10 AM", "actual": "08:12 AM"},
              {"name": "Stop 3", "expected": "08:20 AM", "actual": null},
            ]; // ✅ fallback demo data
        return MaterialPageRoute(
          builder: (_) => StudentBusRouteScreen(stops: stops),
        );

      // === Default ===
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class StudentBusRouteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stops;

  const StudentBusRouteScreen({Key? key, required this.stops})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Bus Route')),
      body: ListView.builder(
        itemCount: stops.length,
        itemBuilder: (context, index) {
          final stop = stops[index];
          return ListTile(
            title: Text(stop['name'] ?? 'Unknown Stop'),
          );
        },
      ),
    );
  }
}
