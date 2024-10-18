import 'package:aladia_flutter_test/features/authentication/login/login_screen.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_form.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_header.dart';
import 'package:aladia_flutter_test/widgets/custom_button.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/login_provider.dart';
import '../../home/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const kPadHor = 24.0;

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
          SignupScreen.kPadHor,
          MediaQuery.paddingOf(context).top,
          SignupScreen.kPadHor,
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
                    const SizedBox(height: 20),
                    CustomButton(
                      child: authProvider.authLoading == AuthLoading.signingUp
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : const Text('Sign Up'),
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
                                  builder: (context) => const LoginScreen(),
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
                              print(p0);
                            },
                          );
                        }
                      },
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
