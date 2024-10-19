import 'package:aladia_flutter_test/features/authentication/verification/verification_header.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Signup header', type: VerificationHeader)
Widget verificationHeader(BuildContext context) {
  return const VerificationHeader();
}
