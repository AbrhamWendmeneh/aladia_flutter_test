import 'package:flutter/material.dart';
import 'package:aladia_flutter_test/utils/validators.dart';
import 'package:aladia_flutter_test/widgets/input_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isEnteringPassword;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isEnteringPassword,
    required this.formKey,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          if (!widget.isEnteringPassword)
            InputField(
              controller: widget.emailController,
              hintText: 'email',
              icon: Icons.email,
              validator: Validators.validateEmail,
              textInputAction: TextInputAction.next,
            ),
          if (widget.isEnteringPassword)
            InputField(
              controller: widget.passwordController,
              hintText: 'password',
              icon: Icons.lock,
              obscureText: _obscureText,
              suffixIcon:
                  _obscureText ? Icons.visibility : Icons.visibility_off,
              onSuffixIconTap: _togglePasswordVisibility,
              validator: Validators.validatePassword,
              textInputAction: TextInputAction.done,
            ),
        ],
      ),
    );
  }
}
