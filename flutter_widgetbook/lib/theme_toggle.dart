import 'package:aladia_flutter_test/providers/theme_provider.dart';
import 'package:aladia_flutter_test/widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'input field toggle', type: ThemeToggleSwitch)
Widget toggleUseCase(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: const ThemeToggleSwitch(),
  );
}
