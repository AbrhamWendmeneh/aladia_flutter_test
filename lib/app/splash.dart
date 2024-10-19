import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aladia_flutter_test/features/authentication/login/login_screen.dart';
import 'package:aladia_flutter_test/features/home/home_screen.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.checkStoredAccessToken();

    if (authProvider.users.isNotEmpty) {
      // Access token found, navigate to HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // No access token found, navigate to LoginScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/images/splash_screen_image.png'), // Your splash screen image
      ),
    );
  }
}
