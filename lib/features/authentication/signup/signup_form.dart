import 'package:flutter/material.dart';

import '../../../utils/validators.dart';
import '../../../widgets/input_field.dart';

class SignupForm extends StatefulWidget {
  final TextEditingController? nameController;
  final TextEditingController? surnameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final GlobalKey<FormState>? formKey;
  const SignupForm(
      {super.key,
      this.nameController,
      this.surnameController,
      this.emailController,
      this.passwordController,
      this.confirmPasswordController,
      this.formKey});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _obscureTextForPassword = true;
  bool _obscureTextForConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureTextForPassword = !_obscureTextForPassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureTextForConfirmPassword = !_obscureTextForConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          InputField(
            controller: widget.nameController,
            hintText: 'Name',
            icon: Icons.person,
            validator: Validators.validateName,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          InputField(
            controller: widget.surnameController,
            hintText: 'Surname',
            icon: Icons.person,
            validator: Validators.validateSurname,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          InputField(
            controller: widget.emailController,
            hintText: 'email',
            icon: Icons.email,
            validator: Validators.validateEmail,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          InputField(
            controller: widget.passwordController,
            hintText: 'password',
            icon: Icons.lock,
            obscureText: _obscureTextForPassword,
            suffixIcon: _obscureTextForPassword
                ? Icons.visibility
                : Icons.visibility_off,
            onSuffixIconTap: _togglePasswordVisibility,
            validator: Validators.validatePassword,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          InputField(
            controller: widget.confirmPasswordController,
            hintText: 'confirm password',
            icon: Icons.lock,
            obscureText: _obscureTextForConfirmPassword,
            suffixIcon: _obscureTextForConfirmPassword
                ? Icons.visibility
                : Icons.visibility_off,
            onSuffixIconTap: _toggleConfirmPasswordVisibility,
            validator: Validators.confirmPasswordValidator(
                widget.passwordController!.text),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
