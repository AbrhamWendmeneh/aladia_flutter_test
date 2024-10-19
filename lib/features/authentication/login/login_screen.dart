import 'package:aladia_flutter_test/features/authentication/signup/signup_screen.dart';
import 'package:aladia_flutter_test/shared/constants.dart';
import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/home_screen.dart';
import 'login_header.dart';
import 'login_form.dart';
import '../../../providers/auth_provider.dart';
import 'social_media_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEnteringPassword = false;

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Theme.of(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: _isEnteringPassword
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _isEnteringPassword = false;
                  });
                },
              ),
              actions: const [ThemeToggleSwitch()],
            )
          : null,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
        kPadHor,
          MediaQuery.paddingOf(context).top,
        kPadHor,
          MediaQuery.paddingOf(context).bottom,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LoginHeader(),
                    const SizedBox(height: 24),
                    Text(
                      _isEnteringPassword
                          ? 'Enter your password'
                          : 'Enter your email',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      isEnteringPassword: _isEnteringPassword,
                      formKey: _formKey,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      color: appTheme.colorScheme.onPrimary,
                      borderColor: appTheme.colorScheme.secondary,
                      onPressed: () async {
                        if (_isEnteringPassword) {
                          if (_formKey.currentState!.validate()) {
                            authProvider.signIn(
                                email: _emailController.text,
                                password: _passwordController.text,
                                onSuccess: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                      (route) => false);
                                },
                                onFail: (p0) => {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(p0),
                                        ),
                                      ),
                                      debugPrint(p0)
                                    });
                          }
                        } else {
                          if (_formKey.currentState!.validate()) {
                            try {
                              final userExists = await authProvider
                                  .checkUser(_emailController.text);

                              if (userExists) {
                                setState(() {
                                  _isEnteringPassword = true;
                                });
                              } else {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString(
                                    'signup_email', _emailController.text);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignupScreen(),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Failed to check user Please try again'),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child:
                          authProvider.authLoading == AuthLoading.signingIn ||
                                  authProvider.authLoading ==
                                      AuthLoading.checkingUser
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: appTheme.colorScheme.secondary,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Enter',
                                  style: TextStyle(
                                      color: appTheme.colorScheme.onSurface),
                                ),
                    ),
                    if (!_isEnteringPassword) ...[
                      const SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 1.5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    appTheme.colorScheme.onSurface
                                        .withOpacity(0.0),
                                    appTheme.colorScheme.onSurface
                                        .withOpacity(0.5),
                                    appTheme.colorScheme.onSurface,
                                  ],
                                  stops: const [0.0, 0.5, 1.0],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            'Or',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 1.5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    appTheme.colorScheme.onSurface,
                                    appTheme.colorScheme.onSurface
                                        .withOpacity(0.5),
                                    appTheme.colorScheme.onSurface
                                        .withOpacity(0.0),
                                  ],
                                  stops: const [0.0, 0.5, 1.0],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SocialMediaButtons(),
                      const SizedBox(height: 20),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: appTheme.colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
