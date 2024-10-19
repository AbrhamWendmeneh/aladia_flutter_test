import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aladia_flutter_test/features/authentication/login/login_screen.dart';
import 'package:aladia_flutter_test/features/home/home_screen.dart';
import '../providers/auth_provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.users.isNotEmpty) {
      // Access token found, navigate to HomeScreen
      return const HomeScreen();
    } else {
      // No access token found, navigate to LoginScreen
      return const LoginScreen();
    }
  }
}