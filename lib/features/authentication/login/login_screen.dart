import 'package:aladia_flutter_test/features/authentication/signup/signup_screen.dart';
import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/home_screen.dart';
import 'login_header.dart';
import 'login_form.dart';
import '../../../providers/login_provider.dart';
import 'social_media_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const kPadHor = 24.0;

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
          LoginScreen.kPadHor,
          MediaQuery.paddingOf(context).top,
          LoginScreen.kPadHor,
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
                                      print(p0)
                                    });
                          }
                        } else {
                          if (_formKey.currentState!.validate()) {
                            final userExists = await authProvider
                                .checkUser(_emailController.text);
                            print('loginscreen: $userExists');
                            if (userExists == true) {
                              setState(() {
                                _isEnteringPassword = true;
                              });
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
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
                              ? CircularProgressIndicator(
                                  color: appTheme.colorScheme.secondary,
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
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: CustomPaint(
                              painter: CustomDividerPainter(
                                color: appTheme.colorScheme.primary,
                                startThickness: 1.0,
                                endThickness: 4.0,
                              ),
                              child: Container(height: 1.0),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text('or'),
                          const SizedBox(width: 20),
                          Expanded(
                            child: CustomPaint(
                              painter: CustomDividerPainter(
                                color: appTheme.colorScheme.primary,
                                startThickness: 4.0,
                                endThickness: 1.0,
                              ),
                              child: Container(height: 1.0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SocialMediaButtons(),
                      const SizedBox(height: 10),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: appTheme.colorScheme.primary,
                          fontSize: 16,
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

class CustomDividerPainter extends CustomPainter {
  final Color color;
  final double startThickness;
  final double endThickness;

  CustomDividerPainter({
    required this.color,
    this.startThickness = 4.0,
    this.endThickness = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    for (double i = 0; i < size.width; i++) {
      double t = i / size.width;
      paint.strokeWidth = startThickness * (1 - t) + endThickness * t;
      canvas.drawLine(
          Offset(i, size.height / 2), Offset(i + 1, size.height / 2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
