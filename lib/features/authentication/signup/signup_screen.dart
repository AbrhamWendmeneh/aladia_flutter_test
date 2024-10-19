import 'package:aladia_flutter_test/features/authentication/login/login_screen.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_form.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_header.dart';
import 'package:aladia_flutter_test/features/authentication/verification/verify_screen.dart';
import 'package:aladia_flutter_test/shared/constants.dart';
import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../providers/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEnteringPassword = false;

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('signup_email');
    if (email != null) {
      _emailController.text = email;
      await prefs.remove('signup_email');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                    const SignupHeader(),
                    const SizedBox(height: 40),
                    SignupForm(
                      nameController: _nameController,
                      surnameController: _surnameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                      formKey: _formKey,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      color: appTheme.colorScheme.onPrimary,
                      borderColor: appTheme.colorScheme.secondary,
                      child: authProvider.authLoading == AuthLoading.signingUp
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: appTheme.colorScheme.secondary,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: appTheme.colorScheme.onSurface),
                            ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authProvider.signUp(
                            email: _emailController.text,
                            password: _passwordController.text,
                            firstName: _nameController.text,
                            lastName: _surnameController.text,
                            onSuccess: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => VerifyScreen(
                                    email: _emailController.text,
                                  ),
                                ),
                                (route) => false,
                              );
                            },
                            onFail: (p0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(p0),
                                ),
                              );
                              debugPrint(p0);
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        'Already have an account? Sign in',
                        style: TextStyle(
                            color: appTheme.colorScheme.outlineVariant),
                      ),
                    ),
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
