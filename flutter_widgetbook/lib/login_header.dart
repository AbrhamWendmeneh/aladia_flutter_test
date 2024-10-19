import 'package:aladia_flutter_test/features/authentication/login/login_header.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Login header', type: LoginHeader)
Widget loginHeaderUseCase(BuildContext context) {
  return const LoginHeader();
}
