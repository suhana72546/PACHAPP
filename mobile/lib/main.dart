import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/landing/screens/landing_screen.dart';

void main() {
  runApp(const PachappApp());
}

class PachappApp extends StatelessWidget {
  const PachappApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PACHAPP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LandingScreen(),
    );
  }
}