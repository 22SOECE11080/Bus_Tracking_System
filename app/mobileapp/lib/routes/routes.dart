import 'package:flutter/material.dart';
import '../screens/auth/ForgotPasswordScreen.dart';
import '../screens/auth/LoginScreen.dart';
import '../screens/auth/ResetPasswordScreen.dart';
import '../screens/auth/VerifyOtpScreen.dart';
import '../screens/splash/SplashScreen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String verifyOtp = '/verify-otp';
  static const String home = '/home';
  static const String resetPassword = '/reset-password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      // case home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
