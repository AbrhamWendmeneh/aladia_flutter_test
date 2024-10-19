import 'package:aladia_flutter_test/features/authentication/signup/signup_form.dart';
import 'package:aladia_flutter_test/features/authentication/signup/signup_header.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Signup header', type: SignupForm, )
Widget loginHeaderUseCase(BuildContext context) {
  return const SignupForm();
}
