import 'package:aladia_flutter_test/features/authentication/verification/verification_header.dart';
import 'package:aladia_flutter_test/features/home/home_screen.dart';
import 'package:aladia_flutter_test/providers/auth_provider.dart';
import 'package:aladia_flutter_test/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_button.dart';
import 'verification_form.dart';

class VerifyScreen extends StatefulWidget {
  final String email;
  const VerifyScreen({super.key, required this.email});
 

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String _verificationCode = '';

  void _verifyUser() async {
    if (_verificationCode.isEmpty || _verificationCode.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter the verification code correctly')),
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final success =
        await authProvider.verifyUser(widget.email, _verificationCode);
    debugPrint('Verification success: $success');
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification successful')));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Verification failed, please try again')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          kPadHor,
          MediaQuery.paddingOf(context).top,
          kPadHor,
          MediaQuery.paddingOf(context).bottom,
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const VerificationHeader(),
                    const SizedBox(height: 48),
                    VerificationForm(onCodeChanged: (code) {
                      setState(() {
                        _verificationCode = code;
                      });
                    }),
                    const SizedBox(height: 48),
                    CustomButton(
                        color: appTheme.colorScheme.onPrimary,
                        borderColor: appTheme.colorScheme.secondary,
                        onPressed: _verifyUser,
                        child: authProvider.authLoading ==
                                AuthLoading.verifyingUser
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: appTheme.colorScheme.secondary,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Verify',
                                style: TextStyle(
                                    color: appTheme.colorScheme.onSurface),
                              )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
