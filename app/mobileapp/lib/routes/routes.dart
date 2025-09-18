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
