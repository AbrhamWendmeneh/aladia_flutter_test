import 'package:aladia_flutter_test/features/authentication/verification/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Signup header', type: VerifyScreen)
Widget verficationScreen(BuildContext context) {
  return VerifyScreen(
      email:
          context.knobs.string(label: 'email', initialValue: 'test@gmail.com'));
}
