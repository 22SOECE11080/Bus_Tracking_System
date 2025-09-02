import 'package:flutter/material.dart';
import '../../routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bus Tracking App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.splash,
    );
  }
}
