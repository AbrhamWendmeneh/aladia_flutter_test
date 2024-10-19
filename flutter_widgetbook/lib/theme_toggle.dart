import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'input field', type: ThemeToggleSwitch)
Widget toggleUseCase(BuildContext context) {
  return const ThemeToggleSwitch();
}
