import 'package:aladia_flutter_test/app/splash.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aladia_flutter_test/features/authentication/login/login_screen.dart';
import 'package:aladia_flutter_test/features/home/home_screen.dart';

import '../providers/login_provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return FutureBuilder<void>(
      future: authProvider.checkStoredAccessToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        } else if (authProvider.users.isNotEmpty) {
          // Access token found, navigate to HomeScreen
          return const HomeScreen();
        } else {
          // No access token found, navigate to LoginScreen
          return const LoginScreen();
        }
      },
    );
  }
}
