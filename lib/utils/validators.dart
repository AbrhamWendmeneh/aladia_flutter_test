import 'package:flutter/material.dart';

class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please enter your password';
    } else if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static FormFieldValidator<String> confirmPasswordValidator(String password) {
    return (String? confirmPassword) {
      return validateConfirmPassword(confirmPassword, password);
    };
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateSurname(String? surname) {
    if (surname == null || surname.isEmpty) {
      return 'Please enter your surname';
    }
    return null;
  }
}
